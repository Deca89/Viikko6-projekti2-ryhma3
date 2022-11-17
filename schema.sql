DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    title TEXT NOT NULL,
    content TEXT NOT NULL
);

INSERT INTO posts (title, content) VALUES ('Jämähditkö? Tee kuten Heidi ja muuta urasi suuntaa', 'Jokaisen maanantain ei tarvitse olla nousukiitoa, mutta jos perjantaihin mennessä ei sorvin ääressä ole juuri ilon tai innostumisen kokemuksia irronnut, ollaan lähellä jämähtämistä. Oireet on helppo tunnistaa ja hoito on jokaisen ulottuvilla – uranvaihto ei katso taustaa eikä vaadi vuosien opiskelua.');

INSERT INTO posts (title, content) VALUES ('Tradenomista IT-ammattilaiseksi: Ilkan tarina', 'Kansainvälisen kaupan tradenomiksi valmistunut ja useita vuosia työuraa LVI-alalla rakentanut Ilkka Jokela hyppäsi Academyn kiihdytyskaistalle saatuaan kipinän koodiin. Olin jo päättänyt, että haluan koodata ja kouluttautua IT-alalle. Hain ja pääsinkin yliopistoon lukemaan tietotekniikkaa. Huomasin kuitenkin Academyn, joten en ottanut opiskelupaikkaa vastaan. Olen aina ollut kiinnostunut teknologiasta ja haluan tehdä jotain, mikä on tätä päivää”, Ilkka avaa omaa polkuaan. Muiden academylaisten tyyliin myös Ilkalle halu ja kyky oppia uutta on luontaista. Ilkka painottaakin, että “uuden oppiminen on upeaa, ja varsinkin se fiilis, kun on ihan pihalla. Se samanaikaisesti sekä turhauttaa että antaa nautintoa, koska tietää että nyt oppii varmasti jotakin uutta. Ilkka muistelee jännittäneensä Academyn intensiivistä prässiä enemmän kuin oli syytä. 12 viikkoa meni nopeasti ja uusia oppeja tuli ennalta-arvaamaton määrä. Koulutuksen paras anti meni kuitenkin pelkkää tietoa syvemmälle. Parasta Academyssa oli ehdottomasti porukan yhteishenki sekä mahtavat opettajat. Käteen koulutuksesta jäi ennen kaikkea tieto siitä, että mitä vain voi oppia, kun on halu oppia.');

INSERT INTO posts (title, content) VALUES ('Kaiken takana on koodi – ja sen voi oppia 12 viikossa', 'Miten koodi pyörittää maailmaa? Ja miten sen oppiminen 12 viikon intensiivikoulutuksessa on mahdollista? IT-konsulttina ja -kouluttajana työskentelevä Tommi Teräsvirta kertoo. Tietokoneet ja niiden käyttämä kieli on muuttanut maailmaamme käsittämättömän paljon kohtuullisen pienessä ajassa. Jos kuka tahansa saisi kyydin aikakoneella 30 vuoden takaa nykypäivään, jäisi aikamatkustajan suu taatusti auki monessa arkisessa kohtaamisessa 2019-luvun alkuasukkaan kanssa. Koodi on yksi käytetyimmistä ja arkemme kannalta vaikuttavimmista kielistä. Sen osaamisesta on pelkästään hyötyä ja sen osaajille on työmarkkinoilla jatkuvaa tilausta. Academyn 12 viikon ja vakituisen työpaikan Academic Workin asiakasyrityksen palveluksessa takaavan koodauskoulutusohjelman opettaja Tommi Teräsvirta Sovellolta osaa avata tämän kiehtovan kielen sekä sen oppimisen saloja syvemmin.');

INSERT INTO posts (title, content) VALUES ('Tätä haluat kysyä AW Academysta ja uranvaihdosta', 'Uudenlaisen koulutusmallin saapuminen Suomeen on herättänyt vuosien varrella keskustelua ja kirvoittanut kysymyksiä. Kokosimme tähän blogikirjoitukseen muutamia verkkokeskusteluissa (mm. Helsingin Sanomat, Taloussanomat) esiintyneitä kysymyksiä ja vastauksia.');
