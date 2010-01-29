/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pac.xaqtrix.domain;

import com.pac.xaqtrix.enums.TaskStatusEnum;
import java.util.Date;
import java.util.List;
import org.apache.log4j.Logger;

/**
 *
 * @author robert
 */
public class Task implements Runnable {

    private Logger logger = Logger.getLogger(getClass()) ;

    private int priority=0;
    private TaskStatusEnum status ;
    private boolean enabled = false ;
    private String name;
    private String description;
    private String[] arguments ;
    private Date submittedTime ;
    private Date startTime ;
    private Date endTime ;
    private List<Environment> environments ;

    public Task(String[] arguments){
        setArguments(arguments);
    }

    // Execute basic Gradle script
   /* exec "$JAVACMD" $JAVA_OPTS $GRALE_OPTS \
        -classpath "$CLASSPATH" \
        -Dgradle.home="$GRADLE_HOME" \
        -Dtools.jar="$TOOLS_JAR" \
        org.gradle.BootstrapMain \
        "$@" */
    public void run() {

        // initialize task
        setStatus(TaskStatusEnum.Running);
        setStartTime(new Date());
        setEndTime(null);

        try {
            System.setProperty("gradle.home", "scripts/gradle-0.8");
            org.gradle.BootstrapMain.main(getArguments());
            setStatus(TaskStatusEnum.Passed);
        } catch (Exception e){
            setStatus(TaskStatusEnum.Failed);
            logger.error("Exception: " + e.toString());
        } finally {
            setEndTime(new Date());
            setEnabled(false);
        }
        
        return ;
    }

    public String getTaskKey(){
        return name + startTime.toString() ;
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
     * @return the arguments
     */
    public String[] getArguments() {
        return arguments;
    }

    /**
     * @param arguments the arguments to set
     */
    public void setArguments(String[] arguments) {
        this.arguments = arguments;
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
     * @return the startTime
     */
    public Date getStartTime() {
        return startTime;
    }

    /**
     * @param startTime the startTime to set
     */
    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    /**
     * @return the endTime
     */
    public Date getEndTime() {
        return endTime;
    }

    /**
     * @param endTime the endTime to set
     */
    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    /**
     * @return the environments
     */
    public List<Environment> getEnvironments() {
        return environments;
    }

    /**
     * @param environments the environments to set
     */
    public void setEnvironments(List<Environment> environments) {
        this.environments = environments;
    }

    /**
     * @return the status
     */
    public TaskStatusEnum getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(TaskStatusEnum status) {
        this.status = status;
    }

    /**
     * @return the enabled
     */
    public boolean isEnabled() {
        return enabled;
    }

    /**
     * @param enabled the enabled to set
     */
    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }


}
