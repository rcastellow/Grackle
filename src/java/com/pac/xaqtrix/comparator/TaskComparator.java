/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pac.xaqtrix.comparator;

import com.pac.xaqtrix.domain.Task;
import java.util.Comparator;

/**
 *
 * @author robert
 */
public class TaskComparator implements Comparator {

    public int compare(Object obj1, Object obj2) {

        Task ca1 = (Task) obj1;
        Task ca2 = (Task) obj2;

        if ((ca1.getPriority() > ca2.getPriority())) {
            return 1;
        } else if (ca1.getPriority() == ca2.getPriority()) {
            return 0;
        } else {
            return -1;
        }
    }
}
