import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/Provider/favourite_provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider=Provider.of<FavouriteItem>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Favourite App",),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context,int index){
                return Consumer<FavouriteItem>(builder: (context,value,child){
                  return ListTile(
                    onTap: (){
                      if(value.selected.contains(index))
                        value.removeItem(index);
                      else
                        value.addItem(index);
                    },
                    title: Text("Item"+index.toString()),
                    trailing: Icon(value.selected.contains(index)?Icons.favorite:Icons.favorite_outline),
                  );
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
