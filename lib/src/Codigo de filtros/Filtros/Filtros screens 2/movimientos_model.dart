/* class Movimiento {
  late int id;
  late String name;
  late double valor;
  late String fecha;
  
  Movimiento({required this.id, required this.name, required this.valor, required this.fecha});
}

List<Movimiento> listMovimientosFiltrados = [];

List<Movimiento> listMovimientos = [
  Movimiento(id: 1, name: "Nequi", valor: 500000, fecha: "13/12/2023"),
  Movimiento(id: 2, name: "Banco Bogota", valor: 1000000, fecha: "10/10/2023"),
  Movimiento(id: 3, name:"Bancolombia", valor: 30000, fecha: "11/11/2023"),
  Movimiento(id: 4, name: "Banco Bogota", valor: 50000, fecha: "09/07/2023"),
  Movimiento(id: 5, name: "Bancolombia", valor: 500000, fecha: "13/12/2023"),
  Movimiento(id: 6, name: "Bancolombia", valor: 1000000, fecha: "10/10/2023"),
  Movimiento(id: 7, name: "Visa", valor: 30000, fecha: "11/11/2023"),
  Movimiento(id: 8, name: "Banco Bogota", valor: 50000, fecha: "09/07/2023"),
  Movimiento(id: 9, name: "Banco Bogota", valor: 500000, fecha: "13/12/2023"),
  Movimiento(id: 10, name: "Nequi", valor: 1000000, fecha: "10/10/2023"),
  Movimiento(id: 11, name: "Bancolombia", valor: 30000, fecha: "11/11/2023"),
  Movimiento(id: 12, name: "Bancolombia", valor: 50000, fecha: "09/07/2023"),
];

// Sistema de filtros
List<Movimiento> filterMovimientos(List<Movimiento> movimientos, String filter, String filterTwo) {
  return movimientos.where((item) {
    final nameLowerCase = item.name.toLowerCase();
    final fechaLowerCase = item.fecha.toLowerCase();
    final filterLowerCase = filter.toLowerCase();
    final filterLowerCaseTwo = filterTwo.toLowerCase();
    return nameLowerCase.contains(filterLowerCase) && fechaLowerCase.contains(filterLowerCaseTwo);
  }).toList();
}






class Item {
  late String name;
  late String description;

  Item({required this.name, required this.description});
}

List<Item> items = [
  Item(name: "Item 1", description: "Este es el primer elemento"),
  Item(name: "Item 2", description: "Este es el segundo elemento"),
  Item(name: "Item 1", description: "Este es el primer elemento del primer elemento"),
  Item(name: "Item 3", description: "Este es el tercer elemento"),
  // ... otros elementos
];


List<Item> filterItems(List<Item> items, String filter) {
  return items.where((item) {
    final nameLowerCase = item.name.toLowerCase();
    final descriptionLowerCase = item.description.toLowerCase();
    final filterLowerCase = filter.toLowerCase();
    return nameLowerCase.contains(filterLowerCase) || descriptionLowerCase.contains(filterLowerCase);
  }).toList();
} */