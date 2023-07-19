// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/Example_one_provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  // double input_value = 1.0; // initilize value
  @override
  Widget build(BuildContext context) {
    final example_One_provider =
        Provider.of<ExampleOneProvider>(context, listen: false);
    print('build whole example one widger');
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('provider second example'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(
            // consumer user for builld only its child not complete widgets
            builder: (context, value, child) {
              return Slider(
                  //slider
                  min: 0, // req
                  max: 1, // req
                  value: example_One_provider
                      .value, // value define in exampleone class and pass below in val
                  onChanged: (val) {
                    // val come onchange b/w 0-1
                    print(val);
                    example_One_provider
                        .setValue(val); //setvalue req double value
                  });
            },
          ),
          Consumer<ExampleOneProvider>(
            // consumer user for builld only its child not complete widgets
            builder: (context, value, child) {
              // pass class to consumer Remember!!(Exampleoneprovider)
              print('build only consumer');
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.amber
                              .withOpacity(example_One_provider.value)),
                      child: const Center(child: Text('container 1')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.green
                              .withOpacity(example_One_provider.value)),
                      child: const Center(child: Text('container 2')),
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
