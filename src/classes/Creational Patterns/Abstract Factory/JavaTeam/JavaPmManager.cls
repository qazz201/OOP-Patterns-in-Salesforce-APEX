/**
 * Created by Vlad K.  on 04.11.2021.
 * @description The specific variation of Java project manager
 */

public with sharing class JavaPmManager implements IProjectManager{

    public void manageProject() {
        System.debug('JavaPmManager: The Java Project Manager manages the project...');
    }
}