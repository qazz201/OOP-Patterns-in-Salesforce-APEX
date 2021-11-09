/**
 * Created by Vlad K. on 08.11.2021.
 * @description The Builder interface declare all steps to create specific  configurations of the product
 */

public interface Builder {
    void setName(String name);
    void setEngine(Engine engine);
    void setWheels(Integer count);
    void setWingType(String wingType);
}