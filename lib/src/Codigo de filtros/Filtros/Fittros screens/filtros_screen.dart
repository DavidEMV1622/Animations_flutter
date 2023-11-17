/* import 'package:credibanco_plus_app/presentation/screens/Filtro_screens/provider/dropdown_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../widgets/FIltros/movimiento_model.dart';
import '../../widgets/FIltros/movimientos_card.dart';
import '../../widgets/buttons.dart';

/* class MovimientoPage extends StatefulWidget {
  const MovimientoPage({super.key});

  @override
  State<MovimientoPage> createState() => _MovimientoPageState();
}

class _MovimientoPageState extends State<MovimientoPage> {

  void _showMultiSelect() async {

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: context.watch<DropDown>().listMediosPago);
      },
    );

    if (results != null) {
      //setState(() {
        context.read<DropDown>().setAddAllListMediosPagoSeleccionado(results);
        
        //_selectedItems = results;
      //});
    }
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const  Text("Movimientos", style: TextStyle(fontSize: 16)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
        child: Column(
          children: [

            SizedBox(
              width: size.width,
              child: ElevatedButton(
                onPressed: _showMultiSelect,
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  side: const BorderSide(color: Colors.black54, width: 1),
                  elevation: 0.0,
                  backgroundColor: const Color(0xFFFFFFFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    context.watch<DropDown>().listMediosPagoSeleccionado.isEmpty ? 
                    const Text("Metodo de Pago", style: TextStyle(color: Colors.black87)) :
                    Wrap(
                      children: 
                      
                      context.watch<DropDown>().listMediosPagoSeleccionado.map((e) => Text("$e, ", 
                        style: const TextStyle(color: Colors.black87),)
                      ).toList(),
                    ),
                    const Icon(Icons.arrow_drop_down, color: Colors.black,)
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            /* Wrap(
              children: _selectedItems.map((e) => Chip(label: Text(e),))
              .toList(),
            ), */
            Wrap(
              children: context.watch<DropDown>().listMediosPagoSeleccionado.map((e) => Text("$e, "))
              .toList(),
            ),

            /* Container(
              height: 50,
              width: size.width,
              color: Colors.black12,
              child: DropdownButton(
                isExpanded: true,
                /* value: context.watch<DropDown>().listMediosPagoSeleccionado.isEmpty ? "Medio de pago" :
                Wrap(
                  children: context.watch<DropDown>().listMediosPagoSeleccionado.map((e) => Text("$e, ", 
                    style: const TextStyle(color: Colors.black87),)
                  ).toList(),
                ), */
                // "items" va a contener la lista que aparecera en el "DropdownButton"
                items: context.read<DropDown>().showMultiSelect.map((medioPago) { // "mediosPago" valor a seleccionar en la lista
                  return DropdownMenuItem(
                    child: Text(medioPago), // "child" muestra el valor seleccionado en la lista
                    value: medioPago, // "value" lo que va a contener lo seleccionado en la lista
                  );
                }).toList(),
                onTap: _showMultiSelect,
                onChanged: (value) {
                  /* setState(() {
                    dropdownValue = value ?? "Seleccione una opción";
                  }); */
                  print(value); // muestra por consola el valor seleccionado en la lista
                },
              ),
            ), */
          ],
        ),
      )
    );
  }
}



class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {

  //final List<String> _selectedItems = [];

  void _itemChange(String itemValue, bool isSelected) {
    //setState(() {
      if (isSelected) {
        //_selectedItems.add(itemValue);
        //context.watch<DropDown>().listMediosPagoSeleccionado.add(itemValue);
        context.read<DropDown>().setListMediosPagoSeleccionado(itemValue);
      } else {
        //_selectedItems.remove(itemValue);
        //context.watch<DropDown>().listMediosPagoSeleccionado.remove(itemValue);
        context.read<DropDown>().removelistMediosPagoSeleccionado(itemValue);
      }
    //});
  }

  void _cancel() {
    Navigator.pop(context);
  }

  /* void _submit() {
    //Navigator.pop(context, _selectedItems);
    Navigator.pop(context, context.watch<DropDown>().listMediosPagoSeleccionado);
  } */

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text("Metodos de pago")),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items.map((item) => CheckboxListTile(
            value: context.watch<DropDown>().listMediosPagoSeleccionado.contains(item),
            title: Text(item),
            controlAffinity: ListTileControlAffinity.leading, 
            onChanged: (isChecked) => _itemChange(item, isChecked!)
            )
          ).toList(),
        ),
      ),
      actions: [
        //TextButton(onPressed: _cancel, child: const Text("Cancel")),
        //ElevatedButton(onPressed: _submit, child: const Text("Submit")),
        ElevatedButton(onPressed: _cancel, child: const Text("Salir")),
      ],
    );
  }
}



