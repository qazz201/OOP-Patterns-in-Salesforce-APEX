/**
 *  Created by Vlad K. on 22.10.2021.
 *  @description This class delegates complex operation to other objects that are called 'Receivers'
 */

public with sharing class RebootCommand implements Command {
    private ComputerReceiver receiver;

    public RebootCommand(ComputerReceiver receiver) {
        this.receiver = receiver;
    }

    public void execute() {
        this.receiver.reboot();
        // Do something else ...
        System.debug('RebootCommand: Some after reboot actions...');
    }
}