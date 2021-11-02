/**
 * Created by Vlad.K on 01.11.2021.
 */

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
        /*
        Result:

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

        MouseHandler: The Mouse handler was handle the request.
        */