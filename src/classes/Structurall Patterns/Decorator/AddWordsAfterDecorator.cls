/**
 * Created by Vlad K. on 26.11.2021.
 * @description The decorator that add some additional functionality for the main class (Printer.cls)
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