$p = 'assets/index-viX_Ya5e.js'
$c = Get-Content -Raw $p

$replacements = @(
    @(
        "Tiziana, Robertet'in son 100 formülünden yola çıkarak 30 simyacıya ait veri sanatı portreleri üretti. Her eser sanat kağıdına tek kopya olarak basıldı, çerçevelendi ve kurumsal bir etkinlikte hediye edildi.",
        "MİNA LİDYA'da her tasarım, gelinin ölçüsüne, stiline ve düğün konseptine göre sıfırdan ele alınır. Her parça, kişiye özel kalıp ve titiz işçilikle hazırlanarak benzersiz bir couture sonuca dönüştürülür."
    ),
    @(
        "Dijital ile doğa arasındaki bu yeni ittifakı görünür kılan görsel senfoniyi keşfettikten sonra, bu eserleri bir adım ileri taşıyıp daha geniş kitlelerle paylaşma isteğimiz netleşti.",
        "İnegöl mağazamızdaki birebir görüşmelerle başlayan süreç, Valencia atölyemizdeki yaratıcı dokunuşlarla güçlenir. Böylece her tasarım, estetik ve zanaati aynı çizgide buluşturur."
    ),
    @(
        "Bu dijital galeriyle, Robertet'i var eden yetenekleri yakından tanımaya davet ediyoruz.",
        "Bu dijital galeriyle, MİNA LİDYA'nın tasarım anlayışını ve size özel hazırlanan couture yolculuğunu yakından keşfetmeye davet ediyoruz."
    ),
    @(
        "1923'ten itibaren Maurice Maubert yönetiminde Robertet, doğal hammaddelerin ekstraksiyonu için geliştirdiği yeni süreçlerle Parisli parfümörler nezdindeki itibarını güçlendirdi. Yıllar içinde grubun faaliyetleri parfümeri ve gıda aromaları alanlarında çeşitlendi; ardından uluslararası bir büyüme dönemi başladı. Grubun sürdürülebilirlik odağı, 2007'de organik uçucu yağlar konusunda uzman Sapad'ın satın alınmasıyla 2000'li yıllarda somut bir yapıya kavuştu.",
        "MİNA LİDYA, yıllar içinde biriken dikim ve tasarım deneyimini güncel couture yaklaşımıyla birleştirir. Ölçü alma, prova, kalıp geliştirme ve son rötuş aşamaları, her gelin için kişisel bir planla ilerletilir."
    ),
    @(
        "Robertet Group'un hikayesi, doğaya bağlı kalarak 170 yılı aşkın inovasyonu temsil eder.",
        "MİNA LİDYA'nın hikayesi, her gelinin kendini en iyi haliyle yansıtacağı özel bir görünüm oluşturma tutkusunu temsil eder."
    ),
    @(
        "Scented Connections'da, bir formülün arkasındaki kuyumcu titizliğindeki emeğe yeni bir gözle bakmamızı sağlar. 30 portrenin her birinde 100 formül bir araya gelir; her formül bir bağlantı noktasına karşılık gelir. ",
        "Bu koleksiyonda, her modelin arkasındaki ince işçiliği ve tasarım disiplinini yeni bir gözle görürüz. Her detay, gelinin siluetine ve karakterine uyum sağlayacak şekilde birbirine bağlanır. "
    ),
    @(
        "Her bir nokta, bir kişinin yaratıcılığını ve farklı unsurlarla karşılaşarak benzersiz bir şey ortaya çıkarma sürecini simgeler.",
        "Her bir detay; kumaş, dantel, kesim ve formun bir araya gelerek kişiye özel bir tasarımı nasıl oluşturduğunu simgeler."
    ),
    @(
        " Yakınlaşıp uzaklaştıkça verinin doğayı ve özlerini çağrıştıran formlara dönüştüğünü görürüz. Tiziana Alocci burada yalnızca bir sanatçı değil, aynı zamanda görsel bir anlatıcıdır; dijital ile doğa arasındaki görünmez ve uyumlu bağları görünür kılar.",
        " Yakından baktıkça işçiliğin inceliğini, uzaktan baktıkça siluetin bütün zarafetini görürüz. Böylece MİNA LİDYA'nın tasarım dili, sadece bir kıyafet değil; güçlü, dengeli ve unutulmaz bir görünüm olarak ortaya çıkar."
    )
)

$applied = 0
foreach ($r in $replacements) {
    if ($c.Contains($r[0])) {
        $c = $c.Replace($r[0], $r[1])
        $applied++
    }
}

Set-Content -Path $p -Value $c -NoNewline
Write-Output "applied=$applied"
