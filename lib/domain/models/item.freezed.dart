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

 int get id; String get name; String? get imagePath; DateTime get createdAt; DateTime? get updatedAt; int get categoryId; int? get folderId; bool get isDeleted; DateTime? get deletedAt;
/// Create a copy of ItemDomain
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemDomainCopyWith<ItemDomain> get copyWith => _$ItemDomainCopyWithImpl<ItemDomain>(this as ItemDomain, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemDomain&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.folderId, folderId) || other.folderId == folderId)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,imagePath,createdAt,updatedAt,categoryId,folderId,isDeleted,deletedAt);

@override
String toString() {
  return 'ItemDomain(id: $id, name: $name, imagePath: $imagePath, createdAt: $createdAt, updatedAt: $updatedAt, categoryId: $categoryId, folderId: $folderId, isDeleted: $isDeleted, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $ItemDomainCopyWith<$Res>  {
  factory $ItemDomainCopyWith(ItemDomain value, $Res Function(ItemDomain) _then) = _$ItemDomainCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? imagePath, DateTime createdAt, DateTime? updatedAt, int categoryId, int? folderId, bool isDeleted, DateTime? deletedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imagePath = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? categoryId = null,Object? folderId = freezed,Object? isDeleted = null,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,folderId: freezed == folderId ? _self.folderId : folderId // ignore: cast_nullable_to_non_nullable
as int?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? imagePath,  DateTime createdAt,  DateTime? updatedAt,  int categoryId,  int? folderId,  bool isDeleted,  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemDomain() when $default != null:
return $default(_that.id,_that.name,_that.imagePath,_that.createdAt,_that.updatedAt,_that.categoryId,_that.folderId,_that.isDeleted,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? imagePath,  DateTime createdAt,  DateTime? updatedAt,  int categoryId,  int? folderId,  bool isDeleted,  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _ItemDomain():
return $default(_that.id,_that.name,_that.imagePath,_that.createdAt,_that.updatedAt,_that.categoryId,_that.folderId,_that.isDeleted,_that.deletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? imagePath,  DateTime createdAt,  DateTime? updatedAt,  int categoryId,  int? folderId,  bool isDeleted,  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _ItemDomain() when $default != null:
return $default(_that.id,_that.name,_that.imagePath,_that.createdAt,_that.updatedAt,_that.categoryId,_that.folderId,_that.isDeleted,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ItemDomain implements ItemDomain {
  const _ItemDomain({required this.id, required this.name, this.imagePath, required this.createdAt, this.updatedAt, required this.categoryId, this.folderId, this.isDeleted = false, this.deletedAt});
  

@override final  int id;
@override final  String name;
@override final  String? imagePath;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;
@override final  int categoryId;
@override final  int? folderId;
@override@JsonKey() final  bool isDeleted;
@override final  DateTime? deletedAt;

/// Create a copy of ItemDomain
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemDomainCopyWith<_ItemDomain> get copyWith => __$ItemDomainCopyWithImpl<_ItemDomain>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemDomain&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.folderId, folderId) || other.folderId == folderId)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,imagePath,createdAt,updatedAt,categoryId,folderId,isDeleted,deletedAt);

@override
String toString() {
  return 'ItemDomain(id: $id, name: $name, imagePath: $imagePath, createdAt: $createdAt, updatedAt: $updatedAt, categoryId: $categoryId, folderId: $folderId, isDeleted: $isDeleted, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$ItemDomainCopyWith<$Res> implements $ItemDomainCopyWith<$Res> {
  factory _$ItemDomainCopyWith(_ItemDomain value, $Res Function(_ItemDomain) _then) = __$ItemDomainCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? imagePath, DateTime createdAt, DateTime? updatedAt, int categoryId, int? folderId, bool isDeleted, DateTime? deletedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imagePath = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? categoryId = null,Object? folderId = freezed,Object? isDeleted = null,Object? deletedAt = freezed,}) {
  return _then(_ItemDomain(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,folderId: freezed == folderId ? _self.folderId : folderId // ignore: cast_nullable_to_non_nullable
as int?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$ItemWithLastReview {

 ItemDomain get item; ReviewDomain? get lastReview;
/// Create a copy of ItemWithLastReview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemWithLastReviewCopyWith<ItemWithLastReview> get copyWith => _$ItemWithLastReviewCopyWithImpl<ItemWithLastReview>(this as ItemWithLastReview, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemWithLastReview&&(identical(other.item, item) || other.item == item)&&(identical(other.lastReview, lastReview) || other.lastReview == lastReview));
}


@override
int get hashCode => Object.hash(runtimeType,item,lastReview);

@override
String toString() {
  return 'ItemWithLastReview(item: $item, lastReview: $lastReview)';
}


}

/// @nodoc
abstract mixin class $ItemWithLastReviewCopyWith<$Res>  {
  factory $ItemWithLastReviewCopyWith(ItemWithLastReview value, $Res Function(ItemWithLastReview) _then) = _$ItemWithLastReviewCopyWithImpl;
@useResult
$Res call({
 ItemDomain item, ReviewDomain? lastReview
});


$ItemDomainCopyWith<$Res> get item;$ReviewDomainCopyWith<$Res>? get lastReview;

}
/// @nodoc
class _$ItemWithLastReviewCopyWithImpl<$Res>
    implements $ItemWithLastReviewCopyWith<$Res> {
  _$ItemWithLastReviewCopyWithImpl(this._self, this._then);

  final ItemWithLastReview _self;
  final $Res Function(ItemWithLastReview) _then;

/// Create a copy of ItemWithLastReview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,Object? lastReview = freezed,}) {
  return _then(_self.copyWith(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as ItemDomain,lastReview: freezed == lastReview ? _self.lastReview : lastReview // ignore: cast_nullable_to_non_nullable
as ReviewDomain?,
  ));
}
/// Create a copy of ItemWithLastReview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ItemDomainCopyWith<$Res> get item {
  
  return $ItemDomainCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of ItemWithLastReview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewDomainCopyWith<$Res>? get lastReview {
    if (_self.lastReview == null) {
    return null;
  }

  return $ReviewDomainCopyWith<$Res>(_self.lastReview!, (value) {
    return _then(_self.copyWith(lastReview: value));
  });
}
}


/// Adds pattern-matching-related methods to [ItemWithLastReview].
extension ItemWithLastReviewPatterns on ItemWithLastReview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItemWithLastReview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemWithLastReview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItemWithLastReview value)  $default,){
final _that = this;
switch (_that) {
case _ItemWithLastReview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItemWithLastReview value)?  $default,){
final _that = this;
switch (_that) {
case _ItemWithLastReview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ItemDomain item,  ReviewDomain? lastReview)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemWithLastReview() when $default != null:
return $default(_that.item,_that.lastReview);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ItemDomain item,  ReviewDomain? lastReview)  $default,) {final _that = this;
switch (_that) {
case _ItemWithLastReview():
return $default(_that.item,_that.lastReview);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ItemDomain item,  ReviewDomain? lastReview)?  $default,) {final _that = this;
switch (_that) {
case _ItemWithLastReview() when $default != null:
return $default(_that.item,_that.lastReview);case _:
  return null;

}
}

}

