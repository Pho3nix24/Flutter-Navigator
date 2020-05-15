import 'package:flutter/material.dart';

class Student extends StatefulWidget {
  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  var nameslist=[];
  var admnolist=[];
  var collegelist=[];
  TextEditingController name=TextEditingController();
  TextEditingController admno=TextEditingController();
  TextEditingController college=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 75.0,
            ),
            TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: "Enter Student Name",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            TextField(
              controller: admno,
              decoration: InputDecoration(
                hintText: "Enter Admission Number",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            TextField(
              controller: college,
              decoration: InputDecoration(
                hintText: "Enter College Name",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            RaisedButton(
              color: Colors.red,
              child: Text("Submit",style: TextStyle(color: Colors.white),),
              onPressed: (){
                var getName=name.text;
                var getAdmno=admno.text;
                var getCollege=college.text;
                setState(() {
                  name.clear();
                  admno.clear();
                  college.clear();
                  nameslist.add(getName);
                  admnolist.add(getAdmno);
                  collegelist.add(getCollege);
                });
              },
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: nameslist.length==null?0:nameslist.length,
                itemBuilder: (context,index){
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.perm_identity),
                      title: Text("Name: "+nameslist[index]+"\nAdmission Number: "+admnolist[index]+"\nCollege: "+collegelist[index]),
                     trailing: GestureDetector(
                          onTap: (){
                            setState(() {
                              nameslist.removeAt(index);
                              admnolist.removeAt(index);
                              collegelist.removeAt(index);
                            });
                          },
                         child: Icon(Icons.clear,color: Colors.red,)),
                    ),
                  );
                }
                )
          ],
        ),
      ),
    );
  }
}
