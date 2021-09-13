import 'package:greenpen/model/album.dart';
import 'package:greenpen/model/comic.dart';
import 'package:greenpen/repository/album_repository.dart';
import 'package:rxdart/rxdart.dart';

class AlbumBloc {
  final AlbumRepository repository = AlbumRepository();
  final albumData = PublishSubject<List<ComicModel>>();

  Stream<List<ComicModel>> get getAlbums => albumData.stream;

  fetchAlbumsListData() async {
    List<ComicModel> comicList = [];
    for(int i = 1; i< 20; i++){
      ComicModel album = await repository.getAlbumList(i);
      comicList.add(album);
    }
    albumData.sink.add(comicList);
  }

  dispose(){
    albumData.close();
  }
}
