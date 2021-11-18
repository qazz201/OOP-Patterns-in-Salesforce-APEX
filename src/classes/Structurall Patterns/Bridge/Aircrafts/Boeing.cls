/**
 * Created by Vlad K. on 11.11.2021.
 * @description The specific realization of Aircraft that have its unique characteristics (Type)
 */

public with sharing class Boeing extends Aircraft {
    public Boeing(ICountryOfOrigin countryOfOrigin){
        super( countryOfOrigin);
    }

    public override void showType(){
        System.debug('Aircraft is: Boeing');
    }
}