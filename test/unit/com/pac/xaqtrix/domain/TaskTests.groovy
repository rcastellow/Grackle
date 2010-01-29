package com.pac.xaqtrix.domain

class TaskTests extends GroovyTestCase {

    void testRun() {

        // test version
        Runnable runnable = new Task(["-b","scripts/testScripts/build.gradle","count"] as String[])
        Thread thread = new Thread(runnable)
        thread.start();

    }
}
