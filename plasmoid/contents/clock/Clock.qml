import QtQuick 1.1

Item {
    id: clock
    width: 132; height: 132

    property int hours
    property int minutes
    property int seconds

    //*
    Flipable {
        id: side
        width: 132; height: 132

        property bool flipped: false

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
                            origin.x: 68; origin.y: 65;
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
                            origin.x: 68; origin.y: 65;
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
                        id: mousearea1
                        x: 64; y: 61
                        width: 9; height: 9
                        onClicked: { side.flipped = !side.flipped }
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
                            origin.x: 68; origin.y: 65;
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
                            origin.x: 68; origin.y: 65;
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
                        id: mousearea2
                        x: 61; y: 61
                        width: 9; height: 9
                        onClicked: { side.flipped = !side.flipped }

                    }
                }


        states: [
            State {
                name: "front"
                PropertyChanges { target: rotation; angle: 180 }
                when: side.flipped
            },
            State {
                name: "back"
                PropertyChanges { target: rotation; angle: 0 }
                when: !side.flipped
            }
        ]
        transform: Rotation {
            id: rotation
            origin.x: side.width/2
            origin.y: side.height/2
            axis.x: 1; axis.y: 0; axis.z: 0     // set axis.y to 1 to rotate around y-axis
            angle: 0    // the default angle
        }
        transitions: Transition {
            SpringAnimation { target: rotation; property: "angle";  spring: 4; damping: 0.3; modulus: 360 ;mass :5;}// velocity: 490}
        }
    }

// */



}
