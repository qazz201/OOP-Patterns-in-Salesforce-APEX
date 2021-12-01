/**
 * Created by Vlad K. on 30.11.2021.
 */

public with sharing class ProxyExample {

    public void run() {
        String path = 'D:\\Images\\myImg.png';

        // Without proxy image is loading immediately
        // even if the user doesn't want to show it
        SpecificImage img = new SpecificImage(path);
        // img.show();


        // in this case if the user won't call the show() method
        // the image is not loading
        ImageProxy imageProxy = new ImageProxy(path);
        imageProxy.show();
    }
}