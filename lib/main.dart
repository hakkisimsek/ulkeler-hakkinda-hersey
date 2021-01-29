import 'package:beautiful_list/model/lesson.dart';
import 'package:flutter/material.dart';
import 'package:beautiful_list/detail_page.dart';
import 'package:flutter/services.dart';
import 'package:firebase_admob/firebase_admob.dart';
const String testDevice = 'd9ba85f9ec3095ec ';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return new MaterialApp(
      title: 'Ülkeler',
      theme: new ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0), fontFamily: 'Arial'),
      home: new ListPage(title: 'Ülkeler'),
      // home: DetailPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
 String reklam="ca-app-pub-2006076682262500/1581364465";
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    
    keywords: <String>['Game', 'Mario'],
  );

  List countries;


InterstitialAd _interstitialAd;

  InterstitialAd createInterstitialAd() {
    
    return InterstitialAd(
    
        adUnitId: reklam,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("IntersttialAd $event");
        });
  }


  @override
  void initState() {
   
     FirebaseAdMob.instance.initialize(appId: "ca-app-pub-2006076682262500~3086017824");
    
    _interstitialAd = createInterstitialAd()
      ..load()
      ..show();
    countries = getCountries();
    super.initState();
  }

  @override
  void dispose() {
    _interstitialAd.dispose();
    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Country country) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Image.asset(country.flag, package: 'country_icons',width: 40),
          ),
          title: Text(
            country.countryName,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
            //subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

       
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(country: country)));
          },
        );

    Card makeCard(Country country) => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: makeListTile(country),
          ),
        );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: countries.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(countries[index]);
        },
      ),
    );

   
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text(widget.title),
     
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      body: makeBody,
     
    );
  }
}

