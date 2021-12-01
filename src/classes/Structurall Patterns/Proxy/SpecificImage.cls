/**
 * Created by Vlad K. on 30.11.2021.
 * @description The realisation of some service
 */

public with sharing class SpecificImage implements ImageI {
    private String path;

    public SpecificImage(String path) {
        this.path = path;
        // an immediate loading some very heavy Object
        this.load();
    }

    private void load() {
        System.debug('Loading Image on path: ' + this.path);
    }

    public void show() {
        System.debug('Showing Image on path: ' + this.path);
    }
}