import 'package:bytebank/components/Editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Criando Transferência';
const _accountLabel = 'Número da Conta';
const _valueLabel = 'Valor';
const _buttonConfirm = 'Confirmar';

class TransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController _fieldControllerAccountNumber =
  TextEditingController();
  final TextEditingController _fieldControllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_appBarTitle)),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Editor(controller: _fieldControllerAccountNumber, label: _accountLabel, hint: '0000'),
          Editor(controller: _fieldControllerValue, label: _valueLabel, icon: Icons.monetization_on, hint: '0.00'),
          ElevatedButton(
              onPressed: () => _createTransfer(context),
              child: Text(_buttonConfirm))
        ]),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int? accountNumber =
    int.tryParse(_fieldControllerAccountNumber.text);
    final double? value = double.tryParse(_fieldControllerValue.text);
    if (accountNumber != null && value != null) {
      final createdTransfer = Transfer(value, accountNumber);
      Navigator.pop(context, createdTransfer);
    }
  }
}