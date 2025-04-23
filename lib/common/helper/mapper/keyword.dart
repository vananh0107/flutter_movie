import 'package:movie/core/entities/keyword.dart';
import 'package:movie/core/models/keyword.dart';

class KeywordMapper {
  static KeywordEntity toEntity(KeywordModel model) {
    return KeywordEntity(
      id: model.id,
      name: model.name,
    );
  }
}