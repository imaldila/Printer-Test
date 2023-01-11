import 'package:flutter/material.dart' hide Image;
// ignore: depend_on_referenced_packages
import 'package:printer_test/features/flutter_bluetooth_printer/screens/flutter_bluetooth_printer_screen.dart';
import 'package:printer_test/features/blue_thermar_printer/screens/blue_thermal_printer_screen.dart';
import 'package:printer_test/features/esc_pos_bluetooth/screens/esc_pos_bluetooth_screen.dart';

import 'features/pos_printer_manager/screens/pos_printer_manager_screen.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Printer Test'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const BlueThermalPrinterScreen(),
                ),
              ),
              child: const Text('Package blue_thermal_printer'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EscPosBluetoothScreen(),
                ),
              ),
              child: const Text('Package esc_pos_bluetooth'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PosPrinterManagerScreen(),
                ),
              ),
              child: const Text('Package pos_printer_manager'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FlutterBluetoothPrinterScreen(),
                ),
              ),
              child: const Text('Package flutter_bluetooth_printer'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
