/**
 * Created by Vlad K. on 09.11.2021.
 * The class that implements Copyable interface
 * and has a realization of method copy()
 */

public with sharing class Laptop implements Copyable {
    public String name;
    public String processor;
    public Boolean dvdRom;

    public Laptop() {
    }

    public Laptop(Laptop laptop) {
        if (laptop == null) return;

        this.name = laptop.name;
        this.processor = laptop.processor;
        this.dvdRom = laptop.dvdRom;
    }

    public Laptop copy() {
        return new Laptop(this);
    }
}