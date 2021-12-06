import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: TransferForm(),
    ));
  }
}

class TransferForm extends StatelessWidget {
  final TextEditingController _fieldControllerAccountNumber =
      TextEditingController();
  final TextEditingController _fieldControllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criando Transferência')),
      body: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: _fieldControllerAccountNumber,
            style: TextStyle(fontSize: 24.0),
            decoration:
                InputDecoration(labelText: 'Número da Conta', hintText: '0000'),
            keyboardType: TextInputType.number,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: _fieldControllerValue,
            style: TextStyle(fontSize: 24.0),
            decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0.00'),
            keyboardType: TextInputType.number,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              debugPrint('clicou no confirmar');
              final int? accountNumber =
                  int.tryParse(_fieldControllerAccountNumber.text);
              final double? value = double.tryParse(_fieldControllerValue.text);
              if (accountNumber != null && value != null) {
                final createdTransfer = Transfer(value, accountNumber);
                debugPrint('$createdTransfer');
              }
            },
            child: Text('Confirmar'))
      ]),
    );
  }
}

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Transferências')),
      body: Column(
        children: <Widget>[
          TransferItem(Transfer(150.5, 000123)),
          TransferItem(Transfer(166.5, 000123)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
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

  @override
  String toString() {
    return 'Transfer{value: $value, accountNumber: $accountNumber}';
  }
}
