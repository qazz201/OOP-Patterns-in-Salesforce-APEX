/**
 * Created by vladyslavkravcuk on 26.11.2021.
 */

public with sharing class AddWordsAfterDecorator extends MainDecorator {

    public AddWordsAfterDecorator(IPrinter printer) {
        super(printer);
    }

    public void print() {
        this.printer.print();
        System.debug('Some words AFTER are added.');
    }
}