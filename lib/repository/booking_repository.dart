import 'package:greenpen/model/album.dart';
import 'package:greenpen/model/booking.dart';
import 'package:greenpen/repository/apiprovider.dart';

class BookingRepository {
  ApiProvider apiProvider = ApiProvider();

  Future<List<BookingModel>> getBookingList( ) async {
    return apiProvider.createBooking();
  }
}
