/**
 * Created by Vlad K.  on 04.11.2021.
 */

public with sharing class JavaPmManager implements IProjectManager{

    public void manageProject() {
        System.debug('JavaPmManager: The Java Project Manager manages the project...');
    }
}