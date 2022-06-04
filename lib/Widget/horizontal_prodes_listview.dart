import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/Pages/detail_desainer.dart';
import 'package:fashionizt/Widget/card_des_profile.dart';
import 'package:fashionizt/Widget/card_prodes_profile.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Api/api_short_desainer.dart';
import 'package:fashionizt/Models/desainer_model.dart';

class HorProDesListView extends StatefulWidget {
  const HorProDesListView({Key? key}) : super(key: key);

  @override
  State<HorProDesListView> createState() => _HorProDesListViewState();
}

class _HorProDesListViewState extends State<HorProDesListView> {
  late Future<Desainer> _desainer;
  String status = "false";

  @override
  void initState(){
    super.initState();
    _desainer = ApiServiceDes().topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 275,
      child: FutureBuilder(
        future: _desainer,
        builder: (context, AsyncSnapshot<Desainer> snapshot){
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
                    var desainer = snapshot.data?.desainer[index];
                    return InkWell(
                        onTap: (){
                          Navigator.push((context),
                              MaterialPageRoute(builder: (context){
                                return DetailDesainer(desainer: desainer!);
                              })
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 1,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            height: size.height*1,
                            width: size.width*0.4,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: CircleAvatar(
                                      backgroundImage:  CachedNetworkImageProvider(
                                          desainer!.imgProfil),
                                      radius: 65,
                                    ),
                                  ),
                                ),
                                Text(
                                  desainer.nama,
                                  style: nameHorizontalCardTextStyle,
                                ),
                                SizedBox(height: 5),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.star,
                                        size: 20.0,
                                        color: Colors.amber,
                                      ),
                                      Text(desainer.rating,style: ratingHorizontalCardTextStyle,),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                status == "false" || status == desainer.id ?
                                ElevatedButton(
                                  onPressed: (){
                                    setState(() {
                                      status = desainer.id;
                                    });
                                  },
                                  child: Text(
                                    'Accepted',
                                    style: TextStyle(
                                      color: status == desainer.id ? Colors.white : Colors.green,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(status == desainer.id ? Colors.green : Colors.white),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.green),
                                        ),
                                      )
                                  ),
                                ) : ElevatedButton(
                                  onPressed: null,
                                  child: Text(
                                    'Rejected',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                        ),
                                      )
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                    );
                  },
                  itemCount: snapshot.data?.desainer.length,
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