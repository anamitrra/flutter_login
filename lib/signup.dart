import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test/login.dart';


class Signup extends StatefulWidget {
  const Signup({ Key? key }) : super(key: key);
  @override

  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
   final _formKey = GlobalKey<FormState>();
   final _client = Dio();

  Map<String,dynamic> formData = {};

  login()async{
    var formvalidate = _formKey.currentState!.validate();
    if(formvalidate){
      _formKey.currentState!.save();
      
       var response = await _client.post("http://192.168.15.30/signup.php",data: FormData.fromMap(formData));
      
       print(response);
       var reply =jsonDecode(response.data);
       print(reply);
        if(reply == "success")
        {
           Navigator.push(context, MaterialPageRoute(builder: (context) => const Login(),));
          
        }

       
    
    }
  }
 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Motoring"),
        backgroundColor: Colors.blue
      ),
      body: Form(
          key: _formKey,
          child: ListView(
            children: <Widget> [
              SizedBox(
height: 50
              ),
              
         
            
              
              Container(
                
alignment: Alignment.center,
padding: const EdgeInsets.all(10),
child: const Text( 'SIGN UP', style: TextStyle(fontSize: 20),)
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (value)=> formData["email"] = value,
                  validator: (value)=> value == "" ? "email is required" : null,
                  decoration: InputDecoration(  
               border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
                    hintText: "enter email",
                  ),
                ),
              ),

            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (value)=> formData["name"] = value,
                  validator: (value)=> value == "" ? "name is required" : null,
                  decoration: InputDecoration(  
               border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
                    hintText: "enter name",
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value)=> value == "" ? "password is required" : null,
                  onSaved: (value)=> formData["password"] = value,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
                    hintText: "enter password",
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 50,
                //width: 70,
               child:  ElevatedButton(
                
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
              elevation: MaterialStateProperty.all(5),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)
              ))),
              
                onPressed: login,
                child: const Text("Sign Up",
                ),
              ),
            ),

             TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Login(),));
              },
              child: const Text("Already a Registered User? SignIn here"),
            )
         
            ],
          ),
        ),
    );
  }
}
