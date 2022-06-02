import 'package:fashionizt/constants.dart';
import 'package:fashionizt/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fashionizt/Pages/desainer_explore.dart';
import 'package:fashionizt/Pages/mitra_explore.dart';
import 'package:fashionizt/pages/mall_explore.dart';


class Role extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<Map<String, dynamic>> role = [
      {"icon": "lib/Assets/svg/desainer.svg", "text": "Desainer", "press": DesainerExplore()},
      {"icon": "lib/Assets/svg/mall.svg", "text": "Marketplace", "press": MallExplore()},
      {"icon": "lib/Assets/svg/sewing.svg", "text": "Mitra Produksi", "press": MitraExplore()},
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          role.length,
              (index) => RoleCard(
            icon: role[index]["icon"],
            text: role[index]["text"],
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context){
                return role[index]["press"];
              })));
            },
          ),
        ),
      ),
    );
  }
}

class RoleCard extends StatelessWidget {
  const RoleCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(100),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              height: getProportionateScreenWidth(65),
              width: getProportionateScreenWidth(65),
              decoration: BoxDecoration(
                color: blush,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 10),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}