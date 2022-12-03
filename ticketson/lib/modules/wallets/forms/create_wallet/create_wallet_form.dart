import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticketson/config/themes/palette.dart';
import 'package:ticketson/modules/wallets/widgets/custom_button.dart';
import 'package:ticketson/modules/wallets/widgets/custom_text_field.dart';

class CreateWalletForm extends StatefulWidget {
  const CreateWalletForm({super.key});

  @override
  CreateWalletFormState createState() {
    return CreateWalletFormState();
  }
}

class CreateWalletFormState extends State<CreateWalletForm> {
  final TextEditingController _walletNameController = TextEditingController();
  String? selectedValue;
  final List<String> items = ['1', '2', '3', '4'];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _walletNameController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (() {
        FocusScope.of(context).unfocus();
      }),
      child: Form(
        key: _formKey,
        child: SizedBox(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(children: <Widget>[
                CustomTextField(
                  walletNameController: _walletNameController,
                ),
                const Divider(
                  height: 10.0,
                  color: Palette.transparent,
                ),
                SizedBox(
                  width: size.width / 1.12,
                  child: DropdownButtonHideUnderline(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: DropdownButtonFormField2(
                        buttonDecoration: BoxDecoration(
                          color: Palette.primaryColor.withOpacity(.6),
                          border: Border.all(
                            color: Palette.primaryColor.withOpacity(.6),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        buttonHeight: size.height / 18,
                        buttonPadding:
                            const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          boxShadow: const [],
                          borderRadius: BorderRadius.circular(15),
                          color: Palette.primaryColor.withOpacity(.6),
                        ),
                        hint: const Text(
                          'Wallet Type',
                          style: TextStyle(
                            fontSize: 16,
                            color: Palette.white,
                          ),
                        ),
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Palette.white,
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
                ),
              ]),
              CustomButton(
                buttonText: 'Submit',
                width: 2.58,
                voidCallback: () {
                  HapticFeedback.lightImpact();
                },
                formKey: _formKey,
                walletName: _walletNameController,
                walletType: selectedValue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