/* import 'package:flutter/material.dart';

import '../../widgets/FIltros/movimiento_model.dart';

class MovimientoPage extends StatelessWidget {

  const MovimientoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String filter = "Bancolombia";
    final String filterTwo = "11/11/2023";
    final filteredMovimientos = filterMovimientos(listMovimientos, filter, filterTwo); // Filtrar elementos con el string "item 1"

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Elementos"),
      ),
      body: ListView.builder(
        itemCount: filteredMovimientos.length,
        itemBuilder: (context, index) {
          final item = filteredMovimientos[index];
          return Column(children: [
            Text(item.id.toString()),
            Text(item.name),
            Text(item.valor.toString()),
            Text(item.fecha),
          ],);
        },
      ),
    );
  }
} */

 */





/* class MovimientoPage extends StatefulWidget {
  
  const MovimientoPage({super.key});

  @override
  State<MovimientoPage> createState() => _MovimientoPageState();
}

class _MovimientoPageState extends State<MovimientoPage> {

  List<DropDown> myDropdown = [
    DropDown(listMediosPago: ['Efectivo', 'Tarjeta', 'Transferencia'], listMediosPagoSeleccionado: []),
    DropDown(listMediosPago: ["Nequi", "Bancolombia", "Banco Bogota", "Visa"], listMediosPagoSeleccionado: []),
  ];

  void _showMultiSelect(int posicion) async {
    final List<String>? results = await showDialog<List<String>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: myDropdown[posicion].listMediosPago); // Usar myDropdown[0]
      },
    );

    if (results != null) {
      //myDropdown[posicion].listMediosPagoSeleccionado.addAll(results);
      context.read<DropDown>().setAddAllListMediosPagoSeleccionado(results);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movimientos", style: TextStyle(fontSize: 16)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              child: ElevatedButton(
                onPressed: () => _showMultiSelect(0),
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  side: const BorderSide(color: Colors.black54, width: 1),
                  elevation: 0.0,
                  backgroundColor: const Color(0xFFFFFFFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                /* child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    myDropdown[1].listMediosPagoSeleccionadoConstructor!.isEmpty
                        ? const Text("Metodo de Pago", style: TextStyle(color: Colors.black87))
                        : Wrap(
                            children: myDropdown[1].listMediosPagoSeleccionadoConstructor!.map((e) => Text("$e, ", style: const TextStyle(color: Colors.black87))).toList(),
                          ),
                    const Icon(Icons.arrow_drop_down, color: Colors.black),
                  ],
                ), */

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    context.watch<DropDown>().listMediosPagoSeleccionado.isEmpty ? 
                    const Text("Metodo de Pago", style: TextStyle(color: Colors.black87)) : 
                    Wrap(
                      children: context.watch<DropDown>().listMediosPagoSeleccionado.map((e) => Text("$e, ", style: const TextStyle(color: Colors.black54),))
                      .toList(),
                    ),
                    const Icon(Icons.arrow_drop_down, color: Colors.black),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Wrap(
              children: context.watch<DropDown>().listMediosPagoSeleccionado.map((e) => Text("$e, "))
              .toList(),
            ),

            const SizedBox(
              height: 30,
            ),

            Flexible(
                child: ButtonSecondary(
                  textButton: "Pasar a otra pantalla",
                  onpressParam: () {
                    context.push('/checkBoxPage');
                  },              ),
              ),
          ],
        ),
      ),
    );
  }
}



class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {

  //final List<String> _selectedItems = [];

  void _itemChange(String itemValue, bool isSelected) {
    //setState(() {
      if (isSelected) {
        //_selectedItems.add(itemValue);
        //context.watch<DropDown>().listMediosPagoSeleccionado.add(itemValue);
        context.read<DropDown>().setListMediosPagoSeleccionado(itemValue);
      } else {
        //_selectedItems.remove(itemValue);
        //context.watch<DropDown>().listMediosPagoSeleccionado.remove(itemValue);
        context.read<DropDown>().removelistMediosPagoSeleccionado(itemValue);
      }
    //});
  }

