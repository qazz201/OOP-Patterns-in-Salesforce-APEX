/**
 * Created by Vlad K. on 22.10.2021.
 * @description Invoker class is connected with some commands. It sends request to the command.
 * The Invoker dont know nothing about Receiver. And Invoker call methods from Receiver indirectly
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
        this.computerTurnOn.execute();
    }

    public void switchOff() {
        this.computerTurnOff.execute();
    }

    public void reboot() {
        this.computerReboot.execute();
    }
}