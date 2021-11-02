# OOP-Patterns: Chain of Responsibility

The interface of the chain handler has a method for chaining all next handlers
and a method to handle some request
```apex
public interface ChainHandlerI {
    String handle(String someParam);
    ChainHandlerI linkWith(ChainHandlerI nextHandler);
}
```

The realization of chain handler
```apex
public abstract with sharing class AbstractHandler implements ChainHandlerI {
    ChainHandlerI nextHandler;

    public virtual String handle(String someParam) {
        if (this.nextHandler == null) return null;

        return this.nextHandler.handle(someParam);
    }

    public ChainHandlerI linkWith(ChainHandlerI nextHandler) {
        this.nextHandler = nextHandler;

        // It will help to link all handlers in this way:
        // dogHandler.linkWith(catHandler).linkWith(MouseHandler);
        return nextHandler;
    }
}
```

All specific handlers either handle requests or send them to another handler in the chain
```apex

public with sharing class DogHandler extends AbstractHandler {

    public override String handle(String someParam) {
        if (someParam == 'Dog') {
            return 'DogHandler: The Dog handler was handle the request.';
        }

       return super.handle(someParam);
    }
}
```

```apex

public with sharing class CatHandler extends AbstractHandler {

    public override String handle(String someParam) {
        if (someParam == 'Cat') {
            return 'CatHandler: The Cat handler was handle the request.';
        }
        
       return super.handle(someParam);
    }
}
```

```apex

public with sharing class MouseHandler extends AbstractHandler {

    public override String handle(String someParam) {
        if (someParam == 'Mouse') {
            return 'MouseHandler: The Mouse handler was handle the request.';
        }

      return super.handle(someParam);
    }
}
```
Example:
```apex

public with sharing class ChainExample {
    public void run() {
        List<String> requests = new List<String>{
                'Monkey', 'Mouse', 'Cat', 'Dog'
        };

        DogHandler dogHandler = new DogHandler();
        CatHandler catHandler = new CatHandler();
        MouseHandler mouseHandler = new MouseHandler();

        // Create the chain of handlers
        dogHandler
                .linkWith(catHandler)
                .linkWith(MouseHandler);

        System.debug('ChainExample: Loop starts ...');

        for (String request : requests) {
            System.debug('ChainExample: Request - ' + request);

            // Handle request
            String result = dogHandler.handle(request);

            if (result != null) {
                System.debug('ChainExample: Result from handler is: ' + result);
            } else {
                System.debug('ChainExample: Request was not handle:' + request);
            }

            System.debug('\n');
        }
        System.debug('ChainExample: The end of the loop \n');


        //You can send request to any handler in the chain ( not only the first)
        String result = catHandler.handle('Mouse');
        System.debug(result);
    }
}
```
Result:
```text
        ChainExample: Loop starts ...
        ChainExample: Request - Monkey
        ChainExample: Request was not handle:Monkey

        ChainExample: Request - Mouse
        ChainExample: Result from handler is: MouseHandler: The Mouse handler was handle the request.

        ChainExample: Request - Cat
        ChainExample: Result from handler is: CatHandler: The Cat handler was handle the request.

        ChainExample: Request - Dog
        ChainExample: Result from handler is: DogHandler: The Dog handler was handle the request.
        ChainExample: The end of the loop

        //You can send request to any handler in the chain ( not only the first)
        //      String result = catHandler.handle('Mouse');
        
        MouseHandler: The Mouse handler was handle the request.
```
