using Toybox.WatchUi;
using Toybox.Math;

class CountdownView extends MainLayoutView {

    var mode;
    var countdown;
    var showRound;

    function initialize(_mode, _showRound, _countdown) {
        mode = _mode;
        showRound = _showRound;
        countdown = _countdown;

        MainLayoutView.initialize();
    }


    function fullSecondUpdate() {
        WatchUi.requestUpdate();
    }


    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
        debug("PrepareView onShow");
        countdown.fullSecondListen(self);
        MainLayoutView.onShow();
    }


    // Update the view
    function onUpdate(dc) {
        var timeInState = countdown.time();
        var remainingTime = countdown.remainingTime();
        var stateDuration = countdown.duration();

        var timeInStateSeconds = Math.round(timeInState / 1000.0).toNumber();
        var remainingSeconds = Math.round(remainingTime / 1000.0).toNumber();

        var currentRound = currentTrainingSession.round;
        var totalRounds = currentTraining.rounds();

        if (showRound) {
               setModeTextWithRoundNr(mode);
           } else {
               setModeText(mode);
           }
           setTimeText(remainingTime);

        // Call the parent onUpdate function to redraw the layout
        MainLayoutView.onUpdate(dc);

        graphicsHelper.drawProgressInnerInverted(dc, timeInState, stateDuration);
        graphicsHelper.drawProgressOuter(dc, currentRound, totalRounds);


        var isStartDuration = remainingSeconds == (countdown.duration() / 1000.0).toNumber();

        // Every 30 seconds if not start duration and more than 30 seconds left
        if (remainingSeconds > 30 && (remainingSeconds % 30) == 0 && !isStartDuration) {
            AttentionHelper.beep(2000, 250);
            AttentionHelper.vibrate(100, 250);
          } else if (remainingSeconds == 30) {
              // Exactly 30 seconds left --> 3 beeps
            AttentionHelper.multiBeep([
                {:freq => 2000, :ms => 250},
                {:freq => 0, :ms => 250},
                {:freq => 2000, :ms => 250},
                {:freq => 0, :ms => 250},
                {:freq => 2000, :ms => 250}
            ]);

            AttentionHelper.multiVibrate([
                {:percent => 100, :ms => 250},
                {:percent => 0, :ms => 250},
                {:percent => 100, :ms => 250},
                {:percent => 0, :ms => 250},
                {:percent => 100, :ms => 250}
            ]);

        } else if (remainingSeconds == 20) {
            // Exactly 20 seconds left --> 2 beeps
            AttentionHelper.multiBeep([
                {:freq => 2000, :ms => 250},
                {:freq => 0, :ms => 250},
                {:freq => 2000, :ms => 250},
            ]);

            AttentionHelper.multiVibrate([
                {:percent => 100, :ms => 250},
                {:percent => 0, :ms => 250},
                {:percent => 100, :ms => 250},
            ]);
        } else if (remainingSeconds == 10) {
            // Exactly 10 seconds left --> 1 beep
            AttentionHelper.beep(2000, 250);
            AttentionHelper.vibrate(100, 250);
        } else if (remainingSeconds <= 5) {
            // Less than / Equal 5 seconds --> 1 beep
            AttentionHelper.beep(2000, 250);
            AttentionHelper.vibrate(100, 250);
            graphicsHelper.drawBigCenteredNumber(dc, remainingSeconds, GraphicsHelper.MAIN_COLOR);
        }

        if (remainingSeconds == 5) {
            AttentionHelper.backlight(true);
        }
    }
}
