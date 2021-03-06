import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import QtPositioning 5.2
import QtLocation 5.3

Rectangle {
    width: parent? parent.width : 500
    height: parent? parent.height : 800
    visible: true
    Image {
        visible: true
        anchors.right: parent.right
        anchors.rightMargin: page.width*0.05
        anchors.bottom: parent.bottom
        anchors.bottomMargin: page.width*0.05
        width: page.width*.10
        height: page.width*.10
        source: "qrc:/logo.png"
        asynchronous : true
    }
    Text {
        id: dronelocation_title
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: page.height * 0.03
        text: qsTr("CURRENT DRONE LOCATION")
        font.family: "Avenir"
        font.letterSpacing: 2
    }
    Plugin {
        id: osmplugin2
        name:"osm"
    }

    Map {
        id: tracking_dronelocation_map
        anchors.horizontalCenter: parent.horizontalCenter
        y: dronelocation_title.y + dronelocation_title.height + page.height * 0.03
        width: page.width * 0.8
        height: page.width * 0.6
        plugin: osmplugin2
        zoomLevel: (maximumZoomLevel)*0.95
        center {
            latitude: 22.3362535
            longitude: 114.2629409
        }
    }
    Button {
        id: beep
        anchors.horizontalCenter: parent.horizontalCenter
        width: retrieved.width
        y: tracking_dronelocation_map.y + tracking_dronelocation_map.height + page.height * 0.03
        visible: true
        text: "BEEP"
    }
    Button {
        id: retrieved
        anchors.horizontalCenter: parent.horizontalCenter
        width: page.width * 0.5
        y: beep.y + beep.height + page.height * 0.03
        visible: true
        text: "Click to confirm drone retrieval"
        onClicked:{
            drone_location_page.visible = false
            pending_order_page.visible = true
        }
    }
}

