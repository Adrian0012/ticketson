import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ticketson/config/themes/palette.dart';
import 'package:ticketson/config/urls.dart';
import 'package:ticketson/modules/ticket/bloc/ticket_bloc.dart';
import 'package:ticketson/modules/ticket/models/ticket.dart';
import 'package:ticketson/modules/wallet/models/wallet.dart';
import 'package:ticketson/widgets/bottom_navbar.dart';
import 'package:ticketson/widgets/loading.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key, required this.wallet});
  final Wallet wallet;

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  final TicketBloc _ticketBloc = TicketBloc();

  @override
  void initState() {
    _ticketBloc.add(
      GetTickets(widget.wallet),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.accentColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {
              Beamer.of(context).beamBack();
            },
          ),
          title: Text('${widget.wallet.name} - Tickets'),
          elevation: 0.0,
          backgroundColor: Palette.primaryColor,
        ),
        body: _buildTicket(),
        bottomNavigationBar: const Navbar(selectedIndex: 1),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add),
            onPressed: () {
              Beamer.of(context).beamToNamed(Routes.dashboard);
            },
          ),
        ));
  }

  Widget _buildTicket() {
    return BlocProvider(
      create: (_) => _ticketBloc,
      child: BlocListener<TicketBloc, TicketState>(
        listener: (context, state) {
          if (state is TicketError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        child: BlocBuilder<TicketBloc, TicketState>(
          builder: (context, state) {
            if (state is TicketInitial) {
              return const Loading();
            } else if (state is TicketLoading) {
              return const Loading();
            } else if (state is TicketLoaded) {
              return _buildTicketItems(context, state.tickets);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

Widget _buildTicketItems(BuildContext context, List<Ticket> model) {
  return Column(
    children: <Widget>[
      Expanded(
        child: ListView.builder(
            itemCount: model.length,
            itemBuilder: (BuildContext content, int index) {
              final Ticket ticket = model[index];
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: TicketItem(ticket: ticket),
              );
            }),
      ),
    ],
  );
}

class TicketItem extends StatefulWidget {
  const TicketItem({
    Key? key,
    required this.ticket,
  }) : super(key: key);
  final Ticket ticket;

  @override
  State<TicketItem> createState() => _TicketItemState();
}

class _TicketItemState extends State<TicketItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [
            0.1,
            0.4,
            0.7,
            // 0.9,
          ],
          colors: [
            Palette.cardGradient3,
            Palette.cardGradient1,
            Palette.cardGradient2,
            // Colors.teal,
          ],
        ),
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          width: 1.5,
          color: Colors.white.withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 16,
            spreadRadius: 16,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      width: 360,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.confirmation_num,
                  size: 25.0,
                  color: Palette.primaryColor,
                ),
                Text(
                  widget.ticket.number,
                  style: const TextStyle(
                    color: Palette.primaryColor,
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Status:',
                  style: TextStyle(
                    color: Palette.primaryColor,
                  ),
                ),
                Text(
                  widget.ticket.status,
                  style: const TextStyle(
                    color: Palette.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
