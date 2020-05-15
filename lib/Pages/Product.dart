import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  var itemlist=[];
  var categorylist=[];
  var pricelist=[];
  TextEditingController item=TextEditingController();
  TextEditingController category=TextEditingController();
  TextEditingController price=TextEditingController();
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
              controller: item,
              decoration: InputDecoration(
                  hintText: "Enter Product Name",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            TextField(
              controller: category,
              decoration: InputDecoration(
                  hintText: "Enter Category",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            TextField(
              controller: price,
              decoration: InputDecoration(
                  hintText: "Enter Price",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))
              ),
            ),
            SizedBox(
              height: 12.0,
            ),

            RaisedButton(
              color: Colors.green,
              child: Text("Submit",style: TextStyle(color: Colors.white),),
              onPressed: (){
                var getItem=item.text;
                var getCategory=category.text;
                var getPrice=price.text;
                //var getSalary=salary.text;
                setState(() {
                  item.clear();
                  category.clear();
                  price.clear();
                  //salary.clear();
                  itemlist.add(getItem);
                  categorylist.add(getCategory);
                  pricelist.add(getPrice);
                  //salarylist.add(getSalary);
                });
              },
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: itemlist.length==null?0:itemlist.length,
                itemBuilder: (context,index){
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.perm_identity),
                      title: Text("Name: "+itemlist[index]+"\nCategory: "+categorylist[index]+"\nPrice: "+pricelist[index]),
                      trailing: GestureDetector(
                          onTap: (){
                            setState(() {
                              itemlist.removeAt(index);
                              categorylist.removeAt(index);
                              pricelist.removeAt(index);
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
