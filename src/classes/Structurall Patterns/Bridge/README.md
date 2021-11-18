# OOP-Patterns: Bridge

### The abstract class that represents some product ( can also be an Interface)
```apex
public abstract with sharing class Aircraft {
    
    // this is a bridge between two hierarchies of class (abstraction and implementation)
    // it delegates functionality
    protected ICountryOfOrigin countryOfOrigin; 

    public Aircraft(ICountryOfOrigin countryOfOrigin) {
        this.countryOfOrigin = countryOfOrigin;
    }

  // The example of the pattern 'Template method'
   public virtual void showDetails(){
       this.showType();
       this.countryOfOrigin.setCountry();
   }

    public virtual void setOrigin(ICountryOfOrigin countryOfOrigin){
        this.countryOfOrigin = countryOfOrigin;
    }

    protected abstract void showType();
}


/* Example:

    new Airbus(new USAOrigin()).showDetails();
    new Boeing(new GBBOrigin()).showDetails();
    new Lockheed(new USAOrigin()).showDetails();

 */
```

The specific realization of Aircraft that have its unique characteristics (Type)

```apex

public with sharing class Airbus extends Aircraft {
    public Airbus(ICountryOfOrigin countryOfOrigin) {
        super(countryOfOrigin);
    }

    public override void showType() {
        System.debug('Aircraft is: Airbus');
    }
}
```

```apex
public with sharing class Boeing extends Aircraft {
    public Boeing(ICountryOfOrigin countryOfOrigin){
        super( countryOfOrigin);
    }

    public override void showType(){
        System.debug('Aircraft is: Boeing');
    }
}
```

```apex
public with sharing class Lockheed extends Aircraft {
    public Lockheed(ICountryOfOrigin countryOfOrigin){
        super( countryOfOrigin);
    }

    public override void showType() {
        System.debug('Aircraft is: Lockheed');
    }
}
```

### An interface of another product that knows nothing about Abstraction (in our case Aircraft)

```apex
public interface ICountryOfOrigin {
    void setCountry();
}
```

The specific realisation of Interface ICountryOfOrigin

```apex
public with sharing class USAOrigin implements ICountryOfOrigin{

    public void setCountry() {
        System.debug('Made in: USA ');
    }
}
```

```apex
public with sharing class GBOrigin implements ICountryOfOrigin{

    public void setCountry() {
        System.debug('Made in: Great Britain');
    }
}
```

### Example:

```apex
public with sharing class BridgeExample {
    public void run() {
        Aircraft aircraft = new Airbus(new USAOrigin());
        aircraft.showDetails();

        // We can dynamically change origin of Aircraft
        aircraft = new Lockheed(new GBOrigin());
        aircraft.showDetails();
        aircraft.setOrigin(new USAOrigin());
        aircraft.showDetails();

    }
}
```

Result:

```text
            Aircraft is: Airbus
            Origin: USA

            Aircraft is: Lockheed
            Origin: Great Britain

            Aircraft is: Lockheed
            Origin: USA
```
