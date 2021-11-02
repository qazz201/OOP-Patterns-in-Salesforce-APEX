/**
 * Created by Vlad K. on 01.11.2021.
 * @description All specific handlers either handle requests
  * or send them to another handler in the chain
 */

public with sharing class DogHandler extends AbstractHandler {

    public override String handle(String someParam) {
        if (someParam == 'Dog') {
            return 'DogHandler: The Dog handler was handle the request.';
        }

       return super.handle(someParam);
    }
}