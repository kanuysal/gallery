$p = 'assets/index-viX_Ya5e.js'
$c = Get-Content -Raw $p
$map = [ordered]@{}
$map['Paul Robertet Factory: Eiffel-designed innovation and excellence, gold medalist at the 1900 World Expo'] = 'Sizin tarziniz, bizim tasarimimiz.'
$map['Raising the art of Robertet’s perfumers and flavorists.'] = 'MİNA LİDYA tasarım anlayışı'
$map['It all began with an idea: to illustrate the creative work of our perfumers and flavorists beyond the realm of fragrances and flavors, through the eyes of Italian data artist Tiziana Alocci.'] = 'Her şey, her gelinin hikayesini ve tarzını merkeze alan özel bir tasarım yaklaşımıyla başladı.'
$map['Crystallizing the union between digital and nature'] = 'Tasarım ile zarafetin buluşması'
$map['Tiziana Alocci lives and works in London. Known as an award-winning designer and successful lecturer, the Italian artist is passionate about turning data into visual art.'] = 'MİNA LİDYA, İnegöl mağazası ve Valencia atölyesi arasında kurduğu güçlü hat ile kişiye özel couture deneyimi sunar.'
$map['More than 170 years of innovation dedicated to natural products'] = 'Yılların deneyimi, bugünün zarafeti'
$map['Founded in 1850 by François Chauve under the name "A la confiance", the Robertet Group has followed a path of innovation and growth. Renamed by Paul Robertet in 1875, the company developed an innovative, high-quality service that was awarded a gold medal at the Universal Exhibition of 1900. From the patenting of the first instant coffee process in 1880 to the creation of "Butaflors" in 1950, its innovations marked the first half of the 20th century.'] = 'MİNA LİDYA, yıllara yayılan dikim ve tasarım birikimini modern çizgiyle birleştirir; her modelde kalite, işçilik ve kişiye özel uyum ön plandadır.'
$map['For Robertet, Nature is a craft deeply rooted in excellence. In the passion for the ingredient. It''s the seed of a family spirit, carefully passed down from one generation to the next. A seed that has grown sustainably to offer tailored customer support.'] = 'MİNA LİDYA için her gelinlik, zarafeti kişinin karakteriyle buluşturan özel bir tasarımdır.'
$map['Robertet stands as the roots of a company established in Grasse, enriched by unique expertise incrafting flavors and fragrances, and as the blossoming of a unique art, one that awaken senses to spark emotions. It embodies the nurturing of a strong heritage, already turned towards thefuture. It''s a burgeoning harvest, with perpetual innovations dedicated to the brands that trust us. It’s an ecosystem in full transformation where the art of nature and the freedom to invent, form the essence of a visionary venture. This passion for the ingredient is more than a calling. It''s the promise of always doing better, together. To focus on the living, to preserve it through cutting-edge technologies, and to extract from it …the Nature of tomorrow.'] = 'İnegöl mağazamızda başlayan süreç, Valencia atölyemizde uzman ekibimizle devam eder; ölçü, kalıp, kumaş ve prova adımlarını birlikte planlayarak size en iyi yakışan görünümü ortaya çıkarırız.'
$map['En guzel gununuze beraber hazirlanalim mi_'] = 'En guzel gununuze beraber hazirlanalim mi?'
$applied = 0
foreach($k in $map.Keys){ if($c.Contains($k)){ $c = $c.Replace($k,$map[$k]); $applied++ } }
Set-Content -Path $p -Value $c -NoNewline
Write-Output ("applied=" + $applied)
$checks=@('Paul Robertet','World Expo','Raising the art of','Crystallizing the union between digital and nature','More than 170 years of innovation','For Robertet, Nature is a craft','En guzel gununuze beraber hazirlanalim mi_','En guzel gununuze beraber hazirlanalim mi?')
foreach($k in $checks){ $n=(Select-String -Path $p -SimpleMatch -Pattern $k | Measure-Object).Count; Write-Output ("$k => $n") }
$out = node --check $p 2>&1
Write-Output ("syntax_exit=" + $LASTEXITCODE)
if($out){ $out | Select-Object -First 5 }