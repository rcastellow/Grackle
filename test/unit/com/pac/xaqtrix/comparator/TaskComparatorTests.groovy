package com.pac.xaqtrix.comparator

import com.pac.xaqtrix.domain.Task

class TaskComparatorTests extends GroovyTestCase {

    public void testCompare() {
        Task ca1 = new Task() ;
        Task ca2 = new Task() ;

        TaskComparator cap = new TaskComparator();

        // Scenario 1 - ActionPriority1 > ActionPriority2

        ca1.setPriority(5);
        ca2.setPriority(4);
        assertEquals(1,cap.compare(ca1, ca2));
        assertEquals(-1,cap.compare(ca2,ca1));

        ca2.setPriority(5);
        assertEquals(0,cap.compare(ca1,ca2));
    }
}
