import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color.fromARGB(255, 111, 157, 180),
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Color.fromARGB(255, 111, 157, 180),
        middle: Text(
          'Currency Converter',
          style: TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 251, 249, 249),
          ),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '₹${result.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 187, 84, 76),
                ),
              ),
              CupertinoTextField(
                controller: textEditingController,
                keyboardType: const TextInputType.numberWithOptions(
                  signed: false,
                  decimal: true,
                ),
                style: const TextStyle(
                  color: Color.fromARGB(255, 20, 19, 19),
                  fontSize: 18,
                ),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                placeholder: 'Please enter amount in USD',
                prefix: const Icon(CupertinoIcons.money_dollar),
              ),
              const SizedBox(height: 5),
              CupertinoButton(
                onPressed: () {
                  setState(() {
                    result = double.parse(textEditingController.text) * 81;
                  });
                },

                color: const Color.fromARGB(255, 32, 33, 32),
                foregroundColor: const Color.fromARGB(255, 204, 194, 193),
                minimumSize: const Size(double.infinity, 10),

                borderRadius: BorderRadius.circular(5),
                child: const Text('Convert', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
