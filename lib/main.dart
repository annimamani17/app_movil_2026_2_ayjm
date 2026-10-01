import 'package:flutter/material.dart';

void main() {
  runApp(const MiPerfilApp());
}

class MiPerfilApp extends StatelessWidget {
  const MiPerfilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Perfil Académico Interactivo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      // NOMBRE PERSONALIZADO
      home: const PerfilScreen(nombreEstudiante: 'ANAHI YAHAIRA JARA MAMANI'),
    );
  }
}

class PerfilScreen extends StatefulWidget {
  final String nombreEstudiante;

  const PerfilScreen({super.key, required this.nombreEstudiante});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  // 1. VARIABLES DE DIFERENTES TIPOS (Sesión 02)
  late String nombre;
  int np = 37; // NÚMERO PERSONAL (NP) ACTUALIZADO A 37
  double promedioPonderado = 17.5; // double
  bool estaMatriculado = true; // bool

  // Contador de logros inicializado exactamente en NP (Sesión 03)
  late int contadorLogros;

  @override
  void initState() {
    super.initState();
    nombre = widget.nombreEstudiante;
    contadorLogros = np; // Inicializado en 37
  }

  // Bucle FOR para calcular los primeros 5 múltiplos de NP (Sesión 02)
  List<int> obtenerMultiplos() {
    List<int> multiplos = [];
    for (int i = 1; i <= 5; i++) {
      multiplos.add(np * i);
    }
    return multiplos;
  }

  // Incrementar el contador de logros con setState (Sesión 03)
  void _incrementarLogro() {
    setState(() {
      contadorLogros++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Lógica if-else para clasificar el NP (Sesión 02)
    String evaluacionParidad = (np % 2 == 0)
        ? 'Tu número personal es par'
        : 'Tu número personal es impar';

    String evaluacionMagnitud = (np > 50)
        ? 'Número personal alto'
        : 'Número personal bajo';

    List<int> listaMultiplos = obtenerMultiplos();

    return Scaffold(
      appBar: AppBar(
        title: Text(nombre),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SECCIÓN 1: DATOS PERSONALES
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '📌 Datos del Estudiante',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    Text(
                      '• Nombre completo: $nombre',
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(
                      '• Número Personal (NP): $np',
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(
                      '• Promedio ponderado: $promedioPonderado',
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(
                      '• Estado matriculado: ${estaMatriculado ? "Sí" : "No"}',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),

            // SECCIÓN 2: CLASIFICACIÓN CON IF-ELSE
            Card(
              elevation: 3,
              color: const Color.fromARGB(255, 245, 148, 232),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '⚖️ Análisis de NP (Lógica if-else)',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    Text(
                      '• $evaluacionParidad',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '• $evaluacionMagnitud',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),

            // SECCIÓN 3: BUCLE FOR (MÚLTIPLOS)
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '🔢 Múltiplos de NP (Calculados con for)',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        listaMultiplos.length,
                        (index) => Text(
                          '• Múltiplo ${index + 1} ($np × ${index + 1}): ${listaMultiplos[index]}',
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),

            // SECCIÓN 4: INTERACTIVIDAD (StatefulWidget)
            Card(
              elevation: 3,
              color: const Color.fromARGB(255, 250, 4, 188),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        '🏆 Contador de Logros Académicos',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$contadorLogros',
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 212, 120, 192),
                        ),
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton.icon(
                        onPressed: _incrementarLogro,
                        icon: const Icon(Icons.add_task),
                        label: const Text('Sumar logro'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
