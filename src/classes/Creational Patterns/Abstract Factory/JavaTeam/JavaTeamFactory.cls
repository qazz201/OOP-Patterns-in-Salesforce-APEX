/**
 * Created by Vlad K.  on 04.11.2021.
 * @description The specific factory that knows only about Java team members
 */

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