import 'package:flutter/material.dart';
import 'package:tabularapp/widgets/bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gender Insight'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          // Ikon Logout
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Logika logout atau navigasi ke halaman Sign In
              Navigator.pushNamed(context, '/signin');
            },
          ),
          // Ikon Settings
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Aksi ketika ikon settings ditekan
              Navigator.pushNamed(context, '/settings'); 
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Pesan sambutan
            Text(
              'Selamat Datang di Gender Insight!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 16),
            Text(
              'Jelajahi aplikasi ini untuk memprediksi gender berdasarkan fitur wajah dan pelajari wawasan unik tentang karakteristik wajah.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 32),

            // Kartu fitur tambahan
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.lightbulb, color: Colors.deepPurple),
                title: Text('Tahukah Anda?'),
                subtitle: Text(
                    'Manusia dapat mengenali wajah lebih cepat dibandingkan pola lainnya. Cobalah menganalisis fitur untuk memprediksi gender!'),
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.tips_and_updates, color: Colors.deepPurple),
                title: Text('Tips untuk Prediksi Akurat'),
                subtitle: Text(
                    'Pastikan pencahayaan dan kejernihan gambar untuk analisis fitur wajah yang lebih baik.'),
              ),
            ),
            SizedBox(height: 32),

            // Tombol mulai prediksi
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/predict');
              },
              child: Text('Mulai Prediksi'),
            ),
            SizedBox(height: 16),
            // Tombol lihat riwayat prediksi
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/history');
              },
              child: Text('Lihat Riwayat Prediksi'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }
}
