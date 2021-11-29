/**
 * Created by vladyslavkravcuk on 26.11.2021.
 */

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
/*
     Result:
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
 */