/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pac.xaqtrix.service;

import com.pac.xaqtrix.domain.CommandAction;
import com.pac.xaqtrix.domain.Queue;
import com.pac.xaqtrix.domain.Task;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.apache.log4j.Logger;

/**
 *
 * @author robert - ExecManager will be a singleton that will be
 * instantiated at startup time..  This class should always run and
 * manage the queues and execution of the scripts.
 */
public class QueueServiceImpl implements QueueService {

    private static Logger logger = Logger.getLogger(QueueServiceImpl.class);
    public static List<Queue> queues = new ArrayList<Queue>();
    private static QueueServiceImpl execManager ;
    private HashMap<String,Thread> taskMap = new HashMap<String,Thread>() ;

    private QueueServiceImpl() {
    }

    @Override
    public Object clone()
            throws CloneNotSupportedException {
        throw new CloneNotSupportedException();
    }

    public static synchronized QueueServiceImpl getExecManager() {
        if (execManager == null) {
            execManager = new QueueServiceImpl();
        }
        return execManager;
    }

    /*
     *
     */
    public Queue getQueue(String projectName) {

        // Check if queue exists by projectId
        if (queues != null && queues.size() != 0) {
            for (Queue queue : queues) {
                if (queue.getProjectName().equalsIgnoreCase(projectName)) {
                    return queue;
                }
            }
        }

        // If queue does not currently exist create a new queue
        logger.debug("Creating new queue for " + projectName);

        Queue queue = new Queue();
        queue.setProjectName(projectName);
        queues.add(queue);
        return queue;

    }

    public boolean removeQueue(Queue queue){
        return queues.remove(queue);
    }

    public void checkAllQueues(){
        for(Queue queue:queues){
            pollQueueTasks(queue);
        }
    }

    public void pollQueueTasks(Queue queue){
        // Check if multiple commandActions should be executed at same time
        if (queue != null && queue.size()==0){return ;}

        /* Steps needed to occur to poll commandAciton
        1. Check if any commandActions in Queue
        2. Grab first commandAction in queue
        3. Check if other commandActions exist in queue
        4. Check priority of other commandActions
        5. if same priority and name is not same execute both commandActions
        6. if not execute first commandAction only
        7. repeat 1-6
         */
        CommandAction commandActionOnDeck = queue.getFirstCommandAction();
        pollCommandActionTasks(commandActionOnDeck);
        // If no more tasks are executing remove commandAction from queue
        if (!commandActionOnDeck.areChildTasksExecuting()){
            queue.removeCommandAction(commandActionOnDeck);
        }
    }

    public void pollCommandActionTasks(CommandAction commandAction){
        /*         pollTasks
        1. get commandAction
        2. Check if other tasks exist in commandAction
        4. Check priority of other tasks (after sort)
        5. if same priority and name is not same execute both tasks
        6. if not execute first task only
        7. repeat 1-6
         */
        commandAction.sortChildTasksByPriority();
        List<Task> tasks = commandAction.getTasks() ;
        if (tasks==null || tasks.size()==0) {return;}

        // If tasks are running check if threads are complete and add more
        int currentTaskPriority = -1 ;
        boolean taskInCurrentPriorityStillRunning = false ;
        for (Task task : tasks) {
            String taskKey = task.getTaskKey();
            // Look up tasks that were started and put in taskMap
            if (taskMap.get(taskKey) != null) {
                currentTaskPriority=task.getPriority();
            }

            if (isThreadCompleted(taskMap.get(taskKey))) {
                taskMap.remove(task.getTaskKey());
            } else {
                taskInCurrentPriorityStillRunning=true ;
            }
        }
        
        startNewPriorityTasks(taskInCurrentPriorityStillRunning, tasks);

    }

    private void startNewPriorityTasks(boolean taskInCurrentPriorityStillRunning, List<Task> tasks){
        int currentTaskPriority = -1;
        if (!taskInCurrentPriorityStillRunning) {
            for (Task task : tasks) {
                if (task.isEnabled() && currentTaskPriority == -1) {
                    currentTaskPriority = task.getPriority();
                }
                if (task.isEnabled() && currentTaskPriority == task.getPriority()) {
                    executeCommandActionTask(task);
                }
            }
        }
    }

    public boolean isThreadCompleted(Thread task){
        if (!task.isAlive()){ return true ; }
        return false ;
    }

    public void executeCommandActionTask(Task task) {

        if (task == null) {
            logger.warn("Null task found to execute.  Execution of task will not occur.");
            return;
        }

        try {
            Runnable runnable = task;
            Thread thread = new Thread(runnable);
            thread.start();
            taskMap.put(task.getTaskKey(), thread);
        } catch (Exception e) {
            logger.error("Exception ExecManager.executeAction: " + e);
        }
    }

    public void addCommandAction(CommandAction commandAction, String projectName) {
        Queue queue = getQueue(projectName);
        queue.addCommandAction(commandAction);
    }

    public void removeCommandAction(CommandAction commandAction, String projectName) {
        Queue queue = getQueue(projectName);
        queue.removeCommandAction(commandAction);
    }
}
