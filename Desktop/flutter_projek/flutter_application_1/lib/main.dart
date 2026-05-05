import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ============================================
// [EDIT] BASE URL Laravel
// Untuk Android Emulator gunakan 10.0.2.2 (bukan 127.0.0.1)
// Untuk Chrome/Web/Desktop, gunakan 127.0.0.1
// Untuk device fisik, gunakan IP lokal PC (contoh: 192.168.x.x)
// ============================================
const String laravelBaseUrl = 'http://10.0.2.2:8000';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Krisna',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        //
        // [EDIT] colorScheme: Mengatur skema warna aplikasi.
        // Ganti Colors.deepPurple dengan warna lain jika ingin mengubah tema.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // [EDIT] home: Halaman utama yang ditampilkan saat aplikasi dibuka.
      // Ganti title untuk mengubah judul di AppBar.
      home: const MyHomePage(title: 'MY PROFILE'),
      debugShowCheckedModeBanner: false, // [EDIT] Menghilangkan banner "DEBUG" di pojok kanan atas
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  /// Membuka halaman About di Laravel via browser
  Future<void> _openLaravelAbout() async {
    final Uri url = Uri.parse('$laravelBaseUrl/about');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Tidak bisa membuka halaman Laravel. Pastikan server Laravel berjalan.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ============================================
            // [EDIT] FOTO PROFIL - Berbentuk kotak dengan sudut melengkung
            // Ubah width & height untuk mengubah ukuran foto.
            // Ubah borderRadius untuk mengubah kelengkungan sudut.
            // Ganti Icon(Icons.person) dengan Image jika ingin pakai foto asli.
            // ============================================
            Container(
              width: 150, // [EDIT] Lebar foto profil
              height: 150, // [EDIT] Tinggi foto profil
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100, // [EDIT] Warna background foto
                borderRadius: BorderRadius.circular(12), // [EDIT] Sudut melengkung kotak
                border: Border.all(
                  color: Colors.deepPurple, // [EDIT] Warna border foto
                  width: 3, // [EDIT] Ketebalan border
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // [EDIT] Warna bayangan
                    blurRadius: 10, // [EDIT] Blur bayangan
                    offset: const Offset(0, 4), // [EDIT] Posisi bayangan (x, y)
                  ),
                ],
              ),
              child: const Icon(
                Icons.person, // [EDIT] Icon foto profil. Ganti dengan Image.asset() untuk foto asli
                size: 80, // [EDIT] Ukuran icon
                color: Colors.deepPurple, // [EDIT] Warna icon
              ),
            ),

            // [EDIT] Jarak antara foto dan nama
            const SizedBox(height: 24),

            // ============================================
            // [EDIT] NAMA - Ganti 'Krisna' dengan nama kamu
            // ============================================
            const Text(
              'Krisna', // [EDIT] <-- GANTI NAMA DI SINI
              style: TextStyle(
                fontSize: 28, // [EDIT] Ukuran font nama
                fontWeight: FontWeight.bold, // [EDIT] Ketebalan font
                color: Colors.deepPurple, // [EDIT] Warna teks nama
              ),
            ),

            // [EDIT] Jarak antara nama dan jurusan
            const SizedBox(height: 8),

            // ============================================
            // [EDIT] JURUSAN - Ganti teks jurusan di sini
            // ============================================
            const Text(
              'Teknik Informatika', // [EDIT] <-- GANTI JURUSAN DI SINI
              style: TextStyle(
                fontSize: 18, // [EDIT] Ukuran font jurusan
                fontWeight: FontWeight.w500, // [EDIT] Ketebalan font
                color: Colors.black87, // [EDIT] Warna teks jurusan
              ),
            ),

            // [EDIT] Jarak antara jurusan dan kampus
            const SizedBox(height: 4),

            // ============================================
            // [EDIT] KAMPUS - Ganti teks kampus di sini
            // ============================================
            const Text(
              'PENS PSDKU Lamongan', // [EDIT] <-- GANTI KAMPUS DI SINI
              style: TextStyle(
                fontSize: 16, // [EDIT] Ukuran font kampus
                color: Colors.black54, // [EDIT] Warna teks kampus
              ),
            ),

            // [EDIT] Jarak antara kampus dan tombol
            const SizedBox(height: 32),

            // ============================================
            // [EDIT] TOMBOL ABOUT - Membuka halaman About di Laravel
            // ============================================
            ElevatedButton.icon(
              onPressed: () => _openLaravelAbout(),
              icon: const Icon(Icons.info_outline),
              label: const Text('About (Laravel)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
      // [EDIT] floatingActionButton dihapus karena tidak diperlukan untuk halaman profil.
      // Jika ingin menambahkan tombol kembali, bisa tambahkan di sini.
    );
  }
}
