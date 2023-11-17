/* import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/buttons.dart';

class CheckBoxPago extends StatefulWidget {
  const CheckBoxPago({super.key});

  @override
  State<CheckBoxPago> createState() => _CheckBoxPagoState();
}

final List<String?> listMediosPagoSeleccionado = [];

final List<String> listMediosPago = [
  "Nequi",
  "Bancolombia",
  "Banco Bogota",
  "Visa"
];

String? dropdownValue;

class _CheckBoxPagoState extends State<CheckBoxPago> {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const  Text("Filtro CheckBox", style: TextStyle(fontSize: 16)),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),

      body: Center(
        child: Column(children: [

          Text(dropdownValue ?? "Seleccione una opción"),
          
          Container(
            height: 50,
            width: size.width,
            color: Colors.black12,
            child: DropdownButton(
              isExpanded: true,
              value: dropdownValue,
              // "items" va a contener la lista que aparecera en el "DropdownButton"
              items: listMediosPago.map((medioPago) { // "mediosPago" valor a seleccionar en la lista
                return DropdownMenuItem(
                  //child: Text(medioPago), // "child" muestra el valor seleccionado en la lista
                  child: Text("${MultiSelect(items: listMediosPago)}"),
                  value: medioPago, // "value" lo que va a contener lo seleccionado en la lista
                );
              }).toList(),
                
              onChanged: (value) {
                setState(() {
                  dropdownValue = value ?? "Seleccione una opción";
                });
                print(value); // muestra por consola el valor seleccionado en la lista
              },
            ),
          ),



          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
        
              Flexible(
                child: ButtonSecondary(
                  textButton: "Cancelar",
                  onpressParam: () {
                  },              ),
              ),
        
              const SizedBox(
                width: 15,
              ),
        
              Flexible(
                child: ButtonPrimary(
                  textButton: "Buscar",
                  onpressParam: () {
                    context.pop(context);
                  },
                ),
              ),
            ]
          ),
        ]),
      ),
    );
  }
}




class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<MultiSelect> createState() => _MultiSelectState();
  //State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {

  final List<String> _selectedItems = [];

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Filtro"),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
            .map((item) => CheckboxListTile(
              value: _selectedItems.contains(item),
              title: Text(item),
              controlAffinity: ListTileControlAffinity.leading, 
              onChanged: (isChecked) => _itemChange(item, isChecked!)
              )
            ).toList(),
          ),
        ),
        actions: [
          TextButton(onPressed: _cancel, child: const Text("Cancel")),
          ElevatedButton(onPressed: _submit, child: const Text("Submit")),
        ],
      );
  }
} */