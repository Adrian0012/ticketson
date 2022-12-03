import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ticketson/config/themes/palette.dart';
import 'package:ticketson/modules/tickets/forms/create_ticket/create_ticket_form.dart';

class CreateTicketScreen extends StatefulWidget {
  const CreateTicketScreen({super.key});

  @override
  State<CreateTicketScreen> createState() => _CreateTicketScreen();
}

class _CreateTicketScreen extends State<CreateTicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(-1, -1),
          end: const Alignment(1.7, .5),
          colors: Palette.baseGradient,
        ),
      ),
      child: Scaffold(
        backgroundColor: Palette.transparent,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {
              Beamer.of(context).beamBack();
            },
          ),
          title: const Text('Add Ticket'),
          elevation: 0.0,
          backgroundColor: Palette.primaryColor,
        ),
        body: const CreateTicketForm(),
      ),
    );
  }
}
