/**
 * Created by Vlad K on 12.10.2021.
 */

public with sharing class EmailEventListener implements EventListener {
    /**
       * @param eventType
       * @param someData
       * @description is is a subscription listener
       */
    public void updates(String eventType, String someData) {
        System.debug('__EmailEventListener__: Called as listener. Event type = ' + eventType + ', Data passed in EmailEventListener: ' + someData);
    }
}