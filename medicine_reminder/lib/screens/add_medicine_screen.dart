import 'package:flutter/material.dart';
import 'package:medicine_reminder/models/medicine.dart';
import 'package:medicine_reminder/providers/medicine_provider.dart';
import 'package:medicine_reminder/services/notification_service.dart';
import 'package:provider/provider.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final _nameController = TextEditingController();
  final _doseController = TextEditingController();
  TimeOfDay? _selectedTime;

  void _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Colors.teal),
          ),
          child: child!,
        );
      },
    );
    if (time != null) {
      setState(() {
        _selectedTime = time;
      });
    }
  }

  Future<void> _saveMedicine() async {
    
    if (_nameController.text.isEmpty ||
        _doseController.text.isEmpty ||
        _selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final now = DateTime.now();
    var selectedDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      _selectedTime!.hour,
      _selectedTime!.minute,
    );

    if (selectedDateTime.isBefore(now)) {
      selectedDateTime = selectedDateTime.add(const Duration(days: 1));
    }

    final medicine = Medicine(
      name: _nameController.text.trim(),
      dose: _doseController.text.trim(),
      time: selectedDateTime,
    );
    await Provider.of<MedicineProvider>(context, listen: false)
        .addMedicine(medicine);

    
    final int notificationId = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Medicine'),
        backgroundColor: Colors.teal, 
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Medicine Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.medication, color: Colors.teal),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _doseController,
              decoration: const InputDecoration(
                labelText: 'Dosage (e.g., 1 Tablet)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.straighten, color: Colors.teal),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Reminder Time',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            
           
            InkWell(
              onTap: _pickTime,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedTime == null
                          ? 'Choose Time'
                          : _selectedTime!.format(context),
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Icon(Icons.access_time, color: Colors.orange),
                  ],
                ),
              ),
            ),
            
            const Spacer(),
            
            
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  elevation: 2,
                ),
                onPressed: _saveMedicine,
                child: const Text(
                  'SAVE REMINDER',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _doseController.dispose();
    super.dispose();
  }
}
