import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Motoring"),
        backgroundColor: Colors.blueAccent
      ),
      body:Container(
                
alignment: Alignment.center,
padding: const EdgeInsets.all(10),
child: const Text( 'Home', style: TextStyle(fontSize: 20),)
              ),
             
         
         
    
    );
  }
}
