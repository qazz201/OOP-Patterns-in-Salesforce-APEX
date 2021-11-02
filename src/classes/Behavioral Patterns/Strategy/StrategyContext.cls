/**
 * Created by vladyslavkravcuk on 20.10.2021.
 */

public with sharing class StrategyContext {
    private Strategy strategy;

    public StrategyContext(Strategy strategy) {
        this.strategy = strategy;

    }

    public void setStrategy(Strategy strategy) {
        this.strategy = strategy;
    }

    public void pay(Integer amount) {
        this.strategy.makePayment(amount);
    }
}