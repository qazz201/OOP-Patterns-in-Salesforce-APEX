/**
 * Created by Vlad K. on 11.11.2021.
 */

public with sharing class AdapterExample  extends AbstractHandler{
    public void run() {
        IDatabase adapter = new DbToAppAdapter(new SalesforceApp());

        adapter.dbInsert();
        adapter.dbUpdate();
        adapter.dbUpsert();
        adapter.dbDelete();
    }
}

    /*
      Result:
            SalesforceApp: Creating record...
            SalesforceApp: Modifying record...
            SalesforceApp: Upserting record...
            SalesforceApp: Removing record...
     */