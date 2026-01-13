import 'package:flutter/material.dart';
import 'package:medicine_reminder/providers/medicine_provider.dart';
import 'package:medicine_reminder/screens/add_medicine_screen.dart';
import 'package:medicine_reminder/services/notification_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Medicine'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              NotificationService.scheduleNotification(
                id: 999,
                title: 'Test Notification',
                body: 'If you see this, notifications work',
                scheduledTime: DateTime.now().add(const Duration(seconds: 30)),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Test alarm set for 5 seconds...'),
                ),
              );
            },
          ),
        ],
      ),

      body: Consumer<MedicineProvider>(
        builder: (context, provider, _) {
          if (provider.isEmpty) {
            return const Center(
              child: Text(
                'No medicines added yet',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            );
          }

          final list = provider.medicines;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final med = list[index];
              final timeString = TimeOfDay.fromDateTime(
                med.time,
              ).format(context);
              return ListTile(
                leading: const Icon(Icons.medication, color: Colors.teal),
                title: Text(med.name),
                subtitle: Text('${med.dose} • $timeString'),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddMedicineScreen()),
          );
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
    );
  }
}
