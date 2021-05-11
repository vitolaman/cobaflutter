import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

int number = 0;
int multiplier = 1;
String menu = "Ubah ke Huruf";
String outp = "Angka";
String output = "";
int charcod = 0;

void hitTambah() {
  setState(() {
    number = number + multiplier;
          
    if( outp == "Angka" ){
          output = output + number.toString();
    } else {
      charcod = number%26;
      output = output + String.fromCharCode(charcod+96);
    }
  });
}

void hitKali() {
  setState(() {
    multiplier = multiplier * 2;
  });
}
void reset() {
  setState(() {
    multiplier = 1;
    number = 0;
    output = "";
  });
}

void ubah() {
  setState(() {
    if(menu == "Ubah ke Huruf") {
      menu = "Ubah ke angka";
      outp = "Huruf";
    } else {
      menu = "Ubah ke Huruf";
      outp = "Angka";
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Apps"),
      ),
      body: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.all(20),
        width: double.infinity,
        child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Pengali: "),
                Text(multiplier.toString())
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hasil: "),
                Text(output.toString())
              ],
            ),
            Text(outp),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              RaisedButton(child: Text("Tambah"), onPressed: hitTambah),
              RaisedButton(child: Text("Kali2"), onPressed: hitKali),
              RaisedButton(child: Text(menu), onPressed: ubah),
              RaisedButton(child: Text("Reset"), onPressed: reset)
              ]
            )
          ]
        )
      ),
    ));
  }
}
