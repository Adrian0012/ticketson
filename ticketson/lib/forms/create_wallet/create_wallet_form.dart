import 'package:flutter/material.dart';

class CreateWalletForm extends StatefulWidget {
  const CreateWalletForm({super.key});

  @override
  CreateWalletFormState createState() {
    return CreateWalletFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class CreateWalletFormState extends State<CreateWalletForm> {
  late FocusNode myFocusNode;
  final TextEditingController _walletNameController = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String dropdownValue = '--Wallet Type--';
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (() {
        FocusScope.of(context).unfocus();
      }),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text('QQ'),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextFormField(
                onFieldSubmitted: (term) {
                  FocusScope.of(context).requestFocus(myFocusNode);
                },
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 10.0, right: 10.0),
                  labelText: 'Wallet Name',
                  labelStyle: TextStyle(
                    fontSize: myFocusNode.hasFocus ||
                            _walletNameController.text.isNotEmpty
                        ? 20
                        : 18,
                    fontWeight: myFocusNode.hasFocus
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  // filled: true,
                  // fillColor: Colors.greenAccent,
                ),
                // dropdownColor: Colors.greenAccent,
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>[
                  '--Wallet Type--',
                  'Dog',
                  'Cat',
                  'Tiger',
                  'Lion'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
