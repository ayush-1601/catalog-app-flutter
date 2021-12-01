import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/home_widgets.dart/add_to_cart.dart';
import 'package:flutter_demo/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_demo/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${catalog.price}".text.bold.xl4.red400.make(),
          AddToCart(catalog: catalog).wh(120, 40),
        ],
      ).p16().backgroundColor(context.cardColor),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(
                      catalog.image,
                    ).centered())
                .h32(context)
                .p16(),
            Expanded(
                child: VxArc(
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              height: 30.0,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.bold.xl4
                        .color(context.accentColor)
                        .make(),
                    catalog.desc.text.caption(context).xl.make(),
                    10.heightBox,
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
