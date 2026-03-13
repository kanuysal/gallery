$files = Get-ChildItem -Recurse -File -Include *.js,*.html | Where-Object { $_.FullName -notmatch '\\scripts\\' }
$pairs = @(
    @('magaza','mağaza'),
    @('Magaza','Mağaza'),
    @('MAGAZA','MAĞAZA'),
    @('Inegol','İnegöl'),
    @('INEGOL','İNEGÖL'),
    @('Ispanya','İspanya'),
    @('ISPANYA','İSPANYA'),
    @('Nisan','Nişan'),
    @('NISAN','NİŞAN'),
    @('Kina','Kına'),
    @('guzel','güzel'),
    @('Guzel','Güzel'),
    @('GUZEL','GÜZEL'),
    @('gununuze','gününüze'),
    @('Gununuze','Gününüze'),
    @('GUNUNUZE','GÜNÜNÜZE'),
    @('hazirlaniyoruz','hazırlanıyoruz'),
    @('Hazirlaniyoruz','Hazırlanıyoruz'),
    @('ozel','özel'),
    @('Ozel','Özel'),
    @('OZEL','ÖZEL')
)

$changed = 0
foreach ($f in $files) {
    $t = Get-Content -Raw $f.FullName
    $n = $t
    foreach ($pair in $pairs) {
        $k = $pair[0]
        $v = $pair[1]
        $n = $n -creplace "\b$([regex]::Escape($k))\b", $v
    }
    if ($n -ne $t) {
        Set-Content -Path $f.FullName -Value $n -NoNewline
        $changed++
    }
}

Write-Output "changed_files=$changed"
