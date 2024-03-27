// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snack_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnackVO _$SnackVOFromJson(Map<String, dynamic> json) => SnackVO(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as int?,
      categoryId: json['category_id'] as int?,
      image: json['image'] as String?,
      unitPrice: json['unit_price'] as int?,
      quantity: json['quantity'] as int? ?? 0,
      totalPrice: json['total_price'] as int?,
    );

Map<String, dynamic> _$SnackVOToJson(SnackVO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'category_id': instance.categoryId,
      'image': instance.image,
      'unit_price': instance.unitPrice,
      'quantity': instance.quantity,
      'total_price': instance.totalPrice,
    };
