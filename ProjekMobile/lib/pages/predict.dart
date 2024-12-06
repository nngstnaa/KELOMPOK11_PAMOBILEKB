import 'package:flutter/material.dart';
import 'package:tabularapp/widgets/bottom_bar.dart';

class PredictPage extends StatefulWidget {
  const PredictPage({super.key});

  @override
  _PredictPageState createState() => _PredictPageState();
}

class _PredictPageState extends State<PredictPage> {
  final _formKey = GlobalKey<FormState>();

  // Variabel untuk menyimpan nilai jawaban (0 untuk No, 1 untuk Yes)
  int? _noseWide;
  int? _noseLong;
  int? _lipsThin;
  int? _noseToLip;

  String _predictedGender = '';
  String _resultImagePath = '';

  // Fungsi untuk memprediksi gender
  void _predictGender() {
    if (_noseWide != null &&
        _noseLong != null &&
        _lipsThin != null &&
        _noseToLip != null) {
      setState(() {
        // Simulasi prediksi berdasarkan input
        int total = _noseWide! + _noseLong! + _lipsThin! + _noseToLip!;
        if (total > 2) {
          _predictedGender = 'Female';
          _resultImagePath = 'assets/female.png';
        } else {
          _predictedGender = 'Male';
          _resultImagePath = 'assets/male.png';
        }
      });
    } else {
      setState(() {
        _predictedGender = 'Please answer all questions.';
        _resultImagePath = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Lebar layar untuk responsif
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Gender Prediction'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.05), // Responsif padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Answer the following questions:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Pertanyaan 1: Nose Wide
                      _buildRadioQuestion(
                        question: 'Is your nose wide?',
                        groupValue: _noseWide,
                        onChanged: (value) {
                          setState(() {
                            _noseWide = value;
                          });
                        },
                      ),
                      SizedBox(height: 10),

                      // Pertanyaan 2: Nose Long
                      _buildRadioQuestion(
                        question: 'Is your nose long?',
                        groupValue: _noseLong,
                        onChanged: (value) {
                          setState(() {
                            _noseLong = value;
                          });
                        },
                      ),
                      SizedBox(height: 10),

                      // Pertanyaan 3: Lips Thin
                      _buildRadioQuestion(
                        question: 'Are your lips thin?',
                        groupValue: _lipsThin,
                        onChanged: (value) {
                          setState(() {
                            _lipsThin = value;
                          });
                        },
                      ),
                      SizedBox(height: 10),

                      // Pertanyaan 4: Nose to Lip Distance
                      _buildRadioQuestion(
                        question: 'Is the distance from nose to lip long?',
                        groupValue: _noseToLip,
                        onChanged: (value) {
                          setState(() {
                            _noseToLip = value;
                          });
                        },
                      ),
                      SizedBox(height: 20),

                      // Tombol Prediksi
                      SizedBox(
                        width: screenWidth * 0.6, // Lebar tombol responsif
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              _predictGender();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            backgroundColor: Colors.deepPurple,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: Text('Predict Gender'),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Hasil Prediksi
                      if (_predictedGender.isNotEmpty) ...[
                        Text(
                          'Predicted Gender: $_predictedGender',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        if (_resultImagePath.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Image.asset(
                              _resultImagePath,
                              width: screenWidth * 0.6,
                            ),
                          ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),  
    );
  }

  // Widget untuk membangun pertanyaan dengan radio button
  Widget _buildRadioQuestion({
    required String question,
    required int? groupValue,
    required ValueChanged<int?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text('Yes'),
                leading: Radio<int>(
                  value: 0,
                  groupValue: groupValue,
                  onChanged: onChanged,
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text('No'),
                leading: Radio<int>(
                  value: 1,
                  groupValue: groupValue,
                  onChanged: onChanged,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
