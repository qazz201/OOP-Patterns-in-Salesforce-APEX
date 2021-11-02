/**
 * Created by Vlad K. on 22.10.2021.
 * @description This is just a simple command that can do simple things by it self
 */

public with sharing class TurnOnCommand implements Command {

    public void execute() {
        System.debug('TurnOnCommand: The simple turn On command was called and computer turned On');
        // Do something else ...
    }
}