import 'dart:js';
import 'dart:async';
import 'package:auto_meter/utils/database_helper.dart';
import 'package:auto_meter/models/note.dart';
import 'package:auto_meter/screens/note_detail.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';

// ignore: must_be_immutable
class Page extends StatelessWidget {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  final String title;

  Page(this.title);
  get currentAccountPicture => null;

  @override
  Widget build(BuildContext context) {

    if (noteList == null) {
      noteList = List<Note>();
      updateListView();
    }

    return new Scaffold(




      appBar: new AppBar(title: new Text(title), backgroundColor: Colors.purple,),
      body: new ListView(
        children: <Widget>[

          Container(

          ),

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
                            Navigator.of(context).pushNamed('/note_detail');

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
                    Text('Amit Sharma', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
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
                      Text('+91 8435492115',style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),)
                    ],),
                    SizedBox(height: 10.0,),



                    //SizedBox(height: 10.0,),
                    /* Row(children: <Widget>[
                      Icon(Icons.location_on),
                      SizedBox(width: 5.0,),
                      Text('From',style: TextStyle(
                          fontSize: 18.0
                      ),),
                      SizedBox(width: 5.0,),
                      Text('Lahore',style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),)
                    ],),



                    SizedBox(height: 10.0,),
                    Row(children: <Widget>[
                      Icon(Icons.list),
                      SizedBox(width: 5.0,),
                      Text('Followed by',style: TextStyle(
                          fontSize: 18.0
                      ),),
                      SizedBox(width: 5.0,),
                      Text('100K people',style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),)
                    ],),*/
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
    ListView getNoteListView() {

      TextStyle titleStyle = Theme.of(BuildContext).textTheme.subhead;

      return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(


              title: Text(this.noteList[position].title, style: titleStyle,),

              subtitle: Text(this.noteList[position].description),

              trailing: GestureDetector(

              ),


              onTap: () {
                debugPrint("ListTile Tapped");
                // Navigator.of(context).pushNamed('/details');
                 navigateToDetail(this.noteList[position],'Edit Room');
                //Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("Room One")));
              },

            ),
          );
        },
      );
    }
    /* return new Scaffold(
        appBar: new AppBar(title: new Text(title), backgroundColor: Colors.redAccent,),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 200.0,

                color: Colors.redAccent,
              child: Container(
                padding: EdgeInsets.fromLTRB(160.0, 0.0, 160.0, 0.0) ,
                child: LogoImage(),

              ),
              ),


            /*Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 190.0, 0.0, 0.0),
                    child: Text('Auto',
                        style: TextStyle(
                            fontSize: 60.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 250.0, 0.0, 0.0),
                    child: Text('Meter',
                        style: TextStyle(
                            fontSize: 60.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(175.0, 250.0, 0.0, 0.0),
                    child: Text('.',
                        style: TextStyle(
                            fontSize: 60.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                  )
                ],
              ),
            ),*/
            Container(

                child: Column(
                  children: <Widget>[
                    SizedBox(height: 5.0),

                    Container(

                      child: Text('Create an Account',
                          style: TextStyle(fontFamily: 'RobotoSlab',
                              fontSize: 20.0, color: Color(0xffe76577))),

                    ),
                    SizedBox(height: 300.0),
                    Container(
                      padding: EdgeInsets.only(top: 00.0, left: 30.0, right: 30.0),
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.blueAccent,
                        color: Colors.blue,
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

                  ],
                )
            ),

          ],
      )
    );*/
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

void updateListView() {

  var databaseHelper;
  final Future<Database> dbFuture = databaseHelper.initializeDatabase();
  dbFuture.then((database) {

    Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
    noteListFuture.then((noteList) {
//      setState(() {
//        Element.this.noteList = noteList;
//        this.count = noteList.length;
      });
    });
  }


void navigateToDetail(Note note, String title) async {
  bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
    return NoteDetail(note, title);
  }));

  if (result == true) {
    updateListView();
  }
}