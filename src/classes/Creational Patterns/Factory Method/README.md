# OOP-Patterns: Factory Method

The overall interface for all products (e.g buttons)

```apex
public interface ButtonI {
    void render();
    void onClick();
}
```

The realization of specific buttons
```apex
public with sharing class HtmlButton implements ButtonI{
    public void render() {
        System.debug('HtmlButton: The HTML button has been Rendered.');
        this.onClick();
    }

    public void onClick() {
        System.debug('HtmlButton: The HTML button has been Clicked.');
    }
}
```

```apex
public with sharing class WindowsButton implements ButtonI{

    public void render() {
        System.debug('WindowsButton: The Windows button has been Rendered.');
        this.onClick();
    }

    public void onClick() {
        System.debug('WindowsButton: The Windows button has been Clicked.');
    }
}
```
The base class of the Factory. This class can already have some business logic.
```apex
public abstract with sharing class Dialog {

    public void renderWindow() {
        // Some business logic here...

        System.debug('Dialog: Rendering buttons...');
        ButtonI button = this.createButton();
        button.render();
    }

    //All subclasses can override this method to return
    // a specific type of product ( in this case Button) 
    // and they will be different for every factory
    abstract ButtonI createButton();
}
```

The realisation of specific dialogues
```apex
public with sharing class HtmlDialog extends Dialog {

    public ButtonI createButton() {
        return new HtmlButton();
    }
}
```

```apex
public with sharing class WindowsDialog extends Dialog {
    public ButtonI createButton() {
        return new WindowsButton();
    }
}
```

Example:
```apex
public with sharing class FactoryMethodExample {
    public void run(String dialogType) {
        Dialog dialog;

        //It creates a specific factory depending on configuration
        switch on dialogType {
            when 'Windows' {
                dialog = new WindowsDialog();
            }
            when 'HTML' {
                dialog = new HtmlDialog();
            }
        }

        // All client code works with the Dialog interface
        // and it does not matter what kind  of dialog was created
        dialog.renderWindow();
    }
}
```

Result:
```text
    // new FactoryMethodExample().run('Windows');
        Dialog: Rendering buttons...
        WindowsButton: The Windows button has been Rendered.
        WindowsButton: The Windows button has been Clicked.
        
    // new FactoryMethodExample().run('HTML');
        Dialog: Rendering buttons...
        HtmlButton: The HTML button has been Rendered.
        HtmlButton: The HTML button has been Clicked.
```
