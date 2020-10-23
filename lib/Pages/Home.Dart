import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new/Models/User.dart';

class Home extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}
class _Home extends State<Home>
{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:SingleChildScrollView(child:
      Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 20,right: 20,top: 30),
        child: FutureBuilder<List<user>>(
          future: GetJson(), // async work
          builder: (BuildContext context, AsyncSnapshot<List<user>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting: return Center(child:Text('Loading....'),);
              case ConnectionState.done:
                return ListView.builder(
                itemCount:snapshot.data.length,
                itemBuilder: (BuildContext context, int i) {
                  return Container(

                      margin: EdgeInsets.all(10,),
                      child:Card(
                        color: Colors.white,
                        child:  Padding(padding: EdgeInsets.all(10),
                          child: Text("Title :"+snapshot.data[i].title+"\n\nUserId :"+snapshot.data[i].userId.toString()+"\n\nId :"+snapshot.data[i].id.toString()+"\n\nbody :"+snapshot.data[i].body,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey.shade700),),),));
                },
               );
              default:
                if (snapshot.hasError)
                  return Text('Error: ${snapshot.error}');
                else return null;
            }
          },
        ),),)

    );
  }

}
Future< List<user>> GetJson()
async {
  List<user> Users=new List<user>();
 var respose=await http.get("https://jsonplaceholder.typicode.com/posts");
 var Data=json.decode(respose.body);
 Data.forEach((v){
   Users.add(user(v["userId"],v["id"],v["title"],v["body"]));
 });

return Users;
}
