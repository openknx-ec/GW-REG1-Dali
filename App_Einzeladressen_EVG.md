# Applikation - EVG Einstellungen

> **Achtung** Diese Ansicht erscheint nur, wenn unter [Allgemein](https://github.com/OpenKNX/GW-REG1-Dali/wiki/App_Allgemein) die ETS Version >=6.1.1 auf "Ja" gestellt wurde.  
  
  
![Overview](/OpenKNX/GW-REG1-Dali/wiki/Assets/App_Einzeladressen_EVG.png)  

|Eigenschaft|Beschreibung|
|---|---|
|Dimmwert Min|Minimaler Dimmwert. Beschrenkt durch Leuchtmittel.|
|Dimmwert Max|Maximaler Dimmwert.|
|Power On Level|Dimmwert wenn das EVG mit 230 V versorgt wird.|
|Dailure On Level|Dimmwert wenn es Probleme auf dem Dali Bus gibt (keine Spannung, Fehlerhafte Frames, etc)|
|Fade Time|Zeit um auf den gesetzten Wert zu kommen.|
|Fade Time Extended|Nur für Dali2 Geräte. Feinere Einstellung, ansonsten wie Fade Time. Wird nur angewendet, wenn Fade Time `keine` ist.|
|Fade Rate|Wird aktuell vom Gateway nicht verwendet.|

> Ist die Checkbox `Inaktiv` bei Power/Failure aktiviert, wird das Ereignis ignoriert und kein Dimmwert eingestellt.

Über die Buttons `Aus Gerät lesen` und `Auf Gerät übertragen` können die Einstellungen mit dem EVG synchronisiert werden.  

## Gruppen
![Overview](/OpenKNX/GW-REG1-Dali/wiki/Assets/App_Einzeladressen_EVG-Gruppen.png)  
Ein EVG kann in bis zu 16 Gruppen gleichzeitig sein.  
Dies wird hier durch die Checkboxen eingestellt.  

## Szenen
![Overview](/OpenKNX/GW-REG1-Dali/wiki/Assets/App_Einzeladressen_EVG-Szenen.png)  
Ein EVG kann über bis zu 16 verschiedene Dimmwerte je Dali-Szene speichern.  
Wird die Szene aufgerufen, wird der gespeicherte Dimmwert eingestellt.  
(Siehe [hier](/OpenKNX/GW-REG1-Dali/wiki/Assets/App_Szenen))  