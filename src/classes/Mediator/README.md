# OOP-Patterns: Mediator

Overall  Mediator interface
```apex
public interface Mediator {
    void registerComponent(ComponentI component);
    void saveAction(String actionName);
    void deleteAction(String actionName);
    void updateAction(String actionName);
}
```

The concrete realization of Mediator.
This Mediator receives notification from concrete components and knows how to proceed with them
  
```apex
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
```

The overall Interface of components
```apex
public interface ComponentI {
    void setMediator(Mediator mediator);
    String getName();
    void setTitle(String title);
}
```

The specific realizations of components.
They know nothing about other components and do not depend on them

```apex
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
```
```apex
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
```

```apex
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
```
Example:
```apex
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
}
```
Result:

```text
        SaveButtonComponent: save action was redirected to Mediator
        EditorMediator: The mediator was notified about 'SAVE' action. The action name is: save
        SaveButtonComponent: New Save button Title is:"SAVE button title was changed from Mediator"

        UpdateButtonComponent: update action was redirected to Mediator
        EditorMediator: The mediator was notified about 'UPDATE' action. The action name is: update
        UpdateButtonComponent: New Update button Title is:"UPDATE button title was changed from Mediator"

        DeleteButtonComponent: delete action was redirected to Mediator
        EditorMediator: The mediator was notified about 'DELETE' action. The action name is: delete
        DeleteButtonComponent: New Delete button Title is:"DELETE button title was changed from Mediator"
```
