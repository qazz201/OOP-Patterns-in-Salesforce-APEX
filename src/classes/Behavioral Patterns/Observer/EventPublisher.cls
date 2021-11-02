/**
 * Created by Vlad K on 12.10.2021.
 */

public with sharing class EventPublisher {
    public final String EVENT_OPEN = 'OPEN';
    public final String EVENT_CLOSE = 'CLOSE';

    public EventManager eventManager;

    public EventPublisher() {
        this.eventManager = new EventManager();
    }

    public void publishEvent(String eventType, String dataToPassInListener) {
        System.debug('__EventPublisher__: Publish ' + eventType + ' event');
        // Do some stuff...

        this.eventManager.notify(eventType, dataToPassInListener);
    }
}