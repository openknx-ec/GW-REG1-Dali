# Applikation - Einzeladressen

![Overview](/OpenKNX/GW-REG1-Dali/wiki/Assets/App_Einzeladressen_Overview.png)  

<table>
    <tr>
        <th>Eigenschaft</th>
        <th>Beschreibung</th>
    </tr>
    <tr>
        <td>Name</td>
        <td>Hier kann dem EVG ein Name vergeben werden. Dieser wird dann bei den KOs angezeigt.</td>
    </tr>
    <tr>
        <td>Gerätetyp</td>
        <td>Der DeviceType des EVGs. Bei <code>ETS >= 6.1.1</code> kann der GeräteTyp auch automatisch ausgelesen werden.</td>
    </tr>
    <tr>
        <td>Betriebsart</td>
        <td>Normalbetrieb kann manuell ein- und ausgeschaltet werden. Bei Treppenhauslicht, kann eine Zeit eingestellt werden, nach der das Licht wieder aus geht. (Siehe <a href="#Treppenlicht">hier</a>)</td>
    </tr>
    <tr>
        <td>Sperrobjekt anzeigen</td>
        <td>Macht ein KO sichtbar, mit dem das EVG gesperrt werden kann. (Siehe <a href="#Sperre">hier</a>)</td>
    </tr>
    <tr>
        <td>Fehlerstatus auslesen</td>
        <td>Ist diese Option aktiviert, wird in einem bestimmten Interval der Status des EVGs abgefragt. Liegt ein Fehler vor oder antwortet das EVG nicht, dann wird das KO geschaltet und die Error LED auf der Front leuchtet.</td>
    </tr>
    <tr>
        <td colspan="2">Bei Dimmbaren Gerätetypen</td>
    </tr>
    <tr>
        <td>Einschaltwert Tag</td>
        <td>Prozentwert, der beim Einschalten am Tag gesetzt werden soll.</td>
    </tr>
    <tr>
        <td>Einschaltwert Nacht</td>
        <td>Prozentwert, der beim Einschalten in der Nacht gesetzt werden soll.</td>
    </tr>
</table>

## Treppenlicht
![Treppenlicht](/OpenKNX/GW-REG1-Dali/wiki/Assets/App_Einzeladressen_Treppenlicht.png)  
|Eigenschaft|Beschreibung|
|---|---|
|Nachlaufzeit|Zeitangabe, nach der das Licht ausgeschaltet werden soll.|
|Manuelles ausschalten|Ist diese Option auf `Nein`, kann das Licht nicht manuell durch ein Telegramm ausgeschaltet werden. Bei `Ja` wird bei einem Telegramm mit 0 das Licht ausgeschaltet und das Treppenlicht beendet.|
|Nachtriggern erlauben|Ist diese Option auf `Ja` kann die Nachlaufzeit zurückgesetzt werden. Beim Empfangen eines Telegramms mit 1, läuft die Nachlaufzeit von neuem an.|

## Sperre
![Treppenlicht](/OpenKNX/GW-REG1-Dali/wiki/Assets/App_Einzeladressen_Sperre.png)  
|Eigenschaft|Beschreibung|
|---|---|
|Sperren bei|Hier kann eingestellt werden, bei welchem Wert das EVG als gesperrt gilt.|
|Verhalten bei Sperren|Aktion die ausgeführt werden soll, wenn ein EVG gesperrt wird. War das EVG bereits gesperrt, wird die Aktion nicht erneut ausgeführt.|
|Verhalten bei Entsperren|Aktion die ausgeführt werden soll, wenn ein EVG entsperrt wird. War das EVG bereits entsperrt, wird die Aktion nicht erneut ausgeführt.|
> Bei Aktion Einschalten wird der Einschaltwert Tag/Nacht verwendet.

## Farbe
![Treppenlicht](/OpenKNX/GW-REG1-Dali/wiki/Assets/App_Einzeladressen_Farbe.png)  
<table>
    <tr>
        <th>Eigenschaft</th>
        <th>Beschreibung</th>
    </tr>
    <tr>
        <td>Farbe ansteuern per</td>
        <td>Stellt KOs für RGB bzw HSV zur Verfügung.</td>
    </tr>
    <tr>
        <td colspan="2">RGB/HSV</td>
    </tr>
    <tr>
        <td>Farbe übertragen per</td>
        <td>Einstellung wie die Farbe über Dali an das EVG übertragen werden soll. Infos dazu findet man im Datenblatt des EVGs.</td>
    </tr>
    <tr>
        <td colspan="2">TW</td>
    </tr>
    <tr>
        <td>Farbtemperatur Min</td>
        <td>Minimale Farbtemperatur, die das Leuchtmittel kann.</td>
    </tr>
    <tr>
        <td>Farbtemperatur Max</td>
        <td>Maximale Farbtemperatur, die das Leuchtmittel kann.</td>
    </tr>
    <tr>
        <td>HCl aktivieren</td>
        <td>Aktiviert <a href="https://www.licht.de/fileadmin/Publikationen_Downloads/1806_lw21_HCL_web.pdf">HCL</a> für das EVG. (Siehe <a href="/OpenKNX/GW-REG1-Dali/wiki/Assets/App_HCL">hier</a>)</td>
    </tr>
</table>