import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({Key? key}) : super(key: key);

  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {

  late double userInput;
  late String resultMessage ='';
  var checktext;
  var fromUnit  ;
  var toUnit;

  List<String> fromUnits = ['Celsius(°C)', 'Fahrenheit(°F)', 'Kelvin(K)'];
 List<String> toUnits = ['Celsius(°C)', 'Fahrenheit(°F)', 'Kelvin(K)'];

  void converter (double value,String from, String to){
    var  result;
    if (from == 'Kelvin(K)' && to =='Celsius(°C)'){
      result = value-273;
    }
    else if(to == 'Kelvin(K)' && from =='Celsius(°C)'){
      result = value+273;
    }
    else if (from == 'Fahrenheit(°F)' && to =='Celsius(°C)'){
      result = (value-32) * 5/9;
    }
    else if(to == 'Fahrenheit(°F)' && from =='Celsius(°C)'){
      result = (value*1.8 )+32;
    }
    else if (from == 'Kelvin(K)' && to =='Fahrenheit(°F)'){
      result = (value-273)*1.8 +32;
    }
    else if(to == 'Kelvin(K)' && from =='Fahrenheit(°F)'){
      result = (value-32)*5/9 +273;
    }
    else{
      result = value;
    }

    resultMessage = '$result';



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
  void initState(){
    userInput = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
        backgroundColor: Colors.white,

        appBar :AppBar(
          backgroundColor: Colors.indigo[900],
          automaticallyImplyLeading: true,
          title:Text(''
              'Temperature Converter',
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
