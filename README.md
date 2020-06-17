# TimePicker

**TimePicker** is a litte project which allow you to pick a time on European or American Clock. Its components are intended to be a part of **Qaterial** library (Cf [QaterialGallery](https://olivierldff.github.io/QaterialGallery/))

### Overview

#### Hour Picker (EU way)

![Screen showing an example of the EuHourPicker](./docs/README_files/HourPickerEu.png)

#### Hour Picker (Am way)

![Screen showing an example of the AmHourPicker](./docs/README_files/HourPickerAm.png)

#### Minute Picker

![Screen showing an example of the MinutePicker](./docs/README_files/MinutePicker.png)

### Build

````bash
git clone https://github.com/CedricLeon/TimePicker.git
mkdir build && cd build
cmake -DCMAKE_PREFIX_PATH=/your/Qt/gcc_64/path ..
make -j2
./TimePicker
````

### Components : Code Example

#### EuCircularHourPicker

Allow to pick hour from 0 to 23 (Eu way)

````js
EuCircularHourPicker
{
    radius: 150			    // default: 100
    hour: slider.value		// default: 0
    onAccepted: (hour) => console.log(`hour: ${hour}`)
}
````

**Properties**

* `radius`: (default 100)
* `hour` : Hour of the component, can be set from outside (default 0) 
* `labelSize` : Size of text area, distance between am and pm hour circular path (default 32)

**Signal**

* `accepted` : Signal emitted at every move of the HandClock

#### AmCircularHourPicker

Allow to pick hour from 1 to 12 (American way)

````js
AmCircularHourPicker
{
    radius: 150			    // default: 100
    hour: slider.value		// default: 0    
    onAccepted: (hour) => console.log(`hour: ${hour}`)
}
````

**Properties**

* `radius`: (default 100)
* `hour` :  Hour of the component, can be set from outside (default 12) 

**Signal**

* `accepted` : Signal emitted at every move of the **HandClock**

#### CircularMinutePicker

Allow to pick minute from 0 to 59

````js
CircularMinutePicker
{
    radius: 150			   // default: 100
    minute: slider.value   // default: 0
    onAccepted: (minute) => console.log(`minute: ${minute}`)
}
````

**Properties**

* `radius`: (default 100)
* `minute` : Minute of the component, can be set from outside (default 0) 

**Signal**

* `accepted` : Signal emitted at every move of the HandClock

#### CircularPathLabel

Display data in a circular path, is able to highlight an element

````js
CircularPathLabel
{
    radius: 150				// default: 100
    numberOfElement: 5      // default: 12
    model: ["0", "1", "2", "3", "4"] // default: hours of the day
    currentIndex: 3         // "highlighted" element, default: -1
}
````

**Properties**

* `radius`: (default 100)
* `model` : Table of values displayed in the path (default, hours of the day)
* `numberOfElement` : Number of values display in circle (default 12)
* `textType` : Text characteristics of elements displayed (default, *Qaterial.Style.TextType.Body1*, can be choose among **Qaterial.Style.TextType** Enum)
* `currentIndex` : Index of the element "highlighted" (default -1)
* `labelSize` : Size of text area (default 32)

#### HandClock

Display a handclock

````js
HandClock
{
    radius: 140		    // default 100
    color: "white"	    // default "transparent"
    renderDot: false    // default true
}
````

**Properties**

* `color` : (default `transparent`)
* `radius` : (default 100)
* `labelSize` : Radius of the external "picker" circle (default : 32 x 2^0.5)
* `renderDot` : Boolean which displayed or not a central circle in the external "picker" circle (default `true`) 

### Notes

Note that there is no security on the hour/minute when you set it by yourselves. So you can set an hour like `25:-12`.