  void _cancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text("Metodos de pago")),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items.map((item) => CheckboxListTile(
            value: context.watch<DropDown>().listMediosPagoSeleccionado.contains(item),
            title: Text(item),
            controlAffinity: ListTileControlAffinity.leading, 
            onChanged: (isChecked) => _itemChange(item, isChecked!)
            )
          ).toList(),
        ),
      ),
      actions: [
        //TextButton(onPressed: _cancel, child: const Text("Cancel")),
        //ElevatedButton(onPressed: _submit, child: const Text("Submit")),
        ElevatedButton(onPressed: _cancel, child: const Text("Salir")),
      ],
    );
  }
} */




/* 
class MovimientoPage extends StatefulWidget {
  const MovimientoPage({super.key});

  @override
  State<MovimientoPage> createState() => _MovimientoPageState();
}

class _MovimientoPageState extends State<MovimientoPage> {

  void _showMultiSelect(List<String> listProvider) async {
    final List<String>? results = await showDialog<List<String>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: listProvider);
      },
    );

    if (results != null) {
      context.read<DropDown>().setAddAllListMediosPagoSeleccionado(results);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movimientos", style: TextStyle(fontSize: 16)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              child: ElevatedButton(
                onPressed: () => _showMultiSelect(["Nequi", "Bancolombia", "Banco Bogota", "Visa"]),
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  side: const BorderSide(color: Colors.black54, width: 1),
                  elevation: 0.0,
                  backgroundColor: const Color(0xFFFFFFFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    context.watch<DropDown>().listMediosPagoSeleccionado.isEmpty ? 
                    const Text("Metodo de Pago", style: TextStyle(color: Colors.black87)) : 
                    Wrap(
                      children: context.watch<DropDown>().listMediosPagoSeleccionado.map((e) => Text("$e, ", style: const TextStyle(color: Colors.black54),))
                      .toList(),
                    ),
                    const Icon(Icons.arrow_drop_down, color: Colors.black),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Wrap(
              children: context.watch<DropDown>().listMediosPagoSeleccionado.map((e) => Text("$e, "))
              .toList(),
            ),

            const SizedBox(
              height: 30,
            ),

            SizedBox(
              width: size.width,
              child: ElevatedButton(
                onPressed: () => _showMultiSelect(["tarjeta", "qr"]),
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  side: const BorderSide(color: Colors.black54, width: 1),
                  elevation: 0.0,
                  backgroundColor: const Color(0xFFFFFFFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    context.watch<DropDown>().listMediosPagoSeleccionado.isEmpty ? 
                    const Text("Metodo de Pago", style: TextStyle(color: Colors.black87)) : 
                    Wrap(
                      children: context.watch<DropDown>().listMediosPagoSeleccionado.map((e) => Text("$e, ", style: const TextStyle(color: Colors.black54),))
                      .toList(),
                    ),
                    const Icon(Icons.arrow_drop_down, color: Colors.black),
                  ],
                ),
              ),
            ),

            Wrap(
              children: context.watch<DropDown>().listMediosPagoSeleccionado.map((e) => Text("$e, "))
              .toList(),
            ),

            Flexible(
              child: ButtonSecondary(
                textButton: "Pasar a otra pantalla",
                onpressParam: () {
                  context.push('/checkBoxPage');
                },              ),
            ),
          ],
        ),
      ),
    );
  }
}



class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {

  void _itemChange(String itemValue, bool isSelected) {
    //setState(() {
      if (isSelected) {
        context.read<DropDown>().setListMediosPagoSeleccionado(itemValue);
      } else {
        context.read<DropDown>().removelistMediosPagoSeleccionado(itemValue);
      }
    //});
  }

  void _cancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text("Metodos de pago")),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items.map((item) => CheckboxListTile(
            value: context.watch<DropDown>().listMediosPagoSeleccionado.contains(item),
            title: Text(item),
            controlAffinity: ListTileControlAffinity.leading, 
            onChanged: (isChecked) => _itemChange(item, isChecked!)
            )
          ).toList(),
        ),
      ),

      actions: [
        ElevatedButton(onPressed: _cancel, child: const Text("Salir")),
      ],
    );
  }
} */





