import 'package:greenpen/model/album.dart';
import 'package:greenpen/repository/apiprovider.dart';

class AlbumRepository{
  ApiProvider apiProvider=ApiProvider();
  Future<List<Album>>getAlbumList()async{
    return apiProvider.fetchAlbum();
  }

}