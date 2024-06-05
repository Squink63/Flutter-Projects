
import 'book_vo.dart';

class ShelfVO {

  String? shelfName;

  List<BookVO>? booksInShelf;

  ShelfVO({this.shelfName, this.booksInShelf});
}

List<ShelfVO> shelfList = [];