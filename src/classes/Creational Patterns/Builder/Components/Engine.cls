/**
 * Created by  Vlad K.
 * @description Engine- this is a part of Plane that has its params
 */

public with sharing class Engine {
    private String type;
    private Integer power;
    private Boolean start = false;

    public Engine(String type, Integer power) {
        this.type = type;
        this.power = power;
    }

    public void startEngine(Boolean start) {
        this.start = start;
    }
}