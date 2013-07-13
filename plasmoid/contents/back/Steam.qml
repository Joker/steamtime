import QtQuick 1.0

Item{
    id:sp

    property alias animation: spriteTimer

    property int framesHorizontCount:6
    property int framesVerticalCount:1
    property int framesCount:(framesHorizontCount*framesVerticalCount)
    property int currentFrame:-1

    property string sourcePath:"steam.png"

    property int animationSpeed:80


    x:0; y:0; z:0
    clip:true

    height: spAnimationImg.height/framesVerticalCount
    width:  spAnimationImg.width /framesHorizontCount

    Image{
        id:spAnimationImg
        source:sourcePath

        x:-((sp.currentFrame*sp.width)-Math.floor(sp.currentFrame/sp.framesHorizontCount)*(sp.framesHorizontCount*sp.width))
        y:-(Math.floor(sp.currentFrame/sp.framesHorizontCount)*sp.height)
    }

    Timer{
        id:spriteTimer
        interval:sp.animationSpeed
        running:false
        repeat:true

        onTriggered:{
            //console.log(sp.currentFrame)
            sp.currentFrame++

            if (sp.currentFrame==sp.framesCount){
                //spTimer.stop()
                sp.currentFrame = 0
            }
        }
    }
}
