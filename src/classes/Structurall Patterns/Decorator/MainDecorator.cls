/**
 * Created by vladyslavkravcuk on 26.11.2021.
 */

public abstract with sharing class MainDecorator implements IPrinter {
    protected IPrinter printer;

    public MainDecorator(IPrinter printer) {
        this.printer = printer;
    }
}