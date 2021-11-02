/**
 * Created by Vlad K. on 02.11.2021.
 */

public with sharing class WindowsDialog extends Dialog {
    public ButtonI createButton() {
        return new WindowsButton();
    }
}