$ErrorActionPreference = 'Stop'
Set-Location 'D:\galeri\galeri\robertet-scented-connections.com'

$bundlePath = 'assets/index-viX_Ya5e.js'
$manifestPath = 'assets/json/gallery-products-tr.json'
$bundle = [System.IO.File]::ReadAllText($bundlePath)
$manifest = Get-Content -Raw $manifestPath | ConvertFrom-Json

function E([string]$s) {
  if ($null -eq $s) { return '' }
  $t = $s -replace '"', '\"'
  $t = $t -replace "`r", ' '
  $t = $t -replace "`n", ' '
  return $t
}

# Pre-click label in gallery frame
$bundle = $bundle.Replace('position:[-.3,-.48,0],texts:["Portrait of"]', 'position:[-.3,-.48,0],texts:[et.seniority]')

# Zoom panel labels for gallery cartel
$bundle = $bundle.Replace('className:"pO font-body-sm ",children:"Portrait of"', 'className:"pO font-body-sm ",children:"Kategori"')
$bundle = $bundle.Replace('children:["Raw material: ",c.cardInfos.rawMaterial]', 'children:["Kategori: ",c.cardInfos.rawMaterial]')
$bundle = $bundle.Replace('children:["Masterpiece: ",c.cardInfos.masterPiece]', 'children:["Detay: ",c.cardInfos.masterPiece]')

for ($slot = 1; $slot -le 30; $slot++) {
  $item = $manifest | Where-Object { [int]$_.slot -eq $slot } | Select-Object -First 1
  if (-not $item) { throw "Manifest missing slot $slot" }

  $categoryLabel = if ($item.category -eq 'tesettur-gelinlik') { 'Tesettur Gelinlik' } else { 'Gelinlik' }
  $name = E $item.titleTr
  $short = E $item.shortDescriptionTr
  $cardTitle = E ("$($item.titleTr) Gelinlik")
  $rawMaterial = E $categoryLabel
  $masterPiece = E $item.seoProductUrl

  $marker = 'name:"Picture_' + $slot + '"'
  $iName = $bundle.IndexOf($marker)
  if ($iName -lt 0) { throw "Picture_$slot not found" }

  $iArtist = $bundle.IndexOf('artistInfos:{', $iName)
  if ($iArtist -lt 0) { throw "artistInfos start not found for Picture_$slot" }

  $iOeuvre = $bundle.IndexOf(',oeuvreUrl:"', $iArtist)
  if ($iOeuvre -lt 0) { throw "oeuvreUrl marker not found for Picture_$slot" }

  $newArtist = 'artistInfos:{{name:"{0}",seniority:"{1}",cardInfos:{{title:"{2}",paragraph:"{3}",rawMaterial:"{4}",masterPiece:"{5}"}}}}' -f $name, $categoryLabel, $cardTitle, $short, $rawMaterial, $masterPiece

  $bundle = $bundle.Substring(0, $iArtist) + $newArtist + $bundle.Substring($iOeuvre)
}

[System.IO.File]::WriteAllText($bundlePath, $bundle, [System.Text.UTF8Encoding]::new($false))
Write-Output 'UPDATED_OK'
