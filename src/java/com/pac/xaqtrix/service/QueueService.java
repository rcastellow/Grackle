/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pac.xaqtrix.service;

import com.pac.xaqtrix.domain.CommandAction;
import com.pac.xaqtrix.domain.Queue;
import com.pac.xaqtrix.domain.Task;

/**
 *
 * @author robert
 */
public interface QueueService {

    void addCommandAction(CommandAction commandAction, String projectName);

    void checkAllQueues();

    Object clone() throws CloneNotSupportedException;

    void executeCommandActionTask(Task task);

    Queue getQueue(String projectName);

    boolean isThreadCompleted(Thread task);

    void pollCommandActionTasks(CommandAction commandAction);

    void pollQueueTasks(Queue queue);

    void removeCommandAction(CommandAction commandAction, String projectName);

    boolean removeQueue(Queue queue);

}
