import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favourite_provider.dart';

class MyFavourite extends StatefulWidget {
  const MyFavourite({Key? key}) : super(key: key);

  @override
  State<MyFavourite> createState() => _MyFavouriteState();
}

class _MyFavouriteState extends State<MyFavourite> {

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
            child: Consumer<FavouriteProvider>(
              builder: (context,child,value) {
                return ListView.builder(
                    itemCount: favouriteProvider.selectedItem.length,
                    itemBuilder: (context,index) {
                      return Consumer<FavouriteProvider>(
                          builder: (context,value,child) {
                            return ListTile(
                              onTap: () {
                                if(value.selectedItem.contains(value.selectedItem[index])) {
                                  value.removeItem(value.selectedItem[index]);
                                }
                                print(value.selectedItem);
                              },
                              title: Text('Item  ${value.selectedItem[index]} '),
                              trailing:  value.selectedItem.contains(value.selectedItem[index])? Icon(Icons.favorite):Icon(Icons.favorite_border),
                            );
                          });
                    });
              },
            )
          )
        ],
      ),
    );
  }
}
