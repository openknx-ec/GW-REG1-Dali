# Applikation - Adressierung

![Overview](/OpenKNX/GW-REG1-Dali/wiki/Assets/App_Adressierung_Overview.png)  

## Bedingungen
Damit in der ETS Funktionen ausgeführt werden können, muss die Physikalische Adresse dem Gerät zugewiesen und übertragen sein.  
Erst danach können die Buttons angeklickt werden.  

## Adresse automatisch vergeben
Dieser Button ist vor allem bei einer Neuinstallation wichtig.  
Hierbei werden unadressierte EVGs gesucht und ihnen automatisch eine freie Adresse vergeben.  
Dabei wird keine neue generierung der Langadresse angestoßen.  
>Die gefundenen EVGs werden nicht aufgelistet.   


## Adresse manuell vergeben
Bei einer bekannten Langadresse kann dem EVG eine Kurzadresse zugewiesen werden.  
Groß- und Kleinschreibung wird dabei nicht beachtet.  
> Die Langadresse ist bei einigen Herstellern nicht permanent und kann sich nach dem Stromlosschalten ändern.

## Scannen
Mit diesem Button können alle angeschlossenen EVGs aufgelistet werden.  
Dabei stehen zwei Einstellungen zur Verfügung:
 - Nur ohne Adresse: Hier werden nur EVGs gesucht, die keine Kurzadresse haben. Das ist hilfreich, wenn neue EVGs eingebaut wurden.
 - Adr. neu generieren: Hierbei wird vor dem Suchvorgang in den EVGs eine neue Langadresse generiert.

## Gefundene Geräte
Hier werden alle gefunden EVGs aufgelistet, in der Reihenfolge ihrer Langadresse: von klein nach groß.  
Die Langadresse wird dabei als HEX angezeigt.  
Besitzt das EVG eine Kurzadresse, wird diese ebenfalls angezeigt.  
> Es kann vorkommen, dass nicht immer alle EVGs angezeigt werden. Dies tritt durch Timingprobleme auf. Die Ursache dafür können schlechte Klemmstellen, lange Leitungen, billige Hersteller oder ähnliches sein.

> Bei anhaltenden Problemen, kann auch die Suche auf der [[Kommandozeile]] ausgeführt werden, diese ist stabiler.