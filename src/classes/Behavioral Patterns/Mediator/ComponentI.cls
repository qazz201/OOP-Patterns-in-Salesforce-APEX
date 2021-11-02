/**
 * Created by Vlad K. on 25.10.2021.
 * @description The overall Interface of components
 */

public interface ComponentI {
    void setMediator(Mediator mediator);
    String getName();
    void setTitle(String title);
}