import 'package:flutter/material.dart';

class Books extends StatefulWidget {
  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  var bookslist=[];
  var isbnlist=[];
  var pricelist=[];
  TextEditingController book=TextEditingController();
  TextEditingController isbn=TextEditingController();
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
              controller: book,
              decoration: InputDecoration(
                hintText: "Enter Book Name",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            TextField(
              controller: isbn,
              decoration: InputDecoration(
                hintText: "Enter Book ISBN",
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
              onPressed: (){
                var myBook=book.text;
                var myIsbn=isbn.text;
                var myPrice=price.text;
                setState(() {
                  bookslist.add(myBook);
                  isbnlist.add(myIsbn);
                  pricelist.add(myPrice);
                });
              },
              color: Colors.blue,
              child: Text("Submit",style: TextStyle(color: Colors.white),),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: bookslist.length==null?0:bookslist.length,
                itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  leading: Icon(Icons.book),
                  trailing: GestureDetector(
                      onTap: (){
                        setState(() {
                          bookslist.removeAt(index);
                          isbnlist.removeAt(index);
                          pricelist.removeAt(index);
                        });
                      },
                      child: Icon(Icons.clear,color: Colors.red,)),
                  title: Text("Name: "+bookslist[index]+"\nISBN: "+isbnlist[index]+"\nPrice: "+pricelist[index]),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
