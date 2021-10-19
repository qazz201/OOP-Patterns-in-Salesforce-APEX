/**
 * Created by Vlad K. on 19.10.2021.
 */

public with sharing class Example {
    public void run() {
        Player player = new Player();

        player.onPlay();
        player.onPlay();
        player.onLock();
        player.onNext();
        player.onPrevious();
        player.onPlay();
        player.onNext();
        player.onPrevious();

        /*  Result:
          ReadyState: Player is playing ....
          PlayState: Player is paused
          LockedState: Player is locked!. You can not play next
          LockedState: Player is locked!. You can not play previous
          LockedState: Player is ready
          ReadyState: Next track...
          ReadyState: Previous  track...
     */
    }
}