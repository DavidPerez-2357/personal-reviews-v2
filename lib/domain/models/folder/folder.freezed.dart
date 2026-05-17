// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FolderDomain {

 int get id; String get name; String? get imagePath; int? get parentId; int get categoryId; DateTime get createdAt; bool get isDeleted; DateTime? get deletedAt;
/// Create a copy of FolderDomain
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FolderDomainCopyWith<FolderDomain> get copyWith => _$FolderDomainCopyWithImpl<FolderDomain>(this as FolderDomain, _$identity);

  /// Serializes this FolderDomain to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FolderDomain&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imagePath,parentId,categoryId,createdAt,isDeleted,deletedAt);

@override
String toString() {
  return 'FolderDomain(id: $id, name: $name, imagePath: $imagePath, parentId: $parentId, categoryId: $categoryId, createdAt: $createdAt, isDeleted: $isDeleted, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $FolderDomainCopyWith<$Res>  {
  factory $FolderDomainCopyWith(FolderDomain value, $Res Function(FolderDomain) _then) = _$FolderDomainCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? imagePath, int? parentId, int categoryId, DateTime createdAt, bool isDeleted, DateTime? deletedAt
});




}
/// @nodoc
class _$FolderDomainCopyWithImpl<$Res>
    implements $FolderDomainCopyWith<$Res> {
  _$FolderDomainCopyWithImpl(this._self, this._then);

  final FolderDomain _self;
  final $Res Function(FolderDomain) _then;

/// Create a copy of FolderDomain
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imagePath = freezed,Object? parentId = freezed,Object? categoryId = null,Object? createdAt = null,Object? isDeleted = null,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [FolderDomain].
extension FolderDomainPatterns on FolderDomain {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FolderDomain value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FolderDomain() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FolderDomain value)  $default,){
final _that = this;
switch (_that) {
case _FolderDomain():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FolderDomain value)?  $default,){
final _that = this;
switch (_that) {
case _FolderDomain() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? imagePath,  int? parentId,  int categoryId,  DateTime createdAt,  bool isDeleted,  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FolderDomain() when $default != null:
return $default(_that.id,_that.name,_that.imagePath,_that.parentId,_that.categoryId,_that.createdAt,_that.isDeleted,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? imagePath,  int? parentId,  int categoryId,  DateTime createdAt,  bool isDeleted,  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _FolderDomain():
return $default(_that.id,_that.name,_that.imagePath,_that.parentId,_that.categoryId,_that.createdAt,_that.isDeleted,_that.deletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? imagePath,  int? parentId,  int categoryId,  DateTime createdAt,  bool isDeleted,  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _FolderDomain() when $default != null:
return $default(_that.id,_that.name,_that.imagePath,_that.parentId,_that.categoryId,_that.createdAt,_that.isDeleted,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FolderDomain implements FolderDomain {
  const _FolderDomain({required this.id, required this.name, this.imagePath, this.parentId, required this.categoryId, required this.createdAt, this.isDeleted = false, this.deletedAt});
  factory _FolderDomain.fromJson(Map<String, dynamic> json) => _$FolderDomainFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? imagePath;
@override final  int? parentId;
@override final  int categoryId;
@override final  DateTime createdAt;
@override@JsonKey() final  bool isDeleted;
@override final  DateTime? deletedAt;

/// Create a copy of FolderDomain
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FolderDomainCopyWith<_FolderDomain> get copyWith => __$FolderDomainCopyWithImpl<_FolderDomain>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FolderDomainToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FolderDomain&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imagePath,parentId,categoryId,createdAt,isDeleted,deletedAt);

@override
String toString() {
  return 'FolderDomain(id: $id, name: $name, imagePath: $imagePath, parentId: $parentId, categoryId: $categoryId, createdAt: $createdAt, isDeleted: $isDeleted, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$FolderDomainCopyWith<$Res> implements $FolderDomainCopyWith<$Res> {
  factory _$FolderDomainCopyWith(_FolderDomain value, $Res Function(_FolderDomain) _then) = __$FolderDomainCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? imagePath, int? parentId, int categoryId, DateTime createdAt, bool isDeleted, DateTime? deletedAt
});




}
/// @nodoc
class __$FolderDomainCopyWithImpl<$Res>
    implements _$FolderDomainCopyWith<$Res> {
  __$FolderDomainCopyWithImpl(this._self, this._then);

  final _FolderDomain _self;
  final $Res Function(_FolderDomain) _then;

/// Create a copy of FolderDomain
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imagePath = freezed,Object? parentId = freezed,Object? categoryId = null,Object? createdAt = null,Object? isDeleted = null,Object? deletedAt = freezed,}) {
  return _then(_FolderDomain(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
