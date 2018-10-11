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



























