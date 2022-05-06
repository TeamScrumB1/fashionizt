import 'package:fashionizt/Widget/item_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Data/data_kategori.dart';
import 'package:flutter/widgets.dart';

class CategoryProduct extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          for(int i=0;i<kategoriList.length;i++)
            ItemCategory(nama: kategoriList[i].name, img: kategoriList[i].img)
        ],
      ),
    );
  }
}
