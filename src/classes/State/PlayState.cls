/**
 * Created by Vlad K. on 19.10.2021.
 */

public with sharing class PlayState extends State {
    public PlayState(Player player) {
        super(player);
    }

    public override void onLock() {
        this.player.setState(new LockedState(this.player));
    }

    public override void onPlay() {
        this.player.setPlaying(false);
        this.player.setState(new ReadyState(this.player));

        /* Do some stuff */

        System.debug('PlayState: Player is paused');
    }

    public override void onNext() {
        System.debug('PlayState: Next track...');
    }

    public override void onPrevious() {
        System.debug('PlayState: Previous  track...');
    }
}