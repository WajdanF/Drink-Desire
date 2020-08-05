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
    final brews = Provider.of<List<Brew>>(context) ?? [];
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
            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
             shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))


          ) ,
            child: ListTile(
            onTap: (){
              
            },
            leading: CircleAvatar(
              backgroundColor: Colors.brown[x],
              backgroundImage: AssetImage('Assets/coffee_icon.png'),
            ),
            title: Text('${brews[index].name}'),
            subtitle: Text('Takes ${brews[index].sugar} sugar(s)'),


  
            )
          );
        }
        ),
    );

  }
}