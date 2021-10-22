/**
 * Created by Vlad K. on 22.10.2021.
 * @description The class that can execute some business logic
 * The Invoker dont know nothing about Receiver
 * And Invoker call methods from Receiver indirectly
 */

public with sharing class ComputerReceiver {

    public void turnOn() {
        System.debug('ComputerReceiver: Computer is turned On');
    }

    public void turnOff() {
        System.debug('ComputerReceiver: Computer is turned Off');
    }

    public void reboot() {
        System.debug('ComputerReceiver: Computer is rebooted!!!');
    }
}