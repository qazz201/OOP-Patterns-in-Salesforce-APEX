# OOP-Patterns: Template Method

The abstract class defines the skeleton method for some algorithms that is overall for many classes.
Some methods have default realizations but others should be overridden in subclasses

```apex
public abstract with sharing class TemplateClass {

    // some algorithm that is overall for many classes
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
```

Classes that can use template algorithm and some methods in template algorithm are overridden in subclasses
```apex
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
```

```apex
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
```

Example:

```apex

public with sharing class TemplateMethodExample {

    public void run() {
        new ConcreteClassOne().runTemplateMethod();
       
        new ConcreteClassTwo().runTemplateMethod();
    }
}
```

Result:

```text
      TemplateClass: Default baseOperation1 method realization
      ConcreteClassOne: requiredOperation1 method was launched
      ConcreteClassOne: hook1 method was launched
      TemplateClass: Default baseOperation2 method realization
      ConcreteClassOne: requiredOperation2 method was launched

      ConcreteClassTwo__: baseOperation1 method implementation was changed!!!
      ConcreteClassTwo__: requiredOperation1 method was launched
      TemplateClass: Default baseOperation2 method realization
      ConcreteClassTwo__: requiredOperation2 method was launched
```