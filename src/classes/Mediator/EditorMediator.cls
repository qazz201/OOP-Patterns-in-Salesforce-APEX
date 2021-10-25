/**
 * Created by Vlad K. on 25.10.2021.
 * @description The concrete realization of Mediator.
 * This Mediator receives notification from concrete components and knows how to proceed with them
 */

public with sharing class EditorMediator implements Mediator {
    SaveButtonComponent saveButton;
    DeleteButtonComponent deleteButton;
    UpdateButtonComponent updateButton;

    public void registerComponent(ComponentI component) {
        component.setMediator(this);

        switch on (component.getName()) {
            when 'SaveButtonComponent' {
                this.saveButton = (SaveButtonComponent) component;
            }
            when 'DeleteButtonComponent' {
                this.deleteButton = (DeleteButtonComponent) component;
            }
            when'UpdateButtonComponent' {
                this.updateButton = (UpdateButtonComponent) component;
            }
        }
    }

    public void saveAction(String actionName) {
        System.debug('EditorMediator: The mediator was notified about \'SAVE\' action. The action name is: ' + actionName);

        this.saveButton.setTitle('SAVE button title was changed from Mediator');
    }

    public void deleteAction(String actionName) {
        System.debug('EditorMediator: The mediator was notified about \'DELETE\' action. The action name is: ' + actionName);

        this.deleteButton.setTitle('DELETE button title was changed from Mediator');
    }

    public void updateAction(String actionName) {
        System.debug('EditorMediator: The mediator was notified about \'UPDATE\' action. The action name is: ' + actionName);

        this.updateButton.setTitle('UPDATE button title was changed from Mediator');
    }
}