List getCountries() {
  return [
      

Country(
        countryName: "Afganistan",
        capital: "Kabil",
        language: "Darice, Peştuca",
        money: "Afgani",
        population: "31,822,848",
        area: "652.864 km2",
        code: "+93",
        gmt: "UTC +4:30",
        domain: ".af",
        flag: "icons/flags/png/af.png",
        ),

Country(
        countryName: "Almanya",
        capital: "Berlin",
        language: "Almanca",
        money: "Euro",
        population: "83.020.000",
        area: "357.578 km2",
        code: "+49",
        gmt: "UTC +1 (CET)",
        domain: ".de",
        flag: "icons/flags/png/de.png",
        ),

Country(
        countryName: "Amerika Birleşik Devletleri",
        capital: "Washington, DC",
        language: "İngilizce",
        money: "Amerikan Doları",
        population: "327.167.434",
        area: "9.525.067 km2",
        code: "+1",
        gmt: "UTC -4",
        domain: ".us",
        flag: "icons/flags/png/us.png",
        ),

Country(
        countryName: "Andorra",
        capital: "Andorra La Vella",
        language: "Katalanca",
        money: "Euro",
        population: "77.000",
        area: "46.763 km2",
        code: "+376",
        gmt: "UTC +1 (OAZD)",
        domain: ".ad",
        flag: "icons/flags/png/ad.png",
        ),


Country(
        countryName: "Angola",
        capital: "Luanda",
        language: "Portekizce",
        money: "Kwanza (AOA)",
        population: "24,383,301",
        area: "1.246.700 km2",
        code: "+244",
        gmt: "UTC +1 (WAT)",
        domain: ".ao",
        flag: "icons/flags/png/ao.png",
        ),

Country(
        countryName: "Antigua Ve Barbuda",
        capital: "Saint John’s",
        language: "İngilizce",
        money: "Doğu Karayip Doları (XCD)",
        population: "92.738",
        area: "440 km2",
        code: "+1-268",
        gmt: "UTC -4 (AST)",
        domain: ".ag",
        flag: "icons/flags/png/ag.png",
        ),

Country(
        countryName: "Arjantin",
        capital: "Buenos Aires",
        language: "İspanyolca",
        money: "Peso (ARS)",
        population: "43.413.000",
        area: "2.780.400 km2",
        code: "+54",
        gmt: "UTC -3",
        domain: ".ar",
        flag: "icons/flags/png/ar.png",
        ),

Country(
        countryName: "Arnavutluk",
        capital: "Tiran",
        language: "Arnavutça, İtalyanca, Yunanca",
        money: "Lek (ALL)",
        population: "2.886.026",
        area: "28.748 km2",
        code: "355",
        gmt: "UTC +1 (OAZD)",
        domain: ".al",
        flag: "icons/flags/png/al.png",
        ),

Country(
        countryName: "Avustralya",
        capital: "Canberra",
        language: "İngilizce",
        money: "Avustralya Doları (AUD)",
        population: "24.140.800",
        area: "7.692.024 km2",
        code: "+61",
        gmt: "UTC +8",
        domain: ".au",
        flag: "icons/flags/png/au.png",
        ),


Country(
        countryName: "Avusturya",
        capital: "Viyana",
        language: "Avusturya Almancası",
        money: "Euro",
        population: "8.838.171",
        area: "83.879 km2",
        code: "43",
        gmt: "UTC +1 (OAZD)",
        domain: ".at",
        flag: "icons/flags/png/at.png",
        ),

Country(
        countryName: "Azerbaycan",
        capital: "Bakü",
        language: "Azerice",
        money: "Manat (AZN)",
        population: "10.027.874",
        area: "86.600 km2",
        code: "+994",
        gmt: "UTC +4",
        domain: ".az",
        flag: "icons/flags/png/az.png",
        ),

Country(
        countryName: "Bahamalar",
        capital: "Nassau",
        language: "İngilizce",
        money: "Bahama Doları (BSD)",
        population: "391.232",
        area: "13.878 km2",
        code: "+1-242",
        gmt: "UTC -5 (EST)",
        domain: ".bs",
        flag: "icons/flags/png/bs.png",
        ),

Country(
        countryName: "Bahreyn",
        capital: "Manama",
        language: "Arapça",
        money: "Bahreyn Dinarı (BHD)",
        population: "1.343.000",
        area: "765 km2",
        code: "973",
        gmt: "UTC +3 ",
        domain: ".bh",
        flag: "icons/flags/png/bh.png",
        ),

Country(
        countryName: "Bangladeş",
        capital: "Dakka",
        language: "Bengalce",
        money: "Taka (BDT)",
        population: "86.145.478",
        area: "147.570 km2",
        code: "880",
        gmt: "UTC +6 (BST)",
        domain: ".bd",
        flag: "icons/flags/png/bd.png",
        ),


Country(
        countryName: "Barbados",
        capital: "Bridgetown",
        language: "İngilizce",
        money: "Barbados Doları (BBD)",
        population: "277.821",
        area: "439 km2",
        code: "+1",
        gmt: "UTC -4 (Doğu Karayipler)",
        domain: ".bb",
        flag: "icons/flags/png/bb.png",
        ),

Country(
        countryName: "Batı Sahra",
        capital: "Layun",
        language: "Arapça, İspanyolca",
        money: "Moritanya Uyigasi",
        population: "570.866",
        area: "266.000 km2",
        code: "212",
        gmt: "+0",
        domain: ".eh",
        flag: "icons/flags/png/eh.png",
        ),

Country(
        countryName: "Belçika",
        capital: "Brüksel",
        language: "Felemenkçe, Fransızca, Almanca",
        money: "Euro",
        population: "11.007.020",
        area: "30.528 km2",
        code: "32",
        gmt: "UTC +1 (OAZD)",
        domain: ".be",
        flag: "icons/flags/png/be.png",
        ),

Country(
        countryName: "Belize",
        capital: "Belmopan",
        language: "İngilizce",
        money: "Belize Doları (BZD)",
        population: "400.011",
        area: "23.201 km2",
        code: "501",
        gmt: "UTC -6 (Central Time)",
        domain: ".bz",
        flag: "icons/flags/png/bz.png",
        ),

Country(
        countryName: "Benin",
        capital: "Porto-Novo",
        language: "Fransızca",
        money: "CFA Frangı (XOF)",
        population: "9.983.884",
        area: "112.622 km2",
        code: "229",
        gmt: "UTC + 01:00",
        domain: ".bj",
        flag: "icons/flags/png/bj.png",
        ),


Country(
        countryName: "Beyaz Rusya (Belarus)",
        capital: "Minsk",
        language: "Belarusça, Rusça",
        money: "Belarus Rublesi (BYR)",
        population: "9.498.700",
        area: "207.595 km2",
        code: "375",
        gmt: "UTC +2 (DAZD)",
        domain: ".by",
        flag: "icons/flags/png/by.png",
        ),

Country(
        countryName: "Bhutan",
        capital: "Thimphu",
        language: "Dzongka",
        money: "Ngultrum (BTM)",
        population: "753.947",
        area: "38.394 km2",
        code: "975",
        gmt: "UTC + 6:00 (BTT)",
        domain: ".bt",
        flag: "icons/flags/png/bt.png",
        ),

Country(
        countryName: "Birleşik Arap Emirlikleri",
        capital: "Abu Dabi",
        language: "Arapça",
        money: "BAE Dirhemi (AED)",
        population: "9.346.000",
        area: "83.600 km2",
        code: "+971",
        gmt: "UTC +4 (GST+4)",
        domain: ".ae",
        flag: "icons/flags/png/ae.png",
        ),

Country(
        countryName: "Bolivya",
        capital: "Sucre",
        language: "İspanyolca, Aymaraca, Guaraní dili, Mossi, Kayavaya Dili, Araona",
        money: "Boliviano (BOB)",
        population: "11.217.865",
        area: "1.098.581 km2",
        code: "591",
        gmt: "UTC -4",
        domain: ".bo",
        flag: "icons/flags/png/bo.png",
        ),

Country(
        countryName: "Bosna Hersek",
        capital: "Saray Bosna",
        language: "Boşnakça, Sırpça, Hırvatça",
        money: "Konvertibıl Mark (BAM)",
        population: "3,531,159",
        area: "51.197 km2",
        code: "387",
        gmt: "UTC +1 (OAZD)",
        domain: ".ba",
        flag: "icons/flags/png/ba.png",
        ),


Country(
        countryName: "Botsvana",
        capital: "Gaborone",
        language: "İngilizce, Tsvana",
        money: "Pula (BWP)",
        population: "2.254.000",
        area: "582.000 km2",
        code: "+267",
        gmt: "UTC +2",
        domain: ".bw",
        flag: "icons/flags/png/bw.png",
        ),

Country(
        countryName: "Brezilya",
        capital: "Brasilia",
        language: "Portekizce",
        money: "Real (BRL)",
        population: "206,440,850",
        area: "8.515.767 km2",
        code: "+55",
        gmt: "UTC -2 ile -5 (BRT)",
        domain: ".br",
        flag: "icons/flags/png/br.png",
        ),

Country(
        countryName: "Brunei",
        capital: "Bandar Seri",
        language: "Malayca",
        money: "Brunei Doları (BND)",
        population: "332.844",
        area: "5.765 km2",
        code: "+673",
        gmt: "UTC +8",
        domain: ".bn",
        flag: "icons/flags/png/bn.png",
        ),

Country(
        countryName: "Bulgaristan",
        capital: "Sofya",
        language: "Bulgarca",
        money: "Lev (BGN)",
        population: "7.050.034",
        area: "110.994 km2",
        code: "+359",
        gmt: "UTC +2 (DAZD)",
        domain: ".bg",
        flag: "icons/flags/png/bg.png",
        ),

Country(
        countryName: "Burkina Faso",
        capital: "Ouagadougou",
        language: "Fransızca",
        money: "Batı Afrika CFA frangı (XOF)",
        population: "14.017.262",
        area: "274.200  km2",
        code: "226",
        gmt: "UTC +0 ",
        domain: ".bf",
        flag: "icons/flags/png/bf.png",
        ),


Country(
        countryName: "Burundi",
        capital: "Gitega",
        language: "Kirundi, Fransızca",
        money: "Burundi frangı (FBu) ",
        population: "8,053,574",
        area: "27.834 km2",
        code: "257",
        gmt: "UTC + (CAT)",
        domain: ".bi",
        flag: "icons/flags/png/bi.png",
        ),

Country(
        countryName: "Cezayir",
        capital: "Cezayir",
        language: "Arapça, Berber Dilleri",
        money: "Cezayir Dinarı",
        population: "37.900.000",
        area: "2.381.741 km2",
        code: "213",
        gmt: "UTC+1",
        domain: ".dz",
        flag: "icons/flags/png/dz.png",
        ),

Country(
        countryName: "Cibuti",
        capital: "Cibuti",
        language: "Arapça, Fransızca",
        money: "Frank (DJF)",
        population: "476.000",
        area: "23.200 km2",
        code: "253",
        gmt: "UTC +3",
        domain: ".dj",
        flag: "icons/flags/png/dj.png",
        ),

Country(
        countryName: "Çad",
        capital: "NDjamena",
        language: "Fransızca, Arapça",
        money: "CFA franc (XAF)",
        population: "13,670,084",
        area: "1.284.000 km2",
        code: "235",
        gmt: "UTC +1 (WAT)",
        domain: ".td",
        flag: "icons/flags/png/td.png",
        ),

Country(
        countryName: "Çek Cumhuriyeti",
        capital: "Prag",
        language: "Çekçe",
        money: "Çek Korunası (CZK)",
        population: "10,637,794",
        area: "78,866 km2",
        code: "420",
        gmt: "UTC +1 (OAZD)",
        domain: ".cz",
        flag: "icons/flags/png/cz.png",
        ),


Country(
        countryName: "Çin",
        capital: "Pekin",
        language: "Çince",
        money: "Renminbi (CNY) ",
        population: "1.414.800.392",
        area: "9.596.961 km2",
        code: "+86",
        gmt: "UTC +8 ",
        domain: ".cn",
        flag: "icons/flags/png/cn.png",
        ),


Country(
        countryName: "Danimarka",
        capital: "Kopenhag",
        language: "Danca",
        money: "Danimarka Kronu (DKK)",
        population: "5.806.000",
        area: "42.933km2",
        code: "45",
        gmt: "UTC +1 (OAZD)",
        domain: ".dk",
        flag: "icons/flags/png/dk.png",
        ),

Country(
        countryName: "Doğu Timor",
        capital: "Dili",
        language: "Tetum, Portekizce",
        money: "Amerikan Doları (USD)",
        population: "1.268.000 ",
        area: "15.006 km2",
        code: "670",
        gmt: "UTC +9",
        domain: ".tl",
        flag: "icons/flags/png/tl.png",
        ),

Country(
        countryName: "Dominik Cumhuriyeti",
        capital: "Santo Domingo",
        language: "İspanyolca",
        money: "Dominik Pesosu (DOP)ı",
        population: "9.478.612",
        area: "48.671 km2",
        code: "+1-809   +1-829",
        gmt: "UTC -4 (Atlantik)",
        domain: ".do",
        flag: "icons/flags/png/do.png",
        ),


Country(
        countryName: "Dominika",
        capital: "Roseau",
        language: "İngilizce",
        money: "Doğu Karayip Doları (XCD)",
        population: "71.293",
        area: "754 km2",
        code: "+1-767",
        gmt: "UTC -4",
        domain: ".dm",
        flag: "icons/flags/png/dm.png",
        ),

Country(
        countryName: "Ekvador",
        capital: "Quito",
        language: "İspanyolca",
        money: "Amerikan Doları (USD)",
        population: "16.940.500",
        area: "283.560 km2",
        code: "+593",
        gmt: "UTC -5",
        domain: ".ec",
        flag: "icons/flags/png/ec.png",
        ),

Country(
        countryName: "Ekvator Ginesi",
        capital: "Malabo",
        language: "İspanyolca, Portekizce, Fransızca",
        money: "Central African CFA franc (XAF)",
        population: "1.309.000",
        area: "28.050 km2",
        code: "240",
        gmt: "UTC +1 (WAT)",
        domain: ".gq",
        flag: "icons/flags/png/gq.png",
        ),

Country(
        countryName: "El Salvador",
        capital: "San Salvador",
        language: "İspanyolca",
        money: "Amerikan Doları (USD)",
        population: "5.744.113",
        area: "21.042 km2",
        code: "+503",
        gmt: "UTC -6",
        domain: ".sv",
        flag: "icons/flags/png/sv.png",
        ),

Country(
        countryName: "Endonezya",
        capital: "Cakarta",
        language: "Endonezce",
        money: "Endonezya rupiahı (IDR)",
        population: "255.993.674",
        area: "1.904.569 km2",
        code: "+62",
        gmt: "UTC +7",
        domain: ".id",
        flag: "icons/flags/png/id.png",
        ),


Country(
        countryName: "Eritre",
        capital: "Asmara",
        language: "Arapça, İngilizce, Tigrinyaca",
        money: "Nakfa (ERN)",
        population: "5.291.370",
        area: "117.598 km2",
        code: "291",
        gmt: "UTC +3 (EAT)",
        domain: ".er",
        flag: "icons/flags/png/er.png",
        ),

Country(
        countryName: "Ermenistan",
        capital: "Erivan",
        language: "Ermenice",
        money: "Ermeni Dramı (AMD)",
        population: "2.965.000",
        area: "29.743 km2",
        code: "374",
        gmt: "UTC +4 ",
        domain: ".am",
        flag: "icons/flags/png/am.png",
        ),

Country(
        countryName: "Estonya",
        capital: "Tallinn",
        language: "Estonca",
        money: "Euro",
        population: "1.370.052",
        area: "45.227 km2",
        code: "372",
        gmt: "UTC +2 (DAZD)",
        domain: ".ee",
        flag: "icons/flags/png/ee.png",
        ),

Country(
        countryName: "Etiyopya",
        capital: "Addis Ababa",
        language: "Amharca",
        money: "Birr (ETB)",
        population: "108.853.268 ",
        area: "1.104.300 km2",
        code: "+251",
        gmt: "UTC +3",
        domain: ".et",
        flag: "icons/flags/png/et.png",
        ),

Country(
        countryName: "Fas",
        capital: "Rabat",
        language: "Arapça, Berberi",
        money: "Fas Dirhemi (MAD)",
        population: "35.740.000",
        area: "710.850 km2",
        code: "212",
        gmt: "UTC +0 (WET)",
        domain: ".ma",
        flag: "icons/flags/png/ma.png",
        ),


Country(
        countryName: "Fiji",
        capital: "Suva",
        language: "İngilizce Fijice, Hindi",
        money: "Fiji Doları (FJD)",
        population: "883.483",
        area: "18.274 km2",
        code: "+679",
        gmt: "UTC +12",
        domain: ".fj",
        flag: "icons/flags/png/fj.png",
        ),

Country(
        countryName: "Fildişi Sahili",
        capital: "Yamoussoukro",
        language: "Fransızca",
        money: "Batı Afrika CFA frangı (XOF)",
        population: "22.671.331",
        area: "322.463 km2",
        code: "+225",
        gmt: "UTC +0 (GMT)",
        domain: ".ci",
        flag: "icons/flags/png/ci.png",
        ),

Country(
        countryName: "Filipinler",
        capital: "Manila",
        language: "Filipince, İngilizce",
        money: "Filipinler Pezosu",
        population: "88.574.614",
        area: "300.000 km2",
        code: "+63",
        gmt: "UTC +8 (PST)",
        domain: ".ph",
        flag: "icons/flags/png/ph.png",
        ),

Country(
        countryName: "Filistin",
        capital: "Ramallah, Doğu Kudüs",
        language: "Arapça",
        money: "Yeni İsrail Şekeli",
        population: "5.052.000 ",
        area: "6.220 km2",
        code: "+970",
        gmt: "UTC +2",
        domain: ".ps",
        flag: "icons/flags/png/ps.png",
        ),

Country(
        countryName: "Finlandiya",
        capital: "Helsinki",
        language: "Fince, İsveççe, Laponca",
        money: "Euro",
        population: "5.518.000",
        area: "338.424 km2",
        code: "358",
        gmt: "UTC +2 (DAZD)",
        domain: ".fi",
        flag: "icons/flags/png/fi.png",
        ),

Country(
        countryName: "Fransa",
        capital: "Paris",
        language: "Fransızca",
        money: "Euro",
        population: "67.022.000",
        area: "640.679 km2",
        code: "33",
        gmt: "UTC +1 (CET)",
        domain: ".fr",
        flag: "icons/flags/png/fr.png",
        ),

Country(
        countryName: "Gabon",
        capital: "Libreville",
        language: "Fransızca",
        money: "Orta Afrika CFA frangı (XAF)",
        population: "2.119.000",
        area: "267.668 km2",
        code: "241",
        gmt: "UTC +1 (CAT)",
        domain: ".ga",
        flag: "icons/flags/png/ga.png",
        ),

Country(
        countryName: "Gambiya",
        capital: "Banjul",
        language: "İngilizce",
        money: "Dalasi (GMD) ",
        population: "2.280.000",
        area: "11.295 km2",
        code: "220",
        gmt: "GMT",
        domain: ".gm",
        flag: "icons/flags/png/gm.png",
        ),

Country(
        countryName: "Gana",
        capital: "Accra",
        language: "İngilizce",
        money: "Cedi (GHS) ",
        population: "24.658.823",
        area: "238.537 km2",
        code: "233",
        gmt: "UTC0 (GMT)",
        domain: ".gh",
        flag: "icons/flags/png/gh.png",
        ),

Country(
        countryName: "Gine",
        capital: "Conakry",
        language: "Fransızca",
        money: "Gine Frangı (CNF)",
        population: "10.628.972",
        area: "245.836 km2",
        code: "+224",
        gmt: "UTC +0",
        domain: ".gn",
        flag: "icons/flags/png/gn.png",
        ),



Country(
        countryName: "Gine Bassau",
        capital: "Bissau",
        language: "Portekizce",
        money: "Batı Afrika CFA frangı (XOF)",
        population: "1.449.230",
        area: "36.125 km2",
        code: "245",
        gmt: "UTC +0 (GMT)",
        domain: ".gw",
        flag: "icons/flags/png/gw.png",
        ),

Country(
        countryName: "Grenada",
        capital: "Saint George’s",
        language: "İngilizce",
        money: "Doğu Karayip Doları (XCD)",
        population: "111.454",
        area: "345.500 km2",
        code: "1-473",
        gmt: "UTC -4:00",
        domain: ".gd",
        flag: "icons/flags/png/gd.png",
        ),

Country(
        countryName: "Guyana",
        capital: "Georgetown",
        language: "İngilizce",
        money: "Guyana Doları (GYD)",
        population: "751.223",
        area: "214.969  km2",
        code: "592",
        gmt: "UTC -4",
        domain: ".gy",
        flag: "icons/flags/png/gy.png",
        ),

Country(
        countryName: "Guatemala",
        capital: "Guatemala",
        language: "İspanyolca",
        money: "Quetzal",
        population: "17.250.000",
        area: "108.889 km2",
        code: "502",
        gmt: "UTC -6",
        domain: ".gt",
        flag: "icons/flags/png/gt.png",
        ),

Country(
        countryName: "Güney Afrika Cumhuriyeti",
        capital: "Pretoria, Bloemfontein, Cape Town",
        language: "Afrikaanca, Güney Ndebele dili, Güney Sotho dili, İngilizce, Kuzey Sotho dili, Swati dili, Tsonga dili, Tswana dili, Venda dili, Xhosa dili, Zuluca",
        money: "Rand (ZAR)",
        population: "51.770.560",
        area: "1.219.912 km2",
        code: "+27",
        gmt: "UTC +2 (SAST)",
        domain: ".za",
        flag: "icons/flags/png/za.png",
        ),

Country(
        countryName: "Güney Kore",
        capital: "Seul",
        language: "Korece",
        money: "Kore Cumhuriyeti Wonu",
        population: "51.709.098",
        area: "100.363 km2",
        code: "82",
        gmt: "UTC +9 (Kore Standart Zamanı)",
        domain: ".kr",
        flag: "icons/flags/png/kr.png",
        ),



Country(
        countryName: "Güney Sudan",
        capital: "Cuba",
        language: "İngilizce",
        money: "Güney Sudan Lirası",
        population: "8.260.490",
        area: "619.745 km2",
        code: "+211",
        gmt: "UTC +3 (Doğu Afrika Zaman Dilimi)",
        domain: ".ss",
        flag: "icons/flags/png/ss.png",
        ),

Country(
        countryName: "Gürcistan",
        capital: "Tiflis",
        language: "Gürcüce",
        money: "Lari (GEL)",
        population: "3.731.000",
        area: "69.700 km2",
        code: "995",
        gmt: "UTC +4",
        domain: ".ge",
        flag: "icons/flags/png/ge.png",
        ),

Country(
        countryName: "Haiti",
        capital: "Port-au-Prince",
        language: "Fransızca, Haiti Kreyolu",
        money: "Gourde (HTG)",
        population: "11.120.000",
        area: "27.750 km2",
        code: "509",
        gmt: "UTC -5:00",
        domain: ".ht",
        flag: "icons/flags/png/ht.png",
        ),



Country(
        countryName: "Hırvatistan",
        capital: "Zagreb",
        language: "Hırvatça",
        money: "Kuna (HRK)",
        population: "4.284.889",
        area: "56.594 km2",
        code: "385",
        gmt: "UTC +1 (OAZD)",
        domain: ".hr",
        flag: "icons/flags/png/hr.png",
        ),

Country(
        countryName: "Hindistan",
        capital: "Yeni Delhi",
        language: "Hintçe, İngilizce",
        money: "Hindistan Rupisi",
        population: "1.352.754.507",
        area: "3.287.000 km2",
        code: "91",
        gmt: "UTC +5:30 (HSZD)",
        domain: ".in",
        flag: "icons/flags/png/in.png",
        ),

Country(
        countryName: "Hollanda",
        capital: "Amsterdam",
        language: "Felemenkçe",
        money: "Euro, Amerikan Doları",
        population: "17.280.000",
        area: "41.528 km2",
        code: "31",
        gmt: "UTC +1 (OAZD)",
        domain: ".nl",
        flag: "icons/flags/png/nl.png",
        ),

Country(
        countryName: "Honduras",
        capital: "Tegucigalpa",
        language: "İspanyolca",
        money: "Lempira (HNL)",
        population: "6.975.204",
        area: "112.492 km2",
        code: "504",
        gmt: "UTC -6 (CST)",
        domain: ".hn",
        flag: "icons/flags/png/hn.png",
        ),

Country(
        countryName: "Irak",
        capital: "Bağdat",
        language: "Arapça, Kürtçe",
        money: "Irak Dinarı",
        population: "37.056.169",
        area: "437.072 km2",
        code: "+964",
        gmt: "UTC +3 (ASZD)",
        domain: ".iq",
        flag: "icons/flags/png/iq.png",
        ),




Country(
        countryName: "İngiltere (Birleşik Krallık)",
        capital: "Londra",
        language: "İngilizce",
        money: "Pound Sterling",
        population: "66.040.229",
        area: "242.495 km2",
        code: "+44",
        gmt: "UTC +0 (GMT)",
        domain: ".uk",
        flag: "icons/flags/png/gb-eng.png",
        ),

Country(
        countryName: "İran",
        capital: "Tahran",
        language: "Farsça",
        money: "İran Riyali",
        population: "82.531.700",
        area: "1.648.195 km2",
        code: "98",
        gmt: "UTC +3:30 (IRST)",
        domain: ".ir",
        flag: "icons/flags/png/ir.png",
        ),

Country(
        countryName: "İrlanda",
        capital: "Dublin",
        language: "İrlandaca, İngilizce",
        money: "Euro",
        population: "4.904.000",
        area: "70.273 km2",
        code: "353",
        gmt: "UTC +0 (WET)",
        domain: ".ie",
        flag: "icons/flags/png/ie.png",
        ),

Country(
        countryName: "İspanya",
        capital: "Madrid",
        language: "İspanyolca",
        money: "Euro",
        population: "46.733.038",
        area: "505.992 km2",
        code: "34",
        gmt: "UTC +1 (OAZD)",
        domain: ".es",
        flag: "icons/flags/png/es.png",
        ),

Country(
        countryName: "İsrail",
        capital: "Kudüs",
        language: "İbranice",
        money: "Yeni Şekel (ILS)",
        population: "9.131.220",
        area: "22.145 km2",
        code: "972",
        gmt: "UTC +2 (İZD)",
        domain: ".il",
        flag: "icons/flags/png/il.png",
        ),




Country(
        countryName: "İsveç",
        capital: "Stockholm",
        language: "İsveççe",
        money: "İsveç Kronu (SEK)",
        population: "10.238.627",
        area: "450.295 km2",
        code: "46",
        gmt: "UTC +1 (OAZD)",
        domain: ".se",
        flag: "icons/flags/png/se.png",
        ),

Country(
        countryName: "İsviçre",
        capital: "Bern",
        language: "Almanca, Fransızca, İtalyanca, Romanşça",
        money: "İsviçre Frangı (CHF)",
        population: "8.000.000",
        area: "41.285 km2",
        code: "+41",
        gmt: "UTC +1 (OAZD)",
        domain: ".ch",
        flag: "icons/flags/png/ch.png",
        ),

Country(
        countryName: "İtalya",
        capital: "Roma",
        language: "İtalyanca",
        money: "Euro",
        population: "60.360.000",
        area: "301.338 km2",
        code: "+39",
        gmt: "UTC +1 (OAZD)",
        domain: ".it",
        flag: "icons/flags/png/it.png",
        ),

Country(
        countryName: "İzlanda",
        capital: "Reykjavik",
        language: "İzlandaca",
        money: "İzlanda Kronası",
        population: "358.780",
        area: "103.000 km2",
        code: "+354",
        gmt: "UTC +0 (GMT)",
        domain: ".is",
        flag: "icons/flags/png/is.png",
        ),

Country(
        countryName: "Jamaika",
        capital: "Kingston",
        language: "İngilizce",
        money: "Jamaika Doları",
        population: "2.935.000",
        area: "10.992 km2",
        code: "+1-876",
        gmt: "UTC -5)",
        domain: ".jm",
        flag: "icons/flags/png/jm.png",
        ),




Country(
        countryName: "Japonya",
        capital: "Tokyo",
        language: "Japonca",
        money: "Yen",
        population: "126.317.000",
        area: "377.973 km2",
        code: "+81",
        gmt: "UTC +9:00 (JSZ)",
        domain: ".jp",
        flag: "icons/flags/png/jp.png",
        ),

Country(
        countryName: "Kamboçya",
        capital: "Phnom Penh",
        language: "Khmerce",
        money: "Riel",
        population: "13.388.910",
        area: "181.035 km2",
        code: "855",
        gmt: "UTC +7",
        domain: ".kh",
        flag: "icons/flags/png/kh.png",
        ),

Country(
        countryName: "Kamerun",
        capital: "Yaounde",
        language: "Fransızca, İngilizce",
        money: "Orta Afrika CFA Frangı (XAF)",
        population: "17.463.836",
        area: "475.442 km2",
        code: "237",
        gmt: "UTC +1 (WAT)",
        domain: ".cm",
        flag: "icons/flags/png/cm.png",
        ),

Country(
        countryName: "Kanada",
        capital: "Ottawa",
        language: "İngilizce, Fransızca",
        money: "Kanada Doları (CAD)",
        population: "33.476.688",
        area: "9.984.670 km2",
        code: "+1",
        gmt: "UTC -3.5 to -8",
        domain: ".ca",
        flag: "icons/flags/png/ca.png",
        ),

Country(
        countryName: "Karadağ",
        capital: "Podgorica",
        language: "Karadağca, Sırpça",
        money: "Euro",
        population: "619.800",
        area: "13.812 km2",
        code: "+382",
        gmt: "UTC +1 (OAZD)",
        domain: ".me",
        flag: "icons/flags/png/me.png",
        ),




Country(
        countryName: "Katar",
        capital: "Doha",
        language: "Arapça",
        money: "Katar Riyali",
        population: "2.155.446",
        area: "11.586 km2",
        code: "974",
        gmt: "UTC +3 (AST)",
        domain: ".qa",
        flag: "icons/flags/png/qa.png",
        ),

Country(
        countryName: "Kazakistan",
        capital: "Nur-Sultan",
        language: "Kazakça, Rusça",
        money: "Tenge (KZT)",
        population: "16.009.597",
        area: "2.724.900 km2",
        code: "+7-6xx",
        gmt: "UTC +5/+6 (Batı/Doğu)",
        domain: ".kz",
        flag: "icons/flags/png/kz.png",
        ),

Country(
        countryName: "Kenya",
        capital: "Nairobi",
        language: "Svahili, İngilizce",
        money: "Kenya Şilini",
        population: "38.610.097",
        area: "580.367 km2",
        code: "+254",
        gmt: "UTC +3 (EAT)",
        domain: ".ke",
        flag: "icons/flags/png/ke.png",
        ),

Country(
        countryName: "Kırgızistan",
        capital: "Bişkek",
        language: "Kırgızca, Rusça",
        money: "Som (KGS)",
        population: "4.896.100",
        area: "199.951 km2",
        code: "+996",
        gmt: "UTC +6 (KGT)",
        domain: ".kg",
        flag: "icons/flags/png/kg.png",
        ),

Country(
        countryName: "Kıbrıs Cumhuriyeti",
        capital: "Lefkoşa",
        language: "Yunanca, Türkçe",
        money: "Euro",
        population: "803.147",
        area: "9.251 km2",
        code: "357",
        gmt: "UTC +2 (DAZD)",
        domain: ".cy",
        flag: "icons/flags/png/cy.png",
        ),




Country(
        countryName: "Kiribati",
        capital: "Güney Tarava",
        language: "İngilizce, Kiribatice",
        money: "Kiribati Doları",
        population: "92.533",
        area: "811 km2",
        code: "686",
        gmt: "UTC +12, +13, +14",
        domain: ".ki",
        flag: "icons/flags/png/ki.png",
        ),

Country(
        countryName: "Kolombiya",
        capital: "Bogota",
        language: "İspanyolca",
        money: "Kolombiya Pesosu",
        population: "42.888.592",
        area: "1.141.748 km2",
        code: "+57",
        gmt: "UTC -5",
        domain: ".co",
        flag: "icons/flags/png/co.png",
        ),

Country(
        countryName: "Komorlar",
        capital: "Moroni",
        language: "Komorca, Arapça, Fransızca",
        money: "Komor Frankı",
        population: "832.322",
        area: "2.034 km2",
        code: "+269",
        gmt: "UTC +3 (EAT)",
        domain: ".km",
        flag: "icons/flags/png/km.png",
        ),

Country(
        countryName: "Kongo Cumhuriyeti",
        capital: "Brazzaville",
        language: "Fransızca",
        money: "Orta Afrika CFA Frangı (XAF)",
        population: "5.244.000",
        area: "342.000 km2",
        code: "242",
        gmt: "UTC +1 (WAT)",
        domain: ".cg",
        flag: "icons/flags/png/cg.png",
        ),

Country(
        countryName: "Kongo Demokratik Cumhuriyeti",
        capital: "Kinşasa",
        language: "Fransızca",
        money: "Kongo Frangı (CDF)",
        population: "29.648.833",
        area: "2.344.858 km2",
        code: "+243",
        gmt: "UTC +1, +2 (WAT,CAT)",
        domain: ".cd",
        flag: "icons/flags/png/cd.png",
        ),




Country(
        countryName: "Kosova",
        capital: "Priştine",
        language: "Arnavutça, Sırpça",
        money: "Euro",
        population: "1.739.825",
        area: "10.877 km2",
        code: "+383",
        gmt: "UTC +1 (OAZD)",
        domain: ".ko",
        flag: "icons/flags/png/xk.png",
        ),

Country(
        countryName: "Kosta Rika",
        capital: "San Jose",
        language: "İspanyolca",
        money: "Colon (CRK)",
        population: "4.301.712",
        area: "51.100km2",
        code: "+",
        gmt: "UTC -6",
        domain: ".cr",
        flag: "icons/flags/png/cr.png",
        ),

Country(
        countryName: "Kuveyt",
        capital: "Kuveyt",
        language: "Arapça",
        money: "Kuveyt Dinarı (KWD)",
        population: "4.137.000",
        area: "17.820 km2",
        code: "965",
        gmt: "UTC +3 (AST)",
        domain: ".kw",
        flag: "icons/flags/png/kw.png",
        ),

Country(
        countryName: "Kuzey Kıbrıs Türk Cumhuriyeti",
        capital: "Kuzey Lefkoşa",
        language: "Türkçe",
        money: "Türk Lirası",
        population: "374.299",
        area: "3.355 km2",
        code: "+90 392",
        gmt: "UTC +2 (DAZD)",
        domain: ".ct.tr",
        flag: "icons/flags/png/cy.png",
        ),

Country(
        countryName: "Kuzey Kore",
        capital: "Pyongyang",
        language: "Korece",
        money: "Kore Halkın Wonu",
        population: "24.052.231",
        area: "120.540 km2",
        code: "+850",
        gmt: "UTC +9 (Pyongyang Zamanı)",
        domain: ".kp",
        flag: "icons/flags/png/kp.png",
        ),




Country(
        countryName: "Küba Cumhuriyeti",
        capital: "Havana",
        language: "İspanyolca",
        money: "Küba Pezosu",
        population: "11.210.064",
        area: "109.884 km2",
        code: "+53",
        gmt: "UTC -5",
        domain: ".cu",
        flag: "icons/flags/png/cu.png",
        ),

Country(
        countryName: "Laos",
        capital: "Vientiane",
        language: "Laoca",
        money: "Kip (LAK)",
        population: "4.574.848",
        area: "236.800 km2",
        code: "856",
        gmt: "UTC +7",
        domain: ".la",
        flag: "icons/flags/png/la.png",
        ),

Country(
        countryName: "Lesotho",
        capital: "Maseru",
        language: "Sesotho, İngilizce",
        money: "Loti ve Rand",
        population: "1.876.633",
        area: "30.355 km2",
        code: "+266",
        gmt: "UTC +2",
        domain: ".ls",
        flag: "icons/flags/png/ls.png",
        ),

Country(
        countryName: "Letonya",
        capital: "Riga",
        language: "Letonca",
        money: "Euro",
        population: "1.920.000",
        area: "64.589 km2",
        code: "371",
        gmt: "UTC +2 (DAZD)",
        domain: ".lv",
        flag: "icons/flags/png/lv.png",
        ),

Country(
        countryName: "Liberya",
        capital: "Monrovia",
        language: "İngilizce",
        money: "Liberya Doları",
        population: "4.819.000",
        area: "111.369 km2",
        code: "231",
        gmt: "GMT",
        domain: ".lr",
        flag: "icons/flags/png/lr.png",
        ),




Country(
        countryName: "Libya",
        capital: "Trablus",
        language: "Arapça",
        money: "Libya Dinarı",
        population: "5.670.688",
        area: "1.759.541 km2",
        code: "218",
        gmt: "UTC +2 (DAZD)",
        domain: ".ly",
        flag: "icons/flags/png/ly.png",
        ),

Country(
        countryName: "Lihtenştayn",
        capital: "Vaduz",
        language: "Almanca",
        money: "İsviçre Frankı (CHF)",
        population: "32.426",
        area: "160 km2",
        code: "423",
        gmt: "UTC +1 (OAZD)",
        domain: ".li",
        flag: "icons/flags/png/li.png",
        ),

Country(
        countryName: "Litvanya",
        capital: "Vilnius",
        language: "Litvanca",
        money: "Euro",
        population: "2.794.000",
        area: "65.300 km2",
        code: "370",
        gmt: "UTC +2 (DAZD)",
        domain: ".lt",
        flag: "icons/flags/png/lt.png",
        ),

Country(
        countryName: "Lübnan",
        capital: "Beyrut",
        language: "Arapça",
        money: "Lübnan Lirası",
        population: "6.849.000",
        area: "10.452 km2",
        code: "961",
        gmt: "UTC +2 (DAZD)",
        domain: ".lb",
        flag: "icons/flags/png/lb.png",
        ),

Country(
        countryName: "Lüksemburg",
        capital: "Lüksemburg",
        language: "Lüksemburgca, Almanca, Fransızca",
        money: "Euro",
        population: "605.405",
        area: "2.586 km2",
        code: "352",
        gmt: "UTC +1 (OAZD)",
        domain: ".lu",
        flag: "icons/flags/png/lu.png",
        ),




Country(
        countryName: "Macaristan",
        capital: "Budapeşte",
        language: "Macarca",
        money: "Forint (HUF)",
        population: "9.773.000",
        area: "131.957 km2",
        code: "+36",
        gmt: "UTC +1 (OAZD)",
        domain: ".hu",
        flag: "icons/flags/png/hu.png",
        ),

Country(
        countryName: "Madagaskar",
        capital: "Antananarivo",
        language: "Malgaşça, Fransızca",
        money: "Ariary (MGA)",
        population: "12.238.914",
        area: "587.295 km2",
        code: "+261",
        gmt: "UTC +3 (EAT)",
        domain: ".mg",
        flag: "icons/flags/png/mg.png",
        ),

Country(
        countryName: "Kuzey Makedonya",
        capital: "Üsküp",
        language: "Makedonca, Arnavutça",
        money: "Makedon Denarı (MKD)",
        population: "2.083.869",
        area: "25.713 km2",
        code: "+389",
        gmt: "UTC +1 (OAZD)",
        domain: ".mk",
        flag: "icons/flags/png/mk.png",
        ),

Country(
        countryName: "Malavi",
        capital: "Lilongwe",
        language: "İngilizce, Çevaca",
        money: "Malavi Kwachasi",
        population: "18.140.000",
        area: "118.480 km2",
        code: "265",
        gmt: "UTC +2 (CAT)",
        domain: ".mw",
        flag: "icons/flags/png/mw.png",
        ),

Country(
        countryName: "Maldiv Adaları",
        capital: "Male",
        language: "Maldivce, İngilizce",
        money: "Rufiyaa",
        population: "298.842",
        area: "297.800 km2",
        code: "960",
        gmt: "UTC +5",
        domain: ".mv",
        flag: "icons/flags/png/mv.png",
        ),




Country(
        countryName: "Malezya",
        capital: "Kuala Lumpur",
        language: "Malayca",
        money: "Ringgit",
        population: "32.049.700",
        area: "330.803 km2",
        code: "+60",
        gmt: "UTC +8 (MST)",
        domain: ".my",
        flag: "icons/flags/png/my.png",
        ),

Country(
        countryName: "Mali",
        capital: "Bamako",
        language: "Fransızca",
        money: "Batı Afrika CFA Frangı (XOF)",
        population: "14.517.176",
        area: "1.240.000 km2",
        code: "223",
        gmt: "UTC +0 (GMT)",
        domain: ".ml",
        flag: "icons/flags/png/ml.png",
        ),

Country(
        countryName: "Malta",
        capital: "Valetta",
        language: "Maltaca,İngilizce",
        money: "Euro",
        population: "404.962",
        area: "316 km2",
        code: "356",
        gmt: "UTC +1 (OAZD)",
        domain: ".mt",
        flag: "icons/flags/png/mt.png",
        ),

Country(
        countryName: "Marshall Adaları",
        capital: "Majuro",
        language: "İngilizce, Marshallca, Japonca, Hintçe",
        money: "Amerikan Doları",
        population: "58.413",
        area: "181.300 km2",
        code: "692",
        gmt: "UTC +12",
        domain: ".mh",
        flag: "icons/flags/png/mh.png",
        ),

Country(
        countryName: "Meksika",
        capital: "Meksiko",
        language: "İspanyolca",
        money: "Meksika Pesosu",
        population: "112.336.538",
        area: "1.973.000 km2",
        code: "+52",
        gmt: "UTC -8 ila -6 arası",
        domain: ".mx",
        flag: "icons/flags/png/mx.png",
        ),




Country(
        countryName: "Mısır",
        capital: "Kahire",
        language: "Mısırca, Arapça",
        money: "Mısır Lirası (EGP)",
        population: "94.798.827",
        area: "1.002.450 km2",
        code: "20",
        gmt: "UTC +2 (DAZD)",
        domain: ".eg",
        flag: "icons/flags/png/eg.png",
        ),

Country(
        countryName: "Mikronezya",
        capital: "Palikir",
        language: "İngilizce",
        money: "Amerikan Doları",
        population: "104.000",
        area: "702 km2",
        code: "691",
        gmt: "UTC +10",
        domain: ".fm",
        flag: "icons/flags/png/fm.png",
        ),

Country(
        countryName: "Moğolistan",
        capital: "Ulanbatur",
        language: "Moğolca",
        money: "Tögrög (MNT)",
        population: "3.278.290",
        area: "1.564.115 km2",
        code: "+976",
        gmt: "UTC +7 (UTC)",
        domain: ".mn",
        flag: "icons/flags/png/mn.png",
        ),

Country(
        countryName: "Moldova",
        capital: "Kişinev",
        language: "Rumence, Moldovaca",
        money: "Moldova Leyi",
        population: "3.546.000",
        area: "33.846 km2",
        code: "373",
        gmt: "UTC +2 (DAZD)",
        domain: ".md",
        flag: "icons/flags/png/md.png",
        ),

Country(
        countryName: "Monako",
        capital: "Monaco-Ville",
        language: "Fransızca",
        money: "Euro",
        population: "38.695",
        area: "2 km2",
        code: "+377",
        gmt: "UTC +1 (OAZD)",
        domain: ".mc",
        flag: "icons/flags/png/mc.png",
        ),




Country(
        countryName: "Moritanya",
        capital: "Nuakşot",
        language: "Arapça",
        money: "Ugiya (MRO)",
        population: "3.537.368",
        area: "1.030.000 km2",
        code: "222",
        gmt: "UTC +0 ",
        domain: ".mr",
        flag: "icons/flags/png/mr.png",
        ),

Country(
        countryName: "Moritius",
        capital: "Port Louis",
        language: "İngilizce, Fransızca",
        money: "Mauritius Rupisi",
        population: "1.237.091",
        area: "2.040 km2",
        code: "230",
        gmt: "UTC +4 (MUT)",
        domain: ".mu",
        flag: "icons/flags/png/mu.png",
        ),

Country(
        countryName: "Mozambik",
        capital: "Maputo",
        language: "Portekizce, Shavili",
        money: "Metical",
        population: "21.397.000",
        area: "799.380 km2",
        code: "+258",
        gmt: "UTC +2 (CAT)",
        domain: ".mz",
        flag: "icons/flags/png/mz.png",
        ),

Country(
        countryName: "Myanmar",
        capital: "Raypyidaw",
        language: "Birmanca",
        money: "Kyat (MMK)",
        population: "53.710.000",
        area: "678.500 km2",
        code: "+95",
        gmt: "UTC +6:30 (MMT)",
        domain: ".mm",
        flag: "icons/flags/png/mm.png",
        ),

Country(
        countryName: "Namibya",
        capital: "Windhoek",
        language: "İngilizce",
        money: "Namibya Doları",
        population: "2.448.000",
        area: "825.418 km2",
        code: "264",
        gmt: "UTC +1:00 (WAT)",
        domain: ".na",
        flag: "icons/flags/png/na.png",
        ),




Country(
        countryName: "Nauru",
        capital: "Yaren",
        language: "İngilizce, Nauruca",
        money: "Avustralya Doları",
        population: "11.200",
        area: "21 km2",
        code: "+674",
        gmt: "UTC +12",
        domain: ".nr",
        flag: "icons/flags/png/nr.png",
        ),

Country(
        countryName: "Nepal",
        capital: "Katmandu",
        language: "Nepalce",
        money: "Nepal Rupisi",
        population: "26.494.504",
        area: "147.181 km2",
        code: "977",
        gmt: "UTC +5:45 (NPT)",
        domain: ".np",
        flag: "icons/flags/png/np.png",
        ),

Country(
        countryName: "Nikaragua",
        capital: "Managua",
        language: "İspanyolca, Miskitoca",
        money: "Cordoba (NIO)",
        population: "5.148.098",
        area: "129.999 km2",
        code: "+505",
        gmt: "UTC -6 (CST)",
        domain: ".ni",
        flag: "icons/flags/png/ni.png",
        ),

Country(
        countryName: "Nijer",
        capital: "Niamey",
        language: "Fransızca",
        money: "Batı Afrika CFA Frangı (XOF)",
        population: "22.440.000",
        area: "1.267.000 km2",
        code: "+227",
        gmt: "UTC +1 (WAT)",
        domain: ".ne",
        flag: "icons/flags/png/ne.png",
        ),

Country(
        countryName: "Nijerya",
        capital: "Abuja",
        language: "İngilizce",
        money: "Naira (NGN)",
        population: "188.462.640",
        area: "923.768 km2",
        code: "+234",
        gmt: "UTC +1 (WAT)",
        domain: ".ng",
        flag: "icons/flags/png/ng.png",
        ),




Country(
        countryName: "Norveç",
        capital: "Oslo",
        language: "Norveççe, Lule Sami, Kuzey Lapça, Güney Lapça",
        money: "Norveç Kronu",
        population: "5.367.580",
        area: "385.207 km2",
        code: "+47",
        gmt: "UTC +1 (OAZD)",
        domain: ".no",
        flag: "icons/flags/png/no.png",
        ),

Country(
        countryName: "Orta Afrika Cumhuriyeti",
        capital: "Bangui",
        language: "Sango, Fransızca",
        money: "CFA Frankı (XAF)",
        population: "4.709.000",
        area: "622.984 km2",
        code: "+236",
        gmt: "UTC +1 (WAT)",
        domain: ".cf",
        flag: "icons/flags/png/cf.png",
        ),

Country(
        countryName: "Özbekistan",
        capital: "Taşkent",
        language: "Özbekçe",
        money: "Som (UZS)",
        population: "33.254.100",
        area: "448.978 km2",
        code: "998",
        gmt: "UTC +5 (UZT)",
        domain: ".uz",
        flag: "icons/flags/png/uz.png",
        ),

Country(
        countryName: "Pakistan",
        capital: "İslamabad",
        language: "",
        money: "Urduca, İngilizce",
        population: "212.200.000",
        area: "881.913 km2",
        code: "92",
        gmt: "UTC +5 (PST)",
        domain: ".pk",
        flag: "icons/flags/png/pk.png",
        ),

Country(
        countryName: "Palau",
        capital: "Melekeok",
        language: "İngilizce, Palauca",
        money: "Amerikan Doları (USD)",
        population: "17.907",
        area: "458 km2",
        code: "680",
        gmt: "UTC +9 (UTC)",
        domain: ".pw",
        flag: "icons/flags/png/pw.png",
        ),




Country(
        countryName: "Panama",
        capital: "Panama",
        language: "İspanyolca",
        money: "Amerikan Doları, Panama Balboası",
        population: "4.177.000",
        area: "75.517 km2",
        code: "+507",
        gmt: "UTC -5",
        domain: ".pa",
        flag: "icons/flags/png/pa.png",
        ),

Country(
        countryName: "Papua Yeni Gine",
        capital: "Port Moresby",
        language: "İnglizce, Tok Pisin, Hiri Motu",
        money: "Popua Yeni Gine Kinası (PGK)",
        population: "8.606.000",
        area: "462.840 km2",
        code: "675",
        gmt: "UTC +10 (AEST)",
        domain: ".pg",
        flag: "icons/flags/png/pg.png",
        ),

Country(
        countryName: "Paraguay",
        capital: "Asuncion",
        language: "İspanyolca, Guarani",
        money: "Paraguay Guaranisi (PYG)",
        population: "6.956.000",
        area: "406.752 km2",
        code: "595",
        gmt: "UTC -4",
        domain: ".py",
        flag: "icons/flags/png/py.png",
        ),

Country(
        countryName: "Peru",
        capital: "Lima",
        language: "İspanyolca",
        money: "Nuevo Sol (PEN)",
        population: "31.220.764",
        area: "1.285.216 km2",
        code: "+51",
        gmt: "UTC -5 (PET)",
        domain: ".pe",
        flag: "icons/flags/png/pe.png",
        ),

Country(
        countryName: "Polonya",
        capital: "Varşova",
        language: "Lehçe",
        money: "Polonya Zlotisi (PLN)",
        population: "38.511.824",
        area: "312.679 km2",
        code: "48",
        gmt: "UTC +1 (OAZD)",
        domain: ".pl",
        flag: "icons/flags/png/pl.png",
        ),




Country(
        countryName: "Portekiz",
        capital: "Lizbon",
        language: "Portekizce",
        money: "Euro",
        population: "10.562.178",
        area: "92.280 km2",
        code: "351",
        gmt: "UTC0 (WET)",
        domain: ".pt",
        flag: "icons/flags/png/pt.png",
        ),

Country(
        countryName: "Romanya",
        capital: "Bükreş",
        language: "Rumence",
        money: "Rumen Leyi",
        population: "20.121.641",
        area: "238.391 km2",
        code: "40",
        gmt: "UTC +2 (DAZD)",
        domain: ".ro",
        flag: "icons/flags/png/ro.png",
        ),

Country(
        countryName: "Ruanda",
        capital: "Kigali",
        language: "Kinyarwanda, Fransızca, İngilizce",
        money: "Ruanda Frangı",
        population: "10.515.973",
        area: "26.338 km2",
        code: "250",
        gmt: "UTC +2 (CAT)",
        domain: ".rw",
        flag: "icons/flags/png/rw.png",
        ),

Country(
        countryName: "Rusya",
        capital: "Moskova",
        language: "Rusça",
        money: "Rus Rublesi",
        population: "146.544.710",
        area: "17.075.389 km2",
        code: "+7",
        gmt: "UTC +2 - +12",
        domain: ".ru",
        flag: "icons/flags/png/ru.png",
        ),

Country(
        countryName: "Saint Kitts Ve Nevis",
        capital: "Basseterre",
        language: "İngilizce",
        money: "Doğu Karayip Doları (XCD)",
        population: "52.441",
        area: "261 km2",
        code: "+1-869",
        gmt: "UTC -4",
        domain: ".kn",
        flag: "icons/flags/png/kn.png",
        ),




Country(
        countryName: "Saint Lucia",
        capital: "Castries",
        language: "İngilizce",
        money: "Doğu Karayip Doları (XCD)",
        population: "181.889",
        area: "617 km2",
        code: "1 758",
        gmt: "UTC -4",
        domain: ".lc",
        flag: "icons/flags/png/lc.png",
        ),

Country(
        countryName: "Saint Vincent Ve Grenadinler",
        capital: "Kingstown",
        language: "İngilizce",
        money: "Doğu Karayip Doları (XCD)",
        population: "109.991",
        area: "389 km2",
        code: "+1-784",
        gmt: "UTC -4",
        domain: ".vc",
        flag: "icons/flags/png/vc.png",
        ),

Country(
        countryName: "Samoa",
        capital: "Apia",
        language: "Samoaca, İngilizce",
        money: "Tala (WST)",
        population: "196.130",
        area: "2.842 km2",
        code: "685",
        gmt: "UTC +13 (UTC+13:00)",
        domain: ".ws",
        flag: "icons/flags/png/ws.png",
        ),

Country(
        countryName: "San Marino",
        capital: "San Marino",
        language: "İtalyanca",
        money: "Euro",
        population: "33.344",
        area: "612 km2",
        code: "+378",
        gmt: "UTC +1 (OAZD)",
        domain: ".sm",
        flag: "icons/flags/png/sm.png",
        ),

Country(
        countryName: "Sao Tome Ve Principe",
        capital: "Sao Tome",
        language: "Portekizce",
        money: "Dobra (STD)",
        population: "178.739",
        area: "1.001 km2",
        code: "239",
        gmt: "UTC +0 (UTC)",
        domain: ".st",
        flag: "icons/flags/png/st.png",
        ),





Country(
        countryName: "Senegal",
        capital: "Dakar",
        language: "Fransızca",
        money: "Batı Afrika CFA Frangı (XOF)",
        population: "9.967.215",
        area: "196.722 km2",
        code: "221",
        gmt: "UTC",
        domain: ".sn",
        flag: "icons/flags/png/sn.png",
        ),

Country(
        countryName: "Seyşeller",
        capital: "Victoria",
        language: "Fransızca, İngilizce, Seyşeller Kreyolu",
        money: "Seyşeller Rupisi (SCR)",
        population: "96.762",
        area: "459 km2",
        code: "248",
        gmt: "UTC +4 (SCT)",
        domain: ".sc",
        flag: "icons/flags/png/sc.png",
        ),

Country(
        countryName: "Sırbistan",
        capital: "Belgrad",
        language: "Sırpça",
        money: "Sırp Dinarı",
        population: "7.001.444",
        area: "88.361 km2",
        code: "381",
        gmt: "UTC +1 (OAZD)",
        domain: ".rs",
        flag: "icons/flags/png/rs.png",
        ),

Country(
        countryName: "Sierra Leone",
        capital: "Freetown",
        language: "İngilizce",
        money: "Leone",
        population: "7.650.000",
        area: "71.740 km2",
        code: "232",
        gmt: "UTC +0 (GMT)",
        domain: ".sl",
        flag: "icons/flags/png/sl.png",
        ),




Country(
        countryName: "Singapur",
        capital: "Singapur",
        language: "İngilizce, Malyca, Çince, Tamilce",
        money: "Singapur Doları (SGD)",
        population: "5.469.700",
        area: "7.199 km2",
        code: "+65",
        gmt: "UTC +8 (SST)",
        domain: ".sg",
        flag: "icons/flags/png/sg.png",
        ),

Country(
        countryName: "Slovakya",
        capital: "Bratislava",
        language: "Slovakça",
        money: "Euro",
        population: "5.397.036",
        area: "49.035 km2",
        code: "421",
        gmt: "UTC +1 (OAZD)",
        domain: ".sk",
        flag: "icons/flags/png/sk.png",
        ),

Country(
        countryName: "Slovenya",
        capital: "Ljubljana",
        language: "Slovence",
        money: "Euro",
        population: "1.964.036",
        area: "20.273 km2",
        code: "386",
        gmt: "UTC +1 (OAZD)",
        domain: ".si",
        flag: "icons/flags/png/si.png",
        ),

Country(
        countryName: "Solomon Adaları",
        capital: "Honiara",
        language: "İngilizce",
        money: "Solomon Adaları Doları (SBD)",
        population: "652.858",
        area: "28.399 km2",
        code: "677",
        gmt: "UTC +11",
        domain: ".sb",
        flag: "icons/flags/png/sb.png",
        ),

Country(
        countryName: "Somali",
        capital: "Mogadişu",
        language: "Somalice, Arapça",
        money: "Somali, Şilini",
        population: "15.010.000",
        area: "637.657 km2",
        code: "+252",
        gmt: "UTC +3 (DAZD)",
        domain: ".so",
        flag: "icons/flags/png/so.png",
        ),




Country(
        countryName: "Somaliland",
        capital: "Hargeisa",
        language: "Somelice, Arapça, İngilizce",
        money: "Somaliland Şilini",
        population: "3.508.000",
        area: "176.120 km2",
        code: "252",
        gmt: "UTC +3 (Doğu Afrika Saati)",
        domain: ".so",
        flag: "icons/flags/png/so.png",
        ),

Country(
        countryName: "Sri Lanka",
        capital: "Kolomba",
        language: "Seylanca, Tamilce",
        money: "Sri Lanka Rupisi (LKR)",
        population: "21.324.791",
        area: "65.610 km2",
        code: "94",
        gmt: "UTC +5:30 (LKR)",
        domain: ".lk",
        flag: "icons/flags/png/lk.png",
        ),

Country(
        countryName: "Sudan",
        capital: "Hartum",
        language: "Arapça, İngilizce",
        money: "Sudan Sterlini (SDG)",
        population: "30.894.000",
        area: "1.886.068 km2",
        code: "249",
        gmt: "UTC +3 (DAZD)",
        domain: ".sd",
        flag: "icons/flags/png/sd.png",
        ),

Country(
        countryName: "Surinam",
        capital: "Paramaribo",
        language: "Felemenkçe",
        money: "Surinam Doları (SRD)",
        population: "456.829",
        area: "163.270 km2",
        code: "597",
        gmt: "UTC -3 (ART)",
        domain: ".sr",
        flag: "icons/flags/png/sr.png",
        ),

Country(
        countryName: "Suriye",
        capital: "Şam",
        language: "Arapça",
        money: "Suriye Lirası (SYP)",
        population: "16.910.000",
        area: "185.180 km2",
        code: "963",
        gmt: "UTC +2 (DAZD)",
        domain: ".sy",
        flag: "icons/flags/png/sy.png",
        ),




Country(
        countryName: "Suudi Arabistan",
        capital: "Riyad",
        language: "Arapça",
        money: "Riyal (SAR)",
        population: "33.700.000",
        area: "2.149.690 km2",
        code: "966",
        gmt: "UTC +3 (AST)",
        domain: ".sa",
        flag: "icons/flags/png/sa.png",
        ),

Country(
        countryName: "Şili",
        capital: "Santiago",
        language: "İspanyolca",
        money: "Şili Pesosu (CLP)",
        population: "18.006.407",
        area: "756.950 km2",
        code: "+56",
        gmt: "UTC -4 (n/a)",
        domain: ".cl",
        flag: "icons/flags/png/cl.png",
        ),

Country(
        countryName: "Tacikistan",
        capital: "Duşande",
        language: "Tacikçe",
        money: "Somoni (TJS)",
        population: "8.600.000",
        area: "143.100 km2",
        code: "992",
        gmt: "UTC +5 (TJT)",
        domain: ".tj",
        flag: "icons/flags/png/tj.png",
        ),

Country(
        countryName: "Tanzanya",
        capital: "Darüsselam",
        language: "Shawili, İngilizce",
        money: "Tanzanya Şilini (TZS)",
        population: "53.470.420",
        area: "947.303 km2",
        code: "255",
        gmt: "UTC +3 (EAT)",
        domain: ".tz",
        flag: "icons/flags/png/tz.png",
        ),

Country(
        countryName: "Tayland",
        capital: "Bangkok",
        language: "Tayca",
        money: "Baht (THB)",
        population: "69.430.000",
        area: "513.120 km2",
        code: "+66",
        gmt: "UTC +7",
        domain: ".th",
        flag: "icons/flags/png/th.png",
        ),




Country(
        countryName: "Tayvan",
        capital: "Taipei",
        language: "Çince",
        money: "Yeni Tayvan Doları",
        population: "23.780.000",
        area: "36.193 km2",
        code: "886",
        gmt: "UTC +8 (CST)",
        domain: ".tw",
        flag: "icons/flags/png/tw.png",
        ),

Country(
        countryName: "Togo",
        capital: "Lome",
        language: "Fransızca",
        money: "CFA Frankı (XOF)",
        population: "5.753.324",
        area: "56.785 km2",
        code: "+228",
        gmt: "UTC +/-00:00",
        domain: ".tg",
        flag: "icons/flags/png/tg.png",
        ),

Country(
        countryName: "Tonga",
        capital: "Nuku’alofa",
        language: "Tongaca",
        money: "Pa’anga (TOP)",
        population: "103.197",
        area: "748 km2",
        code: "676",
        gmt: "UTC +13 (UTC)",
        domain: ".to",
        flag: "icons/flags/png/to.png",
        ),



Country(
        countryName: "Trinidad Ve Tobago",
        capital: "Port Of Spain",
        language: "İngilizce",
        money: "Trinidad Ve Topago Doları",
        population: "1.390.000",
        area: "5.130 km2",
        code: "+1-868",
        gmt: "UTC -4",
        domain: ".tt",
        flag: "icons/flags/png/tt.png",
        ),




Country(
        countryName: "Tunus",
        capital: "Tunus",
        language: "Arapça",
        money: "Tunus Dinarı",
        population: "11.783.154",
        area: "163.610 km2",
        code: "+216",
        gmt: "UTC +1 (OAZD)",
        domain: ".tn",
        flag: "icons/flags/png/tn.png",
        ),

Country(
        countryName: "Tuvalu",
        capital: "Funafuti",
        language: "Tuvalyanca, İngilizce",
        money: "Tuvalu Doları",
        population: "11.508",
        area: "26 km2",
        code: "688",
        gmt: "UTC +12",
        domain: ".tv",
        flag: "icons/flags/png/tv.png",
        ),

Country(
        countryName: "Türkiye",
        capital: "Ankara",
        language: "Türkçe",
        money: "Türk Lirası",
        population: "83.154.997",
        area: "783.562 km2",
        code: "+90",
        gmt: "UTC +3 (İstanbul)",
        domain: ".tr",
        flag: "icons/flags/png/tr.png",
        ),
Country(
        countryName: "Türkmenistan",
        capital: "Aşkabat",
        language: "Türkmence",
        money: "Türkmenistan Manatı",
        population: "5.850.901",
        area: "491.200 km2",
        code: "993",
        gmt: "UTC +5 (TMT)",
        domain: ".tm",
        flag: "icons/flags/png/tm.png",
        ),

Country(
        countryName: "Uganda",
        capital: "Kampala",
        language: "İngilizce, Svahilice",
        money: "Uganda Şilini",
        population: "34.634.650",
        area: "241.550 km2",
        code: "+256",
        gmt: "UTC +3 (DAZD)",
        domain: ".ug",
        flag: "icons/flags/png/ug.png",
        ),





Country(
        countryName: "Ukrayna",
        capital: "Kiev",
        language: "Ukraynaca",
        money: "Grivna (UAH)",
        population: "48.457.102",
        area: "603.628 km2",
        code: "+380",
        gmt: "UTC +2 (DAZD)",
        domain: ".ua",
        flag: "icons/flags/png/ua.png",
        ),

Country(
        countryName: "Umman",
        capital: "Maskat",
        language: "Arapça",
        money: "Umman Riyali",
        population: "2.342.000",
        area: "309.501  km2",
        code: "+968",
        gmt: "UTC +4",
        domain: ".om",
        flag: "icons/flags/png/om.png",
        ),

Country(
        countryName: "Uruguay",
        capital: "Montevideo",
        language: "İspanyolca",
        money: "Uuruguay Pesosu",
        population: "3.399.236",
        area: "176.215 km2",
        code: "+598",
        gmt: "UTC -3 (UYT)",
        domain: ".uy",
        flag: "icons/flags/png/uy.png",
        ),

Country(
        countryName: "Ürdün",
        capital: "Amman",
        language: "Arapça",
        money: "Dinar",
        population: "9.956.000",
        area: "89.342 km2",
        code: "+962",
        gmt: "UTC +3",
        domain: ".jo",
        flag: "icons/flags/png/jo.png",
        ),

Country(
        countryName: "Vanuatu",
        capital: "Port Vila",
        language: "Bislamaca, İngilizce, Fransızca",
        money: "Vanuatu Vatu",
        population: "292.680",
        area: "12.199 km2",
        code: "678",
        gmt: "UTC +11",
        domain: ".vu",
        flag: "icons/flags/png/vu.png",
        ),




Country(
        countryName: "Vatikan",
        capital: "Vatikan",
        language: "İtalyanca, Latince",
        money: "Euro",
        population: "825",
        area: "44 km2",
        code: "+379",
        gmt: "UTC +1 (OAZD)",
        domain: ".va",
        flag: "icons/flags/png/va.png",
        ),



Country(
        countryName: "Venezuela",
        capital: "Caracas",
        language: "İspanyolca",
        money: "Venezuela Bolivarı",
        population: "32.050.085",
        area: "916.445 km2",
        code: "+58",
        gmt: "-4:00",
        domain: ".ve",
        flag: "icons/flags/png/ve.png",
        ),



Country(
        countryName: "Vietnam",
        capital: "Hanoi",
        language: "Vietnamca",
        money: "Vietnamca Dong",
        population: "90.710.000",
        area: "331.210 km2",
        code: "+84",
        gmt: "UTC +7 (UTC +07:00)",
        domain: ".vn",
        flag: "icons/flags/png/vn.png",
        ),




Country(
        countryName: "Yemen",
        capital: "San’a",
        language: "Arapça",
        money: "Yemen Riyali",
        population: "26.052.966",
        area: "527.968 km2",
        code: "967",
        gmt: "UTC +3",
        domain: ".ye",
        flag: "icons/flags/png/ye.png",
        ),

Country(
        countryName: "Yeni Zelenda",
        capital: "Wellington",
        language: "İngilizce, Maorice",
        money: "Yeni Zelenda Doları",
        population: "4.886.000",
        area: "268.021 km2",
        code: "64",
        gmt: "UTC +12 (NZST)",
        domain: ".nz",
        flag: "icons/flags/png/nz.png",
        ),

Country(
        countryName: "Yeşi Burun Adaları",
        capital: "Praia",
        language: "Portekizce",
        money: "Yeşil Burun Adaları Eskudosu",
        population: "523.000",
        area: "965 km2",
        code: "238",
        gmt: "UTC -1 (CVT)",
        domain: ".cv",
        flag: "icons/flags/png/cv.png",
        ),

Country(
        countryName: "Yunanistan",
        capital: "Atina",
        language: "Yunanca",
        money: "Euro",
        population: "10.856.291",
        area: "131.957 km2",
        code: "+30",
        gmt: "UTC +2 (DAZD)",
        domain: ".gr",
        flag: "icons/flags/png/gr.png",
        ),

Country(
        countryName: "Zambiya",
        capital: "Lusaka",
        language: "İmgilizce",
        money: "Zambiya Kwachası",
        population: "16.212.000",
        area: "752.618 km2",
        code: "260",
        gmt: "UTC +2 (CAT)",
        domain: ".zm",
        flag: "icons/flags/png/zm.png",
        ),




Country(
        countryName: "Zimbabve",
        capital: "Harare",
        language: "İngilizce, Shonaca, Ndebelece, Çevaca, Çibarvece, Kalangaca, Koisanca, Nambyaca, Ndau, Tsongaca, Sothoca, Chitongaca, Tsvanaca, Vendaca, Xhosaca",
        money: "Amerikan doları, Euro, Botsvana pulası, İngiliz sterlini ve Güney Afrika randı",
        population: "12.973.808",
        area: "390.757 km2",
        code: "+263",
        gmt: "Central Africa Time",
        domain: ".zw",
        flag: "icons/flags/png/zw.png",
        ),




   
   
  ];
}
