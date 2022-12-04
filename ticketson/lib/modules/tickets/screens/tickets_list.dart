import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:ticketson/common_widgets/bottom_navbar.dart';
import 'package:ticketson/config/themes/palette.dart';
import 'package:ticketson/constants/navbar_enum.dart';
import 'package:ticketson/modules/tickets/bloc/ticket_bloc.dart';
import 'package:ticketson/modules/tickets/models/ticket.dart';
import 'package:ticketson/modules/tickets/widgets/tickets_skeleton_loading.dart';
import 'package:ticketson/modules/wallets/models/wallet.dart';

class TicketsScreen extends StatefulWidget {
  const TicketsScreen({super.key, required this.wallet});
  final Wallet wallet;

  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen>
    with TickerProviderStateMixin {
  final TicketBloc _ticketBloc = TicketBloc();
  late final AnimationController _controller;

  @override
  void initState() {
    _ticketBloc.add(
      GetTickets(widget.wallet),
    );
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(-1, -1),
            end: const Alignment(1.7, 0),
            colors: Palette.baseGradient,
          ),
        ),
        child: Scaffold(
          backgroundColor: Palette.transparent,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                size: screenWidth * .076,
              ),
              color: Palette.white,
              onPressed: () {
                Beamer.of(context).beamBack();
              },
            ),
            title: Text(
              '${widget.wallet.name} - Tickets',
              style: const TextStyle(
                color: Palette.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            elevation: 0.0,
            backgroundColor: Palette.primaryColor,
          ),
          body: _buildTicket(_controller),
          bottomNavigationBar: CustomBottomNavbar(
            selectedIndex: 1,
            navbarLocation: NavbarStatus.tickets.name,
          ),
        ));
  }

  Widget _buildTicket(AnimationController controller) {
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
              return const TicketsSkeletonLoading();
            } else if (state is TicketLoading) {
              return const TicketsSkeletonLoading();
            } else if (state is TicketLoaded) {
              return _buildTicketItems(context, state.tickets, controller);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

Widget _buildTicketItems(
  BuildContext context,
  List<Ticket> model,
  AnimationController controller,
) {
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
                child:
                    TicketItem(ticket: ticket, animationController: controller),
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
    required this.animationController,
  }) : super(key: key);
  final Ticket ticket;
  final AnimationController animationController;

  @override
  State<TicketItem> createState() => _TicketItemState();
}

class _TicketItemState extends State<TicketItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 8,
          child: Container(
            decoration: BoxDecoration(
              color: Palette.primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                width: 1.5,
                color: Palette.secondaryColor.withOpacity(0.5),
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
                        color: Palette.primaryColor,
                      ),
                      const Padding(padding: EdgeInsets.only(right: 4.0)),
                      Text(
                        widget.ticket.number,
                        style: const TextStyle(
                          color: Palette.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w900,
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
          child: Lottie.asset(
            height: size.height / 15,
            fit: BoxFit.fill,
            widget.ticket.status == 'pending'
                ? 'assets/lottie/pending.json'
                : widget.ticket.status == 'win'
                    ? 'assets/lottie/winner.json'
                    : widget.ticket.status == 'lost'
                        ? 'assets/lottie/fail.json'
                        : '',
            controller: widget.animationController,
            onLoaded: (composition) {
              widget.animationController
                ..duration = composition.duration
                ..repeat();
            },
          ),
        )
      ],
    );
  }
}
