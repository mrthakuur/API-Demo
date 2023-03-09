import 'dart:convert';

import 'package:apidemo/Screens/AddData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Model/Posts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Posts>? alldata;
  
  
  getdata() async
  {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await http.get(url);
    if(response.statusCode==200)
      {
        var json = jsonDecode(response.body);
        setState(() {
          alldata = json.map<Posts>((obj)=>Posts.fromJson(obj)).toList();
        });
      }
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API DEMO"),
      ),
      drawer: Drawer(
       child: ListView(
      padding: EdgeInsets.zero,
         children:  [
           const UserAccountsDrawerHeader(
             accountName: Text("Niraj Thakur"),
             accountEmail: Text("officialnirajthakur@gmail.com"),
             currentAccountPicture: CircleAvatar(
               backgroundColor: Colors.orange,
               child: Text(
                 "A",
                 style: TextStyle(fontSize: 40.0),
               ),
             ),
           ),
           Column(
             children: [
               ListTile(
                 leading: const Icon(Icons.view_list),
                 title: const Text("View With Model"),
                 onTap: ()
                 {

                 },

               ),
               ListTile(
                 leading: const Icon(Icons.add_box),
                 title: const Text("Add Data With Model"),
                 onTap: ()
                 {
           Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>AddData()));
                 },

               ),
             ],
           )
         ],
       ),
      ),
      body: ListView.builder(
          itemCount: alldata!.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.teal.shade400,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    "ID : " + alldata![index].id.toString(),
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),

                  Text(
                    "Title : " + alldata![index].title.toString(),
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Body : "+ alldata![index].body.toString(),
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          }),

    );
  }
}
