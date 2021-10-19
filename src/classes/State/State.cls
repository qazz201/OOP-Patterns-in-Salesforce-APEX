/**
 * Created by Vlad K. on 19.10.2021.
 */

public abstract with sharing class State {
    protected Player player;

    public State(Player player) {
        this.player = player;
    }

    public abstract void onLock();
    public abstract void onPlay();
    public abstract void onNext();
    public abstract void onPrevious();
}