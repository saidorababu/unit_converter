import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LengthConverter extends StatefulWidget {
  const LengthConverter({Key? key}) : super(key: key);

  @override
  State<LengthConverter> createState() => _LengthConverterState();
}

class _LengthConverterState extends State<LengthConverter> {

  late double userInput;
  var fromUnit;
  var toUnit;
  late String resultMessage ='';
  var checktext;

  List<String> fromUnits = ['meter','kilometer','centimeter','inch','feet','yard','miles'];
  List<String> toUnits = ['meter','kilometer','centimeter','inch','feet','yard','miles'];

  Map<String,int> UnitsMap = {
    'meter':0,'kilometer':1,'centimeter':2,'inch':3,'feet':4,'yard':5,'miles':6
  };

  dynamic formulas = {

    '0':[1,0.001,100,39.37,3.28,1.0936,0.00062137],
    '1':[1000,1,100000,39370,3280,1093.6,0.62137],
    '2':[0.01,0.00001,1,0.3937,0.0328,0.010936,0.0000062137],
    '3':[0.0254,0.0000254,2.54,1,0.08333,0.027,0.000015782828],
    '4':[0.3048,0.0003048,30.48,12,1,0.33333333,0.000189393939],
    '5':[0.9144,0.0009144,91.44,36,3,1,0.000568181818],
    '6':[1609.344,1.609344,160934.4,63360,5280,1760,1]

  };

  void converter (double value,String from, String to){
    var  result;
    var nFrom = UnitsMap[from];
    var nTo = UnitsMap[to];
    var multiplier = formulas[nFrom.toString()][nTo];
    result = value * multiplier;

    resultMessage = 'Answer : $result';



  }

  @override
  void initState(){

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
              'Length Converter',
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
