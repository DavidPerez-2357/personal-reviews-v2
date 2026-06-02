// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ItemDomain {

 int get id; String get name; String? get imagePath; DateTime get createdAt; DateTime? get updatedAt; CategoryDomain get category; FolderDomain? get folder; List<ReviewDomain> get reviews; bool get isDeleted; DateTime? get deletedAt;
/// Create a copy of ItemDomain
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemDomainCopyWith<ItemDomain> get copyWith => _$ItemDomainCopyWithImpl<ItemDomain>(this as ItemDomain, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemDomain&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.category, category)&&const DeepCollectionEquality().equals(other.folder, folder)&&const DeepCollectionEquality().equals(other.reviews, reviews)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,imagePath,createdAt,updatedAt,const DeepCollectionEquality().hash(category),const DeepCollectionEquality().hash(folder),const DeepCollectionEquality().hash(reviews),isDeleted,deletedAt);

@override
String toString() {
  return 'ItemDomain(id: $id, name: $name, imagePath: $imagePath, createdAt: $createdAt, updatedAt: $updatedAt, category: $category, folder: $folder, reviews: $reviews, isDeleted: $isDeleted, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $ItemDomainCopyWith<$Res>  {
  factory $ItemDomainCopyWith(ItemDomain value, $Res Function(ItemDomain) _then) = _$ItemDomainCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? imagePath, DateTime createdAt, DateTime? updatedAt, CategoryDomain category, FolderDomain? folder, List<ReviewDomain> reviews, bool isDeleted, DateTime? deletedAt
});




}
/// @nodoc
class _$ItemDomainCopyWithImpl<$Res>
    implements $ItemDomainCopyWith<$Res> {
  _$ItemDomainCopyWithImpl(this._self, this._then);

  final ItemDomain _self;
  final $Res Function(ItemDomain) _then;

/// Create a copy of ItemDomain
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imagePath = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? category = freezed,Object? folder = freezed,Object? reviews = null,Object? isDeleted = null,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryDomain,folder: freezed == folder ? _self.folder : folder // ignore: cast_nullable_to_non_nullable
as FolderDomain?,reviews: null == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<ReviewDomain>,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ItemDomain].
extension ItemDomainPatterns on ItemDomain {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItemDomain value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemDomain() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItemDomain value)  $default,){
final _that = this;
switch (_that) {
case _ItemDomain():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItemDomain value)?  $default,){
final _that = this;
switch (_that) {
case _ItemDomain() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? imagePath,  DateTime createdAt,  DateTime? updatedAt,  CategoryDomain category,  FolderDomain? folder,  List<ReviewDomain> reviews,  bool isDeleted,  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemDomain() when $default != null:
return $default(_that.id,_that.name,_that.imagePath,_that.createdAt,_that.updatedAt,_that.category,_that.folder,_that.reviews,_that.isDeleted,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? imagePath,  DateTime createdAt,  DateTime? updatedAt,  CategoryDomain category,  FolderDomain? folder,  List<ReviewDomain> reviews,  bool isDeleted,  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _ItemDomain():
return $default(_that.id,_that.name,_that.imagePath,_that.createdAt,_that.updatedAt,_that.category,_that.folder,_that.reviews,_that.isDeleted,_that.deletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? imagePath,  DateTime createdAt,  DateTime? updatedAt,  CategoryDomain category,  FolderDomain? folder,  List<ReviewDomain> reviews,  bool isDeleted,  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _ItemDomain() when $default != null:
return $default(_that.id,_that.name,_that.imagePath,_that.createdAt,_that.updatedAt,_that.category,_that.folder,_that.reviews,_that.isDeleted,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ItemDomain implements ItemDomain {
  const _ItemDomain({required this.id, required this.name, this.imagePath, required this.createdAt, this.updatedAt, required this.category, this.folder, final  List<ReviewDomain> reviews = const [], this.isDeleted = false, this.deletedAt}): _reviews = reviews;
  

@override final  int id;
@override final  String name;
@override final  String? imagePath;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;
@override final  CategoryDomain category;
@override final  FolderDomain? folder;
 final  List<ReviewDomain> _reviews;
@override@JsonKey() List<ReviewDomain> get reviews {
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviews);
}

@override@JsonKey() final  bool isDeleted;
@override final  DateTime? deletedAt;

/// Create a copy of ItemDomain
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemDomainCopyWith<_ItemDomain> get copyWith => __$ItemDomainCopyWithImpl<_ItemDomain>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemDomain&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.category, category)&&const DeepCollectionEquality().equals(other.folder, folder)&&const DeepCollectionEquality().equals(other._reviews, _reviews)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,imagePath,createdAt,updatedAt,const DeepCollectionEquality().hash(category),const DeepCollectionEquality().hash(folder),const DeepCollectionEquality().hash(_reviews),isDeleted,deletedAt);

@override
String toString() {
  return 'ItemDomain(id: $id, name: $name, imagePath: $imagePath, createdAt: $createdAt, updatedAt: $updatedAt, category: $category, folder: $folder, reviews: $reviews, isDeleted: $isDeleted, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$ItemDomainCopyWith<$Res> implements $ItemDomainCopyWith<$Res> {
  factory _$ItemDomainCopyWith(_ItemDomain value, $Res Function(_ItemDomain) _then) = __$ItemDomainCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? imagePath, DateTime createdAt, DateTime? updatedAt, CategoryDomain category, FolderDomain? folder, List<ReviewDomain> reviews, bool isDeleted, DateTime? deletedAt
});




}
/// @nodoc
class __$ItemDomainCopyWithImpl<$Res>
    implements _$ItemDomainCopyWith<$Res> {
  __$ItemDomainCopyWithImpl(this._self, this._then);

  final _ItemDomain _self;
  final $Res Function(_ItemDomain) _then;

/// Create a copy of ItemDomain
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imagePath = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? category = freezed,Object? folder = freezed,Object? reviews = null,Object? isDeleted = null,Object? deletedAt = freezed,}) {
  return _then(_ItemDomain(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryDomain,folder: freezed == folder ? _self.folder : folder // ignore: cast_nullable_to_non_nullable
as FolderDomain?,reviews: null == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<ReviewDomain>,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
