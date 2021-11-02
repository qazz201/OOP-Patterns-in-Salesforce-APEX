/**
 * Created by Vlad K. on 19.10.2021.
 */

public with sharing class ReadyState extends State {
    public ReadyState(Player player) {
        super(player);
    }

    public override void onLock() {
        this.player.setState(new LockedState(this.player));
    }

    public override void onPlay() {
        if (this.player.isPlaying()) return;

        this.player.setPlaying(true);
        this.player.setState(new PlayState(this.player));

        /* Do some stuff */

        System.debug('ReadyState: Player is playing ....');
    }

    public override void onNext() {
        System.debug('ReadyState: Next track...');
    }

    public override void onPrevious() {
        System.debug('ReadyState: Previous  track...');
    }
}