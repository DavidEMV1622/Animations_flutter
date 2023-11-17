/* import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDown with ChangeNotifier {

  List<String> _listMediosPago = [];

  List<String> _listMediosPagoSeleccionado = [];


  List<String> get listMediosPago => _listMediosPago;
  List<String> get listMediosPagoSeleccionado => _listMediosPagoSeleccionado;


  void setlistMediosPago(List<String> value) {
    _listMediosPago.addAll(value);
    notifyListeners();
  }


  void setListMediosPagoSeleccionado(String value) {
    _listMediosPagoSeleccionado.add(value);
    notifyListeners();
  }

  void setAddAllListMediosPagoSeleccionado(List<String> value) {
    _listMediosPagoSeleccionado.addAll(value);
    notifyListeners();
  }

  void removelistMediosPagoSeleccionado(String value) {
    _listMediosPagoSeleccionado.remove(value);
    notifyListeners();
  }

}





/* 
class DropDown with ChangeNotifier {

  late List<String> listMediosPago = [];
  late List<String> listMediosPagoSeleccionado = [];
  
  DropDown({required this.listMediosPago, required this.listMediosPagoSeleccionado});

  /* List<String>? get listMediosPagoConstructor => listMediosPago;
  List<String>? get listMediosPagoSeleccionadoConstructor => listMediosPagoSeleccionado; */

  List<String>? get listMediosPagoConstructor => listMediosPago;
  List<String>? get listMediosPagoSeleccionadoConstructor => listMediosPagoSeleccionado;

  void setListMediosPagoSeleccionado(String value) {
    listMediosPagoSeleccionado.add(value);
    notifyListeners();
  }

  void setAddAllListMediosPagoSeleccionado(List<String> value) {
    listMediosPagoSeleccionado.addAll(value);
    notifyListeners();
  }

  void removelistMediosPagoSeleccionado(String value) {
    listMediosPagoSeleccionado.remove(value);
    notifyListeners();
  }
}

/* List<DropDown> myDropdown = [
  DropDown(listMediosPago: ["Nequi", "Bancolombia", "Banco Bogota", "Visa"], listMediosPagoSeleccionado: []),
  DropDown(listMediosPago: ['Efectivo', 'Tarjeta', 'Transferencia'], listMediosPagoSeleccionado: []),
]; */ */


class FormData {
  List<String> mediosPago = [];
  List<String> mediosPagoSeleccionados = [];
}

class FormDataProvider with ChangeNotifier {
  List<FormData> formDatas = [];

  void addForm() {
    formDatas.add(FormData());
    notifyListeners();
  }

  void removeForm(int index) {
    formDatas.removeAt(index);
    notifyListeners();
  }
} */