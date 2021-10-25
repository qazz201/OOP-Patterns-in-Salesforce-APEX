/**
 * Created by Vlad K. on 25.10.2021.
 * @description Overall  Mediator interface
 */

public interface Mediator {
    void registerComponent(ComponentI component);
    void saveAction(String actionName);
    void deleteAction(String actionName);
    void updateAction(String actionName);
}