/**
 * Created by Vlad K. on 01.11.2021.
 * @description The interface of the chain handler has a method for chaining all next handlers
  * and a method to handle some request
 */

public interface ChainHandlerI {
    String handle(String someParam);
    ChainHandlerI linkWith(ChainHandlerI nextHandler);
}