$ErrorActionPreference = 'Stop'
Set-Location 'D:\galeri\galeri\robertet-scented-connections.com'

$path = 'assets/index-viX_Ya5e.js'
$c = [System.IO.File]::ReadAllText($path)

$replacements = @(
  @('THE GALLERY IS OPENING','MAGAZA HAZIRLANIYOR...'),
  @('children:"Scented connections"','children:"MINA LIDYA"'),
  @('children:"Scented Connections"','children:"MINA LIDYA"'),
  @('children:[jsxRuntimeExports.jsx("span",{children:"Scented "}),jsxRuntimeExports.jsx("span",{children:"Connections"})]','children:[jsxRuntimeExports.jsx("span",{children:"MINA LIDYA"})]'),
  @('children:"start exhibition"','children:"GALERIYI GEZMEYE BASLAYABILIRSINIZ"'),
  @('children:"Skip the intro"','children:"VIDEOYU GEC"'),
  @('children:["Sound"," "]','children:["SES"," "]'),
  @('children:"Sound"','children:"SES"')
)

foreach($pair in $replacements){
  $old = $pair[0]
  $new = $pair[1]
  $c = $c.Replace($old, $new)
}

$oldParagraph = 'jsxRuntimeExports.jsxs("p",{className:"font-body-lg",children:["Here is Robertet''s Digital Art Gallery,",jsxRuntimeExports.jsx("br",{}),"where Data reveals the very essence of scents and aromas.",jsxRuntimeExports.jsx("br",{}),"Wander through the enchanted web of their creation."]})'
$newParagraph = 'jsxRuntimeExports.jsxs("div",{className:"font-body-lg",children:["Hayalinizdeki gelinlik ve gece kiyafetleri ya da ihtiyaciniz olan her turlu destek icin, video konferans veya magaza ziyareti ile bize ulasin. Hayalinizi tasarlayalim.",jsxRuntimeExports.jsxs("div",{style:{display:"grid",gridTemplateColumns:"repeat(2,minmax(220px,1fr))",gap:"24px",marginTop:"16px"},children:[jsxRuntimeExports.jsxs("div",{children:["BURSA / TURKIYE",jsxRuntimeExports.jsx("br",{}),"Kasim Efendi Caddesi No.25A",jsxRuntimeExports.jsx("br",{}),"Inegol, Bursa +90 542 113 16 41",jsxRuntimeExports.jsx("br",{}),"store@minalidya.com"]}),jsxRuntimeExports.jsxs("div",{children:["ALCOY / ISPANYA",jsxRuntimeExports.jsx("br",{}),"Mina Lidya Novias",jsxRuntimeExports.jsx("br",{}),"Alcoy, Alicante +34 632 623 300",jsxRuntimeExports.jsx("br",{}),"novias@minalidya.es"]})]})]})'
$c = $c.Replace($oldParagraph, $newParagraph)

[System.IO.File]::WriteAllText($path, $c, [System.Text.UTF8Encoding]::new($false))
Write-Output 'TRANSLATION_PATCH_OK'
