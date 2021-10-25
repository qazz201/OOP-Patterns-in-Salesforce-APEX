/**
 * Created by Vlad K. on 25.10.2021.
 */

public with sharing class UpdateButtonComponent implements ComponentI {
    Mediator mediator;

    public void setMediator(Mediator mediator) {
        this.mediator = mediator;
    }

    public void updateMethod() {
        System.debug('UpdateButtonComponent: update action was redirected to Mediator');
        this.mediator.updateAction('update');
    }

    public String getName() {
        return 'UpdateButtonComponent';
    }

    public void setTitle(String title) {
        System.debug('UpdateButtonComponent: New Update button Title is:"' + title + '"');
    }
}