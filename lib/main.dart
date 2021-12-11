import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: TransferList(),
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
        Editor(controller: _fieldControllerAccountNumber, label: 'Número da Conta', hint: '0000'),
        Editor(controller: _fieldControllerValue, label: 'Valor', icon: Icons.monetization_on, hint: '0.00'),
        ElevatedButton(
            onPressed: () => _createTransfer(context),
            child: Text('Confirmar'))
      ]),
    );
  }

  void _createTransfer(BuildContext context) {
    final int? accountNumber =
        int.tryParse(_fieldControllerAccountNumber.text);
    final double? value = double.tryParse(_fieldControllerValue.text);
    if (accountNumber != null && value != null) {
      final createdTransfer = Transfer(value, accountNumber);
      debugPrint('CRIANDO TRANSFERENCIA...');
      debugPrint('$createdTransfer');
      Navigator.pop(context, createdTransfer);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final IconData? icon;

  Editor({this.controller, this.label, this.hint, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(icon: icon != null ? Icon(icon) : null, labelText: label, hintText: hint),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class TransferList extends StatelessWidget {
  final List<Transfer> _transfers = [];

  @override
  Widget build(BuildContext context) {
    _transfers.add(Transfer(200, 1000));
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Transferências')),
      body: ListView.builder(
        itemCount: _transfers.length,
        itemBuilder: (context, index) {
          final transfer = _transfers[index];
          return TransferItem(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transfer?> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferForm();
          }));
          future.then((receivedTransfer) {
            debugPrint('MEU DEUS');
            debugPrint('$receivedTransfer');
            if (receivedTransfer != null) {
              _transfers.add(receivedTransfer);
            }
          });
        },
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
