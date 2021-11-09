/**
 * Created by vladyslavkravcuk on 09.11.2021.
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