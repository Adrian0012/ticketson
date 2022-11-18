part of 'ticket_bloc.dart';

abstract class TicketState extends Equatable {
  const TicketState();

  @override
  List<Object?> get props => [];
}

class TicketInitial extends TicketState {}

class TicketLoading extends TicketState {}

class TicketError extends TicketState {
  final String errorMessage;
  const TicketError(this.errorMessage);
}

class TicketLoaded extends TicketState {
  final List<Ticket> tickets;
  final String walletUid;
  const TicketLoaded(this.tickets, this.walletUid);

  @override
  List<Object?> get props => [tickets];
}
