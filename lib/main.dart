import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Transferências')
          ),
          body: TransferList(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {  },
            child: Icon(Icons.add),
          ),
        )
));

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        TransferItem(Transfer(150.5, 000123)),
        TransferItem(Transfer(166.5, 000123)),
      ],
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.accountNumber.toString()),
      ),
    );
  }

}

class Transfer {
  final double value;
  final int accountNumber;

  Transfer(this.value, this.accountNumber);
}