/**
 * Created by Vlad K. on 09.11.2021.
 * @description The factory that can produce laptop copy
 */

public with sharing class LaptopFactory {

    public Laptop makeCopy(Laptop laptop) {
        Laptop copy = laptop.copy();
        return copy;
    }
}