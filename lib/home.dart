
import 'dart:async';
import 'dart:ffi';
import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_apps1/profile.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final CollectionRefrence _products = FirebaseFirestore.instance.collection("Products");
   final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  Future<void> createOrUpdate([DocumentSnapshot? documentSnapshot])async{
    String action = "create";
    if (documentSnapshot != null){
      action = "update";
      nameController.text = documentSnapshot["name"];
      priceController.text = documentSnapshot["price"].toString();
    }
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
    builder: (BuildContext context){
      return Padding(
        padding: EdgeInsets.only(
          left: 20,
          top: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name"
                ),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller:priceController,
              decoration:  InputDecoration(
                labelText: "price"
                ),
              ),
              ElevatedButton(onPressed: ()async{
                String name = nameController.text;
                double price = double.parse(priceController.text);
                if(name != null && price !=null){
                  if(action == "create"){
                    await _products.add({"name": name, "price": price});
                  }
                  if (action == "update"){
                    await _products.doc(documentSnapshot!.id)
                    .update({"name": name, "price": price});
                  }
                  nameController.text = "";
                  priceController.text = "";
                  Navigator.of(context).pop();
                }
              },
              child: Text(action == "creat" ? "Create":"Update")
              ,)
          ],
        ),
      );
    }
    );
  }
Future<Void> deleteproduct(String ProductId)async{
  await _products.doc(ProductId).delete();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text("product deleted sucessfully"),
    )
    );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text("Products"),
        actions: [
          IconButton(onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return ProfileView();
            }
            ));
          }, 
          icon: Icon(Icons.person,
          color: Colors.white,
          )
          ,)
        ],
      ),
      body: StreamBuilder(
        stream: _products.snapshots(),
        builder:(context, AsyncSnapshot<QuerySnapshot> steamSnapshot){
        if (streamSnapshot.hasData){
          return ListView.builder(
            itemCount: streamSnapshot.data!.docs.length,
            itemBuilder: (context, index){
              final DocumentSnapshot documentSnapshot = 
              streamSnapshot.data!.docs[index];
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(documentSnapshot["name"]),
                  subtitle: Text(documentSnapshot["price"].toString()),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(onPressed: (){
                          createOrUpdate(documentSnapshot);
                        }, 
                        icon: Icon(Icons.edit)
                        ),
                        IconButton(onPressed: (){
                          deleteproduct(documentSnapshot.id);
                        }, 
                        icon: Icon(Icons.delete)
                        ),
                      ],
                    ),
                  ),
                  
                ),
              );
            }
            );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: (){
          createOrUpdate();
        },
        child: Icon(Icons.add),
        ),
    );
    
  }
}