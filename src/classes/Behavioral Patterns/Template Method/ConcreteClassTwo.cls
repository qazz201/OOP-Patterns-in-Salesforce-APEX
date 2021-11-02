/**
 * Created by Vlad K. on 21.10.2021.
 */

public with sharing class ConcreteClassTwo extends TemplateClass {

    public override void baseOperation1(){
        System.debug('ConcreteClassTwo__: baseOperation1 method implementation was changed!!!');
    }

    public override void requiredOperation1() {
        System.debug('ConcreteClassTwo__: requiredOperation1 method was launched');
    }

    public override void requiredOperation2() {
        System.debug('ConcreteClassTwo__: requiredOperation2 method was launched');
    }
}