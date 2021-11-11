/**
 * Created by Vlad K. on 11.11.2021.
 * @description Some class that should be adapted (Adaptee)
 */

public with sharing class SalesforceApp {

    public void createRecord(){
        System.debug('SalesforceApp: Creating record...');
    }

    public void modifyRecord(){
        System.debug('SalesforceApp: Modifying record...');
    }

    public void upsertRecord(){
        System.debug('SalesforceApp: Upserting record...');
    }

    public void removeRecord(){
        System.debug('SalesforceApp: Removing record...');
    }
}