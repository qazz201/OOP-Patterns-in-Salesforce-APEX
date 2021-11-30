/**
 * Created by Vlad K. on 26.11.2021.
 * @description The main class that we want to add some additional  functionality
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