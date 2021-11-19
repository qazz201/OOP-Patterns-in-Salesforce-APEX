
/**
 * Created by Vlad K. on 08.11.2021.
 * @description The specific builders implement steps from Builder interface
 */

public with sharing class PlaneBuilder implements Builder {
    public String planeName;
    public Engine engine;
    public Integer wheelsCount;
    public String wingType;

    public PlaneBuilder(){}

    public void setName(String name) {
        this.planeName = name;
    }

    public void setEngine(Engine engine) {
        this.engine = engine;
    }

    public void setWheels(Integer count) {
        this.wheelsCount = count;
    }

    public void setWingType(String wingType) {
        this.wingType = wingType;
    }

    public Plane getResult() {
        return new Plane(this);
    }
}