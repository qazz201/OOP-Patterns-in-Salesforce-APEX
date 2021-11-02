/**
 * Created by Vlad K on 12.10.2021.
 */

public with sharing class EventManager {
    private Map<String, List<EventListener>> eventTypeByListeners = new Map<String, List<EventListener>>();

    public void subscribe(String eventType, EventListener listener) {
        if (!eventTypeByListeners.containsKey(eventType)) {
            eventTypeByListeners.put(eventType, new List<EventListener>{
                    listener
            });
            return ;
        }

        List<EventListener> listeners = eventTypeByListeners.get(eventType);
        listeners.add(listener);
    }

    public void unsubscribe(String eventType, EventListener listener) {
        if (!eventTypeByListeners.containsKey(eventType)) return;

        String listenerName = this.getListenerName(listener);
        List<EventListener> listeners = eventTypeByListeners.get(eventType);

        // TODO: find a better way
        for (Integer i = 0; i < listeners.size(); i++) {
            String currentListenerName = this.getListenerName(listeners[i]);

            if (currentListenerName == listenerName) listeners.remove(i);
        }
    }

    public void notify(String eventType, String someDataToPassInListener) {
        if (!eventTypeByListeners.containsKey(eventType)) return;

        List<EventListener> listeners = eventTypeByListeners.get(eventType);

        for (EventListener listener : listeners) {
            listener.updates(eventType, someDataToPassInListener);
        }

        System.debug('Notify listeners: ' + listeners);
    }

    private String getListenerName(EventListener listener) {
        return String.valueOf(listener).split(':')[0];
    }
}