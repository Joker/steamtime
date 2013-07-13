import QtQuick 1.1

Item {
    width: 189; height: 197

    property alias gear: gear.rotation

    Image { id: br;          x: 80;  y: 43;  source: "br1.png"  }
    Image { id: shlang_up;   x: 131; y: 0;   source: "shlang_upr.png" }
    Image { id: shlang_left; x: 7;   y: 49;  source: "shlang_leftr.png" }
    Image { id: shlang_down; x: 166; y: 137; source: "shlang_downr1.png" }

    Image {
        id: gear;
        x: 81; y: -3
        smooth: true
        source: "gear_1.png"
        Behavior on rotation {
            SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
        }
    }
}

