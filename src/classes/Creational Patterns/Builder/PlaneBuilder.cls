
/**
 * Created by Vlad K. on 08.11.2021.
 */

public with sharing class PlaneBuilder implements Builder {
    private String planeName;
    private Engine engine;
    private Integer wheelsCount;
    private String wingType;

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
        return new Plane(planeName, engine, wheelsCount, wingType);
    }
}