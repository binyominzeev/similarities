# 2018-10-07

Migrálás hírek:
- Pred180 jó elvileg
- Burst migrálva, mégis üresnek mutatkozik, nézzünk rá, hogy miért (valószínűleg ez is könyvtár path issue lesz)

Most beugrott, hogy a TopiNavhoz kapcsoltuk a DigiLibet korábban, és berlini létünk óta a GoldenDict, és Mendel használati modellje is bekapcsolható ugyanebbe a körbe. Ez nagyon jó lenne, talán kicsit túl szép is ahhoz, hogy igaz legyen, de reménykedjünk mégis. Látszólag egyszerű keresés, de alkalmas vizualizáció esetén van benne chidus. Két alfejezet lehetne a fenti két nagy téma. APS-pilot mindenképpen nyitánya a dolgoknak. Ezt a két konkrét képet kell látnunk magunk előtt mindenekelőtt.

Volt egy eredeti vizualizáció, windowsos megoldás, és az lenne szűkíthető, kézzel beütött kereséssel ill. kattintással. 

Persze szeretjük az általános megoldásokat, de az input mértékétől sok minden függ. Az APS csak címek, esetleg absztraktok. A Daf Yomi már több, hosszú oldal. A Torat Emet már sokrétűbb.

Meddig jutottunk el CG ügyében? Csoportok megállapítása, azokból való statisztika készítése. Időablakonként a fejlődésük, esetleg.

Azt gondolhatjuk, hogy ez így informatikai, ergonómiai chidus. Ami tudományos és kapcsolódó lehet, az a háromféle measure összevetése és kiértékelésük. Hogyan lehet az eredményüket mérni? Random szavakra adott kép gazdagságának mérésével, pl. Amiben benne van az, hogy a gazdagság jó, pedig talán pont az zavarja össze az embereket.

Hálózatok összeköttötségi mérőszámai mindenképpen ellenőrizhetőek. Illetve hosszútávon, further plans-ként megjelölhető, hogy most már, hogy interface van, az is kipróbálható, hogy ezek a felhasználói élménnyel hogyan függenek össze, annak ellenére, hogy ezt szociológiailag felmérni nekem nincsen kapacitásom-képességem, de a lehetőséget immár megteremtettem, for whoever wishes to do so.

---

Innentől kezdhetjük a konkrétumokat. Adatsor: APS. Adatok: cím, dátum, linkek. (Cím és dátum hol?) Három szó-szó-hálózatot produkál:

1. ID. 
2. KK. 
3. CO.
4. 

Minden szópárra a köztük lévő link súlya. Pl. ha két szó gyakran van együtt említve, akkor CO a közös említések száma. Ha hasonló az idődiagramjuk, akkor ID kb. 1, különben kisebb. KK az egyetlen irányított, ha X szó sokszor hivatkozik Y-ra, akkor a hivatkozások száma. Ez az első generálható adatsor.

Eszerint a vizualizáció a legnagyobb súlyú élekkel foglalkozik, és limitál, első körből. Autocomplete: triviális, nem igazán függ a súlyoktól. Keresés utáni update: csak olyan szavak, amiknek van bármilyen kapcsolata a megadottal. Vagy: csak azok, amiknek a kapcsolata jelentős? Kell keresni konkrét tanulmányozandó esetet. Pl. matrix (2946 találat).

Még egy ötlet: szókapcsolatok. Egymást követő párok segítsék az autocomplete folyamatot. Pl. matrix előtti és utáni fő szavak. Google-ben valamiért csak az utánit nézték. Első körből analizáljuk a hálózatot limit nélkül, mert a limit a vizualizáláshoz jó, de az analízishez nem.

/media/bz/SAMSUNG/elte/ingola/git/pred180/aps/records.txt (45,8 MB)
/home/bz/topinavdir/records.txt

Szókapcsolat definíciója: megelőző space (vagy tab).
	
/home/bz/topinavdir/01-szokapcsolatok.pl

---

És itt is az ötlet: Improving Recommendation Systems by comparing multiple similarities. Az RS célja, hogy X szóra mondjon, ajánljon Y-t, ami hasonló, adott hasonlóság szempontjából. De lehet, hogy arra az adott szóra egy másik hasonlósági mérték teljesítene hatékonyabban: minden szóra megvan, hogy miben jobb. Ezért jó, hogy nálunk négyfélét hasonlítunk össze (a fenti hármon túl egy sokkal egyszerűbb, szomszéd-szó-alapút is).

Első körős kísérlet: csak APS, és két hasonlóság: szomszéd-alapú és link-alapú (KK). Egy adott szóra és adott hasonlóság-mértékre úgy értékeljük ki a kapcsolatok erejét, hogy mondjuk vesszük a tíz legerősebb kapcsolatot. Két szó közötti kapcsolat abszolút mérése a hasonlósági mértéken belül, rank-percentage-alapon történik. Vagyis: mi már tudjuk az összes létező szópárra adódó értéket, és ezeket rendezzük egy diagramon el. Ezen a diagramon az adott szópár-hasonlóság hol helyezkedik el? Ez adja meg a két szó adott hasonlóság szerinti kapcsolat-erősségét. A tíz legerősebb alapján vonhatunk átlagot (vagy vehetjük akár első körből csak az elsőt, és utána próbálhatunk összevetni más eredményekkel).

Előnye, hogy összevethetővé válnak teljesen másként mért mértékek (amiket így nem is kell normalizálni külön). A mérés abszolút igazságos, általános, minden helyzetben alkalmazható. Első feladat tehát APS szópárokra mindkét típust megállapítani, és a két alap-diagramot elkészíteni. Utána venni pl. 10 random szót, és megnézni rájuk, hogy melyik mértéken funkcionálnak jobban. Utána mindenféle mértékekre össze lehet gyűjteni, hogy melyik hányszor (hány szóra) bizonyul a legjobb mértéknek.

Utána arról lehet írni, hogy ez a kutatás igazolja a sokféle mérés létjogosultságát, mert ha csak egy szempontból néznénk, még akár a lehető legjobb szempontból is, azáltal is lemaradnánk sokkal erősebb, létező kapcsolatokról. Utána konkrét esettanulmányokon keresztül lehet illusztrálni ezt az elvet.

(Eredetileg klaszterezést akartunk, meg idődiagramot. Az előbbinél jópofa összehasonlítás is lehetne akár, de minek, ha ez így egyszerűbb, lényegretörőbb, és kihangsúlyozza a sokféle méréses, régi alapötletünket. Az utóbbi végülis be is épül, mert ez az egyik a négy mérték közül. Ha ezt sikerül öt adatsorra szépen lefuttatnunk, megjelenítenünk, akkor az már tényleg jelentős kontribúció lenne, mind a tudományhoz, mind a PhD dolgozathoz, és befejezhetjük, beküldhetjük. És egy érdekes programozói feladat is, ami talán jól ráhangol az app-fejlesztésre (akár DavenTimer, akár DigiLib, akár GoldenDict/DafYomi, akár Feature Search).)

# 2018-10-08

Első körből a "matrix" szóra a legközelebbi szomszédjait. Jó, de percentage szerint nem lehet, csak az összes alapján. Mindegy, mert a szóhatárok megállapítása mindenféleképpen szükséges lesz. Ez egy olyan lista, ami tartalmazza az összes szó-szó távolságot (noha csak a létezőket, de reméljük, ez nem okoz nagy gondot).

\[a-zA-Z]+

Minden szomszédos szó kiszámolása egyszerű: párosával végighaladni a szavakon. Noha lehet, hogy kell hozzá kapacitás (topinav vagy atlasz). Következő: linkek párosítása. Irányított mindkét hálózat. Hogy számoljuk legerősebb kapcsolatokat? Oda és vissza külön. Output specifikáció:

aps-\[kk|cn].txt

word1	word2	 weight

APS élhálózat betöltése topinav szerverbe:

Kb. 1000 maradt a kb. 6 perces élprocesszálás után, a rendezés után swappolásig ment le, az eredeti 3734-ből. (Atlaszon 49747 van.)

(De mondjuk erre a lépésre nincs szükség, mert utólag is lehet rendezni, talán, hatékonyabb algoritmusokkal, feleslegesebb éleket figyelmen kívül hagyva.)

313MB a KK hálózat, de elég gyorsan (~16%) elér 10-ig:

root@topinav:~/recsys# pcregrep -n -M '\t10\n' aps-kk.txt | head
2469748:mode	considerations	10
2469749:protected	yba	10
2469750:orientational	preroughening	10
2469751:fundamental	shape	10
2469752:resonating	rokhsar	10
2469753:reflection	breakdown	10
2469754:doping	muffin	10
2469755:transverse	accurate	10
2469756:elastic	love	10
2469757:vapors	radiation	10
root@topinav:~/recsys# wc -l aps-kk.txt 
15360154 aps-kk.txt
root@topinav:~/recsys# echo 24/153 | bc -l
.15686274509803921568

Következő számítás: a "mátrix" szó holléte e két skálán. Konkrétabban: matrix theory (ill. fordítottja). CN: 210. KK: 3023. Legegyszerűbb a rank, de az nem tudom, hogy jó-e. CN: 722. KK: 3136. Legegyszerűbb lenne látni a diagramot, amit elképzeltünk.

Javaslat: long-tail diagram, de az azon kapott percentílisek tökéletesen megegyezni látszanak a sima uniform min-max skálázással. A kérdés az, hogy ez vajon probléma? Nem feltétlenül, noha nem egészen erre gondoltunk eredetileg. A log-skálázás önmagában is hasznos lehet. Nyilván a nagy lépéseket akarjuk ugorni. Próbáljuk meg így, és ha nincsen vele gond, akkor maradhat.

Most ránéztem a CN és KK görbékre (/home/bz/topinavdir/aps-pdf.ods), és mivel fat-tailed-eloszlásokról van szó, ezért azt gondolom, az Y tengely szerinti percentílist érdemesebb számolni, mint az X szerintit. Tehát legfelül 0, legalul 1, középen 50. Ennek kiszámításához csak azt kell tudni, hogy hány 1-es elem van (annak is csak a logaritmusát).

Összességében, minden szóra ki akarjuk számolni, első körből a legközelebbi szomszédjának ezt a számát. Lássuk a példát a mátrixra:

CN	density-matrix-502
KK	quantum-matrix-3651

CN-ben 257,136 db 1-es van. Tehát a mátrix CN-percentílise: 1-(log 502/log 257136). Azaz kb. 50%.

KK-ban 6,511,301 db 1-es van. Tehát KK-perc: 1-(log 3651/log 6511301). Azaz kb. 47,7% – nem nagyon eltérő. (Köv. kérdés, hogy milyen elemekre produkál nagy eltéréseket?)

Előállítjuk a szó-percentíliseket, először az első elemekre, különbségeket nézünk, aztán esetleg top10-et is. Így:

aps-cn-kk-perc.txt

matrix	50.08	47.71

Noha ez nem teljesen akkurátus, mert valójában az Y tengelyt kellene nézni a szó esetén is, és az 1 (mert csak 1 ilyen elem van. KK-ban viszont van 2, sőt, szomszédjában 5, de vajon ez mennyiben releváns? Ha top szavak top elemeiről beszélünk, valóban ennek kell aa különbséget jelentenie? Tudjuk, hogy a végén a görbe „berezonál”. Inkább: maga a görbe főáramához képest hol van, ez az érdekes. Talán: a környezete? Még jobb: az illesztett görbe, és akkor még tudományosak is voltunk. Ezt hívják úgy, hogy power law parameter estimation, és maximum likelihood-ot javasolnak rá), ezért a rangja is maximális, 1. Létezik, hogy ez csak a nagyon érdektelen szavakra kisebb 1-nél? Ebben az esetben nem kapunk tényleges megkülönböztetést. Lehet, hogy emiatt kellene több mint 1 találatot figyelembe venni.

Egyszerűsítésként a kisebb CN adatsorból elkészítjük az aps-words.txt-t, és fentről indulva, amikor már mindegyikre láttunk valamit, megállunk. Gondolván KK-ra, ahol sokkal hamarabb véget kell, hogy érjen, minthogy végighalad az adatsoron.

bz@bz-HP-EliteBook-8530p:~/topinavdir$ cut -f1 aps-cn.txt | sort | uniq | wc -l
27008
bz@bz-HP-EliteBook-8530p:~/topinavdir$ cut -f2 aps-cn.txt | sort | uniq | wc -l
23250
bz@bz-HP-EliteBook-8530p:~/topinavdir$ cut -f1 aps-cn.txt | sort | uniq > aps-words-1.txt
bz@bz-HP-EliteBook-8530p:~/topinavdir$ cut -f2 aps-cn.txt | sort | uniq > aps-words-2.txt
bz@bz-HP-EliteBook-8530p:~/topinavdir$ cat aps-words-1.txt aps-words-2.txt |sort |uniq | wc -l
32357
bz@bz-HP-EliteBook-8530p:~/topinavdir$ cat aps-words-1.txt aps-words-2.txt |sort |uniq > aps-words.txt
bz@bz-HP-EliteBook-8530p:~/topinavdir$ rm aps-words-1.txt aps-words-2.txt 

Paraméterbecslés a hatványfüggvényhez:

http://excelforeducators.blogspot.com/2011/10/ive-got-power-law.html

Nagyon szép, egyszerű képletek, X, Y, szorzatuk, négyzetük összege kell hozzá csak igazából. OK, eszerint a mátrix szó CN-percentílisének számolása a következő. Logaritmusa 8.97. Bár nem értem, hogy miért nem ezt is csak a legnagyobb X értékhez kell viszonyítani? Miben történik más, ha az Y-hoz viszonyítjuk, ha amúgy is egyenest illesztünk rá? Talán mondhatjuk, ha 0-nál meg akarnánk állítani a folyamatot, de miért tennénk ilyet, hiszen ezzel kiértékelhetetlenné, de legalábbis megkülönböztethetetlenné tennénk a legrelevánsabb elemeket. Hanem: ez a modell, amire gondolunk, miközben a kivitelezés gyakorlatilag sokkal egyszerűbb. (Nem torzítunk ezáltal, hogy a legnagyobb elemhez viszonyítunk mindig?)

Mindenesetre: a legnagyobb X (2-es alapú) logaritmus 15.17, és ehhez képest a mátrix: 8.97 / 15.17 = 59%. Vagy a neki megfelelő illesztett Y érték 6.69, míg az Y -5.93-tól 23.73-ig skálázik. Eszerint a teljes skála hossza 5.93 + 23.73 = 29.66, a mi értékünk elhelyezkedése ezen 6.69 + 5.93 = 12.62, azaz relatív percentílise: 1 - (12.62 / 29.66) = 57,45%, majdnem ugyanaz (miért csak majdnem? Valószínűleg a legfelső értékek megállapításában van kis csúszás). Mindennel együtt, most a futtatáshoz induljunk ki ebből, aztán lehet, hogy amikor majd leírjuk, akkor közben rájövünk valamire.

Ugyanezen logika mentén a CN-percentílis (mert ez meglepő módon a KK volt): 12.14 a maximális X-2-log, a mátrixé log502/log2=8.97, a hányados 8.97 / 12.14 = 73,86%, tehát erősebb a KK-nál. Eszerint ilyesmit akarunk a végeredményben látni:

matrix	73.86	59

OK, sok a ritka szó, amik 0-át adnak, abszolúte jogosan, szinte alig fordulnak elő, cserébe miattuk csupán 8 sorral a fájl vége előtt áll le az algoritmus. Emiatt talán haszna lenne, ha kizárnánk a keresésből ezeket a szavakat. Ám nem, mert ki tudja, hogy nem nagyobbak-e a másik kritérium (KK) szerint? Kezdjünk a szólista preparálásával: Nem sokkal nagyobb, de sokkal lassabb. Emiatt és a fenti 1-0 probléma miatt is érdemes lenne külön scriptet gyártani hozzá: words-list.pl. Igen, így már gyorsabb, és hamarabb is leáll:

root@topinav:~/recsys# wc -l aps-kk.txt 
15360154 aps-kk.txt
root@topinav:~/recsys# ./cn-kk-perc.pl 
8841822

Ám meglepő módon a matrix értéke KK szerint 78, és nem 59, ahogy vártuk. Ez meg hogy lehet? Igen, úgy, hogy elrontottuk a számolást, mert a két logaritmus hányadosa továbbra is 78%.

Következő (és mára egyben utolsó) lépés a két lista egyesítése és összevetése. Elég egyesíteni egyelőre, az üres helyekre 0-át írni, és a különbségek szerint, Excelben rendezni (vagy akár rögtön azt kiírni terminálra): cn-kk-perc-unify.pl.

Az OpenOffice most nem akar 600KB-t betölteni, de mezítlábasan látom, hogy ez például egy érdekes elem:

hexagons	0	40.66

Hogyan lehetséges, hogy nincsenek igazán szó szerinti szomszédjai, de hivatkozók vannak? Például egyetlen cikk, cím elején vagy végén, és jó sok ki-be-link, lehetőleg minél hasonlóbb elemekre. Úgy látszik, hogy valahol valami mégiscsak fel lett cserélve, debuggolandó:

bz@bz-HP-EliteBook-8530p:~/topinavdir$ grep -P "hexagons\t" aps-cn-perc.txt 
bz@bz-HP-EliteBook-8530p:~/topinavdir$ grep -P "hexagons\t" aps-kk-perc.txt 
hexagons	40.66
subhexagons	15.3
ultrahexagons	15.3
bz@bz-HP-EliteBook-8530p:~/topinavdir$ grep -P "hexagons\t" aps-kk.txt |head
bz@bz-HP-EliteBook-8530p:~/topinavdir$ grep -P "hexagons\t" aps-cn.txt |head
hexagons	kinks	1
negative	hexagons	1
oscillating	hexagons	1
reentrant	hexagons	1
quasicrystals	hexagons	1
optical	hexagons	1
interfaces	hexagons	1
hard	hexagons	1
huts	hexagons	1
squares	hexagons	1

(Amúgy a nagy trükk itt az, hogy a hexagon az igazi előfordulás, egyes és nem többes számban.)

# 2018-10-09

Sikerült rendezni. Rekorder a presence, mert CN szerint csak 1-es szomszédai vannak, KK szerint azonban a quantum 2741-es. Így tudnám elképzelni: csak néhány cikkben szerepel, azok viszont jól hivatkozottak. Máris egy jó üzenet, egy kiemelhető példa. Mert az a kevés említés nem lehet olyan érdekes.

bz@bz-HP-EliteBook-8530p:~/topinavdir$ grep presence aps-kk.txt | head
presence	quantum	2741
quantum	presence	1838
presence	spin	1426
presence	field	1393
field	presence	1303
presence	theory	1257
presence	dimensional	1216
presence	electron	1196
spin	presence	1124
presence	magnetic	1107
bz@bz-HP-EliteBook-8530p:~/topinavdir$ grep presence aps-cn.txt | head
fluctuations	presence	1
current	presence	1
initial	presence	1
presence	time	1
laalo	presence	1
presence	probability	1
films	presence	1
halides	presence	1
presenceof	diffusion	1
mutual	presence	1

Talán érdemes mihamarabb elkezdeni írni.

# 2018-10-10

OK, mindig úgy áll, hogy "in the presence of", ezért lemáásze nincsen szomszédja. A stopszavak kiszűrése után olyasmit kapunk, ami nem jellemző. Pl. igazán a field a jellemző, de ehhez nyelvtani elemzés kellene (a jelzők levágása, pl. "in the presence of a laser field"). Szuper módon azonban a KK-módszer egész jó, mert 5. helyen áll benne a field. Mindezzel együtt, kellene látni sokkal több szomszédot, ezek hová tűntek. Pl. "laser".

Igen, az algoritmus hibás, mert először kell a stopszószűrés, és csak utána a mentés. Javítva. Így 8 MB-ből 17,3MB-s lett a fájl (több mint duplája). A "presence" megnőtt, de nem jelentősen. Field jó alul van benne. Percentílis fájl is megnőtt, kevesebb mint 1%-al. Presence miért nincs benne továbbra sem? Á, mert a words-list-ből dolgozik. Így már jobb a növekedése valamivel. Presence új CN értéke 52.76.

Diff: a CN-növelés következtében még feljebb kerültek a diff értékek, de lényegében (kiszűretlenül maradt) stopszavak vannak az elején a listának (betűk és számok főleg). Néhány érdekes elemet kiboldoltam.


# 2018-10-11

Git: 8 MB-nél kisebb fájlok feltöltése.

bz@bz-HP-EliteBook-8530p:~/similarities$ git add *
bz@bz-HP-EliteBook-8530p:~/similarities$ git config --global user.email "szvbinjomin@gmail.com"
bz@bz-HP-EliteBook-8530p:~/similarities$ git commit
[master eee3a36] first upload
 17 files changed, 157387 insertions(+)
 create mode 100644 TODO.md
 create mode 100644 aps-cn-kk-perc.txt
 create mode 100644 aps-cn-kk.ods
 create mode 100644 aps-cn-pdf.txt
 create mode 100644 aps-cn-perc.txt
 create mode 100644 aps-cn-perc.txt.2
 create mode 100644 aps-cn-words.txt
 create mode 100644 aps-kk-pdf.txt
 create mode 100644 aps-kk-perc.txt
 create mode 100644 aps-kk-words.txt
 create mode 100644 aps-pdf.ods
 create mode 100755 cn-kk-perc-unify.pl
 create mode 100755 cn-kk-perc.pl
 create mode 100755 cn.pl
 create mode 100755 kk.pl
 create mode 100644 stopwords-en.txt
 create mode 100755 words-list.pl
