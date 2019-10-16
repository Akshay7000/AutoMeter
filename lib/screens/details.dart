//import 'dart:js';
//import 'dart:async';
import 'package:auto_meter/screens/note_list.dart';
import 'package:auto_meter/utils/database_helper.dart';
import 'package:auto_meter/models/note.dart';
//import 'package:auto_meter/screens/note_detail.dart';
import 'package:flutter/material.dart';
//import 'package:sqflite/sqlite_api.dart';
//import 'package:sqflite/sqflite.dart';
// ignore: must_be_immutable
class Page extends StatelessWidget {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  final String title;
  Note noteList2;
  Page(this.title,this.noteList2);
  get currentAccountPicture => null;

  get position => null;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(title: new Text(title), backgroundColor: Colors.purple,),
      body: new ListView(
        children: <Widget>[
                    new Column(
            children: <Widget>[
              Container(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Expanded(child:
                      Container(
                        height: 200.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://scontent.fbho1-2.fna.fbcdn.net/v/t1.0-1/c0.93.240.240a/p240x240/64360662_1327603674083616_7522958690110930944_n.jpg?_nc_cat=104&_nc_oc=AQkNziVpXXGLd4MUqH1gi8UqZQf7VMxiNWeI23sqdwJGhzE7IyrK_-gXArWKnLeUGojzxy7ojEpPokP5b3emhYxb&_nc_ht=scontent.fbho1-2.fna&oh=119c962d66212178e89078725ba16ed6&oe=5DEF598E")
                            )
                        ),
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                          onPressed: () {
                            //NavigateToDetail(this.noteList[position],'Edit Room');
                          },
                          mini: true,
                          child: Icon(Icons.edit),
                        ),
                      ),)
                    ],
                    ),
                    Positioned(
                      top: 50.0,
                      child: Container(
                        height: 190.0,
                        width: 190.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage("http://cdn.ppcorn.com/us/wp-content/uploads/sites/14/2016/01/Mark-Zuckerberg-pop-art-ppcorn.jpg"),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                                color: Colors.white,
                                width: 6.0
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: 100.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(noteList2.title.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0,),


              Container(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      SizedBox(width: 130.0,),
                      Text(this.noteList2.description,style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),)
                    ],),

                    SizedBox(height: 40.0,),
                    Container(
                      height: 20.0,
                      //width: 20.0,
                      child:
                      Divider(
                        color: Colors.grey,

                      ),
                    ),
                    SizedBox(height: 40.0,),
                    Container(
                      padding: EdgeInsets.only(top: 00.0, left: 30.0, right: 30.0),
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.deepPurple,
                        color: Colors.deepPurpleAccent,
                        elevation: 7.0,
                        child: InkWell(
                          onTap: ()
                          {Navigator.of(context).pushNamed('/home_page');
                          },
                          child: Center(
                            child: Text(
                              'View Records',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                //fontFamily: 'Montserrat'
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Container(
                      padding: EdgeInsets.only(top: 00.0, left: 30.0, right: 30.0),
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.deepPurple,
                        color: Colors.deepPurpleAccent,
                        elevation: 7.0,
                        child: InkWell(
                          onTap: () => _popupDialog(context),
                          child: Center(
                            child: Text(
                              'New Entry',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                //fontFamily: 'Montserrat'
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );}
  }

void _popupDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: showmsg(),
          content:TextField(
            decoration: InputDecoration(
                labelText: 'Enter Number',
                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                // hintText: 'EMAIL',
                // hintStyle: ,
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))),
          ),
          actions: <Widget>[
            SizedBox(height: 20.0,),
            FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK')),
            FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('CANCEL')),
          ],
        );
      });
}


Widget showmsg() {

  return Row(children: <Widget>[
    Container(child: Container(
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/ThreePhaseElectricityMeter.jpg/220px-ThreePhaseElectricityMeter.jpg")
      )),
    ),)
  ],
  );
}
class LogoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    AssetImage assetImage = AssetImage('images/logo.png');
    Image image = Image(image: assetImage, width: 10.0, height: 10.0,);
    return Container(child: image,);
  }
}

