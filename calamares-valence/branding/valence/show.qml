import QtQuick 2.0
import calamares.slideshow 1.0

Presentation {
    id: presentation
    function nextSlide() { presentation.goToNextSlide(); }
    Timer { interval: 6000; running: presentation.activatedInCalamares; repeat: true; onTriggered: nextSlide() }
    Slide {
        Image { source: "welcome.png"; width: 260; height: 260; fillMode: Image.PreserveAspectFit; anchors.centerIn: parent; anchors.verticalCenterOffset: -40 }
        Text { anchors.horizontalCenter: parent.horizontalCenter; y: parent.height - 90; text: "Valence is being installed."; font.pixelSize: 20; color: "#2e3350" }
    }
    Slide {
        Text { anchors.centerIn: parent; width: parent.width * 0.8; wrapMode: Text.WordWrap; horizontalAlignment: Text.AlignHCenter
               text: "glibc, the GNU tools, runit and apk underneath.\nKDE Plasma on Wayland on top.\nA snapshot before every update, so a bad one can be undone."; font.pixelSize: 22; color: "#2e3350" }
    }
    function onActivate() { }
    function onLeave() { }
}
