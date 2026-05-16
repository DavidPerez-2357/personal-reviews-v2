// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewDomain {

 int get id; String get comment; int get rating;// 1-10
 DateTime get createdAt; DateTime? get updatedAt; int get itemId; Map<int, String>? get images;// image id and path
 bool get isDeleted; DateTime? get deletedAt;
/// Create a copy of ReviewDomain
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewDomainCopyWith<ReviewDomain> get copyWith => _$ReviewDomainCopyWithImpl<ReviewDomain>(this as ReviewDomain, _$identity);

  /// Serializes this ReviewDomain to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewDomain&&(identical(other.id, id) || other.id == id)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,comment,rating,createdAt,updatedAt,itemId,const DeepCollectionEquality().hash(images),isDeleted,deletedAt);

@override
String toString() {
  return 'ReviewDomain(id: $id, comment: $comment, rating: $rating, createdAt: $createdAt, updatedAt: $updatedAt, itemId: $itemId, images: $images, isDeleted: $isDeleted, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $ReviewDomainCopyWith<$Res>  {
  factory $ReviewDomainCopyWith(ReviewDomain value, $Res Function(ReviewDomain) _then) = _$ReviewDomainCopyWithImpl;
@useResult
$Res call({
 int id, String comment, int rating, DateTime createdAt, DateTime? updatedAt, int itemId, Map<int, String>? images, bool isDeleted, DateTime? deletedAt
});




}
/// @nodoc
class _$ReviewDomainCopyWithImpl<$Res>
    implements $ReviewDomainCopyWith<$Res> {
  _$ReviewDomainCopyWithImpl(this._self, this._then);

  final ReviewDomain _self;
  final $Res Function(ReviewDomain) _then;

/// Create a copy of ReviewDomain
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? comment = null,Object? rating = null,Object? createdAt = null,Object? updatedAt = freezed,Object? itemId = null,Object? images = freezed,Object? isDeleted = null,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as Map<int, String>?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReviewDomain].
extension ReviewDomainPatterns on ReviewDomain {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewDomain value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewDomain() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewDomain value)  $default,){
final _that = this;
switch (_that) {
case _ReviewDomain():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewDomain value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewDomain() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String comment,  int rating,  DateTime createdAt,  DateTime? updatedAt,  int itemId,  Map<int, String>? images,  bool isDeleted,  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewDomain() when $default != null:
return $default(_that.id,_that.comment,_that.rating,_that.createdAt,_that.updatedAt,_that.itemId,_that.images,_that.isDeleted,_that.deletedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String comment,  int rating,  DateTime createdAt,  DateTime? updatedAt,  int itemId,  Map<int, String>? images,  bool isDeleted,  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _ReviewDomain():
return $default(_that.id,_that.comment,_that.rating,_that.createdAt,_that.updatedAt,_that.itemId,_that.images,_that.isDeleted,_that.deletedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String comment,  int rating,  DateTime createdAt,  DateTime? updatedAt,  int itemId,  Map<int, String>? images,  bool isDeleted,  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _ReviewDomain() when $default != null:
return $default(_that.id,_that.comment,_that.rating,_that.createdAt,_that.updatedAt,_that.itemId,_that.images,_that.isDeleted,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReviewDomain implements ReviewDomain {
  const _ReviewDomain({required this.id, required this.comment, required this.rating, required this.createdAt, this.updatedAt, required this.itemId, final  Map<int, String>? images, this.isDeleted = false, this.deletedAt}): _images = images;
  factory _ReviewDomain.fromJson(Map<String, dynamic> json) => _$ReviewDomainFromJson(json);

@override final  int id;
@override final  String comment;
@override final  int rating;
// 1-10
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;
@override final  int itemId;
 final  Map<int, String>? _images;
@override Map<int, String>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableMapView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

// image id and path
@override@JsonKey() final  bool isDeleted;
@override final  DateTime? deletedAt;

/// Create a copy of ReviewDomain
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewDomainCopyWith<_ReviewDomain> get copyWith => __$ReviewDomainCopyWithImpl<_ReviewDomain>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewDomainToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewDomain&&(identical(other.id, id) || other.id == id)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,comment,rating,createdAt,updatedAt,itemId,const DeepCollectionEquality().hash(_images),isDeleted,deletedAt);

@override
String toString() {
  return 'ReviewDomain(id: $id, comment: $comment, rating: $rating, createdAt: $createdAt, updatedAt: $updatedAt, itemId: $itemId, images: $images, isDeleted: $isDeleted, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$ReviewDomainCopyWith<$Res> implements $ReviewDomainCopyWith<$Res> {
  factory _$ReviewDomainCopyWith(_ReviewDomain value, $Res Function(_ReviewDomain) _then) = __$ReviewDomainCopyWithImpl;
@override @useResult
$Res call({
 int id, String comment, int rating, DateTime createdAt, DateTime? updatedAt, int itemId, Map<int, String>? images, bool isDeleted, DateTime? deletedAt
});




}
/// @nodoc
class __$ReviewDomainCopyWithImpl<$Res>
    implements _$ReviewDomainCopyWith<$Res> {
  __$ReviewDomainCopyWithImpl(this._self, this._then);

  final _ReviewDomain _self;
  final $Res Function(_ReviewDomain) _then;

/// Create a copy of ReviewDomain
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? comment = null,Object? rating = null,Object? createdAt = null,Object? updatedAt = freezed,Object? itemId = null,Object? images = freezed,Object? isDeleted = null,Object? deletedAt = freezed,}) {
  return _then(_ReviewDomain(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as Map<int, String>?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
