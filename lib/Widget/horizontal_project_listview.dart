import 'package:fashionizt/Pages/detail_desainer.dart';
import 'package:fashionizt/Widget/card_des_profile.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Api/api_project.dart';
import 'package:fashionizt/Models/project_model.dart';

import 'card_project.dart';

class HorDesListView extends StatefulWidget {
  const HorDesListView({Key? key}) : super(key: key);

  @override
  State<HorDesListView> createState() => _HorDesListViewState();
}

class _HorDesListViewState extends State<HorDesListView> {
  late Future<Project> _project;
  @override
  void initState(){
    super.initState();
    _project = ApiServiceProject().topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.only(left: 10),
      child: FutureBuilder(
        future: _project,
        builder: (context, AsyncSnapshot<Project> snapshot){
          var state = snapshot.connectionState;
          if(state!=ConnectionState.done){
            return Center(child: CircularProgressIndicator());
          }else{
            if(snapshot.hasData){
              return Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var project = snapshot.data?.project[index];
                    return InkWell(
                        onTap: (){
                          // Navigator.push((context),
                          //     MaterialPageRoute(builder: (context){
                          //       return DetailProject(project: project!);
                          //     })
                          // );
                        },
                        child: CardProject(
                            project: project!
                        )
                    );
                  },
                  itemCount: snapshot.data?.project.length,
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