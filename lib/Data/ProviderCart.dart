
import 'package:fashionizt/Data/db_helper.dart';
import 'package:fashionizt/Models/Cart.dart';
import 'package:flutter/cupertino.dart';

class KeranjangProv with ChangeNotifier{
  int jumlah = 0;

  DbHelper db = DbHelper();

  jumlahplus(int x){
    jumlah = x;
    notifyListeners();
  }
}