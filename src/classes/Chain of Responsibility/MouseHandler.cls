/**
 * Created by vladyslavkravcuk on 01.11.2021.
 */

public with sharing class MouseHandler extends AbstractHandler {

    public override String handle(String someParam) {
        if (someParam == 'Mouse') {
            return 'MouseHandler: The Mouse handler was handle the request.';
        }

      return super.handle(someParam);
    }
}