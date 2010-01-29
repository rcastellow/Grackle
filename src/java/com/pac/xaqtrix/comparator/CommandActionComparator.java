/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pac.xaqtrix.comparator;

import com.pac.xaqtrix.domain.CommandAction;
import java.util.Comparator;

/**
 *
 * @author robert
 */
public class CommandActionComparator implements Comparator {

    public int compare(Object obj1, Object obj2) {

        CommandAction ca1 = (CommandAction) obj1;
        CommandAction ca2 = (CommandAction) obj2;

        if (ca1.getPriority() > ca2.getPriority()) {
            return 1;
        } else if (ca1.getPriority() == ca2.getPriority()) {
            return 0;
        } else {
            return -1;
        }
    }
}