/// @nodoc


class _ItemWithLastReview implements ItemWithLastReview {
  const _ItemWithLastReview({required this.item, this.lastReview});
  

@override final  ItemDomain item;
@override final  ReviewDomain? lastReview;

/// Create a copy of ItemWithLastReview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemWithLastReviewCopyWith<_ItemWithLastReview> get copyWith => __$ItemWithLastReviewCopyWithImpl<_ItemWithLastReview>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemWithLastReview&&(identical(other.item, item) || other.item == item)&&(identical(other.lastReview, lastReview) || other.lastReview == lastReview));
}


@override
int get hashCode => Object.hash(runtimeType,item,lastReview);

@override
String toString() {
  return 'ItemWithLastReview(item: $item, lastReview: $lastReview)';
}


}

/// @nodoc
abstract mixin class _$ItemWithLastReviewCopyWith<$Res> implements $ItemWithLastReviewCopyWith<$Res> {
  factory _$ItemWithLastReviewCopyWith(_ItemWithLastReview value, $Res Function(_ItemWithLastReview) _then) = __$ItemWithLastReviewCopyWithImpl;
@override @useResult
$Res call({
 ItemDomain item, ReviewDomain? lastReview
});


@override $ItemDomainCopyWith<$Res> get item;@override $ReviewDomainCopyWith<$Res>? get lastReview;

}
/// @nodoc
class __$ItemWithLastReviewCopyWithImpl<$Res>
    implements _$ItemWithLastReviewCopyWith<$Res> {
  __$ItemWithLastReviewCopyWithImpl(this._self, this._then);

  final _ItemWithLastReview _self;
  final $Res Function(_ItemWithLastReview) _then;

/// Create a copy of ItemWithLastReview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,Object? lastReview = freezed,}) {
  return _then(_ItemWithLastReview(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as ItemDomain,lastReview: freezed == lastReview ? _self.lastReview : lastReview // ignore: cast_nullable_to_non_nullable
as ReviewDomain?,
  ));
}

/// Create a copy of ItemWithLastReview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ItemDomainCopyWith<$Res> get item {
  
  return $ItemDomainCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of ItemWithLastReview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewDomainCopyWith<$Res>? get lastReview {
    if (_self.lastReview == null) {
    return null;
  }

  return $ReviewDomainCopyWith<$Res>(_self.lastReview!, (value) {
    return _then(_self.copyWith(lastReview: value));
  });
}
}

// dart format on
