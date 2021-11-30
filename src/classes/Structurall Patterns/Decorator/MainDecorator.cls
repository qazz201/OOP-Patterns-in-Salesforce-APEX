/**
 * Created by Vlad K. on 26.11.2021.
 * @description The base decorator
 */

public abstract with sharing class MainDecorator implements IPrinter {
    protected IPrinter printer;

    public MainDecorator(IPrinter printer) {
        this.printer = printer;
    }
}