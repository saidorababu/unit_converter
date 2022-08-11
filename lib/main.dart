import 'package:flutter/material.dart';
import 'package:unit_converter/initial_page.dart';
import 'package:unit_converter/units_pages/length_convert.dart';
import 'package:unit_converter/units_pages/speed_convert.dart';
import 'package:unit_converter/units_pages/temp_convert.dart';
import 'package:unit_converter/units_pages/weight_convert.dart';

void main() => runApp(MyApp(

));


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:'/InitialPage',
        routes:{
          '/InitialPage':(context) => InitialPage(),
          '/homePage': (context) => UnitConverterHome(),
          '/TempPage': (context) => TemperatureConverter(),
          '/SpeedPage': (context) => SpeedConverter(),
          '/WeightPage': (context) => WeightConverter(),
          '/LengthPage': (context) => LengthConverter()
    }
    );
  }
}


class UnitConverterHome extends StatefulWidget {
  const UnitConverterHome({Key? key}) : super(key: key);

  @override
  State<UnitConverterHome> createState() => _UnitConverterHomeState();
}

class _UnitConverterHomeState extends State<UnitConverterHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar:AppBar(

        backgroundColor: Colors.indigo[900],
        automaticallyImplyLeading: false,
        title:const Text(
         'Select the type of Conversion',
          style: TextStyle(
            fontSize:20,
            fontWeight: FontWeight.bold,

          )
        ),

      ),

      body:Container(

        decoration: BoxDecoration(
          image:DecorationImage(
            image:AssetImage('images/converter_img1.jpg'),
            fit:BoxFit.cover,

          ),


        ),
        child:Column(
          children: [
            Container(
              margin:const EdgeInsets.fromLTRB(20, 30, 20, 15),
              decoration: BoxDecoration(
                color:Colors.indigo[800],
                borderRadius:BorderRadius.circular(15),
              ),
              child:FlatButton(
                onPressed: (){

                    Navigator.pushNamed(context,'/TempPage');

                },

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,


                  children: const [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical:15),
                        child: Text(

                          'Temperature conversion',
                          style: TextStyle(
                            fontSize:20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white

                          )
                        ),


                      ),
                    ),


                  ],
                ),
              )
            ),
            Container(
                margin:EdgeInsets.symmetric(horizontal: 20,vertical:15),
                decoration: BoxDecoration(
                  color:Colors.indigo[800],
                  borderRadius:BorderRadius.circular(15),
                ),
                child:FlatButton(
                  onPressed: (){
                    Navigator.pushNamed(context,'/WeightPage');
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,

                    children: const [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical:15),
                          child: Text(
                              'Weight conversion',
                              style: TextStyle(
                                  fontSize:20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white

                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
            Container(
                margin:EdgeInsets.symmetric(horizontal:20,vertical:15),
                decoration: BoxDecoration(
                  color:Colors.indigo[800],
                  borderRadius:BorderRadius.circular(15),
                ),
                child:FlatButton(
                  onPressed: (){

                      Navigator.pushNamed(context,'/SpeedPage');

                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,

                    children: const [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical:15),
                          child: Text(
                              'Speed conversion',
                              style: TextStyle(
                                  fontSize:20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white

                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
            Container(
                margin:EdgeInsets.symmetric(horizontal: 20,vertical:15),
                decoration: BoxDecoration(
                  color:Colors.indigo[800],
                  borderRadius:BorderRadius.circular(15),
                ),
                child:FlatButton(
                  onPressed: (){

                      Navigator.pushNamed(context,'/LengthPage');
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,

                    children: const [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical:15),
                          child: Text(
                              'Length conversion',
                              style: TextStyle(
                                  fontSize:20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white

                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            )
          ],
        )
      )
    );
  }
}




