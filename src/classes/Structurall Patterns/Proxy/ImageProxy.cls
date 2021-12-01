
/**
 * Created by Vlad K. on 30.11.2021.
 * @description The proxy that can delay of initialization an instance of the object
  * that makes an immediate load of some heavy data
 */

public with sharing class ImageProxy implements ImageI {
    private String path;
    private SpecificImage image;

    public ImageProxy(String path) {
        this.path = path;
    }

    public void show() {
        if (this.image == null) this.image = new SpecificImage(path);
        this.image.show();
    }
}