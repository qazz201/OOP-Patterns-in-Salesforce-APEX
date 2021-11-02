/**
 * Created by Vlad K. on 02.11.2021.
 * @description The base class of the Factory.
 * This class can already have some business logic.
 */

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