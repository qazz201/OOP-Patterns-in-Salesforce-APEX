/**
 * Created by Vlad K. on 19.10.2021.
 */

public with sharing class Player {
    private State state;
    private Boolean isPlaying = false;

    public Player() {
        this.state = new ReadyState(this);
    }

    public void onPlay() {
        this.state.onPlay();
    }
    public void onLock(){
        this.state.onLock();
    }

    public void onNext(){
        this.state.onNext();
    }
    public void onPrevious(){
        this.state.onPrevious();
    }

    public void setState(State state) {
        this.state = state;
    }

    public void setPlaying(Boolean play) {
        this.isPlaying = play;
    }

    public Boolean isPlaying() {
        return this.isPlaying ;
    }
}