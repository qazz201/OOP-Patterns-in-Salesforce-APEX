/**
 * Created by Vlad K. on 26.10.2021.
 */

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

    /*
    Result:
        Originator: State is: Some Originator default state
        Originator: State now is: 6.027
        Originator: State now is: 6.367
        Originator: State now is: 8.063
        Caretaker: History:
        	       Memento Name: 2021-10-26 12:08:35 Some Originator default state
        	       Memento Name: 2021-10-26 12:08:35 6.027
        	       Memento Name: 2021-10-26 12:08:35 6.367
        Originator: Restore State: Previous state value is"8.063" and Restored value is"6.367"
        Originator: Restore State: Previous state value is"6.367" and Restored value is"6.027"
     */
}