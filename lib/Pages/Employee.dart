import 'package:flutter/material.dart';


class Employee extends StatefulWidget {
  @override
  _EmployeeState createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  var nameslist=[];
  var empnolist=[];
  var orglist=[];
  var salarylist=[];
  TextEditingController name=TextEditingController();
  TextEditingController empno=TextEditingController();
  TextEditingController org=TextEditingController();
  TextEditingController salary=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
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
                  hintText: "Enter Employee Name",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            TextField(
              controller: empno,
              decoration: InputDecoration(
                  hintText: "Enter Employee ID",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            TextField(
              controller: org,
              decoration: InputDecoration(
                  hintText: "Enter Department Name",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            TextField(
              controller: salary,
              decoration: InputDecoration(
                  hintText: "Enter Salary",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            RaisedButton(
              color: Colors.amber,
              child: Text("Submit",style: TextStyle(color: Colors.white),),
              onPressed: (){
                var getName=name.text;
                var getEmpno=empno.text;
                var getOrg=org.text;
                var getSalary=salary.text;
                setState(() {
                  name.clear();
                  empno.clear();
                  org.clear();
                  salary.clear();
                  nameslist.add(getName);
                  empnolist.add(getEmpno);
                  orglist.add(getOrg);
                  salarylist.add(getSalary);
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
                      title: Text("Name: "+nameslist[index]+"\nEmployee ID: "+empnolist[index]+"\nDepartment: "+orglist[index]+"\nSalary: "+salarylist[index]),
                      trailing: GestureDetector(
                          onTap: (){
                            setState(() {
                              nameslist.removeAt(index);
                              empnolist.removeAt(index);
                              orglist.removeAt(index);
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
