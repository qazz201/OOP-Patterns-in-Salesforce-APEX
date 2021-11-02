/**
 * Created by Vlad K. on 02.11.2021.
 * @description The realization of specific button (e.g HTML button)
 */

public with sharing class HtmlButton implements ButtonI{
    public void render() {
        System.debug('HtmlButton: The HTML button has been Rendered.');
        this.onClick();
    }

    public void onClick() {
        System.debug('HtmlButton: The HTML button has been Clicked.');
    }
}