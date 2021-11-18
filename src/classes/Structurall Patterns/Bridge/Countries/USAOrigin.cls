/**
 * Created by Vlad K. on 11.11.2021.
 * @description The specific realisation of Interface ICountryOfOrigin
 */

public with sharing class USAOrigin implements ICountryOfOrigin{

    public void setCountry() {
        System.debug('Made in: USA ');
    }
}