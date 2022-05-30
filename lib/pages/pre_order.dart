import 'package:fashionizt/constants.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreOrder extends StatelessWidget {
  const PreOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 2,
    child: Scaffold(
      resizeToAvoidBottomInset: false,
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
        bottom: TabBar(
          indicatorColor: blush,
          labelColor: blush,
          tabs:<Widget>[
          Tab(
            child: Text('Form', style: TextStyle(
              fontSize: 16,
              ),
            ),
          ),
          Tab(
            child: Text('History', style: TextStyle(
              fontSize: 16,
              ),
            ),
          ),
        ],
        ),
      ),
      body: TabBarView(
        children: [
         SingleChildScrollView(
              padding: EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Judul :', style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5),
                  TextField(
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(
                       border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Kebutuhan Spesifikasi :', style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5),
                  TextField(
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Budget :', style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5),
                  TextField(
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Lampiran :', style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5),
                  TextField(
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
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
             ])
          ),
          Container(

          ),
        ],
      )
        ),
      );
}