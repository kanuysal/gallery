$path = Join-Path $PSScriptRoot '..\assets\index-viX_Ya5e.js'
$content = [IO.File]::ReadAllText($path)

$replacements = @(
    @{ Old = 'Sit down'; New = 'SEYREDIN' }
    @{ Old = "'VISUALISING FRAGRANCES & FLAVORS'"; New = 'HAUTE COUTURE' }
    @{ Old = 'Grasse, where it all begins'; New = 'VALENCIA & İNEGÖL' }
    @{ Old = 'It was in 1894 that Robertet established in the heart of Grasse. Surrounded by the essence of the region''s rare flowers, the site has prospered with buildings added over the decades.'; New = 'Valencia atölyemiz ile İnegöl mağazamız arasında kurulan tasarım hattı, her gelinliğin kişiye özel bir couture deneyimine dönüşmesini sağlar.' }
    @{ Old = 'The city, famous in the 17th century for its perfumed leather, has become the perfume capital of the world. The scent of jasmine, orange blossom, mimosa, roses and other floral treasures has shaped the DNA of perfumers, making Grasse an inexhaustible muse and perpetual source of inspiration.'; New = 'Kumaş, dantel, prova ve kalıp kararları iki merkez arasında birlikte şekillenir. Böylece hem üretim disiplini hem de stil bütünlüğü aynı anda korunur.' }
    @{ Old = 'A UNESCO World Heritage Site, Grasse remains the enchanted cradle where the expertise of the people of Robertet intertwines with the fragrant petals of its patrimony.'; New = 'Mina Lidya ekibi, ilk randevudan son provaya kadar her detayı sizin silüetinize, düğün konseptinize ve hayalinizdeki görünüme göre hazırlar.' }
    @{ Old = 'ROBERTET GROUP'; New = 'BURSA / TURKIYE' }
    @{ Old = 'Robertet group'; New = 'BURSA / TURKIYE' }
    @{ Old = 'Jérôme Bruhat'; New = 'Kasim Efendi Caddesi No.25A' }
    @{ Old = 'Chief Executive Officer'; New = 'Inegol, Bursa' }
    @{ Old = 'Clélia Revinci'; New = '+90 542 113 16 41' }
    @{ Old = 'Global Head of Corporate Communication and Digital'; New = 'store@minalidya.com' }
    @{ Old = 'Gwenaela Cras'; New = 'Randevu ve Bilgi' }
    @{ Old = 'Deputy Director Flavors Division'; New = 'Haute Couture Gelinlik' }
    @{ Old = 'Jérémy Carles'; New = 'Nisan ve Kina Koleksiyonu' }
    @{ Old = 'Marketing & Consumer Insight Director Fragrance Division'; New = 'Kisiye ozel prova ve dikim' }
    @{ Old = 'STUDIO ARTEFACT 3000'; New = 'ALCOY / ISPANYA' }
    @{ Old = 'Studio Artefact 3000'; New = 'ALCOY / ISPANYA' }
    @{ Old = 'Marion Dardouillet'; New = 'Mina Lidya Novias' }
    @{ Old = 'Head of Studio'; New = 'Alcoy, Alicante' }
    @{ Old = 'Julie Delachaux'; New = '+34 632 623 300' }
    @{ Old = 'Production Director'; New = 'novias@minalidya.es' }
    @{ Old = 'Laurie Rubira'; New = 'Valencia Atelier' }
    @{ Old = 'Digital Producer'; New = 'Tasarim ve Kalip Gelistirme' }
    @{ Old = 'Gabriel Belbezier'; New = 'Kumas ve Dantel Secimi' }
    @{ Old = 'Client Lead'; New = 'Uluslararasi Gelinlik Danismanligi' }
    @{ Old = 'Vincent Blachère'; New = 'Mina Lidya Wedding' }
    @{ Old = 'Creative Director'; New = 'Tum Koleksiyonlar' }
    @{ Old = 'Arthur Ruellan'; New = 'Randevu Olustur' }
    @{ Old = 'Art Director'; New = 'Kiralama ve Satin Alma' }
    @{ Old = 'Sophie Neveu'; New = 'Tesettur Gelinlik' }
    @{ Old = 'Copywriter'; New = 'Nisan ve Kina' }
    @{ Old = 'Mathieu Crochet'; New = 'Kisiye Ozel Dikim' }
    @{ Old = 'Lead Developer'; New = 'Uluslararasi Gonderim' }
    @{ Old = 'Louis Cuenot'; New = 'WhatsApp Destek' }
    @{ Old = 'Creative Developer'; New = '+90 542 113 16 41' }
    @{ Old = 'ARTWORKS'; New = 'ONLINE' }
    @{ Old = 'Artworks'; New = 'ONLINE' }
    @{ Old = 'https://www.tizianaalocci.com/'; New = 'https://minalidya.wedding/' }
    @{ Old = 'tiziana.alocci.com'; New = 'minalidya.wedding' }
    @{ Old = 'MUSIC'; New = 'GLOBAL WEBSITE' }
    @{ Old = 'Alex Bainter'; New = 'Mina Lidya' }
    @{ Old = 'https://alexbainter.com/'; New = 'https://minalidya.com/' }
    @{ Old = 'alexbainter.com'; New = 'minalidya.com' }
)

foreach ($entry in $replacements) {
    $content = $content.Replace($entry.Old, $entry.New)
}

[IO.File]::WriteAllText($path, $content, [Text.UTF8Encoding]::new($false))

$checks = @(
    'Sit down',
    'VISUALISING FRAGRANCES & FLAVORS',
    'ROBERTET GROUP',
    'STUDIO ARTEFACT 3000',
    'Jérôme Bruhat',
    'Grasse, where it all begins',
    'It was in 1894',
    'tiziana.alocci.com',
    'alexbainter.com',
    'SEYREDIN',
    'VALENCIA & İNEGÖL'
)

foreach ($check in $checks) {
    $count = [regex]::Matches($content, [regex]::Escape($check)).Count
    Write-Output ("{0} => {1}" -f $check, $count)
}