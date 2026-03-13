$p = 'assets/index-viX_Ya5e.js'
$c = Get-Content -Raw $p

$replacements = @(
    @(
        'Tiziana created data art portraits of 30 Robertet’s alchemists from their last 100 creations. Each work was printed in a single copy on art paper and framed. It was given as a gift at a corporate event.',
        'Tiziana, Robertet''in son 100 formülünden yola çıkarak 30 simyacıya ait veri sanatı portreleri üretti. Her eser sanat kağıdına tek kopya olarak basıldı, çerçevelendi ve kurumsal bir etkinlikte hediye edildi.'
    ),
    @(
        'After discovering the visual symphony that embodies this new alliance between digital and nature, our wish to go one step further and make the work of these artists public became clear.',
        'Dijital ile doğa arasındaki bu yeni ittifakı görünür kılan görsel senfoniyi keşfettikten sonra, bu eserleri bir adım ileri taşıyıp daha geniş kitlelerle paylaşma isteğimiz netleşti.'
    ),
    @(
        'Through this digital gallery, we invite you to get to know the talents that make Robertet.',
        'Bu dijital galeriyle, Robertet''i var eden yetenekleri yakından tanımaya davet ediyoruz.'
    ),
    @(
        'From 1923, under the direction of Maurice Maubert, Robertet strengthened its reputation among Parisian perfumers by creating new processes for extracting natural ingredients. Over the decades, the group''s activities diversified into perfumery and food flavors. A new international adventure followed. The Group''s commitment to sustainable development took shape in the 2000s with the acquisition of Sapad, a company specializing in organic essential oils, in 2007.',
        '1923''ten itibaren Maurice Maubert yönetiminde Robertet, doğal hammaddelerin ekstraksiyonu için geliştirdiği yeni süreçlerle Parisli parfümörler nezdindeki itibarını güçlendirdi. Yıllar içinde grubun faaliyetleri parfümeri ve gıda aromaları alanlarında çeşitlendi; ardından uluslararası bir büyüme dönemi başladı. Grubun sürdürülebilirlik odağı, 2007''de organik uçucu yağlar konusunda uzman Sapad''ın satın alınmasıyla 2000''li yıllarda somut bir yapıya kavuştu.'
    ),
    @(
        'The Robertet Group history embodies more than 170 years of innovation, faithful to nature.',
        'Robertet Group''un hikayesi, doğaya bağlı kalarak 170 yılı aşkın inovasyonu temsil eder.'
    ),
    @(
        'In Scented Connections, she invites us to take a fresh look at the goldsmith''s work that goes into a formula. One hundred formulas are woven together in each of the 30 portraits. One formula corresponds to a connecting point. ',
        'Scented Connections''da, bir formülün arkasındaki kuyumcu titizliğindeki emeğe yeni bir gözle bakmamızı sağlar. 30 portrenin her birinde 100 formül bir araya gelir; her formül bir bağlantı noktasına karşılık gelir. '
    ),
    @(
        'Every single point symbolizes a person''s creativity, their encounter with different elements to shape something unique and special.',
        'Her bir nokta, bir kişinin yaratıcılığını ve farklı unsurlarla karşılaşarak benzersiz bir şey ortaya çıkarma sürecini simgeler.'
    ),
    @(
        ' By zooming in and out, we see the data transformed into forms that evoke nature and its essences. We enter a world where Tiziana Alocci is not only an artist, but also a visual narrator. She reveals the invisible and harmonious connections between digital and nature.',
        ' Yakınlaşıp uzaklaştıkça verinin doğayı ve özlerini çağrıştıran formlara dönüştüğünü görürüz. Tiziana Alocci burada yalnızca bir sanatçı değil, aynı zamanda görsel bir anlatıcıdır; dijital ile doğa arasındaki görünmez ve uyumlu bağları görünür kılar.'
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
