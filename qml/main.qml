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
    property bool amHour: false
    property bool am: true



    //Affichage de l'heure sélectionnée
    Rectangle
    {
        id: hourPrint
        anchors.horizontalCenter: parent.horizontalCenter
        y: _euHourPicker.y - (30 + height)
        width: amHour ? (_switchHourMinute.width + _am.width + 10) : _switchHourMinute.width
        height: _switchHourMinute.height

        color: "transparent"
        border.color: Qaterial.Style.accentColor
        border.width: 4
        radius: 10
        Qaterial.FlatButton
        {
            id: _switchHourMinute
            anchors.verticalCenter: parent.verticalCenter
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
        Column
        {
            id: am_pm
            anchors.verticalCenter: parent.verticalCenter
            x: _switchHourMinute.width

            Qaterial.Label
            {
                id: _am
                text: "AM"
                textType: Qaterial.Style.TextType.Button
                color: window.am ? Qaterial.Style.accentColor : "white"
                visible: amHour
            }
            Qaterial.Label
            {
                id: _pm
                text: "PM"
                textType: Qaterial.Style.TextType.Button
                color: !window.am ? Qaterial.Style.accentColor : "white"
                visible: amHour
            }

        }
        MouseArea
        {
            anchors.fill: am_pm
            enabled: amHour
            onClicked: window.am = !window.am
        }
    }

    EuCircularHourPicker
    {
        id: _euHourPicker

        anchors.centerIn: parent
        radius: _slider.value
        hour: window.hour
        visible: hourVisible && !amHour

        onAccepted: (hour) => window.hour = hour
    }

    AmCircularHourPicker
    {
        id: _amHourPicker

        anchors.centerIn: parent
        radius: _slider.value
        hour: window.hour
        visible: hourVisible && amHour

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
        y: _euHourPicker.y + _euHourPicker.height + 30
        from: 80
        to: 200
        value: 150
    }
    Qaterial.FlatButton
    {
        id: amEuHourChanger
        anchors.horizontalCenter: parent.horizontalCenter
        y: _euHourPicker.y + _euHourPicker.height
        onClicked:
        {
            amHour = !amHour
        }
        text: amHour ? "Am/Pm" : "Eu"
        textType: Qaterial.Style.TextType.Button
    }
}
