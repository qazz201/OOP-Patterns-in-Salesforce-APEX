/**
 * Created by Vlad K. on 26.10.2021.
 * @description The Caretaker does not depend on a specific Memento (snapshot) class.
 * He does not have access to the specific state of Originator stored inside Memento(snapshot).
 * He works with all Mementos(snapshots) via the Memento interface
 */

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