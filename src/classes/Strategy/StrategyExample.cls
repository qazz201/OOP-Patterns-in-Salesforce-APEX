/**
 * Created by Vlad K. on 20.10.2021.
 */

public with sharing class StrategyExample {
    public void run(String strategyName, Integer amount) {
        Strategy strategy;

        switch on strategyName {
            when 'MasterCard' {
                strategy = new MasterCard();
            }
            when 'Visa' {
                strategy = new Visa();
            }
        }

        if (strategy == null) return;

        new StrategyContext(strategy).pay(amount);
    }
}

        /*
            new StrategyExample().run('Visa',100);
            new StrategyExample().run('MasterCard',300);

            Result:

            Visa: You have paid 100$
            MasterCard: You have paid 300$
         */