import 'package:flutter/material.dart';
import 'package:tabularapp/widgets/bottom_bar.dart';

class HistoryPage extends StatelessWidget {
  // Contoh data riwayat prediksi
  final List<Map<String, String>> predictionHistory = [
    {
      'name': 'John Doe',
      'predictedGender': 'Male',
      'predictionDate': '2024-10-10 14:30',
    },
    {
      'name': 'Jane Smith',
      'predictedGender': 'Female',
      'predictionDate': '2024-10-11 10:20',
    },
    {
      'name': 'Sam Wilson',
      'predictedGender': 'Male',
      'predictionDate': '2024-10-12 16:45',
    },
  ];

  HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prediction History'),
        centerTitle: true,
        automaticallyImplyLeading: false
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Here are your previous predictions:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: predictionHistory.length,
                itemBuilder: (context, index) {
                  final prediction = predictionHistory[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5.0,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      title: Text(prediction['name'] ?? 'Unknown'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Predicted Gender: ${prediction['predictedGender']}'),
                          Text('Prediction Date: ${prediction['predictionDate']}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
     bottomNavigationBar: BottomNavBar(currentIndex: 2), 
    );
  }
}
