/**
 * Created by vladyslavkravcuk on 01.11.2021.
 */

public interface ChainHandlerI {
    String handle(String someParam);
    ChainHandlerI linkWith(ChainHandlerI nextHandler);
}