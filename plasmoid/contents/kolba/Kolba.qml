import QtQuick 1.1

Item {
    id: main
    width: 100; height: 100

    property alias  w: water.y
    property alias st: main.state

    Image {
        id: porshen
        x: 83
        y: water.y+87
        visible: false
        source: "kolba_porshen.png"
    }

    Image {
        x: 76
        y: 0
        source: "kolba.png"
    }
    Image {
        id: kolba
        x: 76
        y: 12
        clip: true
        source: "kolba_b.png"

        Image {
            id: water
            x: 6
            y: 75
            source: "kolba_water_b.png"
        }
    }

    Image {
        id: hvat
        x: 0
        y: 27
        source: "kolba_hvat.png"
    }
    states: [
        State {
            name: "steam"

            PropertyChanges {
                target: water
                x: 6
                y: -84
            }

            PropertyChanges {
                target: porshen
                visible: true

            }
            onCompleted: main.state = "start"
        },
        State {
            name: "start"

            PropertyChanges {
                target: water
                y: 75
            }
            PropertyChanges {
                target: porshen
                visible: false

            }
        }
    ]
    transitions: [
        Transition {
            from: "*"; to: "steam"
            NumberAnimation { properties: "y "; duration: 5000 }
        }
    ]
}
