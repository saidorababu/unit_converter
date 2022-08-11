



import 'package:flutter/material.dart';




class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState()  {
    super.initState();
    _navigationHome();

  }

  void _navigationHome() async  {
    await Future.delayed(const Duration(seconds:3),(){});
    setState(() {
      Navigator.pushNamed(context ,'/homePage');
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[700],
        body:Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image.asset('assets/images/unit_converter.jpg',
          height:120,
          width:120
        ),

     const SizedBox(height:30),
    const Text('Unit Converter',

    style:TextStyle(
      fontSize:40,
      color:Colors.white,

    )
    ),
    ],

    ),
    ),

    );
  }
}
