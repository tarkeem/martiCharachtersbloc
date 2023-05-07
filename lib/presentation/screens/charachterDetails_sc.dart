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
      buildText('Name: ',charachter.name),
      buildDivider(300),
      buildText('eposide ',charachter.episode.join(' / ')),
      buildDivider(300),
      buildText('gender: ',charachter.gender),
      buildDivider(300),
      buildText('species: ',charachter.species),
      buildDivider(300),
      SizedBox(height: 500,)
    ]));
  }
  
  appBar() {return SliverAppBar(
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
        TextSpan(text: title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
        TextSpan(text: info,style: TextStyle(fontSize: 10,overflow: TextOverflow.ellipsis)),
      ]
    ));
  }
  
  buildDivider(double val) {
    return Divider(height: 30,endIndent: val,color: Colors.black,);
  }
}