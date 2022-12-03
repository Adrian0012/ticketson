import 'package:flutter/widgets.dart';
import 'package:ticketson/common_widgets/work_in_progress.dart';

class CreateTicketForm extends StatefulWidget {
  const CreateTicketForm({super.key});

  @override
  State<CreateTicketForm> createState() => _CreateTicketFormState();
}

class _CreateTicketFormState extends State<CreateTicketForm> {
  @override
  Widget build(BuildContext context) {
    return const WorkInProgress();
  }
}
