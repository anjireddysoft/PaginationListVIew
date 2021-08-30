import 'package:greenpen/model/album.dart';
import 'package:greenpen/repository/album_repository.dart';
import 'package:rxdart/rxdart.dart';

class AlbumBloc {
final AlbumRepository repository=AlbumRepository();
final albumData=PublishSubject<List<Album>>();
Stream<List<Album>> get getAlbums=>albumData.stream;
fetchAlbumsListData() async {
 List<Album>  albumList=await repository.getAlbumList();
  albumData.sink.add(albumList);
}

}