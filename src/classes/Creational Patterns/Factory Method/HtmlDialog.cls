/**
 * Created by Vlad K. on 02.11.2021.
 */

public with sharing class HtmlDialog extends Dialog {

    public ButtonI createButton() {
        return new HtmlButton();
    }
}