// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmailAdapter extends TypeAdapter<Email> {
  @override
  final int typeId = 1;

  @override
  Email read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Email(
      creator: fields[0] as String?,
      id: fields[1] as String,
      from: fields[2] as String,
      to: (fields[3] as List).cast<String>(),
      subject: fields[4] as String,
      body: fields[5] as String,
      sendedAt: fields[6] as DateTime,
      decryptionKey: fields[8] as String,
      decryptionIV: fields[9] as String,
      previousID: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Email obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.creator)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.from)
      ..writeByte(3)
      ..write(obj.to)
      ..writeByte(4)
      ..write(obj.subject)
      ..writeByte(5)
      ..write(obj.body)
      ..writeByte(6)
      ..write(obj.sendedAt)
      ..writeByte(7)
      ..write(obj.previousID)
      ..writeByte(8)
      ..write(obj.decryptionKey)
      ..writeByte(9)
      ..write(obj.decryptionIV);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
