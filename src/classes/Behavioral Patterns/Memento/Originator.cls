/**
 * Created by Vlad K. on 26.10.2021.
 * @description The Originator has some important state that can be changed.
  * It also represents methods to save state inside of memento (snapshot) and restore state value from that memento (snapshot).
 */

public with sharing class Originator {
    private String state;

    public Originator(String state) {
        System.debug('Originator: State is: ' + state);

        this.state = state;
    }

    /**
     * @description Some important business logic that can change state value
     * that is why the Caretaker should make a backup of the current Originator state to have an opportunity to restore that value in future
     */
    public void changeState() {
        this.state = String.valueOf(Decimal.valueof((Math.random() * 10)).setScale(3));
        System.debug('Originator: State changed: ' + this.state);
    }

    public Memento createMemento() {
        return new Memento(this.state);
    }

    public void restoreStateFromMemento(MementoI memento) {
        System.debug('Originator: Restore State: Previous state value is"' + this.state + '" and Restored value is"' + memento.getState() + '"');
        this.state = memento.getState();
    }

    /**
     * @description A specific snapshot that stores all information about his creator (state)
     */
    public class Memento implements MementoI {
        private String timeStamp;
        private String stateMemento;

        public Memento(String state) {
            this.stateMemento = state;
            this.timeStamp = String.valueOf(Datetime.now());
        }

        public String getState() {
            return this.stateMemento;
        }

        public String getName() {
            return 'Memento Name: ' + this.timeStamp + ' ' + this.stateMemento;
        }
    }
}