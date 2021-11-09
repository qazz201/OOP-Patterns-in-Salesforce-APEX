/**
 * Created by Vlad K. on 09.11.2021.
 * @description Director knows in which sequence the builder should work.
  * He works with builders via Builder interface and can nothing know about what type of product is currently built
 */

public with sharing class PlaneDirector {
    public void constructPassengerPlane(Builder builder) {
        builder.setName('AirBus a380');
        builder.setWheels(22);
        builder.setWingType('Swept Back Wings');
        builder.setEngine(new Engine('Alliance GP7000', 70000));
    }

    public void constructMilitaryPlane(Builder builder) {
        builder.setName('F35');
        builder.setWheels(3);
        builder.setWingType('Trapezoidal Wing');
        builder.setEngine(new Engine('Whitney F119-PW-100 ', 40000));
    }
}