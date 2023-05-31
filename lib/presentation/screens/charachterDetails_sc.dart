import 'package:bloc_breaking_bad/app_constants.dart';
import 'package:bloc_breaking_bad/data/models/charachter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class charachterDetailsScreen extends StatelessWidget {
  Character charachter; 
  
 charachterDetailsScreen({required this.charachter,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          appBar(),
          content()
        ],
      ),
    );
  }
  
  Widget content() {
    return SliverList(delegate: SliverChildListDelegate([
      buildText('Name: ',charachter.name,),
      buildDivider(300),
      buildText('eposide ',charachter.episode.join(' / ')),
      buildDivider(300),
      buildText('gender: ',charachter.gender),
      buildDivider(300),
      buildText('species: ',charachter.species),
      buildDivider(300),
      buildText('Created: ',charachter.created,),
      buildDivider(300),
      buildText('Status ',charachter.status),
      buildDivider(300),
      buildText('Type: ',charachter.type),
      buildDivider(300),
      SizedBox(height: 100,)
      
     
    ]));
  }
  
  appBar() {return SliverAppBar(
    backgroundColor: Colors.black,
    expandedHeight:600 ,
    //toolbarHeight:600 ,
    pinned: true,
    stretch: true,
    flexibleSpace: FlexibleSpaceBar(
      title: Text(charachter.name),
      background: Image.network(charachter.image,fit: BoxFit.cover,),
    ),
    
  );}
  
  buildText(String title,String info) {
    return RichText(maxLines: 1,text: TextSpan(
      children: [
        TextSpan(text: title,style:constants.fontStyle1),
        TextSpan(text: info,style: constants.fontStyle1.copyWith(fontSize: 20)),
      ]
    ));
  }
  
  buildDivider(double val) {
    return Divider(height: 30,endIndent: val,color: Colors.black,);
  }
}