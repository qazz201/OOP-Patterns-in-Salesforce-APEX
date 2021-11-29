/**
 * Created by vladyslavkravcuk on 26.11.2021.
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