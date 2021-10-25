# OOP-Patterns: Command

The class that can execute some business logic. The Invoker doesn't know anything about the Receiver.
And Invoker call methods from Receiver indirectly via commands
```apex
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
```

The Command interface that declare method of commands execution
```apex
public interface Command {
    void execute();
}
```

Those classes delegate complex operation to other objects that are called 'Receivers'
```apex
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
```

```apex
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
```

```apex
public with sharing class TurnOnCommand implements Command {

    public void execute() {
        System.debug('TurnOnCommand: The simple turn On command was called and computer turned On');
        // Do something else ...
    }
}
```

The invoker class is connected with some commands. It sends a request to the command.
The Invoker knows nothing about the Receiver. And Invoker call methods from Receiver indirectly
```apex
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
```

Example:

```apex
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
}
```

Result:
```text
        UserInvoker: switchOn command was launched
        TurnOnCommand: The simple turn On command was called and computer turned On

        UserInvoker: reboot command was launched
        ComputerReceiver: Computer is rebooted!!!
        RebootCommand: Some after reboot actions...

        UserInvoker: switchOff command was launched
        ComputerReceiver: Computer is turned Off
        TurnOffCommand: Some after turn Off actions...
```