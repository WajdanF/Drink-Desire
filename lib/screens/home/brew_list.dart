import 'package:flutter/material.dart';
import 'package:germaway/models/brew.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);
   brews.forEach((brew){
  print(brew.name);
  print(brew.sugar);
  print(brew.strength);
   });

    return Padding(
      padding: const EdgeInsets.symmetric(vertical:5),
      child: ListView.builder(
        itemCount: brews.length,
        itemBuilder: (context, index ){
          int x = brews[index].strength;
          return Card(
            child: ListTile(
            onTap: (){
              
            },
            leading: CircleAvatar(
              backgroundColor: Colors.brown[x],
            ),
            title: Text('strength'),
          

                       
            )
          );
        }
        ),
    );

  }
}