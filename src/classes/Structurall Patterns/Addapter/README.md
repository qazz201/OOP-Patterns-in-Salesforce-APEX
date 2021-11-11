# OOP-Patterns: Adapter

This pattern can also force to work two different classes.
This example more simple because I am using an interface that clients can use

Some interface that clients can work with

```apex
public interface IDatabase {
    void dbInsert();
    void dbUpdate();
    void dbUpsert();
    void dbDelete();
}
```

Some class that should be adapted (Adaptee)

```apex
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
```

The realization of the Adapter. It calls some methods from the Adaptee class ( SalesforceApp class)

```apex
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
```

### Example:

```apex
public with sharing class AdapterExample  extends AbstractHandler{
    public void run() {
        IDatabase adapter = new DbToAppAdapter(new SalesforceApp());

        adapter.dbInsert();
        adapter.dbUpdate();
        adapter.dbUpsert();
        adapter.dbDelete();
    }
}
```

Result:

```text
        SalesforceApp: Creating record...
        SalesforceApp: Modifying record...
        SalesforceApp: Upserting record...
        SalesforceApp: Removing record...
```