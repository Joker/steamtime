import QtQuick 1.1
import "clock"
import "kolba"
import "porshen"
import "back"

Rectangle {
    id: main
    width: 210; height: 210
    color: "transparent"

    property alias porshen_st: porshen.state
    property alias   kolba_st: kolba.state
    property string     water: "b"

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

        if(clock.seconds == 0) { porshen.state = "start"; steam.animation.stop(); steam.currentFrame = -1;
                                                          bk.gear += 12; porshen.gear_b += 12; }
        if(clock.seconds == 55){ porshen.state = "";      kolba.state = "steam";}
        if(clock.seconds == 57){ steam.animation.start() }
    }

    Timer {
        interval: 100; running: true; repeat: true;
        onTriggered: timeChanged()
    }


    Item {
        x: 221; y: 151
        width: 189; height: 197
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Back    { id: bk }
        Kolba   { id: kolba;   x: 87; y: 41 }
        Porshen { id: porshen; x: 31; y: 123 }
        Clock   { id: clock;   x: 29; y: 17 }
        Steam   { id: steam;   x: 2;  y: 95  }
    }
}
