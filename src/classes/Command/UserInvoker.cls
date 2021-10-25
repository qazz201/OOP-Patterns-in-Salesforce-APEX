/**
 * Created by Vlad K. on 22.10.2021.
 * @description The invoker class is connected with some commands. It sends a request to the command.
 * The Invoker knows nothing about the Receiver. And Invoker call methods from Receiver indirectly
 */

public with sharing class UserInvoker {
    public Command computerTurnOn;
    public Command computerTurnOff;
    public Command computerReboot;

    public UserInvoker(Command computerTurnOn, Command computerTurnOff, Command computerReboot) {
        this.computerTurnOn = computerTurnOn;
        this.computerTurnOff = computerTurnOff;
        this.computerReboot = computerReboot;
    }

    public void switchOn() {
        System.debug('UserInvoker: switchOn command was launched');
        this.computerTurnOn.execute();
    }

    public void switchOff() {
        System.debug('UserInvoker: switchOff command was launched');
        this.computerTurnOff.execute();
    }

    public void reboot() {
        System.debug('UserInvoker: reboot command was launched');
        this.computerReboot.execute();
    }
}