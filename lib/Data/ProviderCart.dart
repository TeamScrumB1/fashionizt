
import 'package:fashionizt/Data/db_helper.dart';
import 'package:fashionizt/Models/Cart.dart';
// import 'package:fashionizt/Models/Cart.dart';
import 'package:flutter/cupertino.dart';

class KeranjangProv with ChangeNotifier{
  int jumlah = 0;

  jumlahplus()async{
    jumlah = await _getAllKeranjang();
    notifyListeners();
  }
}
Future<int> _getAllKeranjang() async{
  DbHelper db = DbHelper();
  List<CartShop> listKeranjang = [];
  var list = await db.getAllKeranjang();
  listKeranjang.clear();
  list!.forEach((keranjang) {
    listKeranjang.add(CartShop.fromMap(keranjang));
  });
  return listKeranjang.length;
}