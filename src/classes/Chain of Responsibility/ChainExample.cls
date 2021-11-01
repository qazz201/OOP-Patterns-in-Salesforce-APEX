/**
 * Created by vladyslavkravcuk on 01.11.2021.
 */

public with sharing class ChainExample {
    public void run() {
        List<String> requests = new List<String>{
                'Monkey', 'Mouse', 'Cat', 'Dog'
        };

        DogHandler dogHandler = new DogHandler();
        CatHandler catHandler = new CatHandler();
        MouseHandler mouseHandler = new MouseHandler();

        dogHandler
                .linkWith(catHandler)
                .linkWith(MouseHandler);

        System.debug('Example: Loop starts ...');

        for (String request : requests) {
            System.debug('Example: Request - ' + request);

            String result = dogHandler.handle(request);

            if (result != null) {
                System.debug('Example: Result is: ' + result);
            } else {
                System.debug('Example: Request was not handle:' + request);
            }

            System.debug('\n');
        }
        System.debug('Example: The end of the loop \n');



        String result = catHandler.handle('Mouse');
        System.debug(result);
    }
}