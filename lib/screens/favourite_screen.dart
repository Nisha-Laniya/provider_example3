import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example3/provider/favourite_provider.dart';
import 'package:provider_example3/screens/myfavourite.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteProvider>(context,listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite App'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyFavourite()));
              },
                child: Icon(Icons.favorite)),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
                itemBuilder: (context,index) {
                  return Consumer<FavouriteProvider>(
                      builder: (context,value,child) {
                        return ListTile(
                          onTap: () {
                            if(value.selectedItem.contains(index)) {
                                value.removeItem(index);
                            } else {
                              value.addItem(index);
                            }
                            print(favouriteProvider.selectedItem);

                          },
                          title: Text('Item ${index}'),
                          trailing: Icon(
                              value.selectedItem.contains(index) ? Icons.favorite : Icons.favorite_border),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}
