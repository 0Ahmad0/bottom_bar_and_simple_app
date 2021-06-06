import 'package:fancy_dialog/FancyAnimation.dart';
import 'package:fancy_dialog/FancyGif.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[800],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildCard("Big Breakfast","100 \$"),
                  buildCard("Chocolate Chips Muffin","50 \$"),
                  buildCard("Coffee","80 \$"),
                  buildCard("Egg Benedict","150 \$"),
                  buildCard("Muesli","120 \$"),
                  buildCard("Tea","40 \$"),
                  buildCard("Toasted Breads","30 \$"),
                  buildCard("Waffles","200 \$"),
                ],
              ),
            ),
          ),
        )
    );
  }
  Widget buildCard(String name,String price){
    return FlatButton(
      onPressed: (){
        showGeneralDialog(context: context,
          barrierDismissible: true,
          barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.black,
          transitionDuration: Duration(microseconds: 200),
          pageBuilder: (BuildContext context,Animation first,Animation second){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueGrey,
              title: Text('Details'),
              centerTitle: true,
              actions: [
                Icon(Icons.label),
                SizedBox(width: 20,),
              ],
            ),
            backgroundColor: Colors.cyan[800],
            body: SafeArea(
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 25,
                  height: MediaQuery.of(context).size.height / 1.4,
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(60),
                    ),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/images/'+name+'.png'),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width /1.5,
                        child: Divider(
                          thickness: 3,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'AraHamahHoms-Regular',
                          color: Colors.white

                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text(
                            "Price:  "+price,
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      RaisedButton(
                        onPressed: (){
                        Navigator.of(context).pop();
                      },
                        color: Colors.red,
                        child: Container(
                          width: 100,
                          child: Center(
                            child: Text(
                              'Exit',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                          )
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          }
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 5,bottom: 5),
        padding: EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width - 20,
        height: 110,
        decoration: BoxDecoration(
            color: Colors.orange[300],
          borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               CircleAvatar(
                 radius: 45,
                 backgroundColor: Colors.transparent,
                 backgroundImage: AssetImage('assets/images/'+name+'.png'),
               )
             ],
           ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text(price,style: TextStyle(fontSize: 18,fontFamily: 'AraHamahHoms-Regular'),),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: Icon(Icons.add_outlined,size: 30,))
              ],
            )
          ],
        ),
      ),
    );
  }
}