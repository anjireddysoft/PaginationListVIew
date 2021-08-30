import 'package:greenpen/model/album.dart';
import 'package:greenpen/model/booking.dart';
import 'package:greenpen/repository/album_repository.dart';
import 'package:greenpen/repository/booking_repository.dart';
import 'package:rxdart/rxdart.dart';

class BookingBloc {
  final BookingRepository repository=BookingRepository();
  // ignore: close_sinks
  final BookingData=PublishSubject<List<BookingModel>>();
  Stream<List<BookingModel>> get getBookingList=>BookingData.stream;
  fetchBookingListData( ) async {
    List<BookingModel>  bookingList=await repository.getBookingList();
    BookingData.sink.add(bookingList);
  }

}