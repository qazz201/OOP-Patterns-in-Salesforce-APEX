/**
 * Created by vladyslavkravcuk on 01.11.2021.
 */

public with sharing class CatHandler extends AbstractHandler {

    public override String handle(String someParam) {
        if (someParam == 'Cat') {
            return 'CatHandler: The Cat handler was handle the request.';
        }
        
       return super.handle(someParam);
    }
}