/**
 * Created by Vlad K. on 03.11.2021.
 */

public with sharing class AbstractFactoryExample {
    public void run() {
        ITeamFactory factory = new ConcreteTeamFactory();

        IDeveloper developer = factory.getDeveloper();
        ITester tester = factory.getTester();
        IProjectManager projectManager = factory.getProjectManager();

        developer.writeCode();
        tester.testCode();
        projectManager.manageProject();
    }
}