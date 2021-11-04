/**
 * Created by Vlad K. on 03.11.2021.
 * @description The specific variation of Salesforce project manager
 */

public with sharing class SalesforcePmManager implements IProjectManager{

    public void manageProject() {
        System.debug('SalesforcePmManager: The Salesforce Project Manager manages the project...');
    }
}
