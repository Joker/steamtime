import QtQuick 1.1
import "clock"

Rectangle {
    id: main
    width: 478; height: 478 // 189,165
    color: "transparent"


//*
    Component.onCompleted: {
        defaultDate()

        plasmoid.setBackgroundHints(NoBackground);
    }

    function defaultDate(today) {

    }
    function timeChanged() {
        var date = new Date;

        clock.hours    = date.getHours()
        clock.minutes  = date.getMinutes()
        clock.seconds  = date.getSeconds()
    }

    Timer {
        interval: 100; running: true; repeat: true;
        onTriggered: timeChanged()
    }
// */

    Clock {
        id: clock
        x: 189; y: 189
    }
}
