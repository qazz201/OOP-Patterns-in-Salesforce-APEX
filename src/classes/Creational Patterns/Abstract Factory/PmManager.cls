/**
 * Created by Vlad K. on 03.11.2021.
 */

public with sharing class PmManager implements IProjectManager{

    public void manageProject() {
        System.debug('PmManager: The Project Manager manages the project...');
    }
}