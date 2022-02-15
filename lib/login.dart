import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test/signup.dart';
import 'package:test/home.dart';
class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
   final _formKey = GlobalKey<FormState>();
   final _client = Dio();

  Map<String,dynamic> formData = {};

  login()async{
    var formvalidate = _formKey.currentState!.validate();
    if(formvalidate){
      _formKey.currentState!.save();
      
       var response = await _client.post("http://192.168.15.30/login.php",data: FormData.fromMap(formData));
      
       print(response);
       var reply =jsonDecode(response.data);
       print(reply);
        if(reply == "success")
        {
           Navigator.push(context, MaterialPageRoute(builder: (context) => const Home(),));
          
        }
        else 
        {
           Fluttertoast.showToast(
        msg: "No Account",
        backgroundColor: Colors.redAccent,
        gravity: ToastGravity.CENTER,
           ); 
        }
       
    
    }else{
      
    }
  }
 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Motoring"),
        backgroundColor: Colors.green
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
child: const Text( 'Log in', style: TextStyle(fontSize: 20),)
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
                
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
              elevation: MaterialStateProperty.all(5),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)
              ))),
              
                onPressed: login,
                child: const Text("Login",
                ),
              ),
            ),

             TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Signup(),)); ///// Add home page here
              },
              child: const Text("No Account? Signup here"),
            )
         
            ],
          ),
        ),
    );
  }
}
