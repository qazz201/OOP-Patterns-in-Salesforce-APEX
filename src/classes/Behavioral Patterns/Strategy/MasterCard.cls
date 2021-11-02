/**
 * Created by vladyslavkravcuk on 20.10.2021.
 */

public with sharing class MasterCard implements Strategy{

    public void makePayment(Integer amount) {
        System.debug('MasterCard: You have paid '+amount+'$');
    }
}