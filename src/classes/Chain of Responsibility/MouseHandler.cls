/**
 * Created by Vlad K. on 01.11.2021.
 *  @description All specific handlers either handle requests
 * or send them to another handler in the chain
 */

public with sharing class MouseHandler extends AbstractHandler {

    public override String handle(String someParam) {
        if (someParam == 'Mouse') {
            return 'MouseHandler: The Mouse handler was handle the request.';
        }

      return super.handle(someParam);
    }
}