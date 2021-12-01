import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Transferências')
          ),
          body: Column(
            children: const [
              Card(
                child: ListTile(
                  leading: Icon(Icons.monetization_on),
                  title: Text('100.0'),
                  subtitle: Text('123456-00'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.monetization_on),
                  title: Text('300.0'),
                  subtitle: Text('123456-00'),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {  },
            child: Icon(Icons.add),
          ),
        )
));
