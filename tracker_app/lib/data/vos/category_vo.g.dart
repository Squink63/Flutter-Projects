// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryVOAdapter extends TypeAdapter<CategoryVO> {
  @override
  final int typeId = 0;

  @override
  CategoryVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryVO(
      categoryName: fields[0] as String,
      categoryType: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.categoryName)
      ..writeByte(1)
      ..write(obj.categoryType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
