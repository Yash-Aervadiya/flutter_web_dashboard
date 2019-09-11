import 'package:flutter/material.dart';
import 'package:web_dashboard/src/widget/responsive_widget.dart';
import 'package:web_dashboard/src/widget/sidebar_menu..dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    print('media = $_media');

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 800) {
          return Center(
            child: Text("MOBILE"),
          );
        } else if (constraints.maxWidth <= 1280 &&
            constraints.maxWidth >= 800) {
          return Center(
            child: Text("TABLET"),
          );
        }

        else if (constraints.maxWidth >= 1280){

          return Material(

            child: Row(

              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[

                ResponsiveWidget.isLargeScreen(context)
                    ? SideBarMenu()
                    : Container(),
              ],
            ),


          );


        }
        else{

          return Container();
          
        }
      },
    );
  }
}