bz@bz-HP-EliteBook-8530p:~/similarities$ git push
warning: push.default is unset; its implicit value has changed in
Git 2.0 from 'matching' to 'simple'. To squelch this message
and maintain the traditional behavior, use:

  git config --global push.default matching

To squelch this message and adopt the new behavior now, use:

  git config --global push.default simple

When push.default is set to 'matching', git will push local branches
to the remote branches that already exist with the same name.

Since Git 2.0, Git defaults to the more conservative 'simple'
behavior, which only pushes the current branch to the corresponding
remote branch that 'git pull' uses to update the current branch.

See 'git help config' and search for 'push.default' for further information.
(the 'simple' mode was introduced in Git 1.7.11. Use the similar mode
'current' instead of 'simple' if you sometimes use older versions of Git)

Username for 'https://github.com': binyominzeev
Password for 'https://binyominzeev@github.com': 
Counting objects: 19, done.
Delta compression using up to 2 threads.
Compressing objects: 100% (19/19), done.
Writing objects: 100% (19/19), 2.01 MiB | 701.00 KiB/s, done.
Total 19 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), done.
To https://github.com/binyominzeev/similarities.git
   129f435..eee3a36  master -> master

Többi fájlt is bemásolom, de csak egyesével merem push-olni, egyelőre. Itt tartunk: 

bz@bz-HP-EliteBook-8530p:~/similarities$ ls -laS
total 157732
-rwxrwxr-x  1 bz bz 62815057 okt    8 11:53 aps_edges.txt
-rwxrwxrwx  1 bz bz 45837175 aug   24  2017 records.txt
-rw-rw-r--  1 bz bz 17321484 okt   10 06:37 aps-cn.txt
-rwxrwxr-x  1 bz bz 14801725 okt    7 16:46 aps_nodes.txt
-rw-r--r--  1 bz bz  8978432 okt    8 14:14 aps-kk.txt

De amúgy ki is írja, hogy mi kéne még, ha git commitot kérünk anélkül, hogy bejelölnénk kézzel a változtatásokat. Ez praktikus, mert ébren tart, hogy mivel hogy állunk.

---

A folytatási terv: csak az 5x4-es táblázatot készítsük el arról, hogy melyik adatsorhoz melyik similarity illeszkedik a legjobban. Ezzel nagyon nagy szolgálatot teszünk a társadalomnak, mert kimutatjuk az összefüggéseket, és az utánunk jövőknek talán nem is kell legenerálnia, hanem a kritériumok alapján választhatnak. Szó volt róla, hogy nagy előnyünk lehet a versenytársakhoz képest a különböző adatsorok használata.

Eszerint a következő challenge a „háromdimenziós” könyvelés lesz: adatsor, similarity, és a process lépés. (Lehet, hogy érdemes lesz számot rendelni mindháromhoz? Esetleg README.md-be kiírni ezeket?) Utána, ha megvan, a fő ábra így néz ki: minden adatsorra külön ábra, oszlopdiagram, kezd a legerősebb similarity-vel, és folyamatosan csökken. Tehát mindegyikre csökkenő, mini-Zipf-plot szerű, az összehasonlítás kedvéért színes ábra.

Végül, ami máris megvan: APS CN-KK összehasonlítás. Hány szóban melyik measure prevails. (Noha még egy szűrésre szükség lesz, ld. előző nap, és a diff lista teteje.)

- KK: 33208
- CN: 1297

Szép az eredmény, KK sokkal hatékonyabbnak bizonyul ebben az adatsorban. Igazán szép akkor lesz, ha kontextusba helyezzük.

# 2018-10-12

Mai teendő: APS maradékok kiszámolása, rendezés a terv szerint.

Új lépés: evaluation. Output format:

aps:

kk	33208
cn	1297

Érdekes, hogy most, hogy az OC-t is hozzáadtam, megváltozott a szituáció, és az utóbbi kettő sorrendje is megfordult (erre van vajon magyarázat?):

bz@bz-HP-EliteBook-8530p:~/similarities$ cat 5-ev.txt 
1-aps:

4-oc	10025
1-cn	6069
2-kk	5028

Azért lesz szükség némi debugra, mert ha csak kettőt generálok, akkor:

bz@bz-HP-EliteBook-8530p:~/similarities$ cat 5-ev.txt 
1-aps:

1-cn	11560
2-kk	5070

Szóval nem egészen ugyanazok a számok jöttek ki itt. Hol kezdődik az eltérés? Percentílisek megegyezni látszanak. Sok jobbat nem tudok tenni, mint szúrópróbát, esetleg fent leírt példára: matrix (tökéletes), hexagons (nem egyezik, nem tudok mit csinálni). Mindenesetre: 

bz@bz-HP-EliteBook-8530p:~/similarities$ grep matrix 3-pr-1-aps-1-cn.txt 
matrix	73.91
bz@bz-HP-EliteBook-8530p:~/similarities$ grep matrix 3-pr-1-aps-2-kk.txt 
matrix	78
bz@bz-HP-EliteBook-8530p:~/similarities$ grep matrix 3-pr-1-aps-4-oc.txt 
matrix	72.93

Eszerint itt KK győzedelmeskedik, nézzük meg, hogy azt számolja-e, és akkor elégedjünk meg. (Úgyis a jelenlegi verzió az áttekinthetőbb az előzőnél, szóval ha valamiben bug volt, akkor az az előző volt.) Igen, hibátlan.

---

Következő lépés a 3-TD. Ehhez először köztes fájlt kell generálni (pl. 1-mes-1-aps-3-td.diagrams.txt):

word num1 num2 num3 ...

Ha ez megvan, az elv az, hogy minden szót mindenhez hasonlíthatunk. De lehet, hogy ezen a ponton szükség lesz hatékonyításra. Például a diagram egyszerűsítésére, felbontására, szavak csoportokba helyezésére. Becslés kedvéért:

bz@bz-HP-EliteBook-8530p:~/similarities$ wc -l 2-wd-*
 16594 2-wd-1-aps-1-cn.txt
 34090 2-wd-1-aps-2-kk.txt
 21104 2-wd-1-aps-4-oc.txt

És ezek csak azok a szavak, amiknek valamilyen más hálózat szerint kapcsolatai vannak. Világos, hogy sosem fog a négyzetes összehasonlítása lefutni, még a legkisebb hálózatra sem. A felbontás X és Y koordináták szerint történik, és csoportokat hoz létre.

Ha egy csoportba kerül több szó, azok távolsága 0 (vagy: maximális). Ha nem elég felosztott a mértékegység, az percentílisek és összehasonlítás terén okozhat nehézségeket. De: ha csak 10 vagy 100 szó kerül egy csoportba, az már jelentős segítség, mert pl. 10,000 szót 100-ra csökkent, ami négyzetreemelés során ismét 10,000 lesz, szóval lineáris lépésszámot redményez.

Valamint: a csoport-kódok önmagukban is rendezhetőek, és a lineáris skálán mért távolságuk is vizsgálható (ugyan az nem túl hasznos, mert pl. 1010001 és 1000001 nagyon távolinak tűnik, közben pedig szomszédok).

Emlékeztetőül, a hasonlóság hatékonyságát úgy definiáltuk, hogy hány olyan szó van, aminek eszerint van a legközelebbi (N – ezt még nem mértük meg, ha 1-nél nagyobb) szomszédja. Ha csoportokat generálunk, akkor nem létezhet az egy csoportba tartozásnál nagyobb közelség. (Hacsaknem a csoportokon belül másodlagos felosztást definiálunk.) Illetve, a forgalmatlan elemek nagyon közelinek fognak tűnni (hacsaknem vezetünk be valami fura átskálázást).

Ezek alapján ezen a ponton a fő kihívás e két definíció összehangolása: közelség-mérőszám és idődiagram-közelség. Minden más mértékre triviális, mert a CN-KK-val kezdtünk, az OC majdnem ugyanaz mint CN, és csak a TD marad.

Talán így a legegyszerűbb: jelentős szavakra nincsen probléma, mert két jelentős szó idő-diagramja aligha fog egybeesni. Csak a kicsi szavaknak lesz rengeteg szomszédjuk ebben a hálózatban, ami félrevezető, mert jellemzően éppen a hubok a jelentősek. Elvileg akár magába a mérőszám kiértékelésébe is belefoglalható lenne pl. szimpla előfordulásszám szerinti súlyozás, ami képes lenne ellensúlyozni ezt.

Persze az meg akkor lenne furcsa, ha egy normálisan működő mérőszámot ellensúlyozna, amit nem kell, így abban elvileg kétszeres ellensúly lenne. De ezt sem gondolom, mert mi baj lehet abból, ha a tényleg releváns elemeknek nagyobb a szerepe? Talán ez a legjobb: csak fontos szavak kerüljenek bele minden mérésbe. Idődiagram ügyében amúgy is ezt tettük.

Súlyozás esetén az adódna, hogy a valóságban gyakori szavak a hálózatban is sok szomszéddal rendelkeznek-e. Világos, hogy a TD-mérték számára ez teljesíthetetlennek látszó kihívás. Hiszen minél nagyobb, annál változatosabb, és nem sok szomszédja lesz. De mondjuk ha eleve csak nagyokkal versenyez, akkor ez nem így van. Mindkét korrekcióra amúgy sem lesz szükség.

Konklúzió: nézzük meg a szavak forgalmát, toplistáját, és konstruáljuk a TD hálózatot csak a nagy elemekre. Korábban már szerepelt hasonló nagyság-definíció, talán épp a publikációban, de most még erősebb feltételhez kötnénk.

Kezdjünk 5000-el próbálkozni, és utána majd meglátjuk.

bz@bz-HP-EliteBook-8530p:~/similarities$ head -n5000 0-wdc-1-aps.txt | tail
solve	43
surrounding	43
alkanes	43
environmental	43
decorated	43
waiting	43
caesium	43
architecture	43
bunched	43
radion	43

Évek száma: 1893 - 2009 + 1 = 117. Eszerint lehetünk kicsit bátrabbak és mehetünk évi 2 átlagos előfordulásra:

bz@bz-HP-EliteBook-8530p:~/similarities$ head -n2080 0-wdc-1-aps.txt | tail
blue	236
centered	236
lennard	236
quadrupolar	235
orthorhombic	235
residual	235
fractions	234
uncertainty	234
langmuir	234
coarsening	234

Szóval elég az első 2080 elem. Felosztás: lehet 10x10-es. Ugyan lehet, hogy normalizálni is érdemes (SVD), mert biztos a későbbi években jellemző bármi. De talán lefut a Wekán a sima SVD, ha 2080 elemre és 117 dimenzióra futtatjuk.

Még ez is jó:

bz@bz-HP-EliteBook-8530p:~/similarities$ cut -f2 aps-records.txt | sort | pdf.pl
1893 20
1894 36
1895 36
1896 36
1897 54
1898 61
1899 57
1900 63
1901 69
1902 75
1903 87
1904 79
1905 67
1906 120
1907 88
1908 80
1909 73
1910 116
1911 171
1912 81
1913 82
1914 166
1915 97
1916 145
1917 127
1918 92
1919 88
1920 100
1921 92
1922 241
1923 134
1924 160
1925 191
1926 208
1927 200
1928 249
1929 362
1930 521
1931 606
1932 559
1933 493
1934 547
1935 493
1936 483
1937 546
1938 504
1939 651
1940 559
1941 451
1942 299
1943 153
1944 165
1945 182
1946 427
1947 651
1948 929
1949 1238
1950 1380
1951 1534
1952 1372
1953 1575
1954 1659
1955 1522
1956 1474
1957 1471
1958 1714
1959 1672
1960 1733
1961 1748
1962 1947
1963 2164
1964 2689
1965 2985
1966 3316
1967 3902
1968 4374
1969 4433
1970 4498
1971 4596
1972 4652
1973 4838
1974 4594
1975 4654
1976 4599
1977 4611
1978 4772
1979 4649
1980 4714
1981 5168
1982 5524
1983 5797
1984 6091
1985 6949
1986 7603
1987 7996
1988 8624
1989 9278
1990 9123
1991 9690
1992 10575
1993 11956
1994 12341
1995 13032
1996 13024
1997 13032
1998 13553
1999 13687
2000 14379
2001 14809
2002 16705
2003 15035
2004 16483
2005 18361
2006 17944
2007 17889
2008 19179
2009 18732

Azt hiszem, ki lett zárva a korábbi mérésből a néhány kezdeti év, mondjuk, 1949-ig, és akkor az már csak 61 év. (Mérjünk szavakat ugyaneddig, és hátha akkor megússzuk az SVD-t. Persze minden más adatot újra kell generálni ezen évekre vonatkoztatva.) Alaposabb vizuális analízis eredményeként láthatjuk, hogy még jelentősebb és tartósabb ugrás történt 1968-tól számítva (így 42 év adódik).

UPDATE: a publikáció Table 1.-ben 1965-2009 áll, 45 év (legyen 5 évenként 9, vagy 4 évenként 11, és az utolsót is belevéve, ami átlag miatt nem probléma).

Első kísérletként készítsük el ezt az adatsort, és osszuk be 3-asával, 14 csoportra, Y skálát pedig meglátjuk, hogy hogy mozog (évcsoportok átlagával dolgozzunk, a publikációban szereplő Fig. 3-al konzisztens módon).

Ehhez már több szó kell, mert 90-ig (2 x 45) kell lemenni:

bz@bz-HP-EliteBook-8530p:~/similarities$ head -n3330 0-wdc-1-aps.txt | tail
sudden	90
identity	90
ns	90
sustained	90
dimerization	90
millimeter	90
branched	90
pathways	90
poissonian	90
compositional	90

Vagy követeljünk évi 3 átlagos cikket (135), és akkor:

bz@bz-HP-EliteBook-8530p:~/similarities$ head -n2700 0-wdc-1-aps.txt | tail
hypernuclei	133
texture	133
mnf	133
annealed	133
rest	133
technicolor	133
plateau	133
nondemolition	133
tree	133
neutralization	133

Legközelebb innentől folytatjuk: a szódiagramok legyártása erre. (Vagy megkeresése, mert a pred-hez már legyártottuk, csak kevésbé szűrve.)

# 2018-10-16

A szódiagramok előállítása a fenti specifikáció alapján.

# 2018-10-21

Kategóriák: minél több, annál jobb, feltéve, hogy nem marad üresen egyik sem. 1-0 sorozatok, és az egyik 1-0 sorozat szomszédai azok, akik tőle csak 1 karakterben különböznek. Szóval annyi szomszéda van, amennyire hosszú. Az algoritmus a saját dobozát hasonlítja a szomszédaival, szóval 1 dobozba átlagosan N/2^k elem kerül, és a szomszédos k dobozzal kell összehasonlítani, ezért a végső képlet kN/2^k.

2700 elem van, és 9 számjegy kezdetben, és 2 ^ 9 = 512. Eszerint elvileg lehetséges, hogy ne legyen minden üres. Ehelyett jelenleg 164 van (32%). Próbáljuk ezért 7 számjeggyel (noha elképzelhető, hogy „sarokba” tömörülnek). Ahogy sejtettem, így már csak 86 szomszéd van. Ez az SVD irányába mutat. Azért megpróbálunk még egy lépést: 6 számjegy, 64 teljes, 54 jelenlegi. Ez már egyáltalán nem rossz arány (84%). Talán feltételezhető, hogy nem is veszítünk általa – egy próbát megér talán.

Van amúgy SVD Perlben is:

https://metacpan.org/pod/Math::GSL::Linalg::SVD
https://metacpan.org/pod/release/SWALTERS/Math-Preference-SVD-0.01/lib/Math/Preference/SVD.pm
http://pdl.perl.org/PDLdocs/MatrixOps.html

Noha nem értem, hogy miért nem ugyanazt adja, mint a Weka (test.csv):

=== Run information ===

Evaluator:    weka.attributeSelection.PrincipalComponents -R 0.95 -A 5
Search:weka.attributeSelection.Ranker -T -1.7976931348623157E308 -N -1
Relation:     test
Instances:    4
Attributes:   10
              word
              a1
              a2
              a3
              a4
              a5
              a6
              a7
              a8
              a9
Evaluation mode:evaluate on all training data



=== Attribute Selection on all input data ===

Search Method:
	Attribute ranking.

Attribute Evaluator (unsupervised):
	Principal Components Attribute Transformer

Correlation matrix
  1      0      0.71   0.9    1      0      0.69  -0.3  
  0      1      0.5    0.43   0      0.71  -0.32  -0.43 
  0.71   0.5    1      0.85   0.71   0      0     -0.85 
  0.9    0.43   0.85   1      0.9    0.3    0.48  -0.45 
  1      0      0.71   0.9    1      0      0.69  -0.3  
  0      0.71   0      0.3    0      1      0.23   0.3  
  0.69  -0.32   0      0.48   0.69   0.23   1      0.48 
 -0.3   -0.43  -0.85  -0.45  -0.3    0.3    0.48   1    


eigenvalue	proportion	cumulative
  4.13392	  0.51674	  0.51674	-0.486a5-0.46a6-0.46a2-0.436a4+0.258a9...
  2.19318	  0.27415	  0.79089	0.579a8+0.489a9-0.487a3-0.289a4+0.226a6...
  1.6729 	  0.20911	  1      	0.761a7+0.469a3+0.346a9+0.179a8-0.134a4...

Eigenvectors
 V1	 V2	 V3	
-0.4599	 0.2256	-0.0917	a2
-0.1645	-0.487 	 0.469 	a3
-0.4363	-0.2889	-0.1342	a4
-0.4862	-0.0036	 0.1171	a5
-0.4599	 0.2256	-0.0917	a6
-0.0756	-0.0545	 0.7614	a7
-0.2258	 0.5792	 0.1791	a8
 0.258 	 0.4891	 0.3459	a9

Ranked attributes:
 0.483  1 -0.486a5-0.46a6-0.46a2-0.436a4+0.258a9...
 0.209  2 0.579a8+0.489a9-0.487a3-0.289a4+0.226a6...
 0      3 0.761a7+0.469a3+0.346a9+0.179a8-0.134a4...

Selected attributes: 1,2,3 : 3

Legközelebb ennek futtatását próbáljuk (már fel van installálva):

http://pdl-stats.sourceforge.net/GLM.htm#pca

---

Elmélet: az összes diagramot a konvertált térben kell kezelni. Input adatokkal együtt. Mindkét irányú hash-t hozunk létre, elemből dobozba és dobozból elembe. Egy elem processzálásakor lekérjük a dobozát, a szomszédait, annak elemeit, és ebből adódnak a szomszédai. A feltételezés az, hogy a konvertált térben is ugyanolyan távol vannak az elemek mint egyébként.

Ami ehhez kell: a ranked attributes, azaz hogyan számítandóak az új koordináták a régiekből. Weka ebből egyetlen attribútumot generál, lehet, hogy azért, mert nem normalizáltam. Így már más: 46-ból 37 attribútumot választott ki, ami összességében 95%-os lefedettséget ér el.

=== Run information ===

Evaluator:    weka.attributeSelection.PrincipalComponents -R 0.95 -A 5
Search:weka.attributeSelection.Ranker -T -1.7976931348623157E308 -N -1
Relation:     1-mes-1-aps-3-td-svd
Instances:    2700
Attributes:   46
              word
              y1965
              y1966
              y1967
              y1968
              y1969
              y1970
              y1971
              y1972
              y1973
              y1974
              y1975
              y1976
              y1977
              y1978
              y1979
              y1980
              y1981
              y1982
              y1983
              y1984
              y1985
              y1986
              y1987
              y1988
              y1989
              y1990
              y1991
              y1992
              y1993
              y1994
              y1995
              y1996
              y1997
              y1998
              y1999
              y2000
              y2001
              y2002
              y2003
              y2004
              y2005
              y2006
              y2007
              y2008
              y2009
Evaluation mode:evaluate on all training data



=== Attribute Selection on all input data ===

Search Method:
	Attribute ranking.

Attribute Evaluator (unsupervised):
	Principal Components Attribute Transformer

