# Firmware/KnxProd erstellen

Inhalt
* [KnxProd erstellen](#KnxProd)
* [Repo automatisch klonen](#Automatisch)
* [Repo manuell klonen](#Manuell)
* [Firmware flashem](#Firmware-flashen)

## KnxProd
Um eine knxprod erstellen zu können, wir der [Kaenx-Creator](https://github.com/OpenKNX/Kaenx-Creator/releases) benötigt.  
Dort das letzte Release herunterladen und installieren.  
Danach damit die Dali.ae-manu Datei öffnen.  
Dort im Reiter oben auf Veröffentlichen gehen und den Button "Veröffentlichen" drücken.  
Im selben Ordner wie die .ae-manu wurde nun die KnxProd erstellt.  
Diese kann nun in die ETS geladen werden.  

## Repo Klonen
### Automatisch
Öffne den Ordner, in dem all deine Repos liegen, bzw in dem das Repo erstellt werden soll.  
Kopiere folgenden
```
iex (iwr "https://raw.githubusercontent.com/OpenKNX/GW-REG1-Dali/master/Firmware/scripts/New-Clone.ps1").Content
```

It will clone this repo and run Restore-First.ps1
### Manuell
Du kannst das Repo ganz normal klonen.  
Es wird empfohlen, dies mit PowerShell zu tun, um das Restore Skript ausführen zu können.  
```
git clone https://github.com/OpenKNX/GW-REG1-Dali
.\GW-REG1-Dali\Firmware\scripts\Restore-Project.ps1
```
Wenn du das skript nicht ausführen magst/kannst, dann clone alle benötigten Repos (siehe dependencies.txt) im lib Ordner.
```
git clone https://github.com/OpenKNX/GW-REG1-Dali
cd GW-REG1-Dali\Firmware\lib
git clone https://github.com/OpenKNX/knx.git
git clone  https://github.com/OpenKNX/OFM-FileTransferModule.git
git clone ... etc
```

## Firmware flashen
Öffne den Ordner Firmware mit VS-Code.  
(Platformio muss bereits installiert und eingerichtet sein)  
Drücke nun `Strg+T` und wähle dann `Build-and-Upload` aus.  
Platformio erstellt nun die Firmware und lädt sie per USB auf das Gerät. Dies kann ein paar Minuten dauern.