/**
 * Created by vladyslavkravcuk on 20.10.2021.
 */

public with sharing class Visa implements Strategy{

    public void makePayment(Integer amount) {
        System.debug('Visa: You have paid '+amount+'$');
    }
}