/**
 * Created by Vlad K. on 02.11.2021.
 * @description The realization of specific button (e.g Windows button)
 */

public with sharing class WindowsButton implements ButtonI{

    public void render() {
        System.debug('WindowsButton: The Windows button has been Rendered.');
        this.onClick();
    }

    public void onClick() {
        System.debug('WindowsButton: The Windows button has been Clicked.');
    }
}