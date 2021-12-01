import 'dart:convert';
// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/core/store.dart';
import 'package:flutter_demo/models/cart.dart';
import 'package:flutter_demo/models/catalog.dart';
// import 'package:flutter_demo/pages/tempCodeRunnerFile.dart';
import 'package:flutter_demo/utils/routes.dart';
// import 'package:flutter_demo/widgets/drawer.dart';
import 'package:flutter_demo/widgets/home_widgets.dart/catalog_header.dart';
import 'package:flutter_demo/widgets/home_widgets.dart/catalog_list.dart';
// import 'package:flutter_demo/widgets/item_widget.dart';
// import 'package:flutter_demo/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  final url =
      "https://gist.github.com/ayush-1601/9385ac304fdcd1b259d9725911baba4e";
  var crossAxisAlignment;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));

    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");

    // final response = await http.get(Uri.);
    // final catalogJson = response.body;

    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  // @override
  // Widget build(BuildContext context) {
  //   throw UnimplementedError();
  // }

  @override
// ignore: dead_code
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    //  final dummyList = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (context, _, VxStatus) => FloatingActionButton(
            // ignore: deprecated_member_use
            backgroundColor: context.theme.buttonColor,
            onPressed: () => Navigator.pushNamed(context, MyRoute.cartRoute),
            child: Icon(
              CupertinoIcons.cart,
              // color: Colors.white,
            ),
          ).badge(
              color: Vx.red600,
              size: 22,
              count: _cart.items.length,
              textStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        body: SafeArea(
          child: Container(
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatalogHeader(),
                  if (CatalogModel.items != null &&
                      CatalogModel.items.isNotEmpty)
                    CatalogList().py16().px12().expand()
                  else
                    CircularProgressIndicator().centered().expand(),
                ],
              )),
        ));
  }
}
