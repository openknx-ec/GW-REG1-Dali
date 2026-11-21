# Generate-Secure_Certificate.ps1
#
# Erzeugt den FDSK-String (Factory Default Setup Key) fuer die ETS,
# wie er auf dem KNX Secure Zertifikat/Aufkleber eines Geraets steht.
#
# Aufbau: 6 Byte KNX-Seriennummer + 16 Byte FDSK + CRC-4 (High-Nibble eines 23. Bytes),
#         Base32-kodiert, 36 Zeichen in 6 Gruppen zu 6 Zeichen.
#
# Der FDSK ist fest im Stack hinterlegt:
#   knx/src/knx/security_interface_object.cpp -> SecurityInterfaceObject::_fdsk

# FDSK aus dem Code (muss mit security_interface_object.cpp uebereinstimmen)
[byte[]]$Fdsk = 0xFF, 0xEE, 0xDD, 0xCC, 0xBB, 0xAA, 0x99, 0x88, 0x77, 0x66, 0x55, 0x44, 0x33, 0x22, 0x11, 0x00

# OpenKNX Hersteller-ID (erste 2 Byte der Seriennummer)
$ManufacturerId = "00FA"

# CRC-4, Generatorpolynom x^4 + x + 1
[byte[]]$Crc4Table = 0x0, 0x3, 0x6, 0x5, 0xC, 0xF, 0xA, 0x9, 0xB, 0x8, 0xD, 0xE, 0x7, 0x4, 0x1, 0x2

function Get-Crc4([byte[]]$Data) {
    $c = 0
    foreach ($b in $Data) {
        $c = $Crc4Table[$c -bxor (($b -shr 4) -band 0x0F)]
        $c = $Crc4Table[$c -bxor ($b -band 0x0F)]
    }
    return [byte]$c
}

function ConvertTo-Base32([byte[]]$Data) {
    $alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567"
    $sb = New-Object System.Text.StringBuilder
    $buffer = 0
    $bitsLeft = 0
    foreach ($b in $Data) {
        $buffer = (($buffer -shl 8) -bor $b) -band 0xFFFF
        $bitsLeft += 8
        while ($bitsLeft -ge 5) {
            $index = ($buffer -shr ($bitsLeft - 5)) -band 0x1F
            [void]$sb.Append($alphabet[$index])
            $bitsLeft -= 5
        }
    }
    if ($bitsLeft -gt 0) {
        $index = ($buffer -shl (5 - $bitsLeft)) -band 0x1F
        [void]$sb.Append($alphabet[$index])
    }
    return $sb.ToString()
}

function Get-FdskString([byte[]]$Serial, [byte[]]$Key) {
    [byte[]]$buffer = New-Object byte[] 23
    [Array]::Copy($Serial, 0, $buffer, 0, 6)
    [Array]::Copy($Key, 0, $buffer, 6, 16)
    $buffer[22] = [byte](((Get-Crc4 $buffer[0..21]) -shl 4) -band 0xFF)

    $encoded = (ConvertTo-Base32 $buffer).Substring(0, 36)
    $groups = for ($i = 0; $i -lt 36; $i += 6) { $encoded.Substring($i, 6) }
    return ($groups -join "-")
}

# --- Eingabe der Seriennummer ---
Write-Host "KNX Secure FDSK Generator" -ForegroundColor Cyan
Write-Host "Seriennummer eingeben, z.B. 00FA:0123ABCD (wie in der Konsole unter 'info')"
Write-Host "oder nur die 8 Hex-Stellen nach '00FA:'."

while ($true) {
    $userInput = Read-Host "Seriennummer"
    $hex = ($userInput -replace '[^0-9A-Fa-f]', '').ToUpper()

    if ($hex.Length -eq 8) { $hex = $ManufacturerId + $hex }

    if ($hex.Length -eq 12) { break }
    Write-Host "Ungueltige Seriennummer: 12 Hex-Stellen (oder 8 ohne '00FA') erwartet." -ForegroundColor Red
}

[byte[]]$serial = for ($i = 0; $i -lt 12; $i += 2) { [Convert]::ToByte($hex.Substring($i, 2), 16) }

$fdskString = Get-FdskString $serial $Fdsk

Write-Host ""
Write-Host ("Seriennummer: {0}:{1}" -f $hex.Substring(0, 4), $hex.Substring(4))
Write-Host ("FDSK:         {0}" -f $fdskString) -ForegroundColor Green
Write-Host ""
Write-Host "Diesen String in der ETS beim Hinzufuegen des Geraets als FDSK eingeben."

Write-Host "Press any key to continue..." -ForegroundColor Cyan;
$null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown");