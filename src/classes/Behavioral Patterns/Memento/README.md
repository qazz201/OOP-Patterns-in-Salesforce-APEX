# OOP-Patterns: Memento (Snapshot)

The Originator has some important state that can be changed.
It also represents methods to save state inside of memento (snapshot) and restore state value from that memento (snapshot).

```apex
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
```

The Memento (snapshot) Interface represents the way of extracting metadata from Memento (snapshot)

```apex
public interface MementoI {
    String getState();
    String getName();
}
```

The Caretaker does not depend on a specific Memento (snapshot) class.
He does not have access to the specific state of Originator stored inside Memento(snapshot).
He works with all Mementos(snapshots) via the Memento interface
```apex
public with sharing class Caretaker {
    private Originator originator;
    private List<MementoI> history = new List<MementoI>();

    public Caretaker(Originator originator) {
        this.originator = originator;
    }

    public void backup() {
        this.history.add(this.originator.createMemento());
    }

    public void undo() {
        if (this.history.isEmpty()) return;

        Integer lastElement = this.history.size() - 1;
        MementoI concreteMemento = this.history.get(lastElement);

        this.originator.restoreStateFromMemento(concreteMemento);
        this.history.remove(lastElement);
    }

    public void showHistory() {
        System.debug('Caretaker: History: ');

        for (MementoI memento : this.history) {
            System.debug('\t' + memento.getName());
        }
    }
}
```

Example:

```apex
public with sharing class MementoExample {
    public void run() {
        Originator originator = new Originator('Some Originator default state');
        Caretaker caretaker = new Caretaker(originator);

        caretaker.backup(); //Save current state

        originator.changeState(); //Change current state
        caretaker.backup(); //Save current state

        originator.changeState();//Change current state
        caretaker.backup(); //Save current state

        originator.changeState();//Change current state and do not save it
        caretaker.showHistory();

        caretaker.undo(); //Restore the last state
        caretaker.undo(); //Restore the last state
    }
}
```

Result:

```text
        Originator: State is: Some Originator default state
        Originator: State changed: 6.027
        Originator: State changed: 6.367
        Originator: State changed: 8.063
        Caretaker: History:
        	       Memento Name: 2021-10-26 12:08:35 Some Originator default state
        	       Memento Name: 2021-10-26 12:08:35 6.027
        	       Memento Name: 2021-10-26 12:08:35 6.367
        Originator: Restore State: Previous state value is"8.063" and Restored value is"6.367"
        Originator: Restore State: Previous state value is"6.367" and Restored value is"6.027"
```