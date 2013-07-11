import QtQuick 1.1

Item {
    id: klb
    width: 100; height: 100

    property alias ht: shtof.height
    property alias st: klb.state

    Image {
        id: porshen
        x: 83; y: water.y+87
        visible: false
        source: "kolba_porshen.png"
    }

    Image {           x: 76; y: 0;  source: "kolba.png" }
    Image {           x: 76; y: 12; source: "kolba_b.png" }
    Image { id: hvat; x: 0;  y: 27; source: "kolba_hvat.png" }

    Item {
        id: shtof
        x: 82; y: 12
        width: 13; height: 0

        anchors.bottom: parent.bottom
        anchors.bottomMargin: 13
        clip: true

        Image {
            id: water

            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            source: "kolba_water_b.png"
        }
    }

    states: [
        State {
            name: "steam"

            PropertyChanges { target: porshen; visible: true }
            PropertyChanges { target: shtof;   height: 75 }
            PropertyChanges { target: water;   y: -82 }
            AnchorChanges   { target: water;   anchors.bottom: undefined }
            PropertyChanges { target: main;    porshen_st: ""}
            onCompleted: {klb.state = "start"; }
        },
        State {
            name: "start"

            PropertyChanges { target: porshen; visible: false }
            PropertyChanges { target: shtof;   height: 0 }
        }
    ]
    transitions: [
        Transition {
            from: "*"; to: "steam"
            NumberAnimation {target: water; properties: "y"; duration: 5000 }
        }
    ]
}
