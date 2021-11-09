# OOP-Patterns: Builder

The Builder interface declare all steps to create specific  configurations of the product

```apex
public interface Builder {
    void setName(String name);
    void setEngine(Engine engine);
    void setWheels(Integer count);
    void setWingType(String wingType);
}
```
The specific builder implement steps from Builder interface

```apex
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
```

Plane - this is a class of some product

```apex
public with sharing class Plane {
    private String planeName;
    private Engine engine;
    private Integer wheelsCount = 3;
    private String wingType = 'Tapered Wing';
    private Integer topSpeed = 300; //mph
    private Integer seats = 300;
    private Boolean armor = false;

    public Plane(String planeName, Engine engine, Integer wheelsCount, String wingType) {
        this.planeName = planeName;
        this.engine = engine;
        this.wheelsCount = wheelsCount;
        this.wingType = wingType;
    }

    public String getPlaneName(){
        return this.planeName;
    }

    public Engine getEngine(){
        return this.engine;
    }

    public Integer getWheelCount(){
        return this.wheelsCount;
    }

    public String getWingType(){
        return this.wingType;
    }

    public Integer getSpeed(){
        return this.topSpeed;
    }

    public Integer getSeats(){
        return this.seats;
    }

    public Boolean getArmor(){
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
```

Engine- this is a part of Plane that has its params

```apex
public with sharing class Engine {
    private String type;
    private Integer power;
    private Boolean start = false;

    public Engine(String type, Integer power) {
        this.type = type;
        this.power = power;
    }

    public void startEngine(Boolean start) {
        this.start = start;
    }
}
```

Director knows in which sequence the builder should work. 
He works with builders via Builder interface and can nothing know about what type of product is currently built

```apex

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
```

### Example:

```apex
public with sharing class BuilderExample {
    public void run() {
        PlaneDirector director = new PlaneDirector();
        PlaneBuilder builder = new PlaneBuilder();

        director.constructPassengerPlane(builder);
        Plane passengerPlane = builder.getResult();
        passengerPlane
                .setSeats(853)
                .setSpeed(740);

        System.debug(passengerPlane);

        director.constructMilitaryPlane(builder);
        Plane militaryPlane = builder.getResult();
        militaryPlane
                .setArmor(true)
                .setSeats(2)
                .setSpeed(1200);

        System.debug(militaryPlane);
    }
}
```

Result:

```text
///////////// AirBus a380 //////////////////////////////////////////////////////////////////////////////////////////////
        Plane:[
                armor=false,
                engine=Engine:[
                               power=70000,
                               start=false,
                               type=Alliance GP7000
                               ],
                planeName=AirBus a380,
                seats=853,
                topSpeed=740,
                wheelsCount=22,
                wingType=Swept Back Wings
              ]

///////////// F35 //////////////////////////////////////////////////////////////////////////////////////////////////////
        Plane:[
                armor=true,
                engine=Engine:[
                               power=40000,
                               start=false,
                               type=Whitney F119-PW-100
                               ],
                planeName=F35,
                seats=2,
                topSpeed=1200,
                wheelsCount=3,
                wingType=Trapezoidal Wing
        ]
```
