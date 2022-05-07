import 'package:fashionizt/constants.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Models/Cart.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';
import '../../../size_config.dart';

class CartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    {
      return Scaffold(
        appBar: buildAppBar(context),
        body: Body(),
        bottomNavigationBar: CheckoutCard(),
      );
    }
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: Colors.black,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      backgroundColor: darkYellowColor,
      title: Column(
        children:[
          Text.rich(
            TextSpan(
              text: "Your Cart\n",
              style: TextStyle(fontFamily: 'Poppins', fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: "${demoCarts.length} items",
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ]
      ),
      );
  }
}
