import '../data/vos/error_vo.dart';

class CustomException {
  final ErrorVO errorVO;

  CustomException(this.errorVO);

  @override
  String toString() => errorVO.statusMessage;
}