import 'package:fashionizt/Widget/card_promit_profile.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Api/api_short_konveksi.dart';
import 'package:fashionizt/Models/konveksi_model.dart';
import 'package:fashionizt/Widget/card_mit_profile.dart';
import '../Pages/detail_mitra.dart';

class HorProMitListView extends StatefulWidget {
  const HorProMitListView({Key? key}) : super(key: key);

  @override
  State<HorProMitListView> createState() => _HorProMitListViewState();
}

class _HorProMitListViewState extends State<HorProMitListView> {
  late Future<Konveksi> _konveksi;
  @override
  void initState(){
    super.initState();
    _konveksi = ApiServiceMit().topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      child: FutureBuilder(
        future: _konveksi,
        builder: (context, AsyncSnapshot<Konveksi> snapshot){
          var state = snapshot.connectionState;
          if(state!=ConnectionState.done){
            return Center(child: CircularProgressIndicator());
          }else{
            if(snapshot.hasData){
              return Container(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var konveksi = snapshot.data?.konveksi[index];
                    return InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context){
                                return DetailKonveksi(konveksi: konveksi!);
                              })
                          );
                        },
                        child: CardProMitProfile(konveksi: konveksi!)
                    );
                  },
                  itemCount: snapshot.data?.konveksi.length,
                ),
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