import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController _id =TextEditingController();
  TextEditingController _title =TextEditingController();
  TextEditingController _body =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("AddData"),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(height: 20,),
            Container(
             // padding: EdgeInsets.all(20),
              margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "ID",
                    hintText: "Enter id",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
             // padding: EdgeInsets.all(20),
              margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Title",
                  hintText: "Enter Title",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
             // padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
              margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: "Body",
                  hintText: "Message",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

    SizedBox(height: 30,),



        Container(
          margin: EdgeInsets.all(20),
          child:Row(
            children: [
              Expanded(child: ElevatedButton(

                  onPressed: (){

                  },
                  child: const Text("Add"))),
            ],
          ),
        ),
          ],
        ),
      ),
    );
  }
}
