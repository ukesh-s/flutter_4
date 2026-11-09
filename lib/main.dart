import 'package:flutter/material.dart';

void main() => runApp(const MileageApp());

class MileageApp extends StatelessWidget {
  const MileageApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(debugShowCheckedModeBanner: false, title: 'Mileage Calculator', theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff16836b)), useMaterial3: true), home: const MileagePage());
}

class MileagePage extends StatefulWidget {
  const MileagePage({super.key});
  @override
  State<MileagePage> createState() => _MileagePageState();
}

class _MileagePageState extends State<MileagePage> {
  final _form = GlobalKey<FormState>();
  final _distance = TextEditingController(), _fuel = TextEditingController();
  double? _result;
  @override
  void dispose() { _distance.dispose(); _fuel.dispose(); super.dispose(); }
  String? _positive(String? value) { final n = double.tryParse(value ?? ''); if (n == null || n <= 0) return 'Enter a number greater than zero'; return null; }
  void _calculate() { if (_form.currentState!.validate()) setState(() => _result = double.parse(_distance.text) / double.parse(_fuel.text)); }
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Car Mileage Calculator')), body: Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 520), child: Padding(padding: const EdgeInsets.all(24), child: Form(key: _form, child: ListView(shrinkWrap: true, children: [const Text('Find your vehicle’s fuel efficiency', style: TextStyle(fontSize: 18)), const SizedBox(height: 20), TextFormField(controller: _distance, keyboardType: const TextInputType.numberWithOptions(decimal: true), decoration: const InputDecoration(labelText: 'Distance travelled (km)', prefixIcon: Icon(Icons.route), border: OutlineInputBorder()), validator: _positive), const SizedBox(height: 16), TextFormField(controller: _fuel, keyboardType: const TextInputType.numberWithOptions(decimal: true), decoration: const InputDecoration(labelText: 'Fuel used (litres)', prefixIcon: Icon(Icons.local_gas_station), border: OutlineInputBorder()), validator: _positive), const SizedBox(height: 20), FilledButton.icon(onPressed: _calculate, icon: const Icon(Icons.calculate), label: const Text('Calculate mileage')), if (_result != null) Padding(padding: const EdgeInsets.only(top: 28), child: Card(child: Padding(padding: const EdgeInsets.all(24), child: Column(children: [const Text('YOUR MILEAGE'), Text('${_result!.toStringAsFixed(2)} km/L', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold))]))))]))))));
}
