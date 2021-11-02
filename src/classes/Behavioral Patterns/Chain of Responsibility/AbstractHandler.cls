/**
 * Created by Vlad K. on 01.11.2021.
 * @description The realization of chain handler
 */

public abstract with sharing class AbstractHandler implements ChainHandlerI {
    ChainHandlerI nextHandler;

    public virtual String handle(String someParam) {
        if (this.nextHandler == null) return null;

        return this.nextHandler.handle(someParam);
    }

    public ChainHandlerI linkWith(ChainHandlerI nextHandler) {
        this.nextHandler = nextHandler;

        // It will help to link all handlers in this way:
        // dogHandler.linkWith(catHandler).linkWith(MouseHandler);
        return nextHandler;
    }
}