import QtQuick 1.1

Item {
    id: klb
    width: 100; height: 100

    property alias ht: shtof.height
    property alias st: klb.state
    property int sh: 0

    Component.onCompleted: {
        var kolbaState      = plasmoid.readConfig("kolbaState").toString();
        if (kolbaState.length > 0) { klb.state = kolbaState }
    }

    Image {
        id: porsh
        x: 83; y: water.y+87
        visible: false
        source: "kolba_porshen.png"
    }

    Image {
        id: kolba;
        x: 76; y: 0;
        source: "kolba.png"

        Image { x: 0; y: 12; source: "kolba_b.png" }
        Item {
            id: shtof
            x: 6; y: 87
            width: 13; height: 0

            anchors.bottom: parent.bottom
            anchors.bottomMargin: 13
            clip: true

            Image {
                id: water

                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                source: "kolba_water_"+main.water+".png"
            }
        }
    }

    Image { id: hvat; x: 0;  y: 27; source: "kolba_hvat.png" }

    MouseArea {
        id: mousearea1
        x: 82; y: 12
        width: 13; height: 75
        onClicked: {
            if(clock.seconds <= 50 && clock.seconds >= 3){
                sh = ht
                klb.state = "hvat1"
                ht = sh
            }
            plasmoid.writeConfig("kolbaState", klb.state);
        }
    }

    states: [
        State {
            name: "steam"

            PropertyChanges { target: main;    porshen_st: ""}
            PropertyChanges { target: porshen.gear_big; angle:-360; }
            PropertyChanges { target: porsh;   visible: true }
            PropertyChanges { target: shtof;   height: 75 }
            PropertyChanges { target: water;   y: -82 }
            AnchorChanges   { target: water;   anchors.bottom: undefined }

            onCompleted: { klb.state = "start"; }
        },
        State {
            name: "start"

            PropertyChanges { target: porsh; visible: false }
            PropertyChanges { target: shtof;  height: 0 }
        },


        State {
            name: "hvat1"
            PropertyChanges { target: porshen; state: "" }
            PropertyChanges { target: hvat; x: 30 }
            PropertyChanges { target: mousearea1; visible: false }
            onCompleted: { klb.state = "hvat2";}
        },
        State {
            name: "hvat2"
            extend: "hvat1"
            PropertyChanges { target: hvat;  x: -46; }
            PropertyChanges { target: kolba; x: 0 }
            onCompleted: {
                klb.state = "hvat3";
                clock.wt = "../clock/" + main.water + ".png";
                if(main.water == "b")    main.water = "g"
                                 else    main.water = "b"
                clock.shtof = sh
                ht = sh

            }
        },
        State {
            name: "hvat3"
            extend: "hvat2"
            PropertyChanges { target: hvat;  x: 30 }
            PropertyChanges { target: kolba; x: 76 }
            onCompleted: { klb.state = ""; mousearea1.visible = true}
        }
    ]
    transitions: [
        Transition {
            from: "*"; to: "steam"
            NumberAnimation {target: water; properties: "y";      duration: 2000 }
            NumberAnimation {target: shtof; properties: "height"; duration: 100 }
            NumberAnimation {target: porshen.gear_big; properties: "angle"; duration: 1850;  easing.type: Easing.InOutBack;}
        },
        Transition {
            NumberAnimation {target: hvat; properties: "x"; duration: 1500; easing.type: Easing.InOutBack; }
            NumberAnimation {target: kolba; properties: "x"; duration: 1500; easing.type: Easing.InOutBack; }
        }
    ]
}
