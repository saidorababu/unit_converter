import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WeightConverter extends StatefulWidget {
  const WeightConverter({Key? key}) : super(key: key);

  @override
  State<WeightConverter> createState() => _WeightConverterState();
}

class _WeightConverterState extends State<WeightConverter> {

  late double userInput;
  var fromUnit ;
  var toUnit;
  var checktext ='';
  late String resultMessage ='';

  List<String> fromUnits = ['kilograms(kg)','grams(g)','milligrams(mg)','stones','pounds','ounces','metric tons'];
  List<String> toUnits = ['kilograms(kg)','grams(g)','milligrams(mg)','stones','pounds','ounces','metric tons'];

  Map<String,int> UnitsMap = {
    'kilograms(kg)':0,'grams(g)':1,'milligrams(mg)':2,'stones':3,'pounds':4,'ounces':5,'metric tons':6
  };

  dynamic formulas = {

    '0':[1,1000,1000000,0.157473,2.204623,35.27396,0.001],
    '1':[0.001,1,1000,0.000157473,0.002204623,0.03527396,0.000001],
    '2':[0.000001,0.001,1,0.000000157473,0.000002204623,0.00003527396,0.000000001],
    '3':[6.350293,6350.293,6350293,1,14,224,0.006350293],
    '4':[0.4535924,453.5924,453592.4,0.07142857,1,16,0.0004535924],
    '5':[0.02834952,28.34952,28349.52,0.004464286,0.0625,1,0.00002834952],
    '6':[1000,1000000,1000000000,157.473,2204.623,35273.96,1]

  };

  void converter (double value,String from, String to){
    var  result = 0.0;
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

        appBar :AppBar(
            backgroundColor: Colors.indigo[900],
            automaticallyImplyLeading: true,
          title:Text('Weight Converter')
        ),
        body:SingleChildScrollView(
            child:Container(
              decoration: BoxDecoration(
                image:DecorationImage(
                  image:AssetImage('images/converter_img1.jpg'),
                  fit:BoxFit.cover,

                ),


              ),
              child: Center(
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
                            const SizedBox(height:30),
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

                                    hint:Text('Choose your Unit',style:TextStyle(color:Colors.white)),
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
                            Text('To:',style:TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.w600)),

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
                            const SizedBox(height:30),
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
                            SizedBox(height:20),
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
                          ]
                      )
                  )
              ),
            )
        )
    );
  }
}
