/**
 * Created by Vlad K. on 21.10.2021.
 */

public with sharing class ConcreteClassOne extends TemplateClass {

    //the key point in the algorithm has been changed
    public override void hook1() {
        System.debug('ConcreteClassOne: hook1 method was launched');
    }

    public override void requiredOperation1() {
        System.debug('ConcreteClassOne: requiredOperation1 method was launched');
    }

    public override void requiredOperation2() {
        System.debug('ConcreteClassOne: requiredOperation2 method was launched');
    }
}