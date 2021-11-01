/**
 * Created by vladyslavkravcuk on 01.11.2021.
 */

public with sharing class DogHandler extends AbstractHandler {

    public override String handle(String someParam) {
        if (someParam == 'Dog') {
            return 'DogHandler: The Dog handler was handle the request.';
        }

       return super.handle(someParam);
    }
}