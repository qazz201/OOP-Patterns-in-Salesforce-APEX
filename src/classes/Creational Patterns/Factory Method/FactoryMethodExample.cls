/**
 * Created by Vlad K. on 02.11.2021.
 *
 */

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
        /*
        Result:
        Dialog: Rendering buttons...
        WindowsButton: The Windows button has been Rendered.
        WindowsButton: The Windows button has been Clicked.

        Dialog: Rendering buttons...
        HtmlButton: The HTML button has been Rendered.
        HtmlButton: The HTML button has been Clicked.
        */