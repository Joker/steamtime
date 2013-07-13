import QtQuick 1.1
import "clock"
import "kolba"
import "porshen"

Rectangle {
    id: main
    width: 478; height: 478 // 189,165
    color: "transparent"

    property alias porshen_st: porshen.state
    property alias kolba_st: kolba.state
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
        // clock.seconds  = date.getSeconds()
        var sec = date.getSeconds()
        porshen.gear_up = clock.minutes * 24;
        gear_sec.rotation  = date.getMinutes()*6
        /*
        if(0 < sec && sec < 51 && sec%2 == 0 ){
            //kolba.ht = sec*1.5
        }
        */
        if(sec == 0) { porshen.state = "start" }
        if(sec == 55){ porshen.state = ""; kolba.state = "steam" }

        //console.log(sec)
    }
    
    Item {
        id: item1
        x: 221
        y: 151
        width: 189
        height: 165
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Image {
            id: br
            x: 80
            y: 43
            source: "back/br1.png"
        }

        Image {
            id: slangup
            x: 131
            y: 0
            source: "back/shlang_upr.png"
        }

        Image {
            id: shlangl
            x: 7
            y: 49
            source: "back/shlang_leftr.png"
        }

        Image {
            id: image6
            x: 166
            y: 137
            source: "back/shlang_downr1.png"
        }

        Image {
            id: gear_sec
            x: 99
            y: 5
            smooth: true
            source: "back/gear_1.png"
            Behavior on rotation {
                SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
            }
        }

        Kolba {
            id: kolba
            x: 87
            y: 41


        }


        Porshen {
            id: porshen
            x: 31
            y: 123
        }



        Clock {
            id: clock
            x: 29; y: 17

        }



    }

    Timer {
        interval: 100; running: true; repeat: true;
        onTriggered: timeChanged()
    }
    // */









}
