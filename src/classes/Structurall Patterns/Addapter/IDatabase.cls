/**
 * Created by Vlad K. on 11.11.2021.
 * @description  Some interface that clients can work with
 */

public interface IDatabase {
    void dbInsert();
    void dbUpdate();
    void dbUpsert();
    void dbDelete();
}