# Kommandozeile

Über die Kommandozeile können verschiedene Befehle ausgeführt werden.  
So können Infos über das Gerät abgefragt werden wie Physikalische Adresse, aktuelle Firmware oder Applikation, Versionen der verwendeten Module, etc.  

Als Terminal kann jedes Programm verwendet werden, dass COM Schnittstellen ansprechen kann.  
Als Beispiel kann dafür verwendet werden VS-Code oder auch Putty.  
![Overview](/OpenKNX/GW-REG1-Dali/wiki/Assets/Kommandozeile_VSCode.png)  
> Dazu muss der Ordner Firmware mit VS-Code geöffnet werden und die PlatformIO Erweiterung installiert sein.  

![Overview](/OpenKNX/GW-REG1-Dali/wiki/Assets/Kommandozeile_Putty.png)  
> Der COM-Port kann aus dem Gerätemanager entnommen werden.

Siehe auch [Beispiel Putty](https://github.com/OpenKNX/OpenKNX/wiki/Device-Console).

## scan wxyz
Startet einen Scan der Dali-Linie.  
|Option|Wert|Beschreibung|
|---|---|---|
|w|0|Es sollen auch EVGs gefunden werden, die bereits eine Kurzadresse haben.|
||1|Nur EVGs suchen, die noch keine Kurzadresse haben.|
|x|0|Langadresse nicht neu generieren.|
||1|Langadresse soll neu generiert werden.|
|y|0|Kurzadressen sollen nicht gelöscht werden.|
||1|Alle Kurzadressen sollen gelöscht werden.|
|z|0|Kein automatisches zuweisen von Kurzadressen.|
||1|Gefundenen EVGs soll eine freie Kurzadresse zugewiesen werden.|

Beispiele:  
scan 0000 => Es werden alle EVGs gesucht, ohne die Langadresse zu ändern, Kurzadressen bleiben erhalten, neue EVGs erhalten keine Kurzadresse.  
scan 0100 => Es werden alle EVGs gesucht, vorher soll eine neue Langadresse generiert werden.  
scan 1101 => Sucht nur nach neuen EVGs und vergibt automatisch eine freie Kurzadresse.
scan 0111 => Löscht die Kurzadresse aller EVGs und vergibt sie neu.
> Da eine Langadresse bei einigen Herstellern nicht permanent ist und manche als Standardwert 0xFFFFFF setzen, empfiehlt es sich einmalig eine neue Langadresse zu generieren. (Auch wenn vorher EVGs ohne Strom waren)

## arc xyyzzz
Setzt den Dimmwert auf einen festgelegten Wert.
|Option|Wert|Beschreibung|
|---|---|---|
|x|B|Broadcast: Alle EVGs setzen den Dimmwert|
||A|Kurzadresse: Nur das angegebene EVG setzt den Dimmwert|
||G|Gruppe: Nur EVGs die in der Gruppe sind setzend en Dimmwert|
|y|2-stellig|Gibt die Kurzadresse oder Gruppe an. Bei Broadcast 00|
|z|3-stellig|Gibt den Dimmwert von 000 bis 100 an (in %)|

## set xxxxxxyy
Ändert die Kurzadresse eines EVGs.  
|Option|Wert|Beschreibung|
|---|---|---|
|x|6-stellig|Die Langadresse des EVGs|
|y|2-stellig|Die neue Kurzadresse des EVGs|

## getLvl yy
Gibt den aktuellen Dimmwert des EVGs aus.  
|Option|Wert|Beschreibung|
|---|---|---|
|y|2-stellig|Die Kurzadresse des EVGs|

## stepUp xyy / stepDown xyy
Schickt wiederholt den Befehl StepUp/-Down an ein EVG.   
|Option|Wert|Beschreibung|
|---|---|---|
|x|1-stellig|Anzahl wie oft StepUp/-Down wiederholt werden soll|
|y|2-stellig|Die Kurzadresse des EVGs|

> Es wird vorher geprüft, ob die Kurzadresse bereits verwendet wird.

> Ist als neue Kurzadresse 99 angegeben, wird die Kurzadresse im EVG gelöscht. Es ist somit wieder unadressiert.