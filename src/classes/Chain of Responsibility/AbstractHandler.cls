/**
 * Created by vladyslavkravcuk on 01.11.2021.
 */

public abstract with sharing class AbstractHandler implements ChainHandlerI {
    ChainHandlerI nextHandler;

    public virtual String handle(String someParam) {
        if (this.nextHandler == null) return null;

        return this.nextHandler.handle(someParam);
    }

    public ChainHandlerI linkWith(ChainHandlerI nextHandler) {
        this.nextHandler = nextHandler;

        return nextHandler;
    }
}