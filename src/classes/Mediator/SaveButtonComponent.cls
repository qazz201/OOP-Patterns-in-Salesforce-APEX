/**
 * Created by Vlad K. on 25.10.2021.
 */

public with sharing class SaveButtonComponent implements ComponentI {
    Mediator mediator;

    public void setMediator(Mediator mediator) {
        this.mediator = mediator;
    }

    public void saveMethod() {
        System.debug('SaveButtonComponent: save action was redirected to Mediator');
        this.mediator.saveAction('save');
    }

    public String getName() {
        return 'SaveButtonComponent';
    }

    public void setTitle(String title) {
        System.debug('SaveButtonComponent: New Save button Title is:"' + title + '"');
    }
}