import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:ticketson/config/themes/palette.dart';

class CreateWalletForm extends StatefulWidget {
  const CreateWalletForm({super.key});

  @override
  CreateWalletFormState createState() {
    return CreateWalletFormState();
  }
}

class CreateWalletFormState extends State<CreateWalletForm> {
  late FocusNode myFocusNode;
  final TextEditingController _walletNameController = TextEditingController();
  String? selectedValue;
  final List<String> items = ['1', '2', '3', '4'];

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
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (() {
        FocusScope.of(context).unfocus();
      }),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextFormField(
                onFieldSubmitted: (term) {
                  FocusScope.of(context).requestFocus(myFocusNode);
                },
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Palette.primaryColor)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Palette.primaryColor,
                    ),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 10.0, right: 10.0),
                  labelText: 'Wallet Name',
                  labelStyle: TextStyle(
                    color: Palette.accentColor,
                    fontSize: myFocusNode.hasFocus ||
                            _walletNameController.text.isNotEmpty
                        ? 16
                        : 16,
                    fontWeight: myFocusNode.hasFocus
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Field cannot be empty';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 60),
            DropdownButtonHideUnderline(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: DropdownButtonFormField2(
                  buttonDecoration: BoxDecoration(
                      color: Palette.primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  buttonHeight: 60,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Palette.primaryColor,
                  ),
                  validator: (value) => value == null || value == 'Select Item'
                      ? 'Please select a Wallet Type'
                      : null,
                  hint: const Text(
                    'Wallet Type',
                    style: TextStyle(
                      fontSize: 16,
                      color: Palette.secondaryColor,
                    ),
                  ),
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Palette.secondaryColor,
                              ),
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Palette.primaryColor),
                  minimumSize: MaterialStateProperty.all(const Size(200, 50)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side:
                              const BorderSide(color: Palette.primaryColor)))),
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
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Palette.secondaryColor,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
