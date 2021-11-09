# OOP-Patterns: Prototype

The Copyable interface that should be implemented in a class that has to be copied

```apex
public interface Copyable {
    Object copy();
}
```

The class that implements Copyable interface and has a realization of method copy()

```apex
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
```

The factory that can produce laptop copy

```apex
public with sharing class LaptopFactory {

    public Laptop makeCopy(Laptop laptop) {
        Laptop copy = laptop.copy();
        return copy;
    }
}
```

### Example:

```apex
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
```

Result:

```text
        Original Laptop: Laptop:[dvdRom=false, name=Acer, processor=Core i7]
        Laptop copy    : Laptop:[dvdRom=false, name=Acer, processor=Core i7]
```