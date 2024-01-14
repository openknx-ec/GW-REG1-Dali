# Applikation - Szenen

![Overview](/OpenKNX/GW-REG1-Dali/wiki/Assets/App_Szenen_Overview.png)  

|Eigenschaft|Beschreibung|
|---|---|
|Name|Hier kann der Szene einen Namen gegeben werden. Dieser wird links in der Übersicht und bei den KOs angezeigt.|
|Typ|Hier kann ausgewählt werden, an wen die Szene gesendet werden solle: Adresse, Gruppe oder als Broadcast an alle.|
|Dali Adresse/Gruppe|Die Adresse des EVGs oder der Gruppe.|
|Speichern erlauben|Ist diese Option aktiviert (und auch im Taster), dann kann der aktuelle Wert für die Szene gespeichert werden.|
|Szenennummer KNX|Die Szene auf der KNX Seite, die es auslöst.|
|Szenennummer Dali|Die Szene auf der Dali Seite, die ausgelöst werden soll.|

Mit diesen Einstellungen, können mehrere Szenen verwendet werden, welche auch nur an einzelne EVGs gesendet werden können.

Beispiel:  
EVGs: 
- A0, in Gruppe 1
- A1, in Gruppe 1
- A2, in Gruppe 2

Wenn die Einstellungen wir oben im Bild sind, dann wird beim Empfangen der KNX-Szene 1, die Dal-Szene 0 ausgelöst, welche aber nur an das EVG A0 geschickt wird.  
Die EVGs A1 und A2 ändern nichts, da sie nicht die Empfänger sind.  

![Beispiel2](/OpenKNX/GW-REG1-Dali/wiki/Assets/App_Szenen_Beispiel2.png)  
Sind die Einstellungen nun im Bild von oben, wird beim Empfangen der KNX-Szene 5, die Dali-Szene 2 ausgelöst, welche von allen EVGs in der Gruppe 1 bearbeitet wird.  
Das EVG A2 ändert nichts, da es nicht der Empfänger ist.  

![Beispiel3](/OpenKNX/GW-REG1-Dali/wiki/Assets/App_Szenen_Beispiel3.png)  
Sind die Einstellungen nun im Bild von oben, wird beim Empfangen der KNX-Szene 6, die Dali-Szene 1 ausgelöst, welche von allen EVGs bearbeitet wird.  