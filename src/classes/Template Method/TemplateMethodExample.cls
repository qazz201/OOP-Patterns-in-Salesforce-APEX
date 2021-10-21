/**
 * Created by vladyslavkravcuk on 21.10.2021.
 */

public with sharing class TemplateMethodExample {

    public void run() {
        new ConcreteClassOne().runTemplateMethod();
        System.debug('\n');
        new ConcreteClassTwo().runTemplateMethod();
    }

    /*
    Result:
      TemplateClass: Default baseOperation1 method realization
      ConcreteClassOne: requiredOperation1 method was launched
      ConcreteClassOne: hook1 method was launched
      TemplateClass: Default baseOperation2 method realization
      ConcreteClassOne: requiredOperation2 method was launched

      ConcreteClassTwo__: baseOperation1 method implementation was changed!!!
      ConcreteClassTwo__: requiredOperation1 method was launched
      TemplateClass: Default baseOperation2 method realization
      ConcreteClassTwo__: requiredOperation2 method was launched
     */
}