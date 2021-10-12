/**
 * Created by Vlad K on 12.10.2021.
 */

public with sharing class ExampleOfWork {

    public void run() {
        EventPublisher eventPublisher = new EventPublisher();
        String open = EventPublisher.EVENT_OPEN;
        String close = EventPublisher.EVENT_CLOSE;

        // Subscribe on OPEN event
        eventPublisher.eventManager.subscribe(open, new LogEventListener());
        eventPublisher.eventManager.subscribe(open, new EmailEventListener());

        // Subscribe on CLOSE event
        eventPublisher.eventManager.subscribe(close, new LogEventListener());
        eventPublisher.eventManager.subscribe(close, new EmailEventListener());

        // Notify Listeners
        eventPublisher.publishEvent(open,'OPEN Event was published');
        eventPublisher.publishEvent(close,'CLOSE Event was published');

        // Unsubscribe listener from the event type
        eventPublisher.eventManager.unsubscribe(open, new LogEventListener());
        eventPublisher.eventManager.unsubscribe(close, new EmailEventListener());

        // Check if the listener was unsubscribed
        eventPublisher.publishEvent(open,'OPEN Event was published');
    }

}