// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionVOAdapter extends TypeAdapter<TransactionVO> {
  @override
  final int typeId = 1;

  @override
  TransactionVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionVO(
      category: fields[0] as String,
      note: fields[1] as String,
      date: fields[2] as String,
      amount: fields[3] as String,
      type: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionVO obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.note)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
