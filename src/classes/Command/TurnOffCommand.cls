/**
 *  Created by Vlad K. on 22.10.2021.
 *  @description This class delegates complex operation to other objects that are called 'Receivers'
 */

public with sharing class TurnOffCommand implements Command {
    private ComputerReceiver receiver;

    public TurnOffCommand(ComputerReceiver receiver) {
        this.receiver = receiver;
    }

    public void execute() {
        this.receiver.turnOff();
        // Do something else ...
        System.debug('TurnOffCommand: Some after turn Off actions...');
    }
}