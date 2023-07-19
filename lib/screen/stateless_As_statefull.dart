// ignore_for_file: must_be_immutable, prefer_final_fields

import 'package:flutter/material.dart';

class NofifyListerScreen extends StatelessWidget {
  NofifyListerScreen({super.key});
  ValueNotifier<int> _count = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);
  //ValueNotifier extends ChangeNotifier (define data type both side)

  @override
  Widget build(BuildContext context) {
    //print('stateless widget build');
    return Scaffold(
      appBar: AppBar(title: const Text('Use Stateless widget as Statefull')),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Center(
            child: ValueListenableBuilder(
              // passward example
              valueListenable: toggle,
              builder: (context, value, child) {
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  child: TextFormField(
                    obscureText: toggle.value,
                    decoration: InputDecoration(
                      hintText: 'passward',
                      suffixIcon: InkWell(
                          onTap: () {
                            toggle.value = !toggle
                                .value; // set true/fale on tap one by one
                          },
                          child: Icon(toggle.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility)),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: ValueListenableBuilder(
            //ValueNotifier<T> extends ChangeNotifier implements ValueListenable<T>
            valueListenable: _count,
            builder: (context, value, child) {
              return Text(
                _count.value.toString(),
                style: const TextStyle(fontSize: 25),
              );
            },
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _count.value++;
          print(_count.value.toString());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
