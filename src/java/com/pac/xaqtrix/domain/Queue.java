/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pac.xaqtrix.domain;

import com.pac.xaqtrix.enums.QueueStatusEnum;
import java.util.LinkedList;

/**
 *
 * @author robert
 */
public class Queue {

    private LinkedList<CommandAction> queue = new LinkedList<CommandAction>();
    private String projectName ;
    private QueueStatusEnum status ;

    public synchronized void addCommandAction(CommandAction action) {
        getQueue().addLast(action);
    }

    public synchronized boolean removeCommandAction(CommandAction action){
        return(getQueue().remove(action));
    }

    public CommandAction getFirstCommandAction() {
        return (CommandAction)getQueue().getFirst();
    }

    /**
     * @return the queue
     */
    public LinkedList getQueue() {
        return queue;
    }

    /**
     * @return the projectName
     */
    public String getProjectName() {
        return projectName;
    }

    /**
     * @param projectName the projectName to set
     */
    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public int size() {
        return queue.size();
    }

    /**
     * @return the status
     */
    public QueueStatusEnum getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(QueueStatusEnum status) {
        this.status = status;
    }

}
