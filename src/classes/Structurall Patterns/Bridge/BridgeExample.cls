/**
 * Created by Vlad K. on 18.11.2021.
 */

public with sharing class BridgeExample {
    public void run() {
        Aircraft aircraft = new Airbus(new USAOrigin());
        aircraft.showDetails();

        // We can dynamically change origin of Aircraft
        aircraft = new Lockheed(new GBOrigin());
        aircraft.showDetails();
        aircraft.setOrigin(new USAOrigin());
        aircraft.showDetails();

    }
}
        /*
        Result:

            Aircraft is: Airbus
            Origin: USA

            Aircraft is: Lockheed
            Origin: Great Britain

            Aircraft is: Lockheed
            Origin: USA
         */