import QtQuick 1.1

Item {
    id: main
    state: "start"

    Image {
        source: "porshen_sh.png"

        Item {
            id: psbar_it
            x: 9; y: 3
            width: 40; height: 12

            anchors.right: parent.right
            anchors.rightMargin: 20
            clip: true

            Image {
                id: water
                source: "psbar.png"
            }
        }

        Image {
            id: end
            x: -1; y: -3
            source: "ps.png"
        }
    }

    states: [
        State {
            name: "start"

            onCompleted: main.state = "stop"

            PropertyChanges { target: end; x: -1; y: -3 }
            PropertyChanges { target: psbar_it; width: 40 }
        },
        State {
            name: "stop"

            onCompleted: main.state = "start"

            PropertyChanges { target: end; x: 39; y: -3 }
            PropertyChanges { target: psbar_it; width: 0 }
        }
    ]
    transitions: [
        Transition {
            NumberAnimation { properties: "width, x"; duration: 850 }
        }
    ]
}
