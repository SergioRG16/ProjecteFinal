import 'package:flutter/material.dart';
import 'auth_gate.dart';
import 'package:login_project/pages/pantalla_grups.dart';
import 'package:login_project/pages/pantalla_usuari.dart';
import 'package:login_project/pages/pantalla_llista_receptes.dart';
import 'package:login_project/pages/pantalla_mostra_recepta.dart';
import 'package:login_project/pages/pantalla_edita_recepta.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthGate(),
       routes: {
          PantallaMostraRecepta.route: (context) =>
              const PantallaMostraRecepta(),
          PantallaEditaRecepta.route: (context) => const PantallaEditaRecepta(),
        }
   );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  var pagActual = 0;

  @override
  Widget build(BuildContext context) {
    final pags = [
      const pantallagrups(),
      const PantallaLlistaReceptes(),
      const pantallausuari(),
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'CuinaCompartida',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        body: IndexedStack(
          index: pagActual,
          children: pags,
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            currentIndex: pagActual,
            onTap: (index) {
              setState(() {
                pagActual = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.group),
                label: 'Grups',
                backgroundColor: Colors.grey,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.table_rows),
                label: 'Receptes',
                backgroundColor: Colors.grey,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: 'Usuari',
                backgroundColor: Colors.grey,
              ),
            ]));
  }
}