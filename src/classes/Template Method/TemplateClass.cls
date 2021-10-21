/**
 * Created by Vlad K. on 21.10.2021.
 * @description The abstract class defines the skeleton method for some algorithm that is overall for many classes.
 * Some methods have default realizations but others should be overridden in subclasses
 */

public abstract with sharing class TemplateClass {

    public void runTemplateMethod() {
        this.baseOperation1();
        this.requiredOperation1();
        this.hook1(); // some key point in an algorithm that can be changed in the subclass
        this.baseOperation2();
        this.requiredOperation2();
    }

    protected virtual void baseOperation1() {
        System.debug('TemplateClass: Default baseOperation1 method realization');
    }

    protected virtual void baseOperation2() {
        System.debug('TemplateClass: Default baseOperation2 method realization');
    }

    protected abstract void requiredOperation1();
    protected abstract void requiredOperation2();
    protected virtual void hook1() {
    }
}