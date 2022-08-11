import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SpeedConverter extends StatefulWidget {
  const SpeedConverter({Key? key}) : super(key: key);

  @override
  State<SpeedConverter> createState() => _SpeedConverterState();
}

class _SpeedConverterState extends State<SpeedConverter> {
  late double userInput;
  var fromUnit;
  var toUnit;
  var checktext ='';
  late String resultMessage ='';

  List<String> fromUnits = ['Kilometer per hour(km/h)','Meter per sec(m/s)','Miles per hour','Foot per second'];
  List<String> toUnits = ['Kilometer per hour(km/h)','Meter per sec(m/s)','Miles per hour','Foot per second'];

  Map<String,int> UnitsMap = {
    'Kilometer per hour(km/h)': 0,
    'Meter per sec(m/s)': 1,
    'Miles per hour': 2,
    'Foot per second': 3,

  };

  dynamic formulas = {
    '0':[1,0.277778,0.621371,0.911344],
    '1':[3.6,1,2.237,3.28084],
    '2':[1.60934,0.44704,1,1.46667],
    '3':[1.09728,0.3048,0.681818,1]
  };

  void converter (double value,String from, String to){
    var  result =0.0;
    var nFrom = UnitsMap[from];
    var nTo = UnitsMap[to];
    var multiplier = formulas[nFrom.toString()][nTo];
    result = value * multiplier;


    resultMessage = '$result';



  }

  @override
  void initState(){
    userInput = 0;
    super.initState();
  }
  bool isNumeric(String string ){

    final number = num.tryParse(string);
    if (number == null){
      return false;
    }
    else{
      return true;
    }


  }

  void showToast() => Fluttertoast.showToast(
    msg :'Enter the valid input',
    fontSize:16,
    gravity: ToastGravity.BOTTOM,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold (
        backgroundColor: Colors.white,

        appBar :AppBar(
          backgroundColor: Colors.indigo[900],
          automaticallyImplyLeading: true,
          title:Text(''
              'Speed Converter',
              style:TextStyle(color:Colors.white)
          ),

        ),
        body:Container(
          decoration: BoxDecoration(
            image:DecorationImage(
              image:AssetImage('assets/images/converter_img1.jpg'),
              fit:BoxFit.cover,

            ),


          ),
          child: SingleChildScrollView(

              child:Center(
                  child:Padding(
                      padding:const EdgeInsets.symmetric(vertical:30,horizontal:10),
                      child:Column(
                          children:[

                            const SizedBox(height:40),
                            Container(
                              margin:const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                onChanged:(text){
                                  checktext = text ;
                                  var input =  double.tryParse(text);
                                  if (input != null) {
                                    setState(() {
                                      userInput = input;
                                    });
                                  }
                                },
                                style:const TextStyle(
                                  fontSize: 20,color:Colors.black54,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusColor: Colors.indigo[900],



                                  hintText:'Enter the measurement',
                                  hintStyle:TextStyle(
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.w100
                                  ),


                                  border:OutlineInputBorder(

                                    borderRadius: BorderRadius.circular(40),



                                  ),
                                ),

                              ),
                            ),
                            const SizedBox(height:50),
                            Text('From:',style:TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.w600)),

                            const SizedBox(height:5),
                            Container(
                              margin:const EdgeInsets.symmetric(horizontal:20),
                              padding:const EdgeInsets.symmetric(horizontal: 20),
                              decoration:BoxDecoration(
                                color:Colors.indigo[700],
                                borderRadius:BorderRadiusDirectional.circular(40),
                              ),
                              child: DropdownButtonHideUnderline(
                                  child:DropdownButton<String>(
                                    value: fromUnit,

                                    hint:const Text('Choose your Unit',style:TextStyle(color:Colors.white)),
                                    dropdownColor: Colors.indigo[700],
                                    isExpanded: true,
                                    focusColor:Colors.indigo,
                                    autofocus:true,
                                    iconEnabledColor: Colors.white,
                                    iconDisabledColor: Colors.white,



                                    style:const TextStyle(
                                      fontSize:20,
                                      color:Colors.white,
                                    ),
                                    items:toUnits.map((String value){
                                      return DropdownMenuItem<String>(
                                        value:value,
                                        child:Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (value) => setState(()=> fromUnit = value,),



                                  )
                              ),
                            ),
                            const SizedBox(height:20),
                            const Text('To:',style:TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.w600)),

                            const SizedBox(height:5),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal:20),
                              padding:const EdgeInsets.symmetric(horizontal: 20),
                              decoration:BoxDecoration(
                                color:Colors.indigo[700],
                                borderRadius:BorderRadiusDirectional.circular(40),
                              ),
                              child: DropdownButtonHideUnderline(
                                  child:DropdownButton<String>(
                                    value: toUnit,
                                    hint:const Text('Choose your Unit',style:TextStyle(color:Colors.white)),
                                    dropdownColor: Colors.indigo[700],
                                    isExpanded: true,
                                    focusColor:Colors.indigo,
                                    autofocus:true,
                                    iconEnabledColor: Colors.white,
                                    iconDisabledColor: Colors.white,
                                    style:const TextStyle(
                                      fontSize:20,
                                      color:Colors.white,
                                    ),
                                    items:fromUnits.map((String value){
                                      return DropdownMenuItem<String>(
                                        value:value,
                                        child:Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (value) => setState(()=> toUnit = value,),



                                  )
                              ),
                            ),
                            const SizedBox(height:40),
                            FlatButton(
                              onPressed:(){
                                if (isNumeric(checktext) == false){
                                  showToast();
                                }
                                else{
                                  setState((){
                                    if(fromUnit.isEmpty || toUnit.isEmpty ||userInput == null ){
                                      return ;
                                    }
                                    else{
                                      converter(userInput,fromUnit,toUnit);
                                    }
                                  });
                                }



                              },
                              child: Container(

                                padding:const EdgeInsets.symmetric(horizontal:20,vertical: 10 ),


                                decoration:BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color:Colors.indigo[800],

                                ),
                                child:const Text('Convert',style:TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color:Colors.white)),

                              ),
                            ),
                            SizedBox(height:40),
                            Container(

                              padding:EdgeInsets.symmetric(horizontal:20,vertical:15),
                              decoration:BoxDecoration(
                                  color:Colors.white,
                                  borderRadius: BorderRadiusDirectional.circular(10),
                                  border:Border.all(
                                    color:Colors.black87,
                                    width:1,
                                    style:BorderStyle.solid,
                                  )

                              ),
                              child:Column(
                                children: [
                                  Text('Answer:',style:TextStyle(color:Colors.black,fontSize:20,)),
                                  Text(resultMessage,style:TextStyle(color:Colors.black,fontSize:20,)),
                                ],
                              ),


                            ),
                            SizedBox(height:150)
                          ]
                      )
                  )
              )
          ),
        )
    );
  }
}
