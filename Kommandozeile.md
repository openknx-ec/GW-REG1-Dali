# Kommandozeile

Über die Kommandozeile können verschiedene Befehle ausgeführt werden.  
So können Infos über das Gerät abgefragt werden wie Physikalische Adresse, aktuelle Firmware oder Applikation, Versionen der verwendeten Module, etc.  

Als Terminal kann jedes Programm verwendet werden, dass COM Schnittstellen ansprechen kann.  
Als Beispiel kann dafür verwendet werden VS-Code oder auch Putty.  
![Overview](/OpenKNX/GW-REG1-Dali/wiki/Assets/Kommandozeile_VSCode.png)  
> Dazu muss der Ordner Firmware mit VS-Code geöffnet werden und die PlatformIO Erweiterung installiert sein.  

![Overview](/OpenKNX/GW-REG1-Dali/wiki/Assets/Kommandozeile_Putty.png)  
> Der COM-Port kann aus dem Gerätemanager entnommen werden.


## scan xy
Startet einen Scan der Dali-Linie.  
|Option|Wert|Beschreibung|
|---|---|---|
|x|0|Es sollen auch EVGs gefunden werden, die bereits eine Kurzadresse haben.|
||1|Nur EVGs suchen, die noch keine Kurzadresse haben.|
|y|0|Langadresse nicht neu generieren.|
||1|Langadresse soll neu generiert werden.|

Beispiele:  
scan 00 => Es werden alle EVGs gesucht, ohne die Langadresse zu ändern.  
scan 01 => Es werden alle EVGs gesucht, vorher soll eine neue Langadresse generiert werden.  
> Da eine Langadresse bei einigen Herstellern nicht permanent ist und manche als Standardwert 0xFFFFFF setzen, empfiehlt es sich einmalig eine neue Langadresse zu generieren. (Auch wenn vorher EVGs ohne Strom waren)

## auto
Sucht nach EVGs ohne Kurzadresse und vergibt ihnen automatisch freie Kurzadressen.  

## arc xyyzzz
Setzt den Dimmwert auf einen festgelegten Wert.
|Option|Wert|Beschreibung|
|---|---|---|
|x|B|Broadcast: Alle EVGs setzen den Dimmwert|
||A|Kurzadresse: Nur das angegebene EVG setzt den Dimmwert|
||G|Gruppe: Nur EVGs die in der Gruppe sind setzend en Dimmwert|
|y|2-stellig|Gibt die Kurzadresse oder Gruppe an. Bei Broadcast 00|
|z|3-stellig|Gibt den Dimmwert von 000 bis 100 an|

## set xxxxxxyy
Ändert die Kurzadresse eines EVGs.  
|Option|Wert|Beschreibung|
|---|---|---|
|x|6-stellig|Die Langadresse des EVGs|
|y|2-stellig|Die neue Kurzadresse des EVGs|

> Es wird vorher geprüft, ob die Kurzadresse bereits verwendet wird.

> Ist als neue Kurzadresse 99 angegeben, wird die Kurzadresse im EVG gelöscht. Es ist somit wieder unadressiert.