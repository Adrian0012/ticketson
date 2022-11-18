import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticketson/modules/tickets/models/ticket.dart';
import 'package:ticketson/modules/tickets/repository/ticket_repository.dart';
import 'package:ticketson/modules/wallets/models/wallet.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc() : super(TicketInitial()) {
    TicketRepository ticketRespository = TicketRepository();
    on<GetTickets>((event, emit) async {
      emit(TicketLoading());
      final List<Ticket> tickets =
          await ticketRespository.getTickets(event.wallet.uid);
      if (tickets.isNotEmpty) {
        emit(TicketLoaded(tickets, event.wallet.uid));
      } else {
        emit(TicketLoaded(const [], event.wallet.uid));
      }
    });
  }
}
