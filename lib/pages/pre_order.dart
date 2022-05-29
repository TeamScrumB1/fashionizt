import 'package:fashionizt/constants.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreOrder extends StatelessWidget {
  const PreOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blacksand,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: blush,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Pre Order',
          style: titleApps,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Judul :', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 5),
            TextField(
              maxLines: 1,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(width: 1)
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15.0),),
            Text('Kebutuhan Spesifikasi :', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 5),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(width: 1)
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15.0),),
            Text('Budget :', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 5),
            TextField(
              maxLines: 1,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(width: 1)
                  ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15.0),),
            Text('Lampiran :', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 5),
            TextField(
              maxLines: 1,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(width: 1)
                  ),
              ),
            ),
            SizedBox(height: 20,),

            Card(
              color: blacksand,
              elevation: 5,
              child: Container(
                height: 40,
                child: InkWell(
                  splashColor: blush,
                  onTap: (){},
                  child: Center(
                    child: Text("Submit", style: TextStyle(fontSize: 15, color: blush),),
                  ),
                ),
              ),
            )
              ],
            )
        ),
      );
  }
}