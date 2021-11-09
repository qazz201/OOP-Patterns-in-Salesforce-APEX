/**
 * Created by Vlad K. on 09.11.2021.
 */

public with sharing class PrototypeExample {
    public void run() {
        Laptop originalLaptop = new Laptop();
        originalLaptop.name = 'Acer';
        originalLaptop.processor = 'Core i7';
        originalLaptop.dvdRom = false;

        System.debug('Original Laptop: ' + originalLaptop);

        LaptopFactory factory = new LaptopFactory();
        Laptop copyLaptop = factory.makeCopy(originalLaptop);

        System.debug('Laptop copy: ' + copyLaptop);
    }
}

    /*
    Result:
           Original Laptop: Laptop:[dvdRom=false, name=Acer, processor=Core i7]
           Laptop copy: Laptop:[dvdRom=false, name=Acer, processor=Core i7]

     */