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





