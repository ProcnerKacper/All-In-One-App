import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/shop_list.dart';

class AddListItem extends StatefulWidget {
  static const routeName = '/add-list-item';
  @override
  _AddListItemState createState() => _AddListItemState();
}

class _AddListItemState extends State<AddListItem> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  Map<String, dynamic> _formData = {};

  void _onSave() {
    var valid = _key.currentState.validate();
    if (valid) {
      _key.currentState.save();
      Provider.of<ShopList>(context)
          .addItem(_formData['name'], _formData['amount']);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dodaj nowy produkt'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Nazwa produktu'),
                  validator: (String val) =>
                      val == '' ? 'Nie podano nazyw produktu!' : null,
                  onSaved: (val) {
                    setState(() => _formData['name'] = val);
                  }),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Ilość'),
                  validator: (String val) => val == '' ? 'Podaj ilość!' : null,
                  onSaved: (val) {
                    setState(() => _formData['amount'] = val);
                  }),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                onPressed: _onSave,
                child: const Text('Dodaj produkt'),
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
