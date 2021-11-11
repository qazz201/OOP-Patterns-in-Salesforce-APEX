/**
 * Created by Vlad K. on 11.11.2021.
 * @description The realization of the Adapter. It calls some methods from the Adaptee class ( SalesforceApp class)
 */

public with sharing class DbToAppAdapter implements IDatabase {
    private SalesforceApp salesforceApp;

    public DbToAppAdapter(SalesforceApp salesforceApp) {
        this.salesforceApp = salesforceApp;
    }

    public void dbInsert() {
        this.salesforceApp.createRecord();
    }

    public void dbUpdate() {
        this.salesforceApp.modifyRecord();
    }

    public void dbUpsert() {
        this.salesforceApp.upsertRecord();
    }

    public void dbDelete() {
        this.salesforceApp.removeRecord();
    }
}