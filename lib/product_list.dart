import 'dart:convert';

import 'package:flutter/material.dart';
import"package:http/http.dart";

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  final Client httpClient = Client();
  Future<void> getProductListFromApi()async{
    // encode
    // decode

    Uri uri = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
    Response response = await httpClient.get(uri);
    print(response.statusCode);
    print(jsonDecode(response.body));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductListFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crud"),
      ),
      body: ListView.builder( itemCount: 5, itemBuilder: (context, index){

        return ListTile(
          title: Text("Product name"),
          subtitle: Text("Quantity: 1"),
          trailing: Text("Total: 120"),
          leading: Text("12/Unit"),
        );
      }),
    );
  }
}
