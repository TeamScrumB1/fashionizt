import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/Data/db_helper.dart';
import 'package:fashionizt/Models/Cart.dart';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KeranjangProduk extends StatefulWidget {
  const KeranjangProduk({Key? key}) : super(key: key);

  @override
  State<KeranjangProduk> createState() => _KeranjangProdukState();
}

class _KeranjangProdukState extends State<KeranjangProduk> {
  List<CartShop> listKeranjang = [];
  DbHelper db = DbHelper();

  @override
  void initState(){
    _getAllKeranjang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blacksand,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: blush,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Keranjang',
          style: titleApps,
        ),
      ),
      body: ListView.builder(
          itemCount: listKeranjang.length,
          itemBuilder: (context,index){
            CartShop keranjang = listKeranjang[index];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F6F9),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.network('${keranjang.Gambar}'),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${keranjang.NamaProduk}',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        maxLines: 2,
                      ),
                      //Text(
                      // cart.product.owner,
                      // style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                      //  maxLines: 2,
                      // ),
                      SizedBox(height: 10),
                      Text.rich(
                        TextSpan(
                          text: "\Rp ${keranjang.Harga}",
                          style: TextStyle(fontWeight: FontWeight.w600, color: brownColor),
                          children: [
                            TextSpan(
                                text: " x1",
                                style: Theme.of(context).textTheme.bodyText1),
                          ],
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: (){
                        _deleteKeranjang(keranjang, index);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: blacksand,
                      ),
                  )
                ],
              ),
            );
          }
      ),
    );
  }

  Future<void> _getAllKeranjang() async {
    var list = await db.getAllKeranjang();
    setState(() {
      listKeranjang.clear();
      list!.forEach((keranjang) {
        listKeranjang.add(CartShop.fromMap(keranjang));
      });
    });
  }

  Future<void> _deleteKeranjang(CartShop keranjang, int position) async {
    await db.deleteKeranjang(keranjang.id!);

    setState(() {
      listKeranjang.removeAt(position);
    });
  }
}