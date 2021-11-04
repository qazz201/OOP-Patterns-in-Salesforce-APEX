/**
 * Created by Vlad K. on 03.11.2021.
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