Correlation matrix
  1      0.68   0.6    0.57   0.52   0.51   0.48   0.45   0.45   0.39   0.33   0.32   0.3    0.27   0.27   0.25   0.22   0.24   0.19   0.16   0.17   0.13   0.08   0.09   0.11   0.07   0.06   0.02   0.04   0.01  -0.02  -0.06  -0.09  -0.13  -0.1   -0.13  -0.2   -0.19  -0.23  -0.22  -0.25  -0.28  -0.25  -0.25  -0.23 
  0.68   1      0.71   0.68   0.62   0.58   0.56   0.52   0.53   0.44   0.39   0.36   0.34   0.3    0.28   0.29   0.26   0.25   0.2    0.17   0.17   0.13   0.1    0.1    0.12   0.04   0.06   0.03   0.05  -0.01   0     -0.06  -0.1   -0.14  -0.12  -0.17  -0.19  -0.19  -0.23  -0.23  -0.26  -0.26  -0.26  -0.25  -0.25 
  0.6    0.71   1      0.77   0.72   0.66   0.61   0.55   0.55   0.47   0.43   0.38   0.36   0.34   0.3    0.31   0.26   0.28   0.23   0.18   0.2    0.15   0.15   0.13   0.15   0.08   0.09   0.07   0.07   0.03   0.02  -0.05  -0.09  -0.12  -0.1   -0.13  -0.17  -0.18  -0.21  -0.24  -0.24  -0.26  -0.24  -0.24  -0.25 
  0.57   0.68   0.77   1      0.76   0.7    0.65   0.59   0.58   0.5    0.47   0.41   0.4    0.36   0.35   0.34   0.28   0.31   0.25   0.2    0.22   0.18   0.15   0.14   0.15   0.09   0.08   0.07   0.07   0.03   0.01  -0.04  -0.07  -0.1   -0.1   -0.14  -0.17  -0.17  -0.19  -0.24  -0.24  -0.24  -0.24  -0.23  -0.22 
  0.52   0.62   0.72   0.76   1      0.73   0.7    0.64   0.6    0.54   0.48   0.45   0.44   0.39   0.37   0.39   0.32   0.31   0.25   0.22   0.23   0.19   0.17   0.16   0.18   0.12   0.12   0.08   0.1    0.06   0.02  -0.02  -0.08  -0.11  -0.1   -0.12  -0.17  -0.18  -0.22  -0.27  -0.25  -0.25  -0.24  -0.24  -0.24 
  0.51   0.58   0.66   0.7    0.73   1      0.73   0.69   0.66   0.58   0.54   0.5    0.46   0.41   0.41   0.42   0.35   0.35   0.31   0.26   0.26   0.23   0.21   0.21   0.21   0.15   0.13   0.11   0.12   0.08   0.05   0.01  -0.05  -0.06  -0.06  -0.1   -0.12  -0.14  -0.19  -0.23  -0.22  -0.24  -0.21  -0.23  -0.23 
  0.48   0.56   0.61   0.65   0.7    0.73   1      0.72   0.69   0.61   0.54   0.52   0.51   0.45   0.44   0.42   0.36   0.39   0.35   0.29   0.28   0.23   0.2    0.21   0.2    0.16   0.14   0.13   0.14   0.08   0.06   0.02  -0.04  -0.04  -0.05  -0.08  -0.11  -0.12  -0.18  -0.21  -0.21  -0.23  -0.22  -0.22  -0.21 
  0.45   0.52   0.55   0.59   0.64   0.69   0.72   1      0.73   0.67   0.6    0.57   0.54   0.52   0.48   0.46   0.41   0.41   0.37   0.33   0.31   0.27   0.22   0.27   0.27   0.21   0.18   0.18   0.18   0.11   0.09   0.06   0     -0.02  -0.03  -0.06  -0.11  -0.11  -0.18  -0.2   -0.23  -0.23  -0.2   -0.24  -0.22 
  0.45   0.53   0.55   0.58   0.6    0.66   0.69   0.73   1      0.69   0.62   0.58   0.58   0.53   0.5    0.47   0.41   0.43   0.37   0.33   0.3    0.26   0.22   0.28   0.25   0.21   0.2    0.18   0.18   0.11   0.08   0.04  -0.01  -0.02  -0.02  -0.06  -0.1   -0.1   -0.17  -0.21  -0.21  -0.23  -0.19  -0.22  -0.22 
  0.39   0.44   0.47   0.5    0.54   0.58   0.61   0.67   0.69   1      0.68   0.62   0.58   0.6    0.53   0.53   0.44   0.48   0.43   0.37   0.35   0.31   0.26   0.28   0.27   0.24   0.2    0.17   0.17   0.12   0.1    0.07   0.01  -0.01   0     -0.04  -0.08  -0.12  -0.17  -0.18  -0.19  -0.21  -0.17  -0.2   -0.19 
  0.33   0.39   0.43   0.47   0.48   0.54   0.54   0.6    0.62   0.68   1      0.69   0.62   0.59   0.53   0.52   0.46   0.46   0.39   0.38   0.34   0.31   0.27   0.29   0.25   0.23   0.2    0.17   0.17   0.11   0.1    0.07   0.01  -0.01  -0.01  -0.05  -0.08  -0.1   -0.16  -0.17  -0.2   -0.2   -0.17  -0.2   -0.19 
  0.32   0.36   0.38   0.41   0.45   0.5    0.52   0.57   0.58   0.62   0.69   1      0.66   0.61   0.57   0.56   0.48   0.5    0.43   0.42   0.38   0.35   0.3    0.3    0.27   0.23   0.2    0.17   0.18   0.12   0.13   0.07   0.02   0.01   0.01  -0.02  -0.06  -0.08  -0.14  -0.17  -0.19  -0.21  -0.17  -0.2   -0.2  
  0.3    0.34   0.36   0.4    0.44   0.46   0.51   0.54   0.58   0.58   0.62   0.66   1      0.62   0.6    0.55   0.51   0.52   0.44   0.43   0.36   0.33   0.31   0.32   0.27   0.26   0.23   0.2    0.18   0.15   0.14   0.07   0.05   0.03   0.03  -0.03  -0.06  -0.07  -0.13  -0.18  -0.19  -0.19  -0.16  -0.18  -0.18 
  0.27   0.3    0.34   0.36   0.39   0.41   0.45   0.52   0.53   0.6    0.59   0.61   0.62   1      0.65   0.59   0.55   0.53   0.48   0.46   0.38   0.36   0.31   0.33   0.28   0.26   0.24   0.2    0.2    0.15   0.14   0.12   0.05   0.05   0.06   0     -0.03  -0.06  -0.09  -0.15  -0.17  -0.18  -0.14  -0.19  -0.17 
  0.27   0.28   0.3    0.35   0.37   0.41   0.44   0.48   0.5    0.53   0.53   0.57   0.6    0.65   1      0.62   0.56   0.54   0.51   0.48   0.42   0.4    0.33   0.33   0.31   0.27   0.28   0.22   0.2    0.17   0.15   0.11   0.07   0.05   0.06  -0.02  -0.07  -0.06  -0.12  -0.17  -0.2   -0.19  -0.16  -0.2   -0.2  
  0.25   0.29   0.31   0.34   0.39   0.42   0.42   0.46   0.47   0.53   0.52   0.56   0.55   0.59   0.62   1      0.61   0.58   0.55   0.53   0.47   0.43   0.35   0.38   0.34   0.31   0.28   0.24   0.23   0.2    0.18   0.13   0.07   0.05   0.06  -0.01  -0.04  -0.08  -0.12  -0.17  -0.18  -0.19  -0.18  -0.19  -0.2  
  0.22   0.26   0.26   0.28   0.32   0.35   0.36   0.41   0.41   0.44   0.46   0.48   0.51   0.55   0.56   0.61   1      0.63   0.58   0.57   0.55   0.49   0.42   0.42   0.4    0.37   0.34   0.3    0.3    0.26   0.22   0.18   0.12   0.11   0.08   0.05   0.01  -0.05  -0.07  -0.13  -0.16  -0.16  -0.15  -0.19  -0.18 
  0.24   0.25   0.28   0.31   0.31   0.35   0.39   0.41   0.43   0.48   0.46   0.5    0.52   0.53   0.54   0.58   0.63   1      0.62   0.59   0.56   0.52   0.47   0.44   0.42   0.37   0.36   0.32   0.3    0.28   0.25   0.21   0.12   0.12   0.12   0.04   0.02  -0.02  -0.08  -0.11  -0.15  -0.16  -0.15  -0.17  -0.15 
  0.19   0.2    0.23   0.25   0.25   0.31   0.35   0.37   0.37   0.43   0.39   0.43   0.44   0.48   0.51   0.55   0.58   0.62   1      0.65   0.61   0.54   0.49   0.45   0.45   0.42   0.38   0.35   0.32   0.29   0.26   0.2    0.15   0.12   0.11   0.06   0.04   0.01  -0.07  -0.11  -0.13  -0.14  -0.17  -0.19  -0.18 
  0.16   0.17   0.18   0.2    0.22   0.26   0.29   0.33   0.33   0.37   0.38   0.42   0.43   0.46   0.48   0.53   0.57   0.59   0.65   1      0.66   0.61   0.52   0.5    0.49   0.44   0.41   0.38   0.35   0.33   0.27   0.24   0.19   0.17   0.13   0.09   0.05   0     -0.06  -0.08  -0.14  -0.16  -0.16  -0.17  -0.19 
  0.17   0.17   0.2    0.22   0.23   0.26   0.28   0.31   0.3    0.35   0.34   0.38   0.36   0.38   0.42   0.47   0.55   0.56   0.61   0.66   1      0.66   0.57   0.54   0.54   0.48   0.44   0.42   0.41   0.39   0.31   0.28   0.19   0.17   0.14   0.11   0.06   0.02  -0.04  -0.07  -0.11  -0.13  -0.14  -0.15  -0.17 
  0.13   0.13   0.15   0.18   0.19   0.23   0.23   0.27   0.26   0.31   0.31   0.35   0.33   0.36   0.4    0.43   0.49   0.52   0.54   0.61   0.66   1      0.64   0.58   0.57   0.52   0.47   0.45   0.41   0.38   0.33   0.3    0.21   0.2    0.17   0.13   0.1    0.02  -0.01  -0.07  -0.11  -0.14  -0.17  -0.17  -0.15 
  0.08   0.1    0.15   0.15   0.17   0.21   0.2    0.22   0.22   0.26   0.27   0.3    0.31   0.31   0.33   0.35   0.42   0.47   0.49   0.52   0.57   0.64   1      0.67   0.64   0.57   0.52   0.5    0.48   0.42   0.4    0.33   0.26   0.23   0.22   0.15   0.13   0.04   0     -0.03  -0.07  -0.08  -0.14  -0.15  -0.16 
  0.09   0.1    0.13   0.14   0.16   0.21   0.21   0.27   0.28   0.28   0.29   0.3    0.32   0.33   0.33   0.38   0.42   0.44   0.45   0.5    0.54   0.58   0.67   1      0.69   0.6    0.56   0.55   0.53   0.48   0.44   0.39   0.3    0.27   0.24   0.2    0.16   0.06   0.01  -0.03  -0.06  -0.08  -0.1   -0.17  -0.16 
  0.11   0.12   0.15   0.15   0.18   0.21   0.2    0.27   0.25   0.27   0.25   0.27   0.27   0.28   0.31   0.34   0.4    0.42   0.45   0.49   0.54   0.57   0.64   0.69   1      0.67   0.6    0.58   0.58   0.51   0.45   0.37   0.33   0.29   0.24   0.19   0.15   0.09   0.03  -0.02  -0.06  -0.08  -0.11  -0.14  -0.16 
  0.07   0.04   0.08   0.09   0.12   0.15   0.16   0.21   0.21   0.24   0.23   0.23   0.26   0.26   0.27   0.31   0.37   0.37   0.42   0.44   0.48   0.52   0.57   0.6    0.67   1      0.65   0.62   0.61   0.56   0.5    0.45   0.39   0.35   0.29   0.23   0.21   0.13   0.07   0.03  -0.02  -0.03  -0.07  -0.1   -0.1  
  0.06   0.06   0.09   0.08   0.12   0.13   0.14   0.18   0.2    0.2    0.2    0.2    0.23   0.24   0.28   0.28   0.34   0.36   0.38   0.41   0.44   0.47   0.52   0.56   0.6    0.65   1      0.62   0.63   0.59   0.53   0.48   0.42   0.37   0.32   0.26   0.21   0.15   0.08   0.03   0     -0.02  -0.04  -0.08  -0.11 
  0.02   0.03   0.07   0.07   0.08   0.11   0.13   0.18   0.18   0.17   0.17   0.17   0.2    0.2    0.22   0.24   0.3    0.32   0.35   0.38   0.42   0.45   0.5    0.55   0.58   0.62   0.62   1      0.67   0.62   0.58   0.53   0.44   0.4    0.35   0.29   0.26   0.18   0.12   0.06   0.03   0     -0.04  -0.08  -0.07 
  0.04   0.05   0.07   0.07   0.1    0.12   0.14   0.18   0.18   0.17   0.17   0.18   0.18   0.2    0.2    0.23   0.3    0.3    0.32   0.35   0.41   0.41   0.48   0.53   0.58   0.61   0.63   0.67   1      0.68   0.63   0.58   0.49   0.44   0.38   0.3    0.28   0.19   0.13   0.09   0.07   0.04  -0.01  -0.07  -0.06 
  0.01  -0.01   0.03   0.03   0.06   0.08   0.08   0.11   0.11   0.12   0.11   0.12   0.15   0.15   0.17   0.2    0.26   0.28   0.29   0.33   0.39   0.38   0.42   0.48   0.51   0.56   0.59   0.62   0.68   1      0.64   0.6    0.52   0.47   0.42   0.35   0.31   0.24   0.17   0.12   0.1    0.04   0.01  -0.03  -0.04 
 -0.02   0      0.02   0.01   0.02   0.05   0.06   0.09   0.08   0.1    0.1    0.13   0.14   0.14   0.15   0.18   0.22   0.25   0.26   0.27   0.31   0.33   0.4    0.44   0.45   0.5    0.53   0.58   0.63   0.64   1      0.62   0.56   0.51   0.46   0.4    0.37   0.27   0.23   0.15   0.1    0.07   0.06  -0.02   0    
 -0.06  -0.06  -0.05  -0.04  -0.02   0.01   0.02   0.06   0.04   0.07   0.07   0.07   0.07   0.12   0.11   0.13   0.18   0.21   0.2    0.24   0.28   0.3    0.33   0.39   0.37   0.45   0.48   0.53   0.58   0.6    0.62   1      0.6    0.57   0.51   0.44   0.4    0.33   0.27   0.2    0.15   0.13   0.1    0.05   0    
 -0.09  -0.1   -0.09  -0.07  -0.08  -0.05  -0.04   0     -0.01   0.01   0.01   0.02   0.05   0.05   0.07   0.07   0.12   0.12   0.15   0.19   0.19   0.21   0.26   0.3    0.33   0.39   0.42   0.44   0.49   0.52   0.56   0.6    1      0.57   0.52   0.46   0.42   0.34   0.31   0.23   0.17   0.16   0.1    0.06   0.07 
 -0.13  -0.14  -0.12  -0.1   -0.11  -0.06  -0.04  -0.02  -0.02  -0.01  -0.01   0.01   0.03   0.05   0.05   0.05   0.11   0.12   0.12   0.17   0.17   0.2    0.23   0.27   0.29   0.35   0.37   0.4    0.44   0.47   0.51   0.57   0.57   1      0.58   0.5    0.48   0.42   0.32   0.29   0.22   0.2    0.18   0.11   0.12 
 -0.1   -0.12  -0.1   -0.1   -0.1   -0.06  -0.05  -0.03  -0.02   0     -0.01   0.01   0.03   0.06   0.06   0.06   0.08   0.12   0.11   0.13   0.14   0.17   0.22   0.24   0.24   0.29   0.32   0.35   0.38   0.42   0.46   0.51   0.52   0.58   1      0.52   0.49   0.42   0.36   0.29   0.24   0.23   0.16   0.1    0.11 
 -0.13  -0.17  -0.13  -0.14  -0.12  -0.1   -0.08  -0.06  -0.06  -0.04  -0.05  -0.02  -0.03   0     -0.02  -0.01   0.05   0.04   0.06   0.09   0.11   0.13   0.15   0.2    0.19   0.23   0.26   0.29   0.3    0.35   0.4    0.44   0.46   0.5    0.52   1      0.53   0.47   0.44   0.36   0.32   0.25   0.26   0.19   0.18 
 -0.2   -0.19  -0.17  -0.17  -0.17  -0.12  -0.11  -0.11  -0.1   -0.08  -0.08  -0.06  -0.06  -0.03  -0.07  -0.04   0.01   0.02   0.04   0.05   0.06   0.1    0.13   0.16   0.15   0.21   0.21   0.26   0.28   0.31   0.37   0.4    0.42   0.48   0.49   0.53   1      0.51   0.45   0.39   0.37   0.31   0.28   0.2    0.22 
 -0.19  -0.19  -0.18  -0.17  -0.18  -0.14  -0.12  -0.11  -0.1   -0.12  -0.1   -0.08  -0.07  -0.06  -0.06  -0.08  -0.05  -0.02   0.01   0      0.02   0.02   0.04   0.06   0.09   0.13   0.15   0.18   0.19   0.24   0.27   0.33   0.34   0.42   0.42   0.47   0.51   1      0.48   0.44   0.42   0.39   0.34   0.28   0.25 
 -0.23  -0.23  -0.21  -0.19  -0.22  -0.19  -0.18  -0.18  -0.17  -0.17  -0.16  -0.14  -0.13  -0.09  -0.12  -0.12  -0.07  -0.08  -0.07  -0.06  -0.04  -0.01   0      0.01   0.03   0.07   0.08   0.12   0.13   0.17   0.23   0.27   0.31   0.32   0.36   0.44   0.45   0.48   1      0.48   0.45   0.44   0.4    0.32   0.3  
 -0.22  -0.23  -0.24  -0.24  -0.27  -0.23  -0.21  -0.2   -0.21  -0.18  -0.17  -0.17  -0.18  -0.15  -0.17  -0.17  -0.13  -0.11  -0.11  -0.08  -0.07  -0.07  -0.03  -0.03  -0.02   0.03   0.03   0.06   0.09   0.12   0.15   0.2    0.23   0.29   0.29   0.36   0.39   0.44   0.48   1      0.52   0.51   0.45   0.42   0.41 
 -0.25  -0.26  -0.24  -0.24  -0.25  -0.22  -0.21  -0.23  -0.21  -0.19  -0.2   -0.19  -0.19  -0.17  -0.2   -0.18  -0.16  -0.15  -0.13  -0.14  -0.11  -0.11  -0.07  -0.06  -0.06  -0.02   0      0.03   0.07   0.1    0.1    0.15   0.17   0.22   0.24   0.32   0.37   0.42   0.45   0.52   1      0.56   0.51   0.48   0.43 
 -0.28  -0.26  -0.26  -0.24  -0.25  -0.24  -0.23  -0.23  -0.23  -0.21  -0.2   -0.21  -0.19  -0.18  -0.19  -0.19  -0.16  -0.16  -0.14  -0.16  -0.13  -0.14  -0.08  -0.08  -0.08  -0.03  -0.02   0      0.04   0.04   0.07   0.13   0.16   0.2    0.23   0.25   0.31   0.39   0.44   0.51   0.56   1      0.54   0.5    0.47 
 -0.25  -0.26  -0.24  -0.24  -0.24  -0.21  -0.22  -0.2   -0.19  -0.17  -0.17  -0.17  -0.16  -0.14  -0.16  -0.18  -0.15  -0.15  -0.17  -0.16  -0.14  -0.17  -0.14  -0.1   -0.11  -0.07  -0.04  -0.04  -0.01   0.01   0.06   0.1    0.1    0.18   0.16   0.26   0.28   0.34   0.4    0.45   0.51   0.54   1      0.54   0.52 
 -0.25  -0.25  -0.24  -0.23  -0.24  -0.23  -0.22  -0.24  -0.22  -0.2   -0.2   -0.2   -0.18  -0.19  -0.2   -0.19  -0.19  -0.17  -0.19  -0.17  -0.15  -0.17  -0.15  -0.17  -0.14  -0.1   -0.08  -0.08  -0.07  -0.03  -0.02   0.05   0.06   0.11   0.1    0.19   0.2    0.28   0.32   0.42   0.48   0.5    0.54   1      0.58 
 -0.23  -0.25  -0.25  -0.22  -0.24  -0.23  -0.21  -0.22  -0.22  -0.19  -0.19  -0.2   -0.18  -0.17  -0.2   -0.2   -0.18  -0.15  -0.18  -0.19  -0.17  -0.15  -0.16  -0.16  -0.16  -0.1   -0.11  -0.07  -0.06  -0.04   0      0      0.07   0.12   0.11   0.18   0.22   0.25   0.3    0.41   0.43   0.47   0.52   0.58   1    


