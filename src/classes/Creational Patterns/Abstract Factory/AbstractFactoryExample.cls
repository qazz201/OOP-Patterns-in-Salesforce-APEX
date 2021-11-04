/**
 * Created by Vlad K. on 03.11.2021.
 */

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