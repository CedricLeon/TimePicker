import QtQuick 2.12
import QtQuick.Window 2.12
import Qaterial 1.0 as Qaterial

Qaterial.ApplicationWindow
{
    id: window
    visible: true
    width: 380
    height: 530
    title: "Hour Picker"

    property int hour: 0
    property int minute: 0
    property bool hourVisible: true

    //Affichage de l'heure sélectionnée
    Rectangle
    {
        id: hourPrint
        anchors.horizontalCenter: parent.horizontalCenter
        y: _hourPicker.y - (30 + height)
        width: 100
        height: _switchHourMinute.height

        color: "transparent"
        border.color: Qaterial.Style.accentColor
        border.width: 4
        radius: 10
        Qaterial.FlatButton
        {
            id: _switchHourMinute
            anchors.fill: parent
            function pad (num, size) {
                let s = num+"";
                while (s.length < size) s = "0" + s;
                return s;
            }
            text: `${pad(window.hour, 2)}:${pad(window.minute, 2)}`
            textType: Qaterial.Style.TextType.Display1
            onClicked:
            {
                // Switch HourPicker to MinutePicker
                window.hourVisible = !window.hourVisible
            }
        }
    }

    EuCircularHourPicker
    {
        id: _hourPicker
        anchors.centerIn: parent
        radius: _slider.value
        hour: window.hour
        visible: hourVisible

        onAccepted: (hour) => window.hour = hour
    }

    CircularMinutePicker
    {
        id: _minutePicker
        anchors.centerIn: parent
        radius: _slider.value
        minute: window.minute
        visible: !hourVisible

        onAccepted: (minute) => window.minute = minute
    }

    Qaterial.FlatButton
    {
        x: hourPrint.x - width - 20
        y: hourPrint.y
        onClicked: hourVisible ? window.hour++ : window.minute++
        text: "+"
        textType: Qaterial.Style.TextType.Display1
    }
    Qaterial.FlatButton
    {
        x: hourPrint.x + hourPrint.width + 20
        y: hourPrint.y
        onClicked: hourVisible ? window.hour-- : window.minute--
        text: "-"
        textType: Qaterial.Style.TextType.Display1
    }

    Qaterial.Slider
    {
        id: _slider
        anchors.horizontalCenter: parent.horizontalCenter
        y: _hourPicker.y + _hourPicker.height + 30
        from: 80
        to: 200
        value: 150
    }
}
