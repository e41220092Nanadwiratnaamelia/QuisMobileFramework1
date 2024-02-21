import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController panjangController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();
  TextEditingController lebarController = TextEditingController();
  TextEditingController sisiKubusController = TextEditingController();
  TextEditingController jariJariController = TextEditingController();
  TextEditingController tinggiTabungController = TextEditingController();

  double luasBalok = 0.0;
  double luasKubus = 0.0;
  double luasTabung = 0.0;

  void HitungLuasBalok() {
    double panjang = double.tryParse(panjangController.text) ?? 0.0;
    double lebar = double.tryParse(lebarController.text) ?? 0.0;
    double tinggi = double.tryParse(tinggiController.text) ?? 0.0;

    double luas = 2 * (panjang * lebar + panjang * tinggi + lebar * tinggi);

    setState(() {
      luasBalok = luas;
    });
  }

  void HitungLuasKubus() {
    double sisi = double.tryParse(sisiKubusController.text) ?? 0.0;

    double luas = 6 * sisi * sisi;

    setState(() {
      luasKubus = luas;
    });
  }

  void HitungLuasTabung() {
    double jariJari = double.tryParse(jariJariController.text) ?? 0.0;
    double tinggi = double.tryParse(tinggiTabungController.text) ?? 0.0;

    double luas = 2 * 3.14 * jariJari * (jariJari + tinggi);

    setState(() {
      luasTabung = luas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink, // Mengubah warna AppBar menjadi pink
        title: Text(widget.title),
      ),
      backgroundColor: Colors.pink[50], // Mengubah warna latar belakang menjadi merah muda
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hitung Luas Bangun Ruang',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text('Luas Balok: $luasBalok'),
            const SizedBox(height: 20),
            TextFormField(
              controller: panjangController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Panjang Balok',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: lebarController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Lebar Balok',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: tinggiController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tinggi Balok',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: HitungLuasBalok,
              child: const Text("Hitung Luas Balok"),
            ),
            const SizedBox(height: 40),
            Text('Luas Kubus: $luasKubus'),
            const SizedBox(height: 20),
            TextFormField(
              controller: sisiKubusController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Sisi Kubus',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: HitungLuasKubus,
              child: const Text("Hitung Luas Kubus"),
            ),
            const SizedBox(height: 40),
            Text('Luas Tabung: $luasTabung'),
            const SizedBox(height: 20),
            TextFormField(
              controller: jariJariController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Jari-jari Tabung',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: tinggiTabungController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tinggi Tabung',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: HitungLuasTabung,
              child: const Text("Hitung Luas Tabung"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
