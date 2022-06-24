import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Valeta'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Center(
          child: Column(
            children: [
              const Text(
                'First App Screen',
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 50,),
              TextField(
                controller: myController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter somethng',
                ),
              ),
              const SizedBox(height: 50,),
              ElevatedButton(
                // When the user presses the button, show an alert dialog containing
                // the text that the user has entered into the text field.
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // Retrieve the text that the user has entered by using the
                        // TextEditingController.
                        content: Text(myController.text),
                      );
                    },
                  );
                },
                child: const Icon(Icons.text_fields),
              ),
              const SizedBox(height: 50,),
              Text(myController.text)
            ],
          ),
        ),
      ),
    );
  }
}
