/**
 * Created by Vlad K. on 25.10.2021.
 */

public with sharing class DeleteButtonComponent implements ComponentI {
    Mediator mediator;

    public void setMediator(Mediator mediator) {
        this.mediator = mediator;
    }

    public void deleteMethod() {
        System.debug('DeleteButtonComponent: delete action was redirected to Mediator');
        this.mediator.deleteAction('delete');
    }

    public String getName() {
        return 'DeleteButtonComponent';
    }

    public void setTitle(String title) {
        System.debug('DeleteButtonComponent: New Delete button Title is:"' + title + '"');
    }
}