/* class MovimientoPage extends StatefulWidget {
  const MovimientoPage({super.key});

  @override
  State<MovimientoPage> createState() => _MovimientoPageState();
}

class _MovimientoPageState extends State<MovimientoPage> {

  void _showMultiSelect(List<String> listProvider) async {
    final List<String>? results = await showGeneralDialog<List<String>>(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return MultiSelect(items: listProvider);
      },
    );

    if (results != null) {
      context.read<DropDown>().setAddAllListMediosPagoSeleccionado(results);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movimientos", style: TextStyle(fontSize: 16)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                SizedBox(
                width: size.width,
                child: ElevatedButton(
                  onPressed: () => _showMultiSelect(["Nequi", "Bancolombia", "Banco Bogota", "Visa"]),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    shadowColor: Colors.transparent,
                    side: const BorderSide(color: Colors.black54, width: 1),
                    elevation: 0.0,
                    backgroundColor: const Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
            
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      context.watch<DropDown>().listMediosPagoSeleccionado.isEmpty ? 
                      const Text("Metodo de Pago", style: TextStyle(color: Colors.black87)) : 
                      Wrap(
                        children: context.watch<DropDown>().listMediosPagoSeleccionado.map((e) => Text("$e, ", style: const TextStyle(color: Colors.black54),))
                        .toList(),
                      ),
                      const Icon(Icons.arrow_drop_down_outlined, color: Colors.black),
                    ],
                  ),
                ),
              ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Wrap(
              children: context.watch<DropDown>().listMediosPagoSeleccionado.map((e) => Text("$e, "))
              .toList(),
            ),

            const SizedBox(
              height: 30,
            ),

            Flexible(
              child: ButtonSecondary(
                textButton: "Pasar a otra pantalla",
                onpressParam: () {
                  context.push('/checkBoxPage');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {

  void _itemChange(String itemValue, bool isSelected) {
    //setState(() {
      if (isSelected) {
        context.read<DropDown>().setListMediosPagoSeleccionado(itemValue);
      } else {
        context.read<DropDown>().removelistMediosPagoSeleccionado(itemValue);
      }
    //});
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: SingleChildScrollView(
            child: ListBody(
              children: widget.items.map((item) => CheckboxListTile(
                value: context.watch<DropDown>().listMediosPagoSeleccionado.contains(item),
                title: Text(item),
                controlAffinity: ListTileControlAffinity.leading, 
                onChanged: (isChecked) => _itemChange(item, isChecked!))
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
} */








class MovimientoPage extends StatefulWidget {
  const MovimientoPage({super.key});

  @override
  State<MovimientoPage> createState() => _MovimientoPageState();
}

class _MovimientoPageState extends State<MovimientoPage> {

  void _showMultiSelect(List<String> listProvider) async {
    final List<String>? results = await showGeneralDialog<List<String>>(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return MultiSelect(items: listProvider);
      },
    );

    if (results != null) {
      context.read<DropDown>().setAddAllListMediosPagoSeleccionado(results);
    }
  }

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movimientos", style: TextStyle(fontSize: 16)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                SizedBox(
                width: size.width,
                child: ElevatedButton(
                  onPressed: () => _showMultiSelect(["Nequi", "Bancolombia", "Banco Bogota", "Visa"]),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    shadowColor: Colors.transparent,
                    side: const BorderSide(color: Colors.black54, width: 1),
                    elevation: 0.0,
                    backgroundColor: const Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
            
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      context.watch<DropDown>().listMediosPagoSeleccionado.isEmpty ? 
                      const Text("Metodo de Pago", style: TextStyle(color: Colors.black87)) : 
                      Wrap(
                        children: context.watch<DropDown>().listMediosPagoSeleccionado.map((e) => Text("$e, ", style: const TextStyle(color: Colors.black54),))
                        .toList(),
                      ),
                      const Icon(Icons.arrow_drop_down_outlined, color: Colors.black),
                    ],
                  ),
                ),
              ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Wrap(
              children: context.watch<DropDown>().listMediosPagoSeleccionado.map((e) => Text("$e, "))
              .toList(),
            ),

            const SizedBox(
              height: 30,
            ),

            Flexible(
              child: ButtonSecondary(
                textButton: "Pasar a otra pantalla",
                onpressParam: () {
                  context.push('/checkBoxPage');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {

  void _itemChange(String itemValue, bool isSelected) {
    //setState(() {
      if (isSelected) {
        context.read<DropDown>().setListMediosPagoSeleccionado(itemValue);
      } else {
        context.read<DropDown>().removelistMediosPagoSeleccionado(itemValue);
      }
    //});
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: SingleChildScrollView(
            child: ListBody(
              children: widget.items.map((item) => CheckboxListTile(
                value: context.watch<DropDown>().listMediosPagoSeleccionado.contains(item),
                title: Text(item),
                controlAffinity: ListTileControlAffinity.leading, 
                onChanged: (isChecked) => _itemChange(item, isChecked!))
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}



 */