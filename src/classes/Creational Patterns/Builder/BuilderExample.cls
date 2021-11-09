/**
 * Created by vladyslavkravcuk on 09.11.2021.
 */

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

/*
Result:
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
 */