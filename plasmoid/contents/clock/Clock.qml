import QtQuick 1.1

Item {
    id: clock
    width: 132; height: 132

    property int hours
    property int minutes
    property int seconds
    property alias wt: wt.source
    property alias shtof: shtof.height

    Image {
        x: -11; y: -18
        source: "bh10.png"

        Image { x: 74; y: 18; source: "bh11.png" }

        Rectangle {
            id: shtof
            width: 17; height: 70
            color: "transparent"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50
            anchors.horizontalCenterOffset: -19
            anchors.horizontalCenter: parent.horizontalCenter
            clip: true

            Image { id:wt; x: 1; y: 0; anchors.bottomMargin: 0; anchors.bottom: parent.bottom; source: "g.png" }
        }
    }
    //*
    Flipable {
        id: side
        width: 132; height: 132

        front: Image {
                    id:  main
                    x: -3
                    source: "cf0.png"

                    Image {
                        id: minute
                        x: 3; y: 0
                        smooth: true
                        source: "mh0.png"

                        transform: Rotation {
                            origin.x: 65; origin.y: 65;
                            angle: clock.minutes * 6
                            Behavior on angle {
                                SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
                            }
                        }
                    }
                    Image {
                        id: hour
                        x: 3; y: 0
                        smooth: true
                        source: "hh0.png"

                        transform: Rotation {
                            origin.x: 65; origin.y: 65;
                            angle: (clock.hours * 30) + (clock.minutes * 0.5)
                            Behavior on angle {
                                SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
                            }
                        }
                    }
                    Image {
                        id: glass
                        x: 15; y: 11
                        source: "cg.png"
                    }
                    MouseArea {
                        x: 64; y: 61
                        width: 9; height: 9
                        onClicked: { side.state = "up" }
                    }
                }

        back: Image {
                    id:  main_back
                    x: -3; y: -6

                    source: "cf1.png"

                    Image {
                        x: 3; y: 0
                        smooth: true
                        source: "mh1.png"

                        transform: Rotation {
                            origin.x: 65; origin.y: 65;
                            angle: clock.minutes * 6
                            Behavior on angle {
                                SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
                            }
                        }
                    }
                    Image {
                        x: 3; y: 0
                        smooth: true
                        source: "hh1.png"

                        transform: Rotation {
                            origin.x: 65; origin.y: 65;
                            angle: (clock.hours * 30) + (clock.minutes * 0.5)
                            Behavior on angle {
                                SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
                            }
                        }

                    }
                    Image {
                        id: glass_back
                        x: 15; y: 10
                        source: "cg.png"
                    }
                    MouseArea {
                        x: 61; y: 61
                        width: 9; height: 9
                        onClicked: { side.state = "vverh" }

                    }
                }


        states: [
            State {
                name: "down"
                PropertyChanges { target: rotation; angle: 0 }
            },
            State {
                name: "up"
                PropertyChanges { target: rotation; angle: 180;}
                onCompleted: side.state = "vniz"
            },
            State {
                name: "vniz"
                extend: "up"
                PropertyChanges { target: main_back;y:-137 }

            },
            State {
                name: "vverh"
                PropertyChanges { target: main_back;y:0 }
                onCompleted: side.state = "down"
            }
        ]
        transform: Rotation {
            id: rotation
            origin.x: side.width/2
            origin.y: 0 //side.height/2
            axis.x: 1; axis.y: 0; axis.z: 0     // set axis.y to 1 to rotate around y-axis
            angle: 0    // the default angle
        }
        transitions: Transition {
            NumberAnimation { target: rotation; property: "angle";  duration: 900 }
            NumberAnimation { properties: "x, y "; duration: 1700 }
        }
    }

// */



}
