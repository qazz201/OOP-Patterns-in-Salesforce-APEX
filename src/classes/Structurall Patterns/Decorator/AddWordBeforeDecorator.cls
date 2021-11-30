/**
 * Created by Vlad K. on 26.11.2021.
 * @description The decorator that add some additional functionality for the main class (Printer.cls)
 */

public with sharing class AddWordBeforeDecorator extends MainDecorator {

    public AddWordBeforeDecorator(IPrinter printer) {
        super(printer);
    }

    public void print() {
        System.debug('Some words BEFORE are added.');
        this.printer.print();
    }
}