/**
 * Created by Vlad K. on 11.11.2021.
 * @description The abstract class that represents some product
 */

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