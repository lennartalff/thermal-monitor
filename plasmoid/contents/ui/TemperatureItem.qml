import QtQuick 2.15
import QtQuick.Layouts 1.0
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
    id : main
    property string device : "DEV"
    property string temperature : "°C"
    property var customHeight
    property double widthHeightRatio: sizeHelper.width / sizeHelper.height

    width: customHeight * widthHeightRatio
    height: customHeight
    // Rectangle {
    //     anchors.fill : parent
    //     color : "transparent"
    //     border.width : 5
    //     border.color : "orange"
    // }


    Text {
        id : deviceLabel
        text : device + ": "
        anchors.left : parent.left
        anchors.top : parent.top
        fontSizeMode : Text.VerticalFit
        minimumPointSize: 8
        font.pointSize: 72
        color : PlasmaCore.ColorScope.textColor
        verticalAlignment : Text.AlignVCenter
        horizontalAlignment : Text.AlignHCenter
        // Rectangle {
        //     anchors.fill : parent
        //     color : "transparent"
        //     border.color : "blue"
        // }
        
        width: parent.width/2
        height: parent.height
    }
    TextMetrics {
        id : sizeHelper
        text : " DEV: 00°C "
    }
    Text {
        id : temperatureLabel
        text : temperature
        anchors.left : deviceLabel.right
        anchors.top : parent.top
        fontSizeMode : Text.VerticalFit
        minimumPointSize: 8
        font : deviceLabel.font
        verticalAlignment : Text.AlignVCenter
        horizontalAlignment : Text.AlignHCenter
        // Rectangle {
        //     anchors.fill : parent
        //     color : "transparent"
        //     border.color : "green"
        // }
        width: parent.width/2
        height: parent.height

    }


}
