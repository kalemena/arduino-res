Few Arduino resources needed for low power sensors building.

Sorry if references are ommited.
Resources come from external sites, sometimes with more details. 

* [Radio RFM12](radio.md)
* [Sensors Temperature](sensors-temp.md)
* [Sensors Light](sensors-light.md)
* [Sensors gardening](sensors-garden.md)
* [Actor relay](actor-relay.md)
* [Actor light strips](actor-lights.md)
* [Interop Teleinfo](interop-teleinfo.md)

# Radio

* [RFM12 board](http://hallard.me/tag/rfm69cw/)
* [Low Power libraries + radio](https://github.com/jcw/jeelib)

# Low-power

## Info

On Deek-Robot board:
* Cut the power led
* !!! Do not cut the regulator !!! On deek-robot board, need to unsolder the regulator Vout instead

Links:
* [Details here](http://forum.mysensors.org/topic/230/power-conservation-with-battery-powered-sensors)
* [How to Run an Arduino for Years on a Battery](http://www.openhomeautomation.net/arduino-battery/)

## Measures

Below are measures for:
- cheap e-Bay arduino 3.3v clone (deek-robot)
- radio RFM69 wired
- using Jeelab libs. Enhanced sleep.
- various sensors

| What? | Measure | Comments |
| ----- | ----- | ----- |
| Arduino alone | 6uA | Deek Robot with cuting led and converter |
| DHT22 | 21.5 uA | |
| DS12B20 | 21.9 uA | |
| LDR | 26uA | |
| Switch | 23.2 uA | |

# Boards links

* Jeenode:
  * [Jeenode pinout](http://jeelabs.net/projects/hardware/wiki/Pinouts)
  * [Specs](http://jeelabs.net/projects/hardware/wiki/JeeNode)
  * [Assembling](http://jeelabs.org/2010/09/26/assembling-the-jeenode-v5/)
  * [SMD kit](http://jeelabs.org/tag/jeesmd/)
  * [SMD kit spec](http://jeelabs.net/projects/hardware/wiki/SMD_Kit)
  * [JeeNode Room Board](http://jeelabs.net/projects/hardware/wiki/Room_Board)
* [Deek-Robot pro mini board](http://arduino-board.com/boards/dr-pro-mini)
* [Moteino](http://lowpowerlab.com/moteino/#specs)
* [Tiny328 board](http://solderpad.com/nathanchantrell/tiny328-wireless-arduino-clone/)
* [Tiny328 specs](http://nathan.chantrell.net/20130923/tiny328-mini-wireless-arduino-clone/)
