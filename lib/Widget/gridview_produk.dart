import 'package:fashionizt/Api/api_produk.dart';
import 'package:fashionizt/Models/produk_model.dart';
import 'package:fashionizt/Pages/detail_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Widget/product_card.dart';

class GridViewProduk extends StatefulWidget {
  const GridViewProduk({Key? key}) : super(key: key);

  @override
  State<GridViewProduk> createState() => _GridViewProdukState();
}

class _GridViewProdukState extends State<GridViewProduk> {
  late Future<Produk> _produk;

  @override
  void initState(){
    super.initState();
    _produk = ApiServiceProd().topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 250,
      child: FutureBuilder(
        future: _produk,
        builder: (context, AsyncSnapshot<Produk> snapshot){
          var state = snapshot.connectionState;
          if(state!=ConnectionState.done){
            return Center(child: CircularProgressIndicator());
          }else{
            if(snapshot.hasData){
              return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1/1.5,
                ),
                itemBuilder: (context, index) {
                  var produk = snapshot.data?.produk[index];
                  return InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context){
                              return DetailProduct(detail: produk!);
                            })
                        );
                      },
                      child: ProductCard(produk: produk!)
                  );
                },
                itemCount: snapshot.data?.produk.length,
              );
            }else if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()));
            }else{
              return Text('');
            }
          }
        },
      ),
    );
  }
}