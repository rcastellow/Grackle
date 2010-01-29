package com.pac.xaqtrix.comparator

import com.pac.xaqtrix.comparator.CommandActionComparator
import com.pac.xaqtrix.domain.CommandAction

class CommandActionComparatorTests extends GroovyTestCase {

    public void testCompare() {
        CommandAction ca1 = new CommandAction() ;
        CommandAction ca2 = new CommandAction() ;

        CommandActionComparator cap = new CommandActionComparator();

        // Scenario 1 - ActionPriority1 > ActionPriority2

        ca1.setPriority(5);
        ca2.setPriority(4);
        assertEquals(1,cap.compare(ca1, ca2));
        assertEquals(-1,cap.compare(ca2,ca1));

        ca2.setPriority(5);
        assertEquals(0,cap.compare(ca1,ca2));
    }
}
