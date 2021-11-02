/**
 * Created by Vlad K. on 19.10.2021.
 */

public with sharing class LockedState extends State {
    public LockedState(Player player) {
        super(player);
    }

    public override void onLock() {
        if(this.player.isPlaying()){
            this.player.setState(new ReadyState(player));
        }else{
            System.debug('LockedState: Player is locked!');
        }
    }

    public override void onPlay() {
        this.player.setState(new ReadyState(player));
        System.debug('LockedState: Player is ready');
    }

    public override void onNext() {
        System.debug('LockedState: Player is locked!. You can not play next');
    }

    public override void onPrevious() {
        System.debug('LockedState: Player is locked!. You can not play previous');
    }
}