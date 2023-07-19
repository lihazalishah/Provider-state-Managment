// ignore_for_file: camel_case_types, non_constant_identifier_names, duplicate_ignore, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/count_provider.dart';

class Count_Example extends StatefulWidget {
  const Count_Example({super.key});

  @override
  State<Count_Example> createState() => _Count_ExampleState();
}

class _Count_ExampleState extends State<Count_Example> {
  @override
  void initState() {
    // call first
    super.initState();
    final count_provider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 2), (timer) {
      // after every sec call set count
      count_provider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names,
    print('build whole widget');
    final count_Provider = Provider.of<CountProvider>(context,
        listen:
            false); // call provider class with created countprovider , here listener false mean build only consumer widget
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Provider count example')),
      ),
      body: Center(child: Consumer<CountProvider>(
        //consumer widget use for build specific widget
        builder: (context, value, child) {
          print('build only consumer');
          return Text(
            value.count
                .toString(), // call count initialize in countprovider class
            style: const TextStyle(
              fontSize: 25,
            ),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count_Provider.setCount(); // set count is method in countprovider
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
