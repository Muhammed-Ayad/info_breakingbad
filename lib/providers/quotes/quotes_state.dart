import '../../data/models/quote.dart';

abstract class QuotesState {}

class QuotesLoaded extends QuotesState {
  final List<Quote> quotes;

  QuotesLoaded(this.quotes);
}
