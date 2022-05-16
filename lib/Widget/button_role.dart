import 'package:fashionizt/Pages/desainer_explore.dart';
import 'package:fashionizt/Pages/mitra_explore.dart';
import 'package:fashionizt/pages/mall_explore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonRole extends StatelessWidget {
  const ButtonRole({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0,1),
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top:0, bottom: 5),
            child: Wrap(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DesainerExplore();
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      // color: Color(0xd6d6d6d6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 80,
                        child: Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: SvgPicture.asset(
                                'lib/Assets/svg/dress.svg',
                                height: 100,
                                width: 100,
                              ),
                            ),
                            Text(
                              'Desainer',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MallExplore();
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      // color: Color(0xd6d6d6d6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 80,
                        child: Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: SvgPicture.asset(
                                'lib/Assets/svg/marketplace.svg',
                                height: 100,
                                width: 100,
                              ),
                            ),
                            Text(
                              'Mall',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: ((context){
                              return MitraExplore();
                            })
                        )
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: SvgPicture.asset(
                                'lib/Assets/svg/sewingmachine.svg',
                                width: 100,
                                height: 100,
                              ),
                            ),
                            Text(
                              'Mitra Produksi',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
