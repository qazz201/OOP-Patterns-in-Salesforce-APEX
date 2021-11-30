# OOP-Patterns: Decorator

The interface that setup base functionality

```apex
public interface IPrinter {
    void print();
}
```

The main class that we want to add some additional functionality

```apex
public with sharing class Printer implements IPrinter {
    String message;

    public Printer(String message) {
        this.message = message;
    }

    public void print() {
        System.debug('Printer prints: ' + this.message);
    }
}
```

#### The base decorator

```apex
public abstract with sharing class MainDecorator implements IPrinter {
    protected IPrinter printer;

    public MainDecorator(IPrinter printer) {
        this.printer = printer;
    }
}
```

The decorators that add some additional functionality for the main class (Printer.cls)

```apex
public with sharing class AddWordBeforeDecorator extends MainDecorator {

    public AddWordBeforeDecorator(IPrinter printer) {
        super(printer);
    }

    public void print() {
        System.debug('Some words BEFORE are added.');
        this.printer.print();
    }
}
```

```apex
public with sharing class AddWordsAfterDecorator extends MainDecorator {

    public AddWordsAfterDecorator(IPrinter printer) {
        super(printer);
    }

    public void print() {
        this.printer.print();
        System.debug('Some words AFTER are added.');
    }
}
```

### Example:

```apex
public with sharing class DecoratorExample {
    public void run() {
        IPrinter printer = new AddWordBeforeDecorator(new AddWordsAfterDecorator(new Printer('HELLO!!')));
        printer.print();

        printer = new AddWordBeforeDecorator(new Printer('BYE!!'));
        printer.print();

        printer = new AddWordsAfterDecorator(new Printer('Hello again!!'));
        printer.print();
    }
}
```

Result:
```text
     // new AddWordBeforeDecorator(new AddWordsAfterDecorator(new Printer('HELLO!!')));
        Some words BEFORE are added.
        Printer prints: HELLO!!
        Some words AFTER are added.

     // new AddWordBeforeDecorator(new Printer('BYE!!'));
        Some words BEFORE are added.
        Printer prints: BYE!!

     // new AddWordsAfterDecorator(new Printer('Hello again!!'));
        Printer prints: Hello again!!
        Some words AFTER are added.
```
