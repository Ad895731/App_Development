import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/medicine.dart';
import '../services/notification_service.dart';

class MedicineProvider with ChangeNotifier {
  static const String boxName = 'medicine';
  List<Medicine> _medicines = [];
  List<Medicine> get medicines {
    _medicines.sort((a, b) => a.time.compareTo(b.time));
    return _medicines;
  }

  Future<void> loadMedicines() async {
    final box = await Hive.openBox<Medicine>(boxName);
    _medicines = box.values.toList();
    notifyListeners();
  }

Future<void> addMedicine(Medicine medicine) async {
  final box = await Hive.openBox<Medicine>(boxName);
  await box.add(medicine);
  _medicines.add(medicine);
  
  await NotificationService.scheduleNotification(
    id: medicine.hashCode,
    title: '💊 Medicine Reminder',
    body: 'Time to take ${medicine.name} - ${medicine.dose}',
    scheduledTime: medicine.time,
  );
  
  notifyListeners();
}
  bool get isEmpty => _medicines.isEmpty;
}
