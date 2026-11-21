import QtQuick

// Valence's loading screen: the default wallpaper eases into place while Plasma starts,
// so the desktop takes over from the same picture; a thin progress bar follows KSplash's stages (1-6)
Rectangle {
    id: root
    color: "#000000"
    property int stage

    Image {
        id: picture
        anchors.fill: parent
        source: "images/splash.jpg"
        fillMode: Image.PreserveAspectCrop
        opacity: 0
        scale: 1.08
        transformOrigin: Item.BottomRight
        Component.onCompleted: rise.start()
        ParallelAnimation {
            id: rise
            OpacityAnimator { target: picture; from: 0; to: 1; duration: 900; easing.type: Easing.OutQuad }
            ScaleAnimator { target: picture; from: 1.08; to: 1.0; duration: 3200; easing.type: Easing.OutCubic }
        }
    }

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * 0.1
        spacing: 16
        opacity: 0
        OpacityAnimator on opacity { from: 0; to: 1; duration: 1200; easing.type: Easing.InOutQuad }

        Text {
            readonly property int px: Math.round(root.height * 0.022)
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Valence"
            color: "#c3c9d6"
            opacity: 0.85
            font.pixelSize: px
            font.letterSpacing: px * 0.45
            font.weight: Font.Light
        }
        Rectangle {
            width: Math.round(root.width * 0.14); height: 3; radius: 1.5
            color: "#33ffffff"
            Rectangle {
                width: parent.width * Math.min(1, root.stage / 6); height: parent.height; radius: 1.5
                color: "#c3c9d6"
                Behavior on width { NumberAnimation { duration: 450; easing.type: Easing.OutCubic } }
            }
        }
    }
}
