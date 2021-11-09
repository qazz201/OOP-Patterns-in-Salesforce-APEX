/**
 * Created by  on .
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