eigenvalue	proportion	cumulative
 12.9421 	  0.2876 	  0.2876 	-0.199y1974-0.199y1973-0.199y1972-0.198y1982-0.196y1980...
  8.14484	  0.181  	  0.4686 	0.237y1998+0.235y1996+0.231y1997+0.224y1999+0.223y2001...
  3.27029	  0.07267	  0.54127	0.275y2007+0.258y2005+0.257y2006+0.253y2008+0.245y2009...
  2.3356 	  0.0519 	  0.59317	0.235y1967+0.231y1966-0.215y1981+0.212y1965-0.211y1980...
  1.45014	  0.03223	  0.6254 	-0.262y2008+0.256y1999-0.241y2009+0.224y1998-0.224y1989...
  1.08739	  0.02416	  0.64956	0.229y1985+0.227y1984+0.223y2002-0.22y1993+0.216y1983...
  0.84739	  0.01883	  0.66839	-0.255y1988+0.253y2009+0.227y1965-0.227y1987+0.224y2008...
  0.68945	  0.01532	  0.68372	0.338y2009-0.295y1965-0.288y2003-0.254y2004+0.25 y1998...
  0.64567	  0.01435	  0.69806	-0.389y1965+0.256y1983-0.23y2009-0.227y1988+0.224y1971...
  0.58774	  0.01306	  0.71112	0.346y2004+0.281y1965-0.257y1979-0.256y2003-0.256y1969...
  0.56698	  0.0126 	  0.72372	-0.359y2006+0.336y2000+0.298y2002-0.263y1999+0.254y2001...
  0.54756	  0.01217	  0.73589	-0.483y2003+0.315y1999+0.294y2002-0.251y1995+0.226y1998...
  0.52289	  0.01162	  0.74751	-0.556y2002+0.382y2000+0.323y2007-0.226y1977-0.203y1976...
  0.51746	  0.0115 	  0.75901	0.451y2001+0.42 y2005-0.418y2003-0.241y1997-0.199y2002...
  0.50194	  0.01115	  0.77016	0.481y2004-0.373y2007+0.359y2009+0.324y2001-0.298y2002...
  0.47937	  0.01065	  0.78082	0.384y2000+0.318y2008+0.313y2004-0.289y2007+0.242y1980...
  0.46498	  0.01033	  0.79115	0.464y2007+0.408y2004-0.286y2005+0.27 y1998-0.262y1997...
  0.45343	  0.01008	  0.80123	-0.553y1997+0.392y1999-0.242y1981+0.224y1986+0.212y1992...
  0.43896	  0.00975	  0.81098	-0.379y2001-0.339y1979+0.333y1982+0.288y2000+0.269y2006...
  0.43383	  0.00964	  0.82062	0.341y1977-0.297y1980+0.28 y2000+0.273y1983-0.255y1975...
  0.42924	  0.00954	  0.83016	0.383y1998-0.302y1988-0.278y1980+0.27 y1991-0.26y1996...
  0.4256 	  0.00946	  0.83962	-0.369y2005-0.342y1981+0.309y2006-0.241y1998-0.237y1977...
  0.40845	  0.00908	  0.8487 	0.424y2008-0.308y1986+0.307y1982-0.299y2009-0.284y2006...
  0.4016 	  0.00892	  0.85762	0.4  y2006+0.293y2008+0.29 y1977-0.277y2005+0.276y2001...
  0.39714	  0.00883	  0.86644	0.361y1980-0.347y1978-0.342y1996+0.265y1995+0.246y1999...
  0.38344	  0.00852	  0.87497	-0.419y1992+0.296y1991+0.28 y1982-0.259y1984-0.234y1998...
  0.37849	  0.00841	  0.88338	0.421y1998-0.329y1999-0.307y1997+0.293y1983-0.256y1992...
  0.36629	  0.00814	  0.89152	0.432y1994+0.381y1978-0.368y1992-0.317y1991-0.271y1980...
  0.34985	  0.00777	  0.89929	0.437y1990-0.391y1994+0.312y1996-0.305y1991+0.25 y1983...
  0.34632	  0.0077 	  0.90699	0.394y1995+0.355y1981-0.301y1992-0.282y1996-0.248y1982...
  0.33764	  0.0075 	  0.91449	0.398y1991+0.293y1996-0.29y1992+0.263y1988+0.26 y2009...
  0.33148	  0.00737	  0.92186	0.336y1977+0.334y1995-0.301y1976-0.281y1993-0.27y1975...
  0.32221	  0.00716	  0.92902	0.348y1978-0.299y1975+0.285y1982-0.278y1994-0.276y1983...
  0.31597	  0.00702	  0.93604	0.534y1985-0.388y1987-0.379y1984+0.29 y1979+0.263y1989...
  0.31121	  0.00692	  0.94295	-0.445y1993+0.373y1995+0.363y1984+0.259y1975-0.255y1980...
  0.29701	  0.0066 	  0.94955	-0.327y1966+0.312y1985+0.306y1965-0.294y1993+0.285y1992...
  0.29062	  0.00646	  0.95601	-0.336y1986+0.316y1974-0.307y1983-0.277y1994+0.268y1987...

Eigenvectors
 V1	 V2	 V3	 V4	 V5	 V6	 V7	 V8	 V9	 V10	 V11	 V12	 V13	 V14	 V15	 V16	 V17	 V18	 V19	 V20	 V21	 V22	 V23	 V24	 V25	 V26	 V27	 V28	 V29	 V30	 V31	 V32	 V33	 V34	 V35	 V36	 V37	
-0.1308	-0.1362	 0.1033	 0.2121	-0.1247	 0.2047	 0.2271	-0.2945	-0.3891	 0.2808	 0.1244	 0.0962	 0.1206	-0.0266	-0.0736	-0.1177	-0.0995	 0.0895	-0.0895	-0.0203	-0.0815	-0.1387	-0.1105	 0.0911	 0.1512	 0.2045	 0.1433	 0.0211	 0.0487	-0.1332	-0.0415	-0.1302	-0.0375	-0.1478	 0.0367	 0.3055	 0.0953	y1965
-0.145 	-0.1505	 0.1392	 0.2311	-0.1399	 0.1793	 0.1782	-0.1986	-0.2114	 0.0928	-0.0069	 0.0266	-0.0144	 0.0387	-0.0193	-0.1295	-0.0268	-0.0737	-0.0387	-0.0722	-0.0773	-0.0121	 0.0422	 0.0689	-0.0143	-0.2091	-0.0442	-0.1102	 0.0118	 0.2054	 0.0967	 0.0883	-0.0251	 0.045 	-0.0561	-0.3274	-0.0546	y1966
-0.1578	-0.1437	 0.1619	 0.2354	-0.1575	 0.1553	 0.094 	-0.0524	-0.0534	-0.1497	-0.0293	-0.0669	-0.1054	 0.104 	-0.0133	 0.0672	 0.0439	-0.0322	 0.0655	 0.0079	 0.0875	 0.1695	 0.108 	-0.1236	-0.1412	-0.1763	-0.0336	 0.0205	-0.0439	-0.0265	-0.0827	 0.025 	 0.0348	 0.0784	-0.0278	-0.0275	-0.0919	y1967
-0.1654	-0.1421	 0.1785	 0.2082	-0.1399	 0.1225	 0.0769	 0.0481	 0.0374	-0.2055	-0.0535	-0.0936	-0.1408	 0.0054	 0.0073	 0.0502	 0.0323	-0.054 	 0.026 	 0.025 	 0.1457	 0.1195	 0.0026	-0.0932	-0.1224	-0.0532	-0.0286	 0.0399	-0.0325	-0.1025	-0.102 	 0.0525	-0.065 	 0.1111	 0.0161	-0.0595	-0.0382	y1968
-0.1736	-0.1394	 0.168 	 0.1865	-0.1061	 0.0305	-0.0061	 0.1206	 0.154 	-0.2555	-0.0274	-0.0573	-0.0465	 0.0314	-0.0004	 0.1849	 0.0666	-0.0631	 0.0305	 0.0228	 0.0745	 0.0651	-0.0579	-0.0092	-0.0094	 0.111 	 0.0011	 0.1137	 0.0372	-0.0991	 0.0904	 0.0399	 0.0639	-0.0329	-0.0417	 0.0361	 0.1224	y1969
-0.1841	-0.1219	 0.182 	 0.1403	-0.0702	 0.0036	-0.1038	 0.1772	 0.1922	-0.1129	-0.0473	 0.0182	 0.0222	-0.0105	 0.0536	 0.0521	 0.0813	-0.0119	-0.0227	 0.0099	 0.0034	-0.0612	-0.0383	-0.0191	 0.1575	 0.1659	 0.0079	-0.017 	 0.0915	-0.0255	-0.0004	-0.1933	-0.0663	-0.1238	 0.1978	 0.1789	-0.0124	y1970
-0.1877	-0.1146	 0.1847	 0.1017	-0.0287	-0.0335	-0.1111	 0.1956	 0.2241	 0.0264	 0.0033	 0.0725	 0.0545	-0.0907	 0.0701	-0.0079	 0.0023	 0.1099	-0.0478	 0.1748	-0.0375	-0.1371	-0.0036	 0.1519	 0.0692	 0.1007	 0.0597	-0.0772	 0.036 	 0.0357	 0.1435	-0.0749	 0.0375	 0.003 	-0.0614	 0.097 	-0.0583	y1971
-0.1986	-0.0971	 0.1643	 0.0549	 0.0237	-0.1225	-0.1622	 0.138 	 0.1718	 0.1524	 0.0243	 0.0861	 0.1925	-0.1425	 0.0239	-0.0794	 0.0307	 0.0547	-0.0335	-0.0133	-0.1434	-0.082 	-0.0605	 0.0965	 0.0325	-0.031 	-0.0358	 0.0278	 0.0259	 0.0453	 0.0362	-0.0064	 0.256 	-0.0064	 0.0477	-0.0117	-0.0858	y1972
-0.1986	-0.0953	 0.1703	 0.031 	 0.0417	-0.1439	-0.1573	 0.0518	 0.0725	 0.1671	 0.0741	 0.1138	 0.1175	-0.0934	-0.0373	-0.1138	-0.0787	 0.0589	-0.0339	 0.0058	-0.0714	-0.1136	 0.1024	 0.0429	-0.045 	-0.0986	-0.14  	-0.0545	-0.1353	 0.1084	 0.0076	 0.2271	-0.0946	-0.0351	-0.0658	-0.2534	-0.0546	y1973
-0.1994	-0.0783	 0.1463	-0.0647	 0.0898	-0.1728	-0.1306	 0.0512	-0.0157	 0.2355	-0.0279	 0.0165	 0.1721	 0.0148	 0.0183	-0.0211	-0.1672	 0.0543	-0.0306	-0.1634	-0.0586	 0.1315	 0.0995	-0.2124	-0.1393	 0.0634	 0.0963	 0.0698	-0.1109	 0.0802	-0.2146	 0.2464	-0.1156	-0.0096	-0.0932	 0.129 	 0.3157	y1974
-0.1936	-0.0705	 0.1231	-0.1067	 0.1386	-0.2014	-0.1492	 0.0071	-0.1412	 0.1799	-0.1059	-0.1798	-0.1257	 0.0928	-0.0469	 0.0147	-0.0233	-0.1371	 0.1193	-0.255 	 0.0839	 0.1725	-0.0707	-0.1597	-0.0833	-0.1185	-0.0693	-0.0834	-0.0218	 0.0947	-0.0713	-0.2702	-0.2993	-0.0844	 0.2589	-0.0243	 0.0584	y1975
-0.1946	-0.0583	 0.1043	-0.1546	 0.1725	-0.1432	-0.1092	-0.0384	-0.1896	 0.1218	-0.0573	-0.2244	-0.2025	 0.1013	-0.1005	 0.0138	 0.016 	-0.0933	 0.1275	-0.042 	 0.1189	 0.0004	-0.0811	 0.0243	 0.2387	 0.1083	 0.1306	-0.1462	 0.055 	-0.032 	 0.1273	-0.3014	 0.2659	 0.1509	-0.0809	 0.0122	-0.2637	y1976
-0.1931	-0.0482	 0.0919	-0.1641	 0.171 	-0.1586	-0.0173	-0.0947	-0.1748	-0.0653	 0.0089	-0.0764	-0.2258	-0.0003	-0.054 	-0.0612	-0.0597	-0.0733	 0.1476	 0.3408	 0.2249	-0.2372	 0.0214	 0.29  	 0.1154	 0.012 	-0.134 	 0.103 	 0.1069	-0.191 	 0.0677	 0.3361	-0.168 	 0.0119	-0.1497	-0.0854	 0.1053	y1977
-0.1913	-0.0318	 0.081 	-0.2065	 0.2023	-0.0951	 0.0426	-0.1852	-0.1436	-0.1491	 0.0053	-0.0023	 0.0324	 0.0064	 0.0121	 0.006 	 0.0771	 0.1959	-0.2121	 0.0504	-0.0146	 0.1767	 0.0071	-0.0288	-0.3468	-0.1676	 0.1261	 0.3809	-0.0193	-0.0006	 0.0778	 0.065 	 0.3479	-0.1275	-0.0506	 0.2532	-0.2206	y1978
-0.1919	-0.0272	 0.0368	-0.2097	 0.1669	-0.0442	 0.1375	-0.1804	-0.0352	-0.2565	-0.009 	 0.1725	-0.0127	-0.1576	-0.032 	 0.1353	 0.0978	 0.1724	-0.3387	 0.2244	-0.145 	 0.1296	-0.0193	 0.1224	 0.0569	 0.1467	-0.0703	-0.0626	 0.0082	 0.1111	-0.2507	-0.2395	-0.1707	 0.2896	 0.1774	-0.2157	 0.193 	y1979
-0.196 	-0.016 	 0.0144	-0.2114	 0.1031	 0.0269	 0.1716	-0.0924	 0.0804	-0.2308	 0.0376	 0.0587	 0.0364	 0.0516	 0.1555	 0.2416	-0.0188	-0.1167	-0.0687	-0.2967	-0.278 	 0.0247	-0.0788	-0.2103	 0.3608	-0.0697	 0.1355	-0.2707	-0.0978	-0.2396	 0.1244	 0.2119	-0.0375	-0.1338	-0.2555	 0.001 	 0.0392	y1980
-0.1931	 0.0208	-0.0284	-0.2146	 0.0391	 0.1267	 0.2077	-0.0748	 0.125 	-0.1484	 0.1244	 0.0267	 0.1807	 0.0959	 0.1513	-0.0165	 0.1039	-0.2418	 0.1846	-0.2016	 0.0095	-0.342 	-0.2729	 0.1203	-0.1939	-0.0962	-0.2216	 0.0816	 0.2053	 0.3552	-0.0185	-0.0461	-0.0723	-0.0439	 0.1068	 0.1387	-0.0249	y1981
-0.1978	 0.0278	-0.021 	-0.2078	-0.0001	 0.14  	 0.1929	 0.026 	 0.0712	 0.0302	 0.0291	 0.0547	-0.0769	 0.0826	 0.1638	-0.2065	-0.0171	 0.0718	 0.3325	-0.0095	 0.0041	-0.228 	 0.3074	-0.1067	-0.2449	 0.2796	-0.0263	-0.1799	-0.2373	-0.2476	-0.1964	-0.043 	 0.2846	 0.0808	 0.1114	-0.0729	 0.0579	y1982
-0.1896	 0.0459	-0.0699	-0.2084	-0.0428	 0.2163	 0.1084	 0.0218	 0.2561	 0.1516	 0.0591	 0.1432	 0.0499	 0.0107	 0.0092	-0.1283	-0.1939	-0.0451	 0.0661	 0.2732	 0.035 	 0.2137	 0.2244	-0.1538	 0.0235	-0.0687	 0.293 	 0.0279	 0.2502	 0.103 	 0.0211	-0.1932	-0.2759	 0.0022	-0.2101	-0.0496	-0.3075	y1983
-0.1868	 0.0665	-0.103 	-0.2071	-0.0596	 0.2269	 0.1149	 0.095 	 0.1039	 0.197 	-0.0279	-0.0257	 0.0484	-0.0644	-0.1497	 0.0651	 0.0281	-0.0656	-0.1105	 0.0759	 0.2029	 0.1341	 0.0956	 0.1142	 0.1418	-0.2589	-0.0744	 0.1166	-0.1178	-0.1876	 0.2493	-0.0249	 0.1066	-0.3795	 0.3634	-0.1351	 0.2538	y1984
-0.1846	 0.0836	-0.1131	-0.1495	-0.1726	 0.229 	 0.0507	 0.1454	 0.1057	 0.2232	-0.0409	-0.1631	-0.0188	-0.0049	-0.1834	 0.0278	 0.031 	 0.0639	-0.0234	-0.0878	 0.0965	 0.1057	-0.1652	 0.0741	 0.1048	-0.0021	-0.1116	 0.1205	-0.0891	 0.0868	 0.0247	 0.1454	-0.0149	 0.5335	-0.2182	 0.3118	 0.1712	y1985
-0.1763	 0.0991	-0.1445	-0.1233	-0.1739	 0.2061	-0.0915	 0.1708	-0.1096	 0.0402	-0.1051	-0.1828	-0.0898	-0.0637	-0.0628	-0.0019	-0.0185	 0.2244	-0.2278	-0.1209	-0.0618	 0.0364	-0.3083	 0.0326	-0.081 	 0.2223	-0.0751	-0.1924	 0.0369	 0.0615	-0.1262	 0.212 	 0.1051	-0.1515	 0.0523	-0.2827	-0.3359	y1986
-0.1665	 0.1256	-0.1515	-0.055 	-0.217 	 0.0868	-0.2271	 0.1138	-0.2198	-0.1788	-0.2387	-0.0674	-0.1267	 0.087 	 0.0051	-0.0194	 0.0533	 0.0545	 0.0302	 0.1828	-0.1133	-0.0701	 0.1143	-0.0198	-0.0757	 0.0975	 0.034 	-0.0392	 0.0962	 0.1906	-0.128 	-0.0777	-0.0858	-0.3879	-0.2359	 0.1459	 0.2676	y1987
-0.1711	 0.1383	-0.1352	-0.0164	-0.1689	-0.0373	-0.2549	 0.026 	-0.2268	-0.1473	-0.0872	 0.0553	 0.1221	 0.0674	-0.0303	-0.119 	 0.1279	-0.0726	 0.012 	 0.0497	-0.3022	-0.1797	 0.1   	-0.0317	-0.0185	-0.1959	-0.0325	 0.0667	-0.1647	-0.1616	 0.2626	-0.0093	-0.251 	 0.1581	 0.0637	 0.0896	-0.2268	y1988
-0.1687	 0.1458	-0.1405	 0.0358	-0.2236	-0.0395	-0.2196	-0.0307	-0.1367	-0.1004	 0.0326	 0.15  	 0.0877	-0.1229	-0.0143	-0.0249	 0.0108	-0.1791	-0.0045	-0.077 	-0.0327	-0.0841	 0.0939	-0.1063	 0.1725	-0.1332	 0.0956	 0.1753	-0.0787	-0.0235	-0.1154	-0.1758	 0.2652	 0.2631	 0.1124	-0.1367	 0.1396	y1989
-0.1543	 0.1728	-0.125 	 0.0532	-0.1552	-0.151 	-0.1197	-0.0754	-0.0658	-0.018 	 0.1533	 0.1502	 0.0422	-0.1302	 0.1162	 0.0673	-0.1114	-0.1573	 0.0379	-0.1556	 0.2565	 0.0585	-0.0837	-0.0592	-0.0152	 0.2054	 0.2252	 0.1765	 0.437 	-0.1353	-0.0843	 0.243 	-0.0067	 0.0306	 0.1403	-0.1443	-0.0287	y1990
-0.1458	 0.1789	-0.1123	 0.091 	-0.1184	-0.1777	 0.0162	-0.1578	-0.0315	-0.075 	 0.2079	 0.1671	 0.0321	-0.0813	-0.0882	 0.1776	-0.0763	-0.054 	-0.0242	 0.0063	 0.2699	 0.1594	 0.1069	 0.0442	-0.2082	 0.2959	-0.102 	-0.3168	-0.3048	 0.2045	 0.3984	 0.0046	-0.0665	-0.0211	 0.0223	 0.1679	-0.0658	y1991
-0.1367	 0.1944	-0.1006	 0.1254	-0.096 	-0.1843	-0.0182	-0.0878	 0.0997	 0.0402	 0.1775	-0.0286	-0.0644	-0.0312	 0.1136	-0.0353	-0.0708	 0.212 	-0.0044	 0.0489	 0.004 	 0.1187	-0.0267	 0.1343	-0.0171	-0.4186	-0.2559	-0.3682	 0.2063	-0.3007	-0.2898	-0.0383	 0.0123	-0.0128	 0.0247	 0.2848	-0.0541	y1992
-0.1354	 0.2037	-0.0735	 0.1631	-0.0791	-0.2196	 0.0712	-0.1388	 0.1286	 0.0634	 0.04  	-0.0244	-0.0389	 0.1286	 0.072 	-0.0019	 0.0222	 0.0798	 0.0337	-0.0415	 0.0324	 0.0027	-0.1107	 0.0581	 0.0103	-0.082 	-0.0275	 0.0762	-0.0071	 0.1557	 0.0613	-0.2814	 0.2306	-0.1154	-0.4446	-0.294 	 0.2525	y1993
-0.1174	 0.2165	-0.0656	 0.1623	-0.0199	-0.1514	 0.1612	-0.0818	 0.1742	 0.0867	 0.0712	-0.0886	-0.0848	 0.1156	-0.0127	 0.1066	 0.0174	 0.1636	 0.0689	 0.0056	-0.0283	-0.1209	-0.1278	-0.0367	 0.1608	 0.1269	-0.0287	 0.4323	-0.3911	-0.0898	-0.2161	-0.0555	-0.2779	-0.1358	 0.0297	-0.0613	-0.2773	y1994
-0.1041	 0.2227	-0.0291	 0.1779	 0.0726	-0.1318	 0.1777	-0.0605	 0.0592	-0.0149	-0.0254	-0.2511	-0.0937	 0.1266	 0.0882	-0.1527	 0.1285	 0.06  	 0.1001	 0.2001	-0.1661	 0.0782	 0.1094	-0.0835	 0.2649	-0.0215	 0.2419	-0.0944	 0.0525	 0.3939	 0.0503	 0.334 	 0.1282	 0.0486	 0.3733	 0.0977	 0.0602	y1995
-0.084 	 0.2346	 0.0029	 0.1691	 0.1361	-0.07  	 0.1913	 0.044 	 0.1097	 0.0956	-0.1917	-0.149 	-0.0144	 0.0205	-0.1652	-0.0093	 0.1304	 0.0838	-0.0729	-0.2285	-0.2602	-0.048 	 0.137 	 0.1248	-0.3421	 0.1256	 0.1061	 0.0169	 0.312 	-0.2817	 0.2926	-0.0704	-0.1515	 0.127 	 0.0192	-0.1073	 0.1284	y1996
-0.0574	 0.2311	 0.0212	 0.1671	 0.189 	-0.0294	 0.1924	 0.0646	-0.0044	 0.0269	-0.2279	-0.1015	 0.0539	-0.2408	-0.0759	-0.0943	-0.2621	-0.5534	-0.2195	 0.2034	-0.1177	 0.005 	-0.0204	-0.1879	-0.0181	 0.1053	-0.3068	 0.0163	-0.0119	-0.0333	-0.1235	-0.0193	 0.144 	-0.0493	-0.0934	 0.1002	-0.0876	y1997
-0.045 	 0.2369	 0.0693	 0.1274	 0.2237	 0.0409	 0.1267	 0.25  	-0.1003	 0.0151	-0.174 	 0.2257	-0.008 	-0.134 	-0.01  	-0.0216	 0.2696	-0.0316	-0.1321	-0.0393	 0.3833	-0.2407	-0.1267	 0.0416	-0.0761	-0.2344	 0.4205	-0.198 	-0.1831	 0.0237	-0.1653	 0.0156	-0.0817	-0.0004	-0.0865	 0.0419	-0.0185	y1998
-0.0382	 0.224 	 0.0946	 0.1148	 0.2556	 0.1421	 0.0597	 0.1546	-0.207 	-0.1378	-0.2627	 0.3152	 0.0959	 0.0135	 0.0231	 0.0299	-0.2177	 0.3917	 0.2574	-0.1746	 0.1246	 0.0926	 0.0967	-0.1014	 0.246 	 0.0018	-0.3286	 0.1118	 0.1444	 0.0826	 0.1219	-0.014 	 0.0311	 0.0202	 0.0133	 0.0066	-0.0547	y1999
-0.0132	 0.2224	 0.1429	 0.0736	 0.1882	 0.2026	-0.1053	 0.158 	-0.1922	 0.0103	 0.3357	-0.1793	 0.3817	 0.1268	-0.133 	 0.3836	-0.0545	-0.0341	 0.2879	 0.28  	-0.1613	 0.0873	-0.1428	 0.0669	-0.128 	-0.0278	 0.1082	-0.0766	-0.0285	-0.0523	-0.0858	-0.0214	 0.0398	 0.0223	-0.0003	-0.1271	 0.0463	y2000
 0.0037	 0.2229	 0.1547	 0.0499	 0.1647	 0.215 	-0.201 	 0.1197	-0.0249	-0.0358	 0.2539	 0.0163	-0.1011	 0.451 	 0.3238	-0.2415	-0.0477	-0.167 	-0.3791	-0.1434	 0.054 	 0.1512	 0.1396	 0.276 	 0.0617	 0.1109	-0.051 	 0.0729	-0.0662	-0.0249	-0.0152	-0.021 	-0.0311	 0.0328	-0.0045	 0.0063	 0.0142	y2001
 0.0238	 0.202 	 0.2086	 0.005 	 0.1088	 0.2234	-0.2023	-0.0989	 0.1117	 0.0682	 0.2979	 0.2943	-0.556 	-0.1986	-0.2978	-0.0311	 0.1495	-0.0414	 0.1128	-0.0405	-0.2325	-0.0098	-0.1029	-0.1794	-0.048 	-0.0173	-0.0454	 0.0464	 0.0381	 0.0531	 0.0283	 0.0466	 0.0355	-0.0762	 0.0025	 0.0607	 0.0605	y2002
 0.0488	 0.191 	 0.2149	-0.033 	 0.0365	 0.212 	-0.1922	-0.2881	 0.1276	-0.256 	 0.0599	-0.4825	 0.1379	-0.4185	 0.0354	-0.2034	-0.1923	 0.1684	-0.0137	-0.1479	 0.1632	-0.14  	 0.083 	-0.0348	 0.0408	-0.0368	 0.1013	-0.0076	-0.0772	 0.0219	 0.0579	-0.0884	-0.0964	-0.0187	-0.0311	-0.0098	 0.0542	y2003
 0.0689	 0.1784	 0.2363	-0.0799	-0.1076	 0.1102	-0.1031	-0.2535	-0.0417	 0.3456	-0.2476	-0.0074	 0.0386	-0.1857	 0.4808	 0.3131	 0.4082	-0.0743	 0.064 	 0.0807	-0.0007	 0.0869	 0.1306	 0.0307	 0.0133	 0.0743	-0.141 	 0.021 	 0.0242	-0.0106	 0.0008	 0.0471	-0.0214	 0.0134	-0.0591	 0.0033	-0.0808	y2004
 0.0815	 0.1649	 0.2576	-0.1024	-0.167 	 0.0053	-0.0978	-0.2167	 0.1444	 0.0819	-0.1922	 0.0789	-0.0112	 0.4199	-0.1062	 0.2296	-0.2856	 0.0913	-0.2664	 0.1636	 0.1173	-0.369 	-0.0912	-0.2774	-0.0741	-0.0794	 0.009 	-0.0878	 0.0813	-0.0094	 0.0651	 0.0272	 0.0699	 0.1   	 0.139 	-0.0039	 0.0363	y2005
 0.0882	 0.1546	 0.2571	-0.1262	-0.2011	-0.0598	-0.0085	-0.1507	 0.1248	-0.1246	-0.3591	 0.2028	 0.0477	 0.0518	-0.0886	-0.2192	-0.1837	-0.1223	 0.2693	-0.0143	-0.1294	 0.3088	-0.2839	 0.4   	-0.0428	 0.0194	 0.182 	-0.0314	-0.1662	-0.0678	-0.0597	 0.0399	 0.0189	-0.0315	 0.0618	 0.0133	 0.0044	y2006
 0.0873	 0.1332	 0.2748	-0.1558	-0.1778	-0.1539	 0.1014	 0.0027	-0.0188	-0.0853	 0.131 	-0.0131	 0.3234	 0.1494	-0.373 	-0.2887	 0.4636	-0.0026	-0.0462	-0.0123	 0.1556	 0.0944	 0.0862	-0.1957	 0.1483	 0.1266	-0.1771	-0.061 	 0.1262	-0.0677	-0.1017	 0.0371	-0.0061	-0.0878	-0.1118	-0.0356	-0.0494	y2007
 0.0982	 0.1104	 0.2531	-0.1693	-0.2622	-0.1615	 0.2242	 0.2299	-0.1089	-0.028 	 0.1033	-0.0646	-0.1489	-0.1067	-0.144 	 0.318 	-0.1815	-0.0508	-0.0478	-0.2285	-0.1092	-0.1317	 0.4237	 0.2928	 0.0632	-0.079 	 0.0637	 0.0677	 0.0448	 0.1691	-0.1587	-0.0174	 0.0445	-0.0412	-0.0084	 0.07  	-0.1267	y2008
 0.0964	 0.1046	 0.2448	-0.1628	-0.2413	-0.1727	 0.253 	 0.338 	-0.23  	 0.0083	 0.1945	-0.038 	-0.126 	-0.1488	 0.3588	-0.1787	-0.0961	 0.1007	-0.0217	 0.1557	-0.0536	 0.0434	-0.2992	-0.2388	-0.0773	-0.0446	-0.0068	 0.0543	-0.0321	-0.0519	 0.2601	-0.0965	-0.0739	 0.0633	 0.0309	-0.053 	 0.1235	y2009

