/* 
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../buttons.dart';

class DialogUtils {
  static Future<void> showMyGeneralDialog({
    required BuildContext context,}) async{

    await showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: false,
      barrierColor: const Color.fromRGBO(0, 175, 170, 0.8),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {

        List<String> listMediosPago = [
          "Nequi",
          "Bancolombia",
          "Banco Bogota",
          "Visa"
        ];

        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: MediaQuery.of(context).size.width,
            
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: SingleChildScrollView(
                  
                  child: Column(
                    children: [
                      
                      Container(
                        // Inicio de la lista desplegable "DropdownButton"
                        child: DropdownButton(
                          // "items" va a contener la lista que aparecera en el "DropdownButton"
                          items: listMediosPago.map((medioPago) { // "mediosPago" valor a seleccionar en la lista
                            return DropdownMenuItem(
                              child: Text(medioPago), // "child" muestra el valor seleccionado en la lista
                              value: medioPago, // "value" lo que va a contener lo seleccionado en la lista
                            );
                          }).toList(),
                      
                          onChanged: (value) {
                            print(value); // muestra por consola el valor seleccionado en la lista
                          },
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        
                        children: [
                    
                          Flexible(
                            child: ButtonSecondary(
                              textButton: "Cancelar",
                              onpressParam: () {
                                context.pop(context);
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
                    ],
                  ),
                ),
              ) 
            ),
          ),
        );
      }
    );
  }
} */