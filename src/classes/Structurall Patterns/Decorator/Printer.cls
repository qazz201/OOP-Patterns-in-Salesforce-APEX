/**
 * Created by vladyslavkravcuk on 26.11.2021.
 */

public with sharing class Printer implements IPrinter {
    String message;

    public Printer(String message) {
        this.message = message;
    }

    public void print() {
        System.debug('Printer prints: ' + this.message);
    }
}