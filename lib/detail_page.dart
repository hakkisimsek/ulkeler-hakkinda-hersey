import 'package:beautiful_list/model/lesson.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Country country;
  DetailPage({Key key, this.country}) : super(key: key);
  @override
  Widget build(BuildContext context) {





  final capital = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text("Başkent: " +
          country.capital,
        style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.w400),textAlign: TextAlign.center,
      ),
    );

    final language = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text("Resmi Dil: "+
          country.language,
        style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.w400),textAlign: TextAlign.center,
      ),
    );

  final money = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text("Para Birimi: "+
          country.money,
        style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.w400),textAlign: TextAlign.center,
      ),
    );



  final population = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text("Nüfus: "+
          country.population,
        style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.w400),textAlign: TextAlign.center,
      ),
    );
 final area = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text("Yüz Ölçümü: "+
          country.population,
        style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.w400),textAlign: TextAlign.center,
      ),
    );

final code = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text("Telefon Kodu: "+
          country.code,
        style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.w400),textAlign: TextAlign.center,
      ),
    );

final gmt = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text("Zaman Dilimi: "+
          country.gmt,
        style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.w400),textAlign: TextAlign.center,
      ),
    );
final domain = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text("Site Uzantısı: "+
          country.domain,
        style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.w400),textAlign: TextAlign.center,
      ),
    );

    final topContentText = Column(
      mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
      
      children: <Widget>[
        SizedBox(height: 10.0),
         Image.asset(country.flag, package: 'country_icons',width: 40),
        Container(
          
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Text(
          country.countryName,
          style: TextStyle(color: Colors.white, fontSize: 22.0),
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
           Expanded(
          child: Padding(
           padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: capital
        ),),

          ],
        ),


 Row(
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: <Widget>[
           
           Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: language
        ),),
 
          ],
        ),



 Row(
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: <Widget>[
           
           Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: money
        ),),
 
          ],
        ),
 Row(
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: <Widget>[
           
           Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: population
        ),),
 
          ],
        ),
 Row(
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: <Widget>[
           
           Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: area
        ),),
 
          ],
        ),
 Row(
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: <Widget>[
           
           Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: code
        ),),
 
          ],
        ),
 Row(
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: <Widget>[
           
           Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: gmt
        ),),
 
          ],
        ),

 Row(
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: <Widget>[
           
           Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: domain
        ),),
 
          ],
        ),



      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 1,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("ulkeler.jpg"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 1,
          padding: EdgeInsets.all(15.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .7)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );




 return Scaffold(
   
      body: Column(
        children: <Widget>[topContent],
      ),
      
    );
  }
}
