// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/remove_favourite_Item_provider.dart';

class MyFavouriteItemscreen extends StatefulWidget {
  List<int> select;
  MyFavouriteItemscreen({super.key, required this.select});

  @override
  State<MyFavouriteItemscreen> createState() => _MyFavouriteItemscreenState();
}

class _MyFavouriteItemscreenState extends State<MyFavouriteItemscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Farourite items')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<RemovefavouriteItemProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: widget.select.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        value.removeItem(
                            index); //remove from list(index of item)
                        widget.select.remove(widget.select[
                            index]); //remove from list(index of pass list)
                      },

                      title: Text(
                          'item${widget.select[index]}'), // pass data index
                      trailing: Icon(value.items.contains(index)
                          ? Icons.favorite_outline
                          : Icons.favorite),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
    ;
  }
}
