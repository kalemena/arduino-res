arduino-res
===========

Few Arduino resources needed to start with.

Sorry if references are ommited. Resources here come from external sites. 

RFM12/RFM69CW
=============

* [Wiring](http://openenergymonitor.org/emon/buildingblocks/rfm12b-wireless)

[logo]: ./RFM12/connections1.png "RFM12 / RFM69CW wiring on 3.3v board"

Low Power
=========

On Deek-Robot board:
* Cut the power led
* !!! Do not cut the regulator !!! On deek-robot board, need to unsolder the regulator Vout instead

[Details here] (http://forum.mysensors.org/topic/230/power-conservation-with-battery-powered-sensors)

Libraries
=========

Here are unavoidable libraries:
* [Low Power libraries](https://github.com/jcw/jeelib)
* OneWire
* Dallas
* [DHT lib](https://github.com/markruys/arduino-DHT)

Links
=====
* [Deek-Robot pro mini board](http://arduino-board.com/boards/dr-pro-mini)
* [How to Run an Arduino for Years on a Battery](http://www.openhomeautomation.net/arduino-battery/)
* [RFM12 board](http://hallard.me/tag/rfm69cw/)
* [JeeNode Room Board](http://jeelabs.net/projects/hardware/wiki/Room_Board)

Low-power boards
================
* Jeenode:
** [Jeenode pinout](http://jeelabs.net/projects/hardware/wiki/Pinouts)
** [Specs](http://jeelabs.net/projects/hardware/wiki/JeeNode)
** [Assembling](http://jeelabs.org/2010/09/26/assembling-the-jeenode-v5/)
** [SMD kit](http://jeelabs.org/tag/jeesmd/)
** [SMD kit spec](http://jeelabs.net/projects/hardware/wiki/SMD_Kit)
* [Moteino](http://lowpowerlab.com/moteino/#specs)
* [Tiny328 board] (http://solderpad.com/nathanchantrell/tiny328-wireless-arduino-clone/)
* [Tiny328 specs] (http://nathan.chantrell.net/20130923/tiny328-mini-wireless-arduino-clone/)