Ranked attributes:
 0.7124    1 -0.199y1974-0.199y1973-0.199y1972-0.198y1982-0.196y1980...
 0.5314    2 0.237y1998+0.235y1996+0.231y1997+0.224y1999+0.223y2001...
 0.4587    3 0.275y2007+0.258y2005+0.257y2006+0.253y2008+0.245y2009...
 0.4068    4 0.235y1967+0.231y1966-0.215y1981+0.212y1965-0.211y1980...
 0.3746    5 -0.262y2008+0.256y1999-0.241y2009+0.224y1998-0.224y1989...
 0.3504    6 0.229y1985+0.227y1984+0.223y2002-0.22y1993+0.216y1983...
 0.3316    7 -0.255y1988+0.253y2009+0.227y1965-0.227y1987+0.224y2008...
 0.3163    8 0.338y2009-0.295y1965-0.288y2003-0.254y2004+0.25 y1998...
 0.3019    9 -0.389y1965+0.256y1983-0.23y2009-0.227y1988+0.224y1971...
 0.2889   10 0.346y2004+0.281y1965-0.257y1979-0.256y2003-0.256y1969...
 0.2763   11 -0.359y2006+0.336y2000+0.298y2002-0.263y1999+0.254y2001...
 0.2641   12 -0.483y2003+0.315y1999+0.294y2002-0.251y1995+0.226y1998...
 0.2525   13 -0.556y2002+0.382y2000+0.323y2007-0.226y1977-0.203y1976...
 0.241    14 0.451y2001+0.42 y2005-0.418y2003-0.241y1997-0.199y2002...
 0.2298   15 0.481y2004-0.373y2007+0.359y2009+0.324y2001-0.298y2002...
 0.2192   16 0.384y2000+0.318y2008+0.313y2004-0.289y2007+0.242y1980...
 0.2088   17 0.464y2007+0.408y2004-0.286y2005+0.27 y1998-0.262y1997...
 0.1988   18 -0.553y1997+0.392y1999-0.242y1981+0.224y1986+0.212y1992...
 0.189    19 -0.379y2001-0.339y1979+0.333y1982+0.288y2000+0.269y2006...
 0.1794   20 0.341y1977-0.297y1980+0.28 y2000+0.273y1983-0.255y1975...
 0.1698   21 0.383y1998-0.302y1988-0.278y1980+0.27 y1991-0.26y1996...
 0.1604   22 -0.369y2005-0.342y1981+0.309y2006-0.241y1998-0.237y1977...
 0.1513   23 0.424y2008-0.308y1986+0.307y1982-0.299y2009-0.284y2006...
 0.1424   24 0.4  y2006+0.293y2008+0.29 y1977-0.277y2005+0.276y2001...
 0.1336   25 0.361y1980-0.347y1978-0.342y1996+0.265y1995+0.246y1999...
 0.125    26 -0.419y1992+0.296y1991+0.28 y1982-0.259y1984-0.234y1998...
 0.1166   27 0.421y1998-0.329y1999-0.307y1997+0.293y1983-0.256y1992...
 0.1085   28 0.432y1994+0.381y1978-0.368y1992-0.317y1991-0.271y1980...
 0.1007   29 0.437y1990-0.391y1994+0.312y1996-0.305y1991+0.25 y1983...
 0.093    30 0.394y1995+0.355y1981-0.301y1992-0.282y1996-0.248y1982...
 0.0855   31 0.398y1991+0.293y1996-0.29y1992+0.263y1988+0.26 y2009...
 0.0781   32 0.336y1977+0.334y1995-0.301y1976-0.281y1993-0.27y1975...
 0.071    33 0.348y1978-0.299y1975+0.285y1982-0.278y1994-0.276y1983...
 0.064    34 0.534y1985-0.388y1987-0.379y1984+0.29 y1979+0.263y1989...
 0.057    35 -0.445y1993+0.373y1995+0.363y1984+0.259y1975-0.255y1980...
 0.0504   36 -0.327y1966+0.312y1985+0.306y1965-0.294y1993+0.285y1992...
 0.044    37 -0.336y1986+0.316y1974-0.307y1983-0.277y1994+0.268y1987...

Selected attributes: 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37 : 37

OK, ez a Statistics::PCA nagyszerű, 34. rankra már eléri a 95%-os kumulatív varianciát.

https://metacpan.org/pod/Statistics::PCA

Távoli szerveren mindkét felajánlott algoritmussal futtattam, nincs hibahatáron túli különbség közöttük, mindkettő 34-ig megy el, 6-7 másodperc alatt (itthon 10-11).

OK, fut, és Excel-lel teszteltem, hogy az első néhány érték egyezik. Következő lépés: rendet csinálni az adatsorban. Step-by-step:

1.1. 1-TD-1-NORM: Szavak értékei min-max norma szerint.
1.2. 1-TD-2-SVD: Koordináták transzformálása SVD szerint.
1.3. 1-TD-3-BOX: Ezek beolvasása és kódokká alakítása: 0-9 és 0-1 dobozok.
1.4. 1-TD-4-NGB: Szavanként legközelebbi szomszédok megkeresése a fentiek alapján.

Mindez az eredeti listában 1-en belül: újrakódolandó.

TODO: "hidden" és "revealed" az eredetiben (https://raw.githubusercontent.com/binyominzeev/similarities/884d71cffc61302f11fda940a83ba8c7660d27f0/1-mes-1-aps-3-td-diagrams.txt) szép közeli, de a transzformáltban nem:

hidden	4545454	11111
revealed	4554555	11111

A normalizálásokon lenne mit javítani. Talán: nézzünk rá a valós görbéjükre, meg a transzformáltakra, csak erre a kettőre, vagy még néhányra. Eszerint azt is külön érdemes előállítani. És akkor jobban böngészhető lenne.

Itt böngészhetőek a korábbi változatok:

https://github.com/binyominzeev/similarities/commits/master

És itt van az a változat, amiben transzformáció nélkül számoltunk kódokat:

884d71c: categories and first attempts for PCA/SVD

# 2018-10-27

Sokkal egyszerűbben kellene. Az ötlet: a kocka „körbevevése”. Ez az, ami garantálja, hogy ebben a halmazban csak a legközelebbi szomszéd lehet, és nem magában a kockában. Legkönnyebben körbevehető kocka, minél rövidebb. Ha három karakter van, akkor mindegyik +/-/0, azaz 3 x 3 x 3 = 27 szomszéd ellenőrizendő. Ha valójában 4-es kódot ír le, az 4 x 4 x 4 = 64 részre osztja a 3000 méretű teret. Ez 27/64, azaz kb. kétszeres gyorsítást eredményez. Még jobb, ha 5 részre osztjuk, abból 625 adódik, ami éppen 5-szörös gyorsítást eredményez. Próbáljuk meg ezért így.

Noha: nagyon nagy ugrások nem várhatóak, ezért ez a leírás, három részre osztva nem feltétlenül tökéletes. 4 részre osztás esetén 81 a minimum, a következő réteg 256-ot, azaz 3-szoros gyorsítást eredményez, és még egész reálisan hangzik. Azonban a következő lépés már 625*5=3125, nagyobb mint 3000, bár lehet, hogy pont ezt kellene, és esetleg még az input is növelhető, hiszen ez már majdnem 40-szeres (!) gyorsítást jelent.

A fájlstruktúrát úgy alakítjuk át, hogy az 1-NORM lépés után rögtön a 3-BOX lépés következzen, a 2-PCA most nem lényeges. (Mivel nem vagyunk biztosak benne, hogy tökéletesen működik, akár csak elméleti szinten, a tér „deformálása” miatt.)

Szomszéd-gyártás: noha lehetne valamennyire gyorsítani azáltal, ha az egyes hasonló dobozok egymást követve sem számolnák mind a 27 szomszédot újra, hanem csak egy részét módosítanák, de ezt nem valószínű, hogy megéri leprogramozni, mert amúgy is max. 3000 x 27 lépés, ami összesen sem sok. Ezért inkább rendezzük, és az azonos elemeken spóroljunk csak, és ahhoz nem is kell új algoritmus. 

bz@bz-HP-EliteBook-8530p:~/similarities$ cut -f3 1-mes-1-aps-3-td-3-box.txt | sort | uniq | wc -l
59

Mégis csak 2-szeres gyorsítás adódik, mert csak 59 doboz van tele a 625-ből. Ez sem annyira rossz.

Üres doboz nem adódott, aminek nincsen szomszédja, a legkisebbnek 2 szomszédja van, de a legnagyobbnak 2496, ami nem nagyon szignifikáns javítás, de sok legalább nincsen belőle. (Ezt az ellenőrzést viszont lehet, hogy el kell majd végezni külön.)

Topinavon viszont szépen fut. Lefutott, de legközelebb vizsgálatra lesz szükség, mert a távoli szerveren most minden szó-ra 0-át ír ki, vagyis minden szóhoz van közelebbi. (Hát persze, hiszen saját magával is össze lett hasonlítva.)

OK, így már szép:

root@topinav:~/similarities# cut -f2 1-mes-1-aps-3-td-4-ngb.txt | sort -n | uniq 
0
1
2
3
4
5
6
7
8
9
10
11
20

# 2018-11-01

Következő fontos cél az APS-re a négy measure-t összehasonlító diagram. Ezelőtt szükséges az NGB measure normalizálása, összevetni, hogy megfelelő versenytársa-e a többinek. Valamint, adminisztratíve ki kell iktatni a queue-ból a szükségtelenné vált 2-es lépést.

Az alapötlet mindig az, hogy a 0-1 skálára vetítsük a mértéket, ami egyszerűen megfordítható. Lássuk az eloszlásokat összehasonlítva.

bz@bz-HP-EliteBook-8530p:~/similarities$ cut -f2 1-mes-1-aps-3-td-3-ngb.txt | pdf.pl 
input read.
0 668
1 737
2 497
3 353
4 222
5 131
6 59
7 22
8 6
9 2
10 1
11 1
20 1

A többi mérték esetében 1-MES lépésben mindkét szomszéd meg van adva, preprocesszálatlan formában, míg 3-PR lépésben már csak a szavak, százalékos értékek szerint. Kövessük, térjünk át erre a jelölésre.

Most már sokkal szebben néz ki a szorzótábla is, a kódokkal:

root@topinav:~/similarities# ./1-mes-0-3-td-3-ngb.pl 
000	1 *	163 =	163
001	58 *	1038 =	60204
002	485 *	1967 =	953995
003	210 *	1900 =	399000
004	3 *	985 =	2955
010	3 *	261 =	783
011	18 *	1238 =	22284
012	322 *	2388 =	768936
013	644 *	2316 =	1491504
014	37 *	1254 =	46398
020	2 *	192 =	384
021	29 *	684 =	19836
022	78 *	1659 =	129402
023	152 *	1652 =	251104
024	41 *	1072 =	43952
030	1 *	109 =	109
031	2 *	223 =	446
032	6 *	472 =	2832
033	13 *	469 =	6097
034	2 *	304 =	608
100	10 *	208 =	2080
101	8 *	1113 =	8904
102	15 *	2034 =	30510
103	4 *	1941 =	7764
110	2 *	319 =	638
111	23 *	1347 =	30981
112	93 *	2496 =	232128
113	87 *	2386 =	207582
120	1 *	242 =	242
121	21 *	785 =	16485
122	69 *	1765 =	121785
123	72 *	1724 =	124128
124	4 *	1093 =	4372
131	2 *	261 =	522
132	12 *	520 =	6240
133	16 *	504 =	8064
134	4 *	315 =	1260
200	4 *	92 =	368
201	5 *	232 =	1160
202	3 *	300 =	900
203	1 *	242 =	242
210	15 *	136 =	2040
211	21 *	365 =	7665
212	27 *	510 =	13770
213	10 *	419 =	4190
220	1 *	115 =	115
221	12 *	337 =	4044
222	21 *	510 =	10710
223	8 *	434 =	3472
231	1 *	153 =	153
232	3 *	247 =	741
233	3 *	215 =	645
301	1 *	81 =	81
310	2 *	67 =	134
312	2 *	118 =	236
320	2 *	58 =	116
321	4 *	114 =	456
322	3 *	115 =	345
340	1 *	2 =	2

Eszerint már látszik, mi mitől mennyire van messze. Ez már ellenőrizhető. Pl. a-properties elvileg 0:

a	properties	0

a		011134578	000111
properties	111235578	000111

B"H nem jól működik, és látjuk is, hogy mi a hiba, egyszerűen. Csak a box értékek vannak összevetve, és nem a véglegesek. Megtérül a pontos könyvelés! Make sure, egy másik példával:

late	spreading	0

late		000012455	000011
spreading	000012455	000011

Hm, érdekes, pedig ez jó.

method	atoms	0

method	222345568	000111
atoms	122235668	000111

OK, akkor csak véletlen volt. Lássuk a kódot. Első látásra pedig azt veti össze. Akkor lássuk kézzel ezeket a példákat közelebbről. a-properties és method-atoms valóságos távolsága 3. Lehet, hogy normalizálva lett, más módon, az általam vizsgált verzióhoz képest? Valóban, mert én 1-mes-1-aps-3-td-diagrams.txt-t vizsgálom (ami törlendő, zavaró!), míg a program 1-mes-1-aps-3-td-2-box.txt-t. Nézzük meg majd utoljára, mi a különbség. A mostani állás szerint:

a		000124568	013
properties	000124568	013

method	011234568	013
atoms	011234568	013

OK, valóban ez volt a probléma.

# 2018-11-02

Most megnéztem görbéken hogy mutatnak a fenti szavak. Jó, hát minden nagyon hasonlít mindenhez, mivel minden nő, szóval le kellene normálni az éves átlaggal, mindenekelőtt. Az lenne nagy dolog, ha különbözőeket sikerülne találni, ezek szerint. Sikerül? Igen:

incident	gev	10

(Úgy látom, 1-mes-1-aps-3-td-3-ngb.txt nem érdekes már, helyébe lépett 1-mes-1-aps-3-td.txt. Törlöm.)

Valóban, különböznek, de nem nagyon. Ugyanakkor, ha már erre járunk: mi a helyzet a min-max-normával? Nagyon felerősíti a zajokat. Nincs jobb? Talán a szum-norma, ami 1-re növeli az integrált. Próbáljuk meg azzal.

# 2018-11-04

Szükség lesz egy listára a cikkek éves alakulásáról. Jelenleg a saját átlaghoz képest normáljuk, ez nem tudom, mit változtat. Úgy tűnik, semmit.

Noha viszonylag kis (azaz tipikus) szavakra továbbra is hasonló növekedést produkál, feltételezem, hogy azért, mert ők éppen a korai években nem szerepelnek. Rejtélyes némileg, de futtassuk, próbáljuk, ingyen van. Jó, néha valóban nő, de alapvetően sokkal hatékonyabban szétdobja a görbéket. Lássuk a konkrét mérőszámokat.

2-BOX lépésben most is min-max-normát használ, ezt vajon szükséges kicserélni? A kód létrehozásához nélkülözhetetlen, hogy 0 és 1 közötti értékek szerepeljenek. De lehet, hogy ez globális maximummal legyen normálva, ha létezik ilyesmi. Próbáljuk első körből normális lokális maximummal, és hasonlítsuk össze a látvánnyal.

method	565665444	332
atoms	677766656	333
late	000134555	013
properties	666678777	344
spreading	001123554	012

Nehéz a kis és nagy számok összehasonlítása. Talán erre lenne való a log-skála?

Összes említés. Tegyük be a két legnagyobb szót is, hogy láthassuk jó görbén:

Teória: kicsi és nagy szó is lehet hasonló, ezért saját lokális maximumához mérjük, és nullához. Megjelenítettük: method, spreading. Próbáljuk ki ezt a kettőt.

method,5,6,5,6,6,5,4,4,4
spreading,0,0,1,1,2,3,5,5,4

conductivity	565655444	332
method		565665444	332

spreading	001123554	012
grazing		002133554	012

OK, ezek valóban hasonlítanak, Excelben, az eredeti értékekkel is. Mennyire oszlik szét?

bz@bz-HP-Laptop-15-bs1xx:~/similarities$ cut -f3 1-mes-1-aps-3-td.txt | ~/pdf.pl
input read.
0 95
1 320
2 561
3 840
4 554
5 240
6 72
7 17
8 1

Összesen 2700 elemből 95, azaz 3,5% van közvetlen szomszédságban. Most már összevethető az összes többi mértékkel. További disztingválási lehetőség a kódhossz növelése által. Próbálkozzunk. 5-ről 3-ra csökkentettem az oszlopszélességet, így már sokkal érdekesebb eredményeink vannak:

bz@bz-HP-Laptop-15-bs1xx:~/similarities$ cut -f3 1-mes-1-aps-3-td.txt | ~/pdf.pl
input read.
0 10
1 34
2 57
3 96
4 140
5 190
6 299
7 409
8 366
9 381
10 284
11 197
12 114
13 66
14 29
15 18
16 7
17 3

Kérdés, hogy igaz-e? Spreading-nek most subject a legközelebbi rokona, 9 távolságra. Lássuk a diagramot.

spreading	000111211555454	012
subject		000031211244455	002

OK, valóban hasonlónak tűnik. Nézzünk most közelebbieket, mondjuk 3-szomszédokat:

adaptive	entropic	3

adaptive	000000001146577	003
entropic	000000003146567	003

Majd távoliakat:

chiral	semiconductor	15

chiral		166322577578767	234
semiconductor	122223577777776	134

Nem tudom, mert ez annyira nem távoli. Az lenne a jó, ha a valódi értékek szerinti távolságot számítaná, bár az lehet, hogy túlságosan lelassítaná. Most mindenesetre gyorsan fut. A kódsor különbözik, de igazából „sok kicsi sokra megy” miatt. Káf zechutosabb felfogás, hogy az elején volt nagy eltérésük, ami a végére lecsökkent. Nézzünk még egy példát.

acceptors	vibration	14

acceptors	525141452312101	210
vibration	625252222311222	211

OK, nem olyan rossz ez, mert alapvetően valóban közeli, de van 1-2 ponton nagy eltérés. Higgyük el az eredményt egyelőre, és dolgozzunk ezzel tovább.

# 2018-11-11

Időterv (óránkénti):

- Programozás: összehasonlítás, kimutatások (10)
- 4. fejezet: megírni (10)
- 1-2. fejezet: átnézni (2)
- 3. fejezet: átmásolni (5)
- Bevezetők, befejezések, tézisek (3)
- Összesen: 30 óra
- Illést megkérdezni, hogy mikorra küldjem

Hátralévő órák száma:

- Dec 23.-Jan 1. Winter break – 7 teljes nap, 1 péntek (de.), 1 szombat (este) – napi 3 óra – 24 óra
- Szombat, vasárnap: 1,5-1,5 óra (3)
- H-P: 0,5 óra (2,5)
- Heti: 5,5
- 6 hét (33)
- 6 hét + Winter break = 57 óra. Elégnek kell lennie. Lehet kérdezni Illést, hogy jó-e, ha utána küldöm.

Hetenkénti időbeosztás:

- Eszerint 2 hét alatt véget ér a programozás
- Utána 2 hét alatt 1-3. fejezet
- Újabb 2 hét alatt 4. fejezet
- Szünetre marad: bevezetők, befejezések, tézisek

APS adathalmaz összes értékének összehasonlítása. 0-100-sűrűségek ábrázolása, TD levetítése erre, ellenőrizni, hogy realisztikusan néz-e ki, mielőtt egy az egyben átvezetjük.

bz@bz-HP-EliteBook-8530p:~/similarities$ cut -f2 3-pr-1-aps-1-cn.txt | perlawk.pl "s/\..*//g" | pdf.pl > 

bz@bz-HP-EliteBook-8530p:~/similarities$ cut -f3 1-mes-1-aps-3-td.txt | pdf.pl 
input read.
0 10
1 34
2 57
3 96
4 140
5 190
6 299
7 409
8 366
9 381
10 284
11 197
12 114
13 66
14 29
15 18
16 7
17 3

Most nem pontosan értem, hogy 3-PR miért mindkét oszlop szavait veszi figyelembe. Ja, igen, hogy az első legyen az, amit elsőre figyelembe vesz, így minden szóhoz a lehető legközelebbi szomszédot találja meg. Esetünkben (3-TD) éppen 2 x 2700 = 5400 szó szerepel a listában, tehát minden szó pontosan kétszer, és valószínű, hogy még szimmetrikusan is.

bz@bz-HP-EliteBook-8530p:~/similarities$ cut -f2 1-mes-1-aps-3-td.txt > 2.txt
bz@bz-HP-EliteBook-8530p:~/similarities$ cut -f1 1-mes-1-aps-3-td.txt > 1.txt
bz@bz-HP-EliteBook-8530p:~/similarities$ cat 1.txt 2.txt | wc -l
5400
bz@bz-HP-EliteBook-8530p:~/similarities$ cat 1.txt 2.txt | sort| uniq| wc -l
2700

Mégsem ez a gyakorlat:

theories	unified	10
gauge	theories	10
isoscalar	gauge	11

Eszerint a cél: minden szóhoz a lehető legközelebbit megtalálni. Pl. esetünkben gauge-hoz 10-et, theories-hez is, isoscalar-ból érdekes módon viszont csak 1-et találtam. Én azt mondanám, hogy csak az első elem legyen érdekes.

A kész diagram: percents.[ods|png], majd a disszertáció céljára ebből könnyebb lesz Gnuplotot gyártani. Az ábra jóslata alapján a 3-td-ből nem nagyon lesz tuti befutó, de azért próbáljuk meg belefoglalni az általános statisztikába.

Nagyszerű, 676 szóra mégiscsak a TD a legerősebb. Talán ezek egyáltalán nem is szerepelnek a többiben? A legigazságosabb az lenne, ha lehetne egyetlen, közös szólistát találni, amiből az összes mérés fut, mert jelenleg az "a" szó is benne van, amiről pedig nemrég észrevettük, hogy tévedés, mert a stopszólistának szűrnie kellene eleve, és csak valami elírás miatt maradt bent.

Mindennel együtt, vannak érdekes szavak. Pl. (/home/bz/similarities/4-un-1-aps.txt):

multifractal	41.53	53.85	76	41.3
nanoscale	32.93	59.39	88	43.08
sulfur	30.46	51.67	52	35.09
synthesis	32.16	52.27	64	39.2
wall	74.62	75.59	82	72.96
water	53.31	65.05	70	57.28

Következő izgalmas kísérlet, hogy ellenőrizzük ezekre a szavakra az összes mértékeket. Pl. multifractal:

bz@bz-HP-EliteBook-8530p:~/similarities$ grep multifractal 1-mes-1-aps-1-cn.txt | head

1. CN: consecutive words

multifractal	analysis	33

2. KK: connections

multifractal	fractal	288

3. TD: time-diagram

multifractal	cuo	4

multifractal	000000047544331	021
cuo		000000057644322	021

multifractal,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,87,73,90,99,72,53,52,68,48,53,59,72,41,34,42,46,28,34,30,39,15,21,26
cuo,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,100,67,74,95,72,66,81,67,53,52,46,44,47,44,37,38,41,34,36,26,31,25,26

4. OC: word co-occurrence

analysis	multifractal	36

Valóban eléggé hasonlóak. Ám a nehézség jelenleg a többi mértékegységgel, hogy azért nem gyakoriak, mert maga a szó nem gyakori. Ebből a szokásos gondolatmenet indítható el, hogy melyikkel osszuk le, vagy mindkettővel, vagy az uniójukkal, és minek.

A kérdés az, hogy akarunk-e még ezzel foglalkozni, vagy továbblépünk, finomítunk, és megyünk a többi adatsorra. OK, mondható, hogy a multifractal annyira nem sok mindenkinek érdekes, de legábé water máj iká lemémár?

1-cn:

liquid	water	89

2-kk:

water	liquid	936

3-td:

water	mapping	5

water	010001232345577	013
mapping	010011224344577	013

water,0,5,4,16,36,4,3,15,15,7,15,0,19,3,11,7,24,29,18,26,39,40,43,48,45,27,24,34,56,42,46,50,44,54,61,63,60,55,77,80,100,78,87,82,76
mapping,0,0,15,13,0,27,0,0,0,0,0,0,39,0,0,12,0,44,21,20,35,32,30,35,65,46,25,23,40,54,56,56,46,58,44,50,53,69,56,100,63,78,68,76,97

4-oc:

liquid	water	144

# 2011-11-15

Két hátralévő teendő az első adatsor összehasonlítása előtt:

- Többi mérték normálása
- Analizált szavak listájának egyesítése

Utóbbit úgy kezdjük orvosolni, hogy elevenítsük fel, értsük meg a jelenlegi helyzetet.

Normálás veszélye: akkor is alacsonyt adhat, ha amúgy magas. Pl. ha az unió szerint normálunk, és az egyik szó nagy, a másik kicsi. Persze, akkor mondhatjuk, hogy a kettő közül a kisebb szerint normáljunk (a szimmetrikus differencia Venn-diagramja szerint). Ugyanakkor az is lehet, hogy a normálás a szólista-problémán is segít valamennyire, legalábbis kezelhetőbbé rövidíti. OC és CN majdnem ugyanaz, csak mondaton belül vagy közvetlen egymás mellett. KK kicsit más, az éleket is figyelembe veszi.

A két szó között menő élek száma – hogyan lehetne elvileg normálni? Az egyik szóból is kijön néhány él (az összes cikk, ami tartalmazza a szót, és az abból kijövő élek – gigantikus szám), és ugyanez a másikra. Ezt elvileg sem lehetne nagyon normálni. Bár hasonló a helyzet a CN-nel.

# 2018-11-20

Normálás: mindig a nagyobbal a kettő közül. Pl. CN esetén a kettő közül többször előforduló szó előfordulásai. Ami szerepel is elvileg, 0-WDC-ben. Próbáljuk ki.

Eszerint legyártva 1-CN, jónak tűnik. Ellenőrizendő: mi van a tetején?

bz@bz-HP-EliteBook-8530p:~/similarities$ wc -l 1-mes-1-aps-1-cn.txt 
378055 1-mes-1-aps-1-cn.txt
bz@bz-HP-EliteBook-8530p:~/similarities$ head 1-mes-1-aps-1-cn.txt 
magnetic	field	13.45
cross	sections	39.9
phase	transition	12.07
quantum	dots	6.14
thin	films	25.66
electronic	structure	9.14
field	theory	7.99
phase	transitions	8.45
heavy	ion	22.49
magnetic	fields	6.66

# 2018-11-21

Vicces.

bz@bz-HP-EliteBook-8530p:~/similarities$ head 1-mes-1-aps-1-cn.txt 
nearest	neighbor	61.19
degrees	freedom	55.29
van	der	44.02
cross	sections	39.9
black	holes	37.96
penetration	depth	37.9
rare	earth	37.62
zinc	blende	36.31
bang	nucleosynthesis	33.83
isoelectronic	sequence	32.38

De legalább hatékony. Mehet végig. Méretében is úgy látom, hogy a felére csökkent.

bz@bz-HP-EliteBook-8530p:~/similarities$ head 1-mes-1-aps-4-oc.txt 
nearest	neighbor	70.78
degrees	freedom	55.82
der	van	44.36
cross	sections	40.59
earth	rare	39.46
black	holes	39.27
depth	penetration	37.9
blende	zinc	36.31
circular	dichroism	35.12
bang	nucleosynthesis	34.58

Hasonlónak tűnik, érdekes lenne látni egy közelebbi összehasonlítást. Ez is lényegesen kisebb lett, 54MB helyett 17MB (de továbbra sem töltöm fel).

1-MES, 2-KK 9MB eredetileg, újonnan: 107MB. Érdekes, a többi felére csökkent, ez tízszeresére nőtt.

root@topinav:~/similarities# head 1-mes-1-aps-2-kk.txt 
einstein	bose	726.94
bose	einstein	719.73
condensates	bose	407.64
condensates	einstein	386.4
nanotubes	carbon	372.64
black	holes	361.19
carbon	nanotubes	360
condensates	condensate	355.18
holes	black	347.74
binaries	post	341.66

Ebből látszik, hogy 1. nem szimmetrikus (ez jó), 2. nem normál (ezt még nem értem).

# 2018-11-25

KK esetén nincs logika ebben a mértékben, mert futhat két szó között több él, ahányszor a gyakoribb szó előfordul. Például A és B szó 2-2 alkalommal fordul elő, de mindegyik hivatkozik mindegyikre - K_{2,2}. Ezáltal 4 / 2 = 2 adódna a normálás eredményeként.

Hanem A * B * K / N, ahol A és B a két szó előfordulásainak száma, K a koordinációs szám (vagyis átlagos ki-fokszám), N pedig az összes csúcs a hálózatban. Gyakorlatilag ha ezt 1-re normáljuk, ugyanaz lesz, mint A * B, mert K / N konstans. A képlet pedig úgy adódik, hogy várható értéket számolunk az A és B halmaz között futó élek számára: az A halmazból kiinduló A csúcs mindegyikéből K darab él indul ki, és annak valószínűsége, hogy 1 él a B halmazba érkezik, B/N, élenként.

Mindehhez szükséges K, N konstansok ismerete (igazából K / N elég, ha számítható, esetleg a reciproka, és oszthatunk vele), és a szavak gyakorisága, ami már megvan, csak be kell tölteni.

N = 450084

bz@bz-HP-EliteBook-8530p:~/similarities$ wc -l aps_nodes.txt 
450084 aps_nodes.txt
bz@bz-HP-EliteBook-8530p:~/similarities$ tail aps_nodes.txt 
450075	10.1103/PhysRevLett.74.1699
450076	10.1103/PhysRevLett.69.2439
450077	10.1103/PhysRevB.27.1363
450078	10.1103/PhysRevD.13.2148
450079	10.1103/PhysRevB.75.144414
450080	10.1103/PhysRevB.17.4479
450081	10.1103/PhysRev.82.952.2
450082	10.1103/PhysRev.48.383.2
450083	10.1103/PhysRevA.38.5810
450084	10.1103/RevModPhys.32.744

Élek száma és koordinációs szám közötti összefüggés nem csak az irányítatlanra van? k=2E/N, vagy valami ilyesmi, mert minden élet kétszer számolunk. Szóval az irányított átlaghoz ez nem hinném, hogy felhasználható. Kifokszám-számításhoz: 0-avg-outdeg.pl.

E = 4710547

bz@bz-HP-EliteBook-8530p:~/similarities$ wc -l aps_edges.txt 
4710547 aps_edges.txt

K = 10.76

bz@bz-HP-EliteBook-8530p:~/similarities$ 0-avg-outdeg.pl 
4710547/437924 = 10.7565399475708

N / K = 41842.8

Nagy eltérések vannak viszont.

root@topinav:~/similarities# head 1-mes-1-aps-2-kk.txt 
quantum	model	1773914.91
model	quantum	1773914.91
quantum	electron	1703938.57
electron	quantum	1703938.57
quantum	spin	1567961.79
spin	quantum	1567961.79
quantum	magnetic	1503118.01
magnetic	quantum	1503118.01
scattering	quantum	1433792.27
quantum	scattering	1433792.27

root@topinav:~/similarities# tail 1-mes-1-aps-2-kk.txt 
oblique	vitreous	37.34
ablation	basic	37.34
colloid	morphological	37.34
calorimetric	vitreous	37.34
location	criteria	37.34
colloid	basic	37.34
location	calorimetric	37.34
criteria	locally	37.34
location	di	37.34
electrolyte	oblique	37.34

Százalékot is leszámítva, 17,740-szerese a várható értéknek. Jó tudni!

# 2011-11-26

Most kiírtam a szavak értékét és párjait is, hogy pontosabban utána lehessen számolni, illetve azon gondolkodom, hogy vajon ez valóban csak a leggyakoribb szavakból áll. Ha igen, akkor most már ezzel nem játszunk tovább, hanem normálunk és továbblépünk, összehasonlítunk, és a többi adatbázisra számolunk.

# 2018-11-30

Szúrópróba, konkrét példákon:

root@topinav:~/similarities# head 1-mes-1-aps-2-kk.txt 
tetracyanoquinodimethane	tcnq	100706.51	136	183	599
tcnq	tetracyanoquinodimethane	99025.27	183	136	589
tetrathiafulvalene	tetracyanoquinodimethane	76640.56	167	136	416
lorentz	cpt	74922.35	630	139	1568
tetracyanoquinodimethane	tetrathiafulvalene	72955.92	136	167	396
peierls	cugeo	72221.66	510	147	1294
cummings	jaynes	71680.46	154	152	401
cugeo	peierls	70603.09	147	510	1265
jaynes	cummings	70429.18	152	154	394
binaries	post	68732.16	208	324	1107

Utolsó három oszlop: a két szó előfordulásainak száma, ill. az egyikből másikba mutató linkek száma. Első jónak tűnik. Harmadik sem irrealisztikus.

Lorentz-cpt között az exp. val kb. 2. Ehhez képest az 1568 700-szoros felülszámolás, és ezt is mutatja. Hasonló az első páros, ahol 0.6 összeköttetést várnánk.

Úgy tűnik, mintha az egyenletes elvárásai miatt a kicsiket részesítené előnyben. Bár végül is hihető. Normáljuk a megszokott logaritmikus módon. Feltéve, hogy szintén hatványfüggvényt követ. Érdekes, a Gnuplot tanúsága szerint nem az, noha fat-tailed, de előtte "lekonyul", az elején, nem is rémlik, hogy mikor láttam ilyesmit. 30 körül tetőzik. Szerintem érdekes az ábra, kerüljön be a publikálandók közé. 165 körül ér vissza a kiindulási pontjára. 88-tól kezdve lehetne hatványfüggvényt belelátni.

Azért csökken, mert 100 körül van a várható érték, és azért nem pont ott van, hanem valamivel előtte, mert nem egyenletes az eloszlás (a modell nagyon primitív), ezért nem tökéletes a normálás. A maximum viszont az, hogy Exp.val. 1000-szereséig megy fel és 1/100-áig megy le. Ha csak logaritmikusan leskáláznánk, akkor a többségre, aminek kicsi az értéke, automatikusan kicsi közelségeket kapnánk, így versenyhátrányba szorulna ez a mérték. Már a 10-szeres mérettől felfelé 100 alá süllyed a görbe, ami nagyon alacsony. Tehát egy természetes átsúlyozásra lenne szükség, amivel a kisebb elemek nagyobb súlyt kaphatnának. Illetve az is jó lenne, ha figyelembe lehetne venni a görbe tetejét.

Ezért az első ötlet, hogy ne az X, hanem az Y tengely alapján történjen a normálás. Ennek kérdése, hogy van, ahol kétértelmű, és ott negatív értékek adódnak. Ebből az jönne ki, hogy akik nagyon távol vannak egymástól, azok már közelinek számítanak. Egyszerű megoldás lehetne levágni, és azt mondani, hogy aki ez alatt van, az már automatikusan 0-nak tekintendő. Miért is ne, hiszen biztosan nincs közel. Talán ez nem túl elrugaszkodott feltételezés: minden szónak kell hogy legyen olyan szomszédja, ami várható értéknél nagyobb. Talán az ábra is ezt sugallja – egy próbát megér.

A többinél pedig tekinthető a rendelkezésre álló Y értékek átlaga. Noha ez empirikus függvény használata, nem pedig az illesztetté, ami nem szokott fizikus körökben illendőnek lenni. Lehet használni ugyanazt az illesztést, amit korábban is (de abból nem sima log-tört jött ki? Most is az fog?), és a tetején lesz egy kis hézag, de nem látom, hogy miért okozna zavaró eltéréseket. Tetőzése:

21.1 37442

Innentől kezdve próbáljuk alkalmazni rá a meglévő képletet, és mellétenni az egyenest.

Excelben előállítottam a képlet alapján: kk-pdf.ods. Az illesztett egyenes még nem ideális, mert logaritmálni kellene az y-ra vonatkozó képletet. Utána mehet vissza gnuplotba.

# 2018-12-03

y=ax+b, ahol a=-2.8, b=24.4. Mindez a meglévő x és y természetes alapú logaritmus értékeire vonatkoztatva. Megjelenítése: kk-pdf.gnu, X: [3..12], Y: [-10..16]. -10-et számítjuk 1-nek, 16-ot 0-nak, ez skálázza át: (16-y)/26.

# 2018-12-18

Min: -7.85
Max: 15.86

Step-by-step kiszámítás:

1. X: a várható értékhez képest normált érték (100(%) körül tetőzik)
2. Y: elemek száma, ahány ilyen van
3. LX: log-nat-X, LY: log-nat-Y
4. LYE: LY-estimated, a lineáris függvény alapján
5. ZO: zero-one, az előző normálása a 0-1 skálára

Min:

1. 0.1
3. LX: -2.3
4. LYE: 30.85 (max)

Max:

1. 100706.1
3. LX: 11.52
4. LYE: -7.86 (min)

Jó, most megvan a lista, de csak topinav oldalon, mert jelenleg 169MB, nem érdemes fel-letölteni.

Következő lépés a tényleges, négyszeres összehasonlítás. Mi a helyzet a szólistákkal, miért van mindegyikre külön? Elvileg ugyanabból a 2700 szóból indultunk, azt csak szűkíteni lehetett. Mégis:

bz@bz-HP-EliteBook-8530p:~/similarities$ wc -l 2-wd*
 16594 2-wd-1-aps-1-cn.txt
 34090 2-wd-1-aps-2-kk.txt
 21104 2-wd-1-aps-4-oc.txt

Lehet, hogy ahhoz a top 2700 szóhoz keres legközelebbi szomszédokat mások között is? Ez vajon az elvárt viselkedés?

Valóban, 1-CN esetén 2700-ból indulunk ki (közös gyökérből: 0-wdc-1-aps), és csak ezek kerülhetnek 1-MES-be. Noha nem pontosan, mert konszekutív szomszédokat keres, és elég, hogy az egyik listás legyen. Jó, most már 1-CN működik, 2074-et ad, pedig nem módosítottam rajta semmit. OK, ugyanígy 2-KK. Így már jobb:

root@topinav:~/similarities# wc -l 2-wd-1-aps-*
 2074 2-wd-1-aps-1-cn.txt
 2700 2-wd-1-aps-2-kk.txt
 2298 2-wd-1-aps-4-oc.txt

Összefoglalva: 2-WD-ig minden megvan, 3-5. lépések hiányoznak, egyesíteni. Aratás!

# 2018-12-23

Eszerint ennek is kisebbnek kellene lennie:

bz@bz-HP-EliteBook-8530p:~/similarities$ wc -l 3-pr-1-aps-*
 16594 3-pr-1-aps-1-cn.txt
  5442 3-pr-1-aps-2-kk.txt
  2700 3-pr-1-aps-3-td.txt
 21104 3-pr-1-aps-4-oc.txt

Valóban, így már más:

bz@bz-HP-EliteBook-8530p:~/similarities$ wc -l 3-pr-1-aps-*
  2074 3-pr-1-aps-1-cn.txt
  2695 3-pr-1-aps-2-kk.txt
  2700 3-pr-1-aps-3-td.txt
  2298 3-pr-1-aps-4-oc.txt

3-TD ki van véve a log-log-normálandóak köréből, és 2-KK is hasonlóan kiveendő, azt hiszem, de talán nem ugyanúgy. Hogyan tesztelhető le ez? Vajon ha a további lépések felé visszük, később könnyebb vagy nehezebb kijavítani? Úgy tűnik, később nehezebb, most könnyebb. Csak nehéz egy egyszerű tesztet kitalálni, hogy jó eredmények jöttek-e ki.

1-CN: 61-ig skálázik (normálva a nagyobbik elem szerint)
2-KK: 36901 (pedig azt hittem, lenormáltam – valóban, a topinav szerveren!)
3-TD: 17 (megegyező elemek száma ennyi lehet max.)
4-OC: 70-ig (elvileg uaz mint 1-CN – akkor vajon szükséges valaha is a log-log-normálás?)

1,2,4: csökkenő sorrendben van eleve

Eszerint 3-pr-hez nem kell egyáltalán semmilyen normálás (esetleg 100-ig normálni 2-KK-t), ahol minél nagyobb, annál erősebb a kapcsolat a két elem között. 100 a legerősebb kapcsolat, és 3-TD már eszerint is működik. Kelleni fog még: külön görbe élekre és csúcsokra, 4-4 darab. Eszerint lehet, hogy még az él-listát is előnyös volna normálni.

Vajon mind a 4 fájl a legerősebb kapcsolathoz rendeli a legnagyobb számot?

1: IGEN
2: IGEN
3: NEM
4: IGEN

Akkor normálhatóak.

Elvileg minden adatsor rendben van, de nem hiszem el, hogy valós eredményt adott a végső evaluáció a mértékenkénti nyertes szavak számára:

aps:

kk	2557
td	139
cn	4
oc	2

A plotok által ellenőrizhető (első körből csak szavankénti, és nem élenkénti). Mondjuk sima textfile-ból, szúrópróbaszerűen is látszik, hogy pl. adaptive a cn-ben a legnagyobb, oda számolta vajon? Algebra szintén.

Fontos végeredményben, hogy normáljuk CN és OC-t logaritmikusan, és akkor ez adódik:

aps:

kk	2528
td	136
cn	32
oc	6

Továbbra sem tökéletes, de legalább igaz.

---

SO adatsor:

/media/bz/SAMSUNG/elte/ingola/git/pred180/so/records.txt -->
similarities/so-records.head.txt

Úgy látom, ez hónaponkénti bontású, 2008-09 és 2015-12 között. Készüljünk fel, hogy a szószámlálás igen fontos lépés (lehet, hogy megvan), ettől függ sok minden, mert csak a top szavakat használjuk. Azt is elevenítsük fel, hogy APS-ben hogyan húztuk meg a vonalat, mert itt is szükség lesz hasonlóra. Ez az (2018-10-12 legvége): „Vagy követeljünk évi 3 átlagos cikket”. Eszerint 88 hónap van a mérésben, mindhez 3: 264 előfordulás.

(words-traffic.txt hasonló a TD-ben használthoz, 30K szót tartalmaz.)

szantoadam@atlasz:~/wordtime/so$ head so-id-title.txt 
4	2008-07-31T21:42:52.667	When setting a form's opacity should I use a decimal or double?
6	2008-07-31T22:08:08.620	Percentage width child element in absolutely positioned parent on IE7
9	2008-07-31T23:40:59.743	How do I calculate someone's age in C#?
11	2008-07-31T23:55:37.967	How can relative time be calculated in C#?
13	2008-08-01T00:42:38.903	Determining a web user's time zone
14	2008-08-01T00:59:11.177	Difference between Math.Floor() and Math.Truncate()

Futtassuk ott. Egyszerű cp, miután mount-oltunk topinavra atlaszt, helyi gépre topinavot.

bz@bz-HP-EliteBook-8530p:~/similarities$ cp 0-wdc-2-so.pl ~/topinavdir/atlaszdir/wordtime/so/

Lefutott, ám a 264 előforduláshoz 9500 szó szükséges, az APS-beni 2700-hoz képest, talán nem nagy eltérés.

szantoadam@atlasz:~/wordtime/so$ head -n9500 0-wdc-2-so.txt | tail
authenticity	265
pushpin	265
rolled	265
bufferedwriter	265
bazaar	265
prototyping	265
impala	265
reopening	265
datamember	265
uidocumentinteractioncontroller	265

De talán érdemesebb még egy szót hozzátenni évente, és abból 352 adódna limitnek, és 8200 topnak – nem nagy gain:

szantoadam@atlasz:~/wordtime/so$ head -n8200 0-wdc-2-so.txt | tail
hierarchies	352
firstname	352
userdata	352
japplet	352
hacking	352
uniq	352
customizable	352
verifyerror	352
jdom	352
mobiles	352

Inkább maradjon a 9500. Csak azt másoljuk fel gitre (látható lesz a sorhosszból):

root@topinav:~/atlaszdir/wordtime/so# head -n9500 0-wdc-2-so.txt > 0-wdc-2-so.9500.txt 

bz@bz-HP-EliteBook-8530p:~/similarities$ cp ~/topinavdir/atlaszdir/wordtime/so/0-wdc-2-so.9500.txt 0-wdc-2-so.txt

# 2018-12-24

Vannak processzált él-adataink SO-hoz, itt: /media/bz/SAMSUNG/elte/hal/17-haromszogek/data/stackoverflow_edges.gz

Ami ID-ket tartalmaz, amik megegyeznek a so_id_title.txt-ben található ID-kkel, de nincsen garancia arra, hogy mindegyiknek van megfelelő elem. Ugyanakkor: ez a hálózat nagyon ritka, kevés él. Összehasonlításképpen: Patentben 3-szor akkora az élfájl, mint a csúcsfájl, ugyanez SO-ban visszafelé (!) 40-szeres (!!) eltérés.

2-KK számára a lineáris függvény paramétereit minden adatsorhoz újra kell becsülni.


$n_per_k megállapítása 2-SO számára (ld. fent, 2018-11-25):

N = 11203031

E = 757475

szantoadam@atlasz:~/wordtime/so$ ./0-avg-outdeg.pl 
757480/719940 = 1.0521432341584

K = 1.05

N / K = 10648256.82

Lineáris illesztés megállapításához létrehozzuk: 1-mes-2-so-2-kk-exp.txt-t, ami a várhatóértékekhez képesti relatív eltéréseket tartalmazza. Ezek gyakoriságát megszámlálva, majd logaritmálva adódik a kívánt, illesztendő görbe (korábban: kk-pdf), majd ebből becsülhetőek a paraméterek.

szantoadam@atlasz:~/wordtime/so$ cut -f3 1-mes-2-so-2-kk-exp.txt | pdf.pl > kk-pdf-2-so.txt

A kapott görbe log-log változatán leolvasott pontok:

P1 = (3.6, 10)
P2 = (6.7, 5.2)

A = (y2 - y1) / (x2 - x1) = -1.55
B = y1 - x1 * A = 15.58

1-APS esetén ugyanez:

A = -2.8
B = 24.4

szantoadam@atlasz:~/wordtime/so$ less 5-ev.txt 
so:

kk      8140
td      1336
oc      24
cn      2

Zeit adatsor processzálása, volt már készen 17-haromszogek/data könyvtárban preprocesszáló, ami az évszámokat kiszedi, ebből lett zeit_years.txt. Eszerint 1965-2014, azaz 50 évre limitálunk, évi 3 év szerint 150 cikk minimum, ami 3200 topszót követel meg 0-wdc-ben.

5-ZEIT:

Nem futtatjuk 2-KK-ra, nem normálható, ld. kk-pdf.gnu, kk-pdf.5-zeit.txt. Már a sima idődiagram is megjeleníthető, hogy adatprobléma miatt hiányzik.

Holnap: 4-PATENT processzálása, és WoS-sal nem tudom, hogy érdemes-e megpróbálkozni.

---

Amíg a futtatás történik, lehet, hogy szükség lesz párhuzamos futtatásra, és a PhD tényleges megírására. Legjobb, ha az éppen aktuális projekt dokumentálásával foglalkozunk.

Mértékek összehasonlításának vázlata:

- TD-kről volt szó korábban, az az egyik, de van még négy
- Miért fontosak a mértékek, irodalom (mehet később)
- Összehasonlítás hasznossága: legközelebbi legközelebbi elem megtalálása, különböző helyzetekben különböző lehet hasznos, ezért jó, hogy sokféle adatsort vetünk össze most
- Az algoritmus leírása
  - Nagy vonalakban
  - Az egyes mértékek
- Eredmények
  - A mértékek megoszlása csúcsonként és élenként
  - Négyes ill. páronkénti összehasonlítások
  - Elemzés, adattípus, adatsor szerinti összehasonlítás, azaz: melyikhez mi illik

# 2018-12-25

Patent_nodes (4,992,219):

3930271 19760106        Golf glove
3930272 19760106        Crib leg lock
3930273 19760106        Bed safety side rail arrangement
3930274 19760106        Assembly for use in recreational activities
3930275 19760106        Method of fabricating a slipper
3930276 19760106        Wheel spinning and vehicle conveying apparatus for automatic wheel
3930277 19760106        Mobile floor sweeper
3930278 19760106        Paintbrush and guard attachment for edging
3930279 19760106        Rubber windshield wiper blades having increased flexibility at clamping

Patent_edges (108,993,623, de 7,3M csúcs van, azok kiszűrendőek):

3930271 2379430
3930271 2782422
3930272 1549144
3930272 1609246
3930272 1667080
3930272 1834468
3930272 2545289

patent_years.pl: évek szerinti limitálás – 1976-2012 – 37 év, * 3 = 111 min. Elég sok, 11,500 szó szükséges hozzá! Szóval viszonylag gyakran ismétlődnek a szavak bennük.

Nem jók a számok. 1-CN és 4-OC-t is ugyanúgy kellene megállapítani, ahogy eredetileg gondoltam, lineáris illesztéssel, és 2-KK-t is automatizálni kell. (3-TD elég kézenfekvő anélkül is, az a kivétel.) Eszerint frissítendő a fájlstruktúra, és mindhárom mértékhez elmentendőek az alap számok is (raw néven). Legjobb az lenne, ha addig futna, amíg tesztelnénk Excelből. 

APS-re amúgy sem volt jó az évek kiszámolása, nincsen erre rendszer még, pedig kellene, ezért patent_years.pl-t idemásoljuk:

/home/bz/topinavdir/atlaszdir/local_behaviour/17-haromszogek/data/years.pl

És itt helyben generálja minden adatsorhoz a szükséges adatokat.

Mintavételezés APS-ből, minden 100. sor:

root@topinav:~/similarities# sed -n "1~100 p" 1-mes-1-aps-1-cn-raw.txt | wc -l
3777

Inkább: R vagy lin. regresszió, a log-logra.

R: 

# library("igraph")
# data <- scan("3.txt")
# f <- fit_power_law(data)

$alpha
[1] 2.183701

$xmin
[1] 4


Alphát kell mínusz eggyel megszorozni, és x = 1-hez az első, azaz legnagyobb értéket beírni.

root@topinav:~/similarities# Rscript power-fit.r < 3.txt 2>/dev/null


root@topinav:~/similarities# cut -f3 1-mes-1-aps-1-cn-raw.txt | Rscript power-fit.r 2> /dev/null
2.183701

Zeit adatsorban nehéz a regexpet rávenni, hogy rendesen match-eljen német (magyar) ékezeteket, mert vagy még többet is match-el, vagy még kevesebbet. A megoldás: cat-tal kell beolvasni és nem open-nel (vagy utf8 az openbe, azt még nem próbáltam).

OK, minden megvan a WoS-t kivéve, és a 4-Patent-3-TD-t (ami nem kicsi). Ugyanakkor: TD végeredmény nem 0-1-normált, hanem integerek, az eltérő számjegyeket sorolja fel, és nincs is rendezve, nem mintha ez baj lenne.

Anomália: Zeit-ben KK nem jó WD-t produkál, 72K a megengedett 3.2K helyett. Pedig fontos lenne, mert erre szépen illeszkedett a power law. Újraszámolandó. 0-wdc-5-zeit.txt-t inkább kézzel editáltam, értelmetlenségeket eltávolítva, ékezeteket lecserélve, Geany-ben. Igen, így most már az ékezetek hibátlanok, WD szintén, ám az eloszlás itt sem hatvány – ezt vagy megnézzük, vagy hagyjuk inkább.

3-PR ügyében 3-TD kapcsán releváns maradt, a másik három 0-1 közé van normálva eleve, ott csak az lenne a feladat, hogy egyetlen szó legközelebbi szomszédjára vetítse, és 100-al felszorozza. Eszerint új verzió: 3-pr.pl.

OK, teljesen jó eredmények jöttek ki:

aps:

kk	1896
td	640
cn	124
oc	43

so:

td	7622
oc	1440
kk	284
cn	160

patent:

td	8942
kk	2345
cn	211
oc	7

zeit:

td	3201
kk	17
oc	7
cn	7

Eszerint általában kk és td viszi a prímet, de SO esetén OC is előrejön, és amúgy sem tartják magukat mindig olyan rosszul, csak Zeit-ban, ami amúgy sem túl jó. Lehet, hogy mégis érdemes lenne WoS-t bevállalni, ha nem túl sok idő (vagy esetleg a végén).

Just for the record, szinte minden számítás topinavon futott:

/home/bz/topinavdir/similarities/5-ev.txt

Kivéve néhány tényleg nagyot, amihez helyi kópiákat készítettem:

SO számára: /home/bz/topinavdir/atlaszdir/wordtime/so/
Patent számára: /home/bz/topinavdir/atlaszdir/local_behaviour/17-haromszogek/data/

# 2018-12-26

Nagy, hátralévő teendők:

1. Web GUI
2. Szöveg megírása (PhD)
  - Irodalmazás
3. Képek, ábrák elkészítése
4. WoS processzálás
5. Kézirat készítése ebből
6. Prediction fejezet PDF-be
7. PhD utómunkák

Ebből a listából 1., 4., 5. pont elhagyható, végére sorolható.

Most látom, hogy OC-ben nincsen unique-á tevő sor a szavaknál, pedig elvileg kellene. Im kol ze, nem gondolom, hogy kedáj ismét végigfuttatni, módosítva, esetleg ha lesz időnk, mert nem hiszem, hogy a végeredményen szignifikánsan változtatna.

# 2018-12-27

PDF:

- APS, SO, Patent, Zeit (lehet, hogy ebből mind rossz, igazából ezen múlik)
- CN, OC, KK

Ill. illesztés is mehetne rá. De minek, talán egyszer, megmutatandó az algoritmust. A futás szerinti power law illesztés a linkeken történik, és nem a csúcsokon, akkor miért akartam a csúcsokat megjeleníteni? Valójában ugyanazok a számok másolódnak át oda is, ezért talán van egy kimondatlan feltételezés, hogy ugyanaz az alfa értékük. Máshogy nem is lehetne nagyon, jól van ez így. Ilyen fájlneveket állítsunk elő:

root@topinav:~/similarities# cut -f3 1-mes-5-zeit-1-cn-raw.txt | ~/pdf.pl > pdf_zeit_cn.txt


- APS

# 2018-12-30

"Evaluating Publication Similarity Measures" megjelent: IEEE CS, Bulletin of the Technical Committee on Data Engineering, 2005, Vol. 28. No. 4. (Dec)

Elsőre látszik, hogy 1 adatsoron futtaták, ami kisebb, mint nálunk a legkisebb. Furthermore, náluk van co-citation, nálunk ez soha nem érne véget, ezen a skálán. Ezért a mi mértékeink frappánsabbak. További chidus, hogy mi egybeskálázunk, hatványfüggvénnyel. Azt nézik, melyik melyikhez hasonlít, ez is érdekes kérdés, de a miénk merészebb, hogy melyik a jobb, cserébe hipotetikusabb alapokon nyugszik. Persze ők nemcsak címre futtatják, hanem teljes szövegre, a miénk ennyivel rugalmasabb (háttérfeltételezés: ha már erre működik, minek több, ill. néha csak ennyi van, pl. videó).

Recommendation: a handbook és hivatkozásai elég kell, hogy legyen. Mi érdekel minket mindebből? Hogy mondanak-e olyat, hogy a megfelelően megválasztott hasonlóság segít. Mivel ők szabadabbak, ezért minden mást is hozzávesznek (felhasználói információ), a nearest neighbor népszerű, de tudományos szempontból elég alapnak számít. Nem látszik, hogy vizsgálja a hatékonyságát a közelség-mérték függvényében. Arról viszont ír, hogy szokott probléma lenni az, hogy milyen gyorsan számol ki mindent-mindennel, és ha a TD jónak bizonyul, arra nekem van egy jó ötletem (innovációm).

Minden más: futottak még. Ill.: mit akarnak az evaluációval elérni, amiben mi is kontribúciót tudunk mutatni.

Olyat találunk, aki jobbnak nevez egy similarity-t a másiknál? Talán Recommendernél. Semantic, Fig. 4. igen: "All similarity measures perform significantly better than the randomly generated set of similarities." Ha jól értem, ez kézzel annotált tanítóhalmaz alapján kontrollál, mi enélkül megyünk a vakvilágba. Egy fontos szó: folksonomy = kollaboratív tagging. Mindenki adhat tag-eket.

Ó, igen, ezt írja az 1. rész végén: "An experimental assessment of the effectiveness of several similarity measures for both tags and resources. For the former, we establish a comparison with user-created tag relations to measure effectiveness."

Time-series: ez csodás forrásnak tűnik a TD számára. Úgy értem, nekik is van ál má liszmoch, beinján evaluation. Jópofa adatsoraik vannak, pl. hogy mennyi áramot fogyasztanak az olaszok. WordsSynonyms lehet, hogy TD-hez hasonló ötlet. Nekik clustering/classification miatt fontos (ez jó, mert akkor nekünk is amiatt lehet az, besides recommendations). Burjánzanak náluk a mértékek, 1-ből 7-et találnak, ami szépen kiemelkedik. Nagyon épít erre, hosszú, képes, Wang: "Experimental comparison of representation methods and distance measures for time series data". Elvileg 3.1-ben írja le a kiértékelés mikéntjét, de nekem abból nem jön át, mit akar.

Inkább olvasom az eredetiekben, amiket hivatkozik: egyszerűen csoportosítja, és ahhoz hasonlítja, hogy a hasonlóak is úgy csoportosulnak-e. Pl. nearest neighbor, és lám, mi sem tettünk nagyon mást. Csak azt nem értem, hogy ez önmaga hogyhogy nem használ hasonlóságot, és akkor saját magához hasonlításnak kellene adódni belőle. Valóban, Cylinder-Bell-Funnel egy meglévő hármas görbesereg, valószínűségileg generált modellje, amiről azt írja, hogy az ember mindig rájön, csak az a kérdés, hogy a gép is rájön-e, hogy melyiket látja. Eszerint, ha éppen közelihez teszi, az adott similarity measure szerint, akkor jó.

Orkut: tetszik a Table 4, hogy konkrét és működő példát ad, ilyesmit én is beletehetnék valahol. Náluk már valóban a recommendation a téma, hogy a sok felhasználó és elem között, túl nagy halmazokban hogyan ajánljanak hatékonyan. Mivel ott valódi a website, mérhető a feedback click alapján.

Összességében mondható, hogy forradalmi és talán vakmerő is a próbálkozás, hogy az eddigiektől eltérő módon, a levegőből vegyük a kontrollmértéket. Ám cserébe rugalmas, és próbálják ki, hátha a gyakorlatban is hatékonyan kamatoztatható.


- Publications (full text), links, co-oc
- Folksonomy, Orkut: mehet egybe, kézzel kontrollált
- Time-series: más műfaj
- RS

---

Elveszettnek hitt WoS adatsor helye: 

szantoadam@atlasz:~/local_behaviour/10-paradigm$ wc -l uid_year_refs_kw_kwp.txt 
35663336 uid_year_refs_kw_kwp.txt

Most atlaszon, screen-ben fut (kb. 10 perces futási idő):

/home/bz/topinavdir/atlaszdir/local_behaviour/17-haromszogek/data/wos_count.pl

Elkészülte után beillesztendő az 1.2-es táblázatba.

szantoadam@atlasz:~/local_behaviour/17-haromszogek/data$ ./wos_count.pl
progress: 100% [=====================================================]D 0h10m39s
nodes: 35663336
edges: 392126014
progress: 100% [=====================================================]D 0h11m07s

Valamiért ez a definíció kimaradt, ill. javítva egy stopszószűrés által okozott adathiba:

bz@bz-HP-Laptop-15-bs1xx:~/similarities$ cut -f2 3-pr-5-zeit-3-td.txt | ~/pdf.pl 2 > pdf/nn_zeit_td.txt 

# 2018-12-31

De most jut eszembe, hogy tegnap Zeit-ben az "online" és a "seite" szavak 10,000-et mutattak, és emiatt lett minden más elem 100. Nem 0-nak kellett volna lenniük?

"TD-similarity (since this latter one was originally a distance measure, therefore, it was subtracted from 100%, in order to be able to read as similarity measure)"

Szóval van SM és DM. A DM-ben a 0 a legközelebbiek, az SM-ben az 1. Eszerint ha a maximális elem 10,000, és minden más közel 0, akkor azok def. szt. távoli elemnek számítanak, tehát SM-ben 0-át kellene eredményezniük, és nem 1-et.

Tegyünk egy szúrópróbát, és válasszuk ki a lista tetején álló elemeket. Eszerint elvileg ezeknek kell a legközelebbieknek lennie, tehát SM szerint 1, DM szerint 0 (kb.). Pl. ukraine. Párja bürgerschaftswahlen, 0 – ez megfelelő.


ukraine 00000000000000004       0001
bürgerschaftswahlen     00000000000000004       0001


ukraine 1148
bürgerschaftswahlen     304

ukraine,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,1,2,0,2,2,0,0,0,0,0,1,0,0,0,3,0,2,4,2,1,1,2,9,3,100
bürgerschaftswahlen,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100


Ebből bizony sajnos 137 és 103 adódik.

root@topinav:~/similarities# wc -l ukr.txt 
1149 ukr.txt
root@topinav:~/similarities# less ukr.txt 
root@topinav:~/similarities# cat ukr.txt | sort | uniq | wc -l
1091

Konkrét ID duplikátumok vannak benne! De ez még nem magyarázza meg a fenti hibát.

29357	2000	Die Erfindung der Ukraine | ZEIT ONLINE
29357	2000	 Seite 2 von 6 | Die Erfindung der Ukraine | ZEIT ONLINE
29357	2000	 Seite 3 von 6 | Die Erfindung der Ukraine | ZEIT ONLINE
29357	2000	 Seite 4 von 6 | Die Erfindung der Ukraine | ZEIT ONLINE
29357	2000	 Seite 5 von 6 | Die Erfindung der Ukraine | ZEIT ONLINE
29357	2000	 Seite 6 von 6 | Die Erfindung der Ukraine | ZEIT ONLINE

(Szóval ID az érdekes, nem a title. Illetve az is érdekes lehet, ha lenne benne bármi új, de nincs. A "Seite" is stopszó kéne hogy legyen.)

Ha csak simán kiiratjuk a processzált rekordokat, nincs eltérés. Akkor mi történt a kettő között? Ja, semmi, csak le lett normálva.

Visszatérve az elejére, nem segít, mert minket korábbi szavak szereplése érdekel, de ott nincs annyira sok előfordulás, hogy kiemelkedjen. Ha valóban 4 a 100%, akkor 1 a 25%, és ez az a küszöb, ami nem éretik el. Valóban:

2010 15
2011 25
2012 89
2013 35
2014 817

Ez a 10% környékéig jut el csupán. Szóval minden jó, még akkor is, ha hihetetlen. De mégsem értem, mert a box paraméterei szerint 9 jegyű lehet minden szám, akkor hogyhogy a maximális csak 4-ig jut el? Mi több kéne még? Mi szerint normál? Három szélességű ablak szerint. Ennek átlaga 89, 35, 817 -- 313. Ami a 817-hez viszonyítva valóban 38%, azaz 9-es skálán 4-est kap. Szóval minden tökéletes! Térjünk is át a végeredmények elemzésére.

Results: azt vártuk, hogy össze tudjuk hasonlítani az adatsorok jellemzőit a megfelelő mértékekkel. Melyik mérték mihez illik?

APS
SO
Patent
Zeit

CN
OC
KK
TD

Szempontok:

- Kérdés, hogy CN és OC között mi a NM
  - APS-ben, Patents-ban CN jobb
  - SO-ban OC
  - Zeit-ban irreleváns, abszolút, minden másban nagyon szignifikáns
  - CN: vannak szókapcsolatok, talán azért, mert formálisabb az adathalmaz
  - Zeit-ben talán azért nincs gyakori közös szereplés, mert az újságírók feladata a figyelemfelhívás, minél újabb dolgok párosításával. De nem, mert igenis vannak kifejezések, hanem mert németben összekapcsolják a szavakat jellemzően.

- Kapcsolatok ott jók, ahol jók a kapcsolatok
  - APS-ben még TD-nél is jobb, talán azért, mert erősen kapcsolt hálózat, átlagosan 11.75 él csúcsonként
  - Ám Patents épp kétszer annyira, 22.7
  - Valóban Patents-nél is jelentős KK, de meglepő, hogy nem annyira, mint TD
  - SO nagyon nem, sőt, éppen fordítva, és Zeit-ban sem nagyon vannak linkek
  - Ott érthető a végeredmény

- TD ott nem jó, ami alapvetően lassan változik
  - Csak APS-ben teljesít alul, a szokásoshoz képest
  - Biztos, hogy találunk forrást arról, hogy a tudomány lassabban mozdul, mint pl. a tech, ipar (SO), híreknél (Zeit) biztos, és talán Patent-nél is
  - Ilyet nem találtunk, ami a tudomány innovációs rátáját akarja mérni, olyat igen, ezt kellene bővíteni

Innovation in Mature Firms: A Text-Based Analysis

@article{bellstam2017innovation,
  title={Innovation in Mature Firms: A Text-Based Analysis},
  author={Bellstam, Gustaf and Bhagat, Sanjai and Cookson, J Anthony},
  year={2017}
}

https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2803232#


- Kellene 1-2 egyszerű, jól megválasztott szemléltető példa, melynek célja a figyelemfelkeltés, elgondolkodtatás, mélyebb működés közelebbrőli bemutatása (case study)
  - Pl. top szavak, amik mindenben vannak, ill. amik az adott halmazra jellemzőek, és közérthetőek
  - Megmutatni a top kapcsolatainak, legközelebbi szomszédnak a kapcsolatait
  - TD esetén egyszerű, két görbe
  - CN, OC esetén is, listásan
  - Mindent úgy, ahogy a web gui-t szeretném, ha elérünk odáig
  - 37 szó mindben szerepel, érdemes talán ezeket szondázni közelebbről, /home/bz/similarities/inters/minden.txt

my @stats=qw/1-cn 2-kk 3-td 4-oc/;

root@topinav:~/similarities# grep generation 4-un-1-aps.txt 
generation	83.84	82.87	70.59	82.68
root@topinav:~/similarities# grep generation 4-un-2-so.txt 
generation	61.25	46.37	81.58	59.7
root@topinav:~/similarities# grep generation 4-un-4-patent.txt 
generation	59.6	73.6	86.67	65.62
root@topinav:~/similarities# grep generation 4-un-5-zeit.txt 
generation	36.94	48.94	38.1	37.64



Ez is megjeleníthető hasonlóan az összeshez.

bz@bz-HP-Laptop-15-bs1xx:~/similarities$ grep signal 4-un-1-aps.txt 
signal	37.1	57.52	64.71	44.94
bz@bz-HP-Laptop-15-bs1xx:~/similarities$ grep signal 4-un-2-so.txt 
signal	54.79	43.87	71.06	55.76
bz@bz-HP-Laptop-15-bs1xx:~/similarities$ grep signal 4-un-4-patent.txt 
signal	78.95	81.02	86.67	79.03
bz@bz-HP-Laptop-15-bs1xx:~/similarities$ grep signal 4-un-5-zeit.txt 
signal	0	25.64	99.92	0

Jobb a generation, mert azon az látszik, hogy lehet a TD nagyon alacsony, pl. APS esetében. A többi legközelebbi szomszédja is megjeleníthető egy ábrán, TD esetén. CN, OC: lista. KK: közös szomszédok. Elemezzük, listázzuk, vizualizáljuk csak ezt.

TD szomszédok:

bz@bz-HP-Laptop-15-bs1xx:~/similarities$ grep generation 1-mes-1-aps-3-td.txt 
generation	transport	5

root@topinav:~/similarities# grep generation 1-mes-2-so-3-td.txt 
generation	solution	7

root@topinav:~/similarities# grep generation 1-mes-4-patent-3-td.txt 
generation	selection	2

root@topinav:~/similarities# grep generation 1-mes-5-zeit-3-td.txt 
generation	zahl	13

APS-transport
SO-solution
Patent-selection
Zeit-zahl

Ez persze 4 x 2 görbe. Most akár CN-t, akár OC-t vesszük, az sok cím. APS, CN: harmonic generation. Lehet, hogy ez az aszimmetriája miatt érdekesebb az OC-nél. De jó, mert KK és OC szerint is ez APS-ben a szomszédja, csak TD-ben nem.

SO, CN, OC: code generation. KK: generate generation. TD: solution G.
Patent, CN: power generation. OC, KK: method. TD: selection.
Zeit, CN, OC: mauer (de hogy lehet? egyszer szerepel, és nem áll semmi más mellette?), KK: seite, de az stopword (újrafuttatandó?), utána: euro. TD: zahl.

Generation-Zeit-probléma: nem is áll, csak szószerkezetben. 0-wdc szerint 566 előfordulás. Pedig van, pl. digitale, ganzen. Az a baja, hogy ezek viszont nem kerülnek a listába, és így a CN-ből kimaradnak. És az OC? Abból is, ha nincsen az egész címben. Ez megmagyarázza CN és OC alulteljesítését. (Egyébként mauer-ra sem nagyon jó az eredmény, mert van egy 4-szer szereplő cikk, és egy teljesen másik is.) Italien-re is látok 3 találatot, pedig az is jó.

Ó, igen, megvan a probléma. A nagy kezdőbetűk. Lefelejtetettem az lc-t, ebből lesz NM. Így már más az output "generation"-re is.

root@topinav:~/similarities# grep generation 1-mes-5-zeit-4-oc-raw.txt | head
generation	junge	32
generation	verlorene	21
generation	land	20

root@topinav:~/similarities# grep generation 1-mes-5-zeit-1-cn-raw.txt | head
junge	generation	30
verlorene	generation	21
jungen	generation	11

Ennek fényében a p-value is jobb:

root@topinav:~/similarities# ./1-mes-1b-pow.pl 
determining alpha...2.928527 (p_val=0.0009796685)
determining pdf...
processing 5-zeit... (837223)
progress: 100% [=====================================================]D 0h00m01sroot@topinav:~/similarities# ./1-mes-1b-pow.pl 
determining alpha...2.947685 (p_val=0.0003622533)
determining pdf...
processing 5-zeit... (837223)

Ez átírandó a szövegben is. KK nem javul, ott már megvan az lc, p-value magas. Így már 5-ev.txt is mindjárt szebb. Frissítjük a képeket.

APS-re nagyon furcsa p-value adódott viszont sajnos így:

root@topinav:~/similarities# ./1-mes-1b-pow.pl 
determining alpha...2.246609 (p_val=0.1169288)
determining pdf... (ez a CN)

root@topinav:~/similarities# ./1-mes-1b-pow.pl 
determining alpha...3.025477 (p_val=0.7219964)
determining pdf...
processing 1-aps... (1207720) (ez az OC)

root@topinav:~/similarities# ./1-mes-1b-pow.pl 
determining alpha...2.510846 (p_val=0.9992314)
determining pdf...
processing 4-patent, 4-oc... (4933170)

root@topinav:~/similarities# ./1-mes-1b-pow.pl 
determining alpha...2.028294 (p_val=0)
determining pdf...
processing 4-patent, 1-cn... (6019542)

# 2019-01-01

TD szomszédok (újraszámolás után):

(max: 17)
bz@bz-HP-Laptop-15-bs1xx:~/similarities$ grep generation 1-mes-1-aps-3-td.txt | head
transport	generation	5
oscillations	generation	9
bulk	generation	9
chemical	generation	9

(max: 38)
root@topinav:~/similarities# grep generation 1-mes-2-so-3-td.txt | head
generation	solution	7
safe	generation	11
architecture	generation	12

(max: 15)
root@topinav:~/similarities# grep generation 1-mes-4-patent-3-td.txt | head
generation	selection	2
file	generation	3
macro	generation	6

(max: 21)
root@topinav:~/similarities# grep generation 1-mes-5-zeit-3-td.txt | head
generation	zahl	13

Látható, hogy össze lett keverve a táblázat a figure-rel, mert nem ugyanazok az értékek a maximálisak benne.



bz@bz-HP-Laptop-15-bs1xx:~/topinavdir/similarities$ grep generation 1-mes-1-aps-3-td-1-norm.txt 

transport,23,22,36,47,26,34,37,31,32,28,25,31,46,32,27,29,35,24,39,35,39,45,68,60,57,57,57,66,69,65,73,68,78,72,69,74,83,83,80,79,99,90,95,89,94
generation,38,34,44,43,43,23,33,28,35,29,33,37,50,28,37,42,57,45,53,50,51,80,55,62,61,61,66,66,76,78,73,74,64,60,78,80,85,71,81,99,100,98,88,96,93
bulk,16,14,16,11,22,44,25,21,30,28,35,28,43,51,64,63,41,26,48,40,52,84,70,80,64,59,52,65,67,71,66,55,52,58,91,71,82,68,89,82,100,95,93,69,82
oscillations,57,66,28,44,46,54,47,26,32,31,31,34,21,43,15,59,45,31,50,44,45,61,67,69,56,50,51,64,58,68,77,74,70,92,82,89,91,82,72,85,93,64,75,86,100
chemical,14,33,11,10,15,44,29,23,13,9,47,33,9,42,28,66,56,44,57,65,89,64,66,87,52,51,78,71,85,52,68,71,73,75,73,72,82,66,83,94,76,98,97,100,76





TD normálása a normális görbéhez képest nagyon fontos, különben még közelebb lennének az elemek! Írjuk bele! Innen látszik! Nem is kell leírni explicit, mert a Pred cikk szövege van hivatkozva a kiszámításnál, és ott szerepel ez.

Sajnos a kép jelenleg nem egyezik a kimutatással, ismét. Nem a maximális, hanem valamely szubmaximális elemet láthatjuk a táblázatban. Lehet, hogy még az 1-mínusz előtt lett maximalizálva, úgy tűnik. Ami ismét újrarajzolandóvá teszi, legalábbis a TD mértéket, mind a 4 adatsor szerint.

Továbbá: döntsük el egyszersmind a 4 adatsor sorrendjét, mert kissé zavaró, hogy néha egyik, néha másik sorrendben szerepel a publikált PDF-ben. Legegyszerűbb a sima betűrend:

- APS
- Stack Overflow
- US Patents
- (WoS)
- Zeit.de

És mindenhol ehhez ragaszkodjunk.

root@topinav:~/similarities# grep generation 1-mes-1-aps-1-cn.txt | head
harmonic	generation	0.838498915059417
mass	generation	0.512002143401697

root@topinav:~/similarities# grep generation 1-mes-1-aps-2-kk.txt | head -n30
generation	harmonic	0.828771073384785
harmonic	generation	0.827362958960324

root@topinav:~/similarities# grep generation 1-mes-1-aps-4-oc.txt | head
generation	harmonic	0.826812792453999
generation	optical	0.685315461406955

Ábraterv cn-kk-oc-hez (generation-neighbors): Top 10 4-szer, a négy adatsorban, oszlopdiagram, alul elforgatott címkékkel, csökkenő sorrendben, pl. harmonic (CN). Szimmetrizálva, a nagyobbikat venni a pár közül.

Leírandók:

- A kétféle oszlopdiagram összehasonlítása, magyarázat
  - APS-ben CN-t és OC-t azért találunk, mert igen gyakori szóról van szó (194. leggyakoribb a 2700-ból)
  - Patent TD-je a nagy kivétel, ahol tendenciák vannak, a normálás ellenére
- TD: csoportosítások miatt kerülhetnek közel, ill. távol
  - Zeit-ban és APS-ban eléggé érzékeny, mert 45 ill. 50 elemű az idősor, viszont SO dupla olyan hosszú, ez magyarázhatja, hogy minden hasonlót egybeejt – further plan, hogy pontosabb paraméterek belövése, túlmutat ezen írás keretein, amikor nagyban, távolról összehasonlító módszert akartunk
- CN-OC-KK-görbén a lecsengéséről is megtudhatjuk, hogy általában milyen közel esik, ill. mennyit veszítünk azáltal, hogy csak 1-et engedünk
- További fejlesztési lehetőség: webes GUI, ahol eszerint kattintani is lehetne a cikkekre, ill. fentiekben bemutatott szófelhőhöz hasonlóban böngészni
- Minden elérhető Githubon






generation	332234455666788	134
transport	233232355666788	124
bulk		122243475656787	123










