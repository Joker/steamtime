import QtQuick 1.1
import "clock"
import "kolba"
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

    Image {
        id: image1
        x: 162
        y: 178
        visible: false
        source: "bk0.png"
    }

    Timer {
        interval: 100; running: true; repeat: true;
        onTriggered: timeChanged()
    }
    // */

    Image {
        id: br
        x: 242
        y: 219
        source: "img/br1.png"
    }



    Image {
        id: image3
        x: 177
        y: 266
        source: "img/gear_2.png"
    }

    Image {
        id: slangup
        x: 294
        y: 185
        source: "img/shlang_up.png"
    }

    Image {
        id: shlangl
        x: 171
        y: 238
        source: "img/shlang_left.png"
    }

    Image {
        id: image4
        x: 248
        y: 174
        source: "img/gear_1.png"
    }





    Image {
        id: image2
        x: 199
        y: 298
        source: "img/gear_4.png"
    }





    Image {
        id: image7
        x: 259
        y: 325
        source: "img/porshen_sh.png"
    }

    Image {
        id: image5
        x: 221
        y: 305
        source: "img/dc_1.png"
    }

    Image {
        id: image6
        x: 328
        y: 319
        source: "img/shlang_down.png"
    }

    Kolba {
        id: kolba1
        x: 249
        y: 219
    }

    Clock {
        id: clock
        x: 194; y: 191
    }


}