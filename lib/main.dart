import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(accentColor: Colors.grey),
      home: HomePage(),
    );
  }
}

//pop ilgili pencereyi kapat
//push ilgili pencereyi getir
//pushReplacement mevcutu olanı kaldır yerine bunu koy
//pushAndRemoveUntil ne var ne yok uçur yerine bunu getir





class HomePage extends StatelessWidget {

  Insan insan_1=Insan(ad: "Feyyaz",yas: 35);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(title: Text('Sayfalar Arası Geçiş / Navigation')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('HomePage'),
            RaisedButton(
                child: Text('Git -> Route Pink'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=> RoutePink(insan: insan_1,) ),
                  );
                })
          ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE PINK
///////////////////////////////////////////////
class RoutePink extends StatelessWidget {

  String metin;
  Insan insan;

  RoutePink({this.metin,this.insan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(title: Text('Route Pink')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Kullanıcı adı: ${insan.ad},Yaşı: ${insan.yas}"),
            RaisedButton(child: Text('Git -> Route Green'), onPressed: () {

              Navigator.push(//bu kalsın bir sonrakine geç
                context,
                MaterialPageRoute(builder:(context)=> RouteGreen() ),
              );

            }),
            RaisedButton(child: Text('Geri Dön'), onPressed: () {
              Navigator.pop(context);

            }),
          ])),
    );
  }
}
///////////////////////////////////////////////
///   ROUTE GREEN
///////////////////////////////////////////////

class RouteGreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title: Text('Route Green')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Şu an RouteGreen en üstte'),
            RaisedButton(child: Text('Git -> Route Grey'), onPressed: () {

              Navigator.pushReplacement(//mevcutu olanı kaldır yerine koy
                context,MaterialPageRoute(builder: (context)=>RouteGrey()),
              );

            }),
            RaisedButton(child: Text('Geri Dön'), onPressed: () {

              Navigator.pop(context);

            }),
          ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE GREY
///////////////////////////////////////////////

class RouteGrey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Route Grey')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Şu an RouteGrey en üstte'),
            RaisedButton(child: Text('Git -> ....en başa gidene kadar kapat'), onPressed: () {
              Navigator.popUntil(context,(route)=>route.isFirst);
            }),
            RaisedButton(child: Text('Geri Dön'), onPressed: () {
              Navigator.pop(context);

            }),
            RaisedButton(child: Text('getir ama var ne yok ucur'), onPressed: () {
              Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>HomePage()),(route)=>false);

            }),
          ])),
    );
  }
}

class Insan{
  String ad;
  int yas;
  Insan({this.ad,this.yas});
}