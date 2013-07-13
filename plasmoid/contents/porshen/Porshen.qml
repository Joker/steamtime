import QtQuick 1.1

Item {
    id: pshn
    width: 135; height: 71
    state: "start"

    property alias gear: gear.rotation
    property alias gear_up: gear_up.rotation
    Image {
        id: gear
        x: -15; y: -35
        smooth: true
        source: "porshen_gear2.png"
        Behavior on rotation {
            SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
        }
    }
    Image {
        id: gear_up
        smooth: true
        source: "porshen_gear.png"
        Behavior on rotation {
            SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
        }
    }

    Image { x: 21; y: 6; source: "porshen_gu1.png" }

    Image {
        x: 56; y: 26
        source: "porshen_g1.png"

        Item {
            id: psbar_it
            y: 3
            width: 40; height: 12

            anchors.right: parent.right
            anchors.rightMargin: 20
            clip: true

            Image { id: water; source: "psbar.png" }
        }
        Image { id: end; x: 9; y: -3; source: "ps.png" }
    }




    states: [
        State {
            name: "start"
            onCompleted: {
                pshn.state = "stop"



            }

            PropertyChanges { target: end; x: 9; y: -3 }
            PropertyChanges { target: psbar_it; width: 40 }
        },
        State {
            name: "stop"
            onCompleted: {
                pshn.state = "start"
                kolba.ht += 4
                if(pshn.gear >= 360) pshn.gear = 0
                pshn.gear  += 12
            }

            PropertyChanges { target: end; x: 49; y: -3 }
            PropertyChanges { target: psbar_it; width: 0 }
        }
    ]
    transitions: [
        Transition {
            NumberAnimation { properties: "width, x"; duration: 1405 }
        }
    ]
}
