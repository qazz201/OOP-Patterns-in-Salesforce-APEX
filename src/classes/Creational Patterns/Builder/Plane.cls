/**
 * Created by Vlad K.
 * @description Plane - this is a class of some product
 */

public with sharing class Plane {
    private String planeName;
    private Engine engine;
    private Integer wheelsCount = 3;
    private String wingType = 'Tapered Wing';
    private Integer topSpeed = 300; //mph
    private Integer seats = 300;
    private Boolean armor = false;

    public Plane(PlaneBuilder planeBuilder) {
        this.planeName = planeBuilder.planeName;
        this.engine = planeBuilder.engine;
        this.wheelsCount = planeBuilder.wheelsCount;
        this.wingType = planeBuilder.wingType;
    }

    public String getPlaneName() {
        return this.planeName;
    }

    public Engine getEngine() {
        return this.engine;
    }

    public Integer getWheelCount() {
        return this.wheelsCount;
    }

    public String getWingType() {
        return this.wingType;
    }

    public Integer getSpeed() {
        return this.topSpeed;
    }

    public Integer getSeats() {
        return this.seats;
    }

    public Boolean getArmor() {
        return this.armor;
    }

    //////////////// Set /////////////////////////////////////////////////////////////////////////////////////////////////

    public Plane setSpeed(Integer topSpeed) {
        this.topSpeed = topSpeed;
        return this;
    }

    public Plane setSeats(Integer seats) {
        this.seats = seats;
        return this;
    }

    public Plane setArmor(Boolean armor) {
        this.armor = armor;
        return this;
    }
}