
import 'package:greenpen/model/comic.dart';
import 'package:greenpen/repository/apiprovider.dart';

class AlbumRepository {
  ApiProvider apiProvider = ApiProvider();

  Future<ComicModel> getAlbumList(int index) async {
    return apiProvider.fetchAlbum(index);
  }
}
