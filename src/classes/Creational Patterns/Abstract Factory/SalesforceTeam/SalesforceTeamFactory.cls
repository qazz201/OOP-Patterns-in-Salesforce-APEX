/**
 * Created by Vlad K. on 03.11.2021.
 * @description The specific factory that knows only about Salesforce team members
 */

public with sharing class SalesforceTeamFactory implements ITeamFactory {

    public IDeveloper getDeveloper() {
        return new SalesforceDeveloper();
    }

    public ITester getTester() {
        return new SalesforceAutomatedTester();
    }

    public IProjectManager getProjectManager() {
        return new SalesforcePmManager();
    }
}