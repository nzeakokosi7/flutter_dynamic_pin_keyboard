import 'package:dynamic_pin_keyboard/dynamic_pin_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DynamicInputController controller = DynamicInputController(length: 4);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: size.width * 0.07,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Enter Passcode",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: size.width * 0.05),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          DynamicPinKeyboard(
            inputFontSize: 30,
            pinInputController: controller,
            onSubmit: () {
              print(controller.text);
              // controller.clear();
            },
            inputTextColor: Colors.blue,
            inputBorderColor: Colors.blue,
            underlineInputs: false,
            obscureInputs: true,
            keyboardButtonShape: KeyButtonShape.circular,
            keyboardButtonTextStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Color(0xFF181818)
            ),
            inputHasBorder: false,
            // extraInput: "Fuck",
            disableUtilityKey: true,
            deleteButton: SvgPicture.asset("assets/delete_icon.svg"),
            // utilityKeyButton: const SizedBox(),
          )
        ],
      ),
    );
  }
}
