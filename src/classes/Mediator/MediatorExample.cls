/**
 * Created by Vlad K. on 25.10.2021.
 */

public with sharing class MediatorExample {
    public void run() {
        Mediator mediator = new EditorMediator();

        SaveButtonComponent saveButton = new SaveButtonComponent();
        DeleteButtonComponent deleteButton = new DeleteButtonComponent();
        UpdateButtonComponent updateButton = new UpdateButtonComponent();

        mediator.registerComponent(saveButton);
        mediator.registerComponent(deleteButton);
        mediator.registerComponent(updateButton);

        saveButton.saveMethod();
        updateButton.updateMethod();
        deleteButton.deleteMethod();
    }
    /*
    Result:
        SaveButtonComponent: save action was redirected to Mediator
        EditorMediator: The mediator was notified about 'SAVE' action. The action name is: save
        SaveButtonComponent: New Save button Title is:"SAVE button title was changed from Mediator"

        UpdateButtonComponent: update action was redirected to Mediator
        EditorMediator: The mediator was notified about 'UPDATE' action. The action name is: update
        UpdateButtonComponent: New Update button Title is:"UPDATE button title was changed from Mediator"

        DeleteButtonComponent: delete action was redirected to Mediator
        EditorMediator: The mediator was notified about 'DELETE' action. The action name is: delete
        DeleteButtonComponent: New Delete button Title is:"DELETE button title was changed from Mediator"
     */
}