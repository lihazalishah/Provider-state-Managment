import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/favourite_item_provider.dart';

import 'myfavouritelist.dart';

class FavouriteApp extends StatefulWidget {
  const FavouriteApp({super.key});

  @override
  State<FavouriteApp> createState() => _FavouriteAppState();
}

class _FavouriteAppState extends State<FavouriteApp> {
  List<int> selectItemsList = []; // uses with setstate
  //bool flag = true;
  @override
  Widget build(BuildContext context) {
    // final Favourite_items_Provider =
    //     Provider.of<FavouriteItemProvider>(context, listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Farourite App')),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyFavouriteItemscreen(
                        select: selectItemsList,
                      ),
                    ));
              },
              child: const Icon(Icons.favorite)),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<FavouriteItemProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        // selectitem.add(index); // with setsate
                        // setState(() {});
                        if (value.SelectItems.contains(index)) {
                          // print(value.SelectItems.contains(index)); // value checking
                          value.removeitem(
                              index); // here value gives all thing of Favouriteitemprovider
                          selectItemsList.remove(index);
                          // print(selectItemsList); // value checking
                        } else {
                          value.selectedItems(index);
                          selectItemsList.add(index);
                          // print(selectItemsList); // value checking
                        }
                      },
                      onLongPress: () {
                        // selectitem.remove(index); // with setsate
                        // setState(() {});
                      },
                      title: Text('item$index'),
                      // trailing: Icon(selectitem.contains(index) // wit setstate
                      //     ? Icons.favorite
                      //     : Icons.favorite_outline),
                      trailing: Icon(value.SelectItems.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_outline),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
