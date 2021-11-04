# OOP-Patterns: Abstract Factory

The abstract factory knows about all types (abstract) of team members

```apex
public interface ITeamFactory {
    IDeveloper getDeveloper();
    ITester getTester();
    IProjectManager getProjectManager();
}
```
### The interfaces for a specific specialization:

This is an interface for different types of developers( e.g Java, Salesforce ....).

```apex
public interface IDeveloper {
    void writeCode();
}
```

This is an interface for different types of project managers ( in this case it's Java, Salesforce ....).

```apex
public interface IProjectManager {
    void manageProject();
}
```

This is an interface for different types of testers(Java, Salesforce ....).
It also can be split into manual and automated testers

```apex
public interface ITester {
    void testCode();
}
```

## The realization a specific specialization:
### Java team:

The specific factory that knows only about Java team members
```apex

public with sharing class JavaTeamFactory implements ITeamFactory{

    public IDeveloper getDeveloper() {
        return new JavaDeveloper();
    }

    public ITester getTester() {
        return new JavaAutomatedTester();
    }

    public IProjectManager getProjectManager() {
        return new JavaPmManager();
    }
}
```

The specific variation of Java developer
```apex
public with sharing class JavaDeveloper implements IDeveloper{

    public void writeCode() {
        System.debug('JavaDeveloper: Java Developer writes code...');
    }
}
```

The specific variation of Java project manager
```apex
public with sharing class JavaPmManager implements IProjectManager{

    public void manageProject() {
        System.debug('JavaPmManager: The Java Project Manager manages the project...');
    }
}
```

The specific variation of Java tester
```apex
public with sharing class JavaAutomatedTester implements ITester{

    public void testCode() {
        System.debug('JavaAutomatedTester: Java Automated Tester tests code...');
    }
}
```

#### Salesforce team:

The specific factory that knows only about Salesforce team members
```apex
public with sharing class SalesforceTeamFactory implements ITeamFactory {

    public IDeveloper getDeveloper() {
        return new SalesforceDeveloper();
    }

    public ITester getTester() {
        return new SalesforceAutomatedTester();
    }

    public IProjectManager getProjectManager() {
        return new SalesforcePmManager();
    }
}
```

The specific variation of Salesforce developer
```apex
public with sharing class SalesforceDeveloper implements IDeveloper {

    public void writeCode() {
        System.debug('SalesforceDeveloper: Salesforce Developer writes code...');
    }
}
```

The specific variation of Salesforce project manager
```apex
public with sharing class SalesforcePmManager implements IProjectManager{

    public void manageProject() {
        System.debug('SalesforcePmManager: The Salesforce Project Manager manages the project...');
    }
}
```

The specific variation of Salesforce tester
```apex
public with sharing class SalesforceAutomatedTester implements ITester{

    public void testCode() {
        System.debug('SalesforceAutomatedTester: Salesforce Automated Tester tests code...');
    }
}
```

## Example:
```apex
public with sharing class AbstractFactoryExample {
    public void run(String speciality) {
        ITeamFactory factory = this.getFactoryBySpeciality(speciality);

        IDeveloper developer = factory.getDeveloper();
        ITester tester = factory.getTester();
        IProjectManager projectManager = factory.getProjectManager();

        developer.writeCode();
        tester.testCode();
        projectManager.manageProject();
    }

    public ITeamFactory getFactoryBySpeciality(String speciality) {
        ITeamFactory factory;

        switch on speciality {
            when 'Salesforce' {
                factory = new SalesforceTeamFactory();
            }
            when 'Java' {
                factory = new JavaTeamFactory();
            }
        }

        return factory;
    }
}
```

Result:
```text
new AbstractFactoryExample().run('Salesforce'); 

    SalesforceDeveloper: Salesforce Developer writes code...
    SalesforceAutomatedTester: Salesforce Automated Tester tests code...
    SalesforcePmManager: The Salesforce Project Manager manages the project...

 new AbstractFactoryExample().run('Java'); 
 
    JavaDeveloper: Java Developer writes code...
    JavaAutomatedTester: Java Automated Tester tests code...
    JavaPmManager: The Java Project Manager manages the project...
```
