import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';

class BlueThermalPrinterScreen extends StatefulWidget {
  const BlueThermalPrinterScreen({super.key});

  @override
  State<BlueThermalPrinterScreen> createState() =>
      _BlueThermalPrinterScreenState();
}

class _BlueThermalPrinterScreenState extends State<BlueThermalPrinterScreen> {
  List<BluetoothDevice> devices = [];
  BluetoothDevice? selectedDevice;
  BlueThermalPrinter printer = BlueThermalPrinter.instance;

  @override
  void initState() {
    super.initState();
    getDevices();
  }

  void getDevices() async {
    devices = await printer.getBondedDevices();
    print(devices);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blue Thermal Printer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<BluetoothDevice>(
              onChanged: (devices) {
                setState(() {
                  selectedDevice = devices;
                });
              },
              value: selectedDevice,
              hint: const Text('Select Thermal Printer'),
              items: _getDeviceItems(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                printer.connect(selectedDevice!);
              },
              child: const Text('Connect'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                printer.disconnect();
              },
              child: const Text('Disconnect'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if ((await printer.isConnected)!) {
                  printer.printNewLine();
                  printer.printCustom('Thermal Printer Demo', 1, 1);
                  printer.printQRcode('Thermal Test', 200, 200, 1);
                }
              },
              child: const Text('Print'),
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (devices.isEmpty) {
      items.add(const DropdownMenuItem(
        child: Text('NONE'),
      ));
    } else {
      for (var device in devices) {
        items.add(DropdownMenuItem(
          value: device,
          child: Text(device.name ?? ""),
        ));
      }
    }
    return items;
  }
}
