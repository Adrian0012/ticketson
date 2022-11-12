import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketson/config/themes/custom_images.dart';
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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(CustomImages.background),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          backgroundColor: Palette.transparent,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              iconSize: 25.0,
              color: Palette.secondaryColor,
              onPressed: () {
                Beamer.of(context).beamBack();
              },
            ),
            title: Text(
              '${widget.wallet.name} - Tickets',
              style: const TextStyle(
                color: Palette.secondaryColor,
              ),
            ),
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
              child: const Icon(
                Icons.add,
                size: 25.0,
                color: Palette.secondaryColor,
              ),
              onPressed: () {
                Beamer.of(context).beamToNamed(Routes.dashboard);
              },
            ),
          )),
    );
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
            shrinkWrap: true,
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 8,
          child: Container(
            decoration: BoxDecoration(
              color: Palette.primaryColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                width: 1.5,
                color: Palette.accentColor.withOpacity(0.5),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 16,
                  spreadRadius: 16,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
            ),
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
                        color: Palette.accentColor,
                      ),
                      const Padding(padding: EdgeInsets.only(right: 4.0)),
                      Text(
                        widget.ticket.number,
                        style: const TextStyle(
                          color: Palette.secondaryColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.only(right: 5.0)),
        Expanded(
          flex: 2,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: widget.ticket.status == 'pending'
                  ? Palette.ticketPending
                  : widget.ticket.status == 'win'
                      ? Palette.ticketWon
                      : widget.ticket.status == 'lost'
                          ? Palette.ticketLost
                          : Palette.secondaryColor,
            ),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                widget.ticket.status.toUpperCase(),
                style: const TextStyle(
                  color: Palette.secondaryColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.2,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
