/**
 * Created by Vlad K. on 22.10.2021.
 * @description  The Invoker dont know nothing about Receiver
 * And Invoker call methods from Receiver indirectly
 */

public with sharing class CommandExample {
    public void run() {
        ComputerReceiver receiver = new ComputerReceiver();
        UserInvoker userInvoker = new UserInvoker(
                new TurnOnCommand(),
                new TurnOffCommand(receiver),
                new RebootCommand(receiver)
        );

        userInvoker.switchOn();
        userInvoker.reboot();
        userInvoker.switchOff();
    }

    /*
    Result:
        UserInvoker: switchOn command was launched
        TurnOnCommand: The simple turn On command was called and computer turned On

        UserInvoker: reboot command was launched
        ComputerReceiver: Computer is rebooted!!!
        RebootCommand: Some after reboot actions...

        UserInvoker: switchOff command was launched
        ComputerReceiver: Computer is turned Off
        TurnOffCommand: Some after turn Off actions...
     */
}