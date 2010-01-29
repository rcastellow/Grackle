/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pac.xaqtrix.enums;

/**
 *
 * @author robert
 */
public enum TaskStatusEnum {
    Running,
    Failed,
    Warning,
    Passed;

    public static boolean isExecuting(TaskStatusEnum status){
        if (status!=null && status.equals(Running)) {
            return true ;
        }       
        return false ;
    }

}
