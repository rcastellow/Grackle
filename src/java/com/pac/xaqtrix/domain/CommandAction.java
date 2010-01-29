/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pac.xaqtrix.domain;

import com.pac.xaqtrix.comparator.TaskComparator;
import com.pac.xaqtrix.enums.TaskStatusEnum;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import org.apache.log4j.Logger;

/**
 *
 * @author robert This class is an abstraction/DTO of Groovy Action
 * class, and will pass command, timestamp,etc to queue using the CommandHandler
 */
public class CommandAction {

    Logger logger = Logger.getLogger(getClass()) ;

    // Identify Specific Action
    private String name;
    private String description;
    private int priority = 0;
    private Date submittedTime ;
    private List<Task> tasks;
    private List<CommandAction> childCommandActions ;

    public CommandAction() {
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the priority
     */
    public int getPriority() {
        return priority;
    }

    /**
     * @param priority the priority to set
     */
    public void setPriority(int priority) {
        this.priority = priority;
    }

    /**
     * @return the submittedTime
     */
    public Date getSubmittedTime() {
        return submittedTime;
    }

    /**
     * @param submittedTime the submittedTime to set
     */
    public void setSubmittedTime(Date submittedTime) {
        this.submittedTime = submittedTime;
    }

    /**
     * @return the tasks
     */
    public List<Task> getTasks() {
        return tasks;
    }

    /**
     * @param tasks the tasks to set
     */
    public void setTasks(List<Task> tasks) {
        this.tasks = tasks;
    }

    /**
     * @return the childCommandActions
     */
    public List<CommandAction> getChildCommandActions() {
        return childCommandActions;
    }

    /**
     * @param childCommandActions the childCommandActions to set
     */
    public void setChildCommandActions(List<CommandAction> childCommandActions) {
        this.childCommandActions = childCommandActions;
    }


    public boolean areChildTasksExecuting() {
        for (Task task : tasks) {
            if (TaskStatusEnum.isExecuting(task.getStatus())) {
                return true;
            }
        }
        return false;
    }

    public void sortChildTasksByPriority(){
        // Sort the List
        Collections.sort(tasks, new TaskComparator());
    }

}
