/**
 * Created by Vlad K on 12.10.2021.
 */

public with sharing class LogEventListener implements EventListener {

    /**
     * @param eventType
     * @param someData
     * @description is is a subscription listener
     */
    public void updates(String eventType, String someData) {
        System.debug('__LogEventListener__: Called as listener. Event type = ' + eventType + ', Data passed in LogEventListener: '+someData);
    }
}