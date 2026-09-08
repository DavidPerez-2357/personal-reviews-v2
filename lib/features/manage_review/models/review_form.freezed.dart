// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ItemImage {

 String get path; int? get id;
/// Create a copy of ItemImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemImageCopyWith<ItemImage> get copyWith => _$ItemImageCopyWithImpl<ItemImage>(this as ItemImage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemImage&&(identical(other.path, path) || other.path == path)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,path,id);

@override
String toString() {
  return 'ItemImage(path: $path, id: $id)';
}


}

/// @nodoc
abstract mixin class $ItemImageCopyWith<$Res>  {
  factory $ItemImageCopyWith(ItemImage value, $Res Function(ItemImage) _then) = _$ItemImageCopyWithImpl;
@useResult
$Res call({
 String path, int? id
});




}
/// @nodoc
class _$ItemImageCopyWithImpl<$Res>
    implements $ItemImageCopyWith<$Res> {
  _$ItemImageCopyWithImpl(this._self, this._then);

  final ItemImage _self;
  final $Res Function(ItemImage) _then;

/// Create a copy of ItemImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? id = freezed,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ItemImage].
extension ItemImagePatterns on ItemImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItemImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItemImage value)  $default,){
final _that = this;
switch (_that) {
case _ItemImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItemImage value)?  $default,){
final _that = this;
switch (_that) {
case _ItemImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String path,  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemImage() when $default != null:
return $default(_that.path,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String path,  int? id)  $default,) {final _that = this;
switch (_that) {
case _ItemImage():
return $default(_that.path,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String path,  int? id)?  $default,) {final _that = this;
switch (_that) {
case _ItemImage() when $default != null:
return $default(_that.path,_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _ItemImage extends ItemImage {
  const _ItemImage({required this.path, this.id}): super._();
  

@override final  String path;
@override final  int? id;

/// Create a copy of ItemImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemImageCopyWith<_ItemImage> get copyWith => __$ItemImageCopyWithImpl<_ItemImage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemImage&&(identical(other.path, path) || other.path == path)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,path,id);

@override
String toString() {
  return 'ItemImage(path: $path, id: $id)';
}


}

/// @nodoc
abstract mixin class _$ItemImageCopyWith<$Res> implements $ItemImageCopyWith<$Res> {
  factory _$ItemImageCopyWith(_ItemImage value, $Res Function(_ItemImage) _then) = __$ItemImageCopyWithImpl;
@override @useResult
$Res call({
 String path, int? id
});




}
/// @nodoc
class __$ItemImageCopyWithImpl<$Res>
    implements _$ItemImageCopyWith<$Res> {
  __$ItemImageCopyWithImpl(this._self, this._then);

  final _ItemImage _self;
  final $Res Function(_ItemImage) _then;

/// Create a copy of ItemImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,Object? id = freezed,}) {
  return _then(_ItemImage(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$ReviewForm {

 double get rating; String get comment; List<ItemImage> get images; String get itemName; CategoryDomain? get category; List<FolderDomain> get folderPath; int? get itemId;
/// Create a copy of ReviewForm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewFormCopyWith<ReviewForm> get copyWith => _$ReviewFormCopyWithImpl<ReviewForm>(this as ReviewForm, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewForm&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.folderPath, folderPath)&&(identical(other.itemId, itemId) || other.itemId == itemId));
}


@override
int get hashCode => Object.hash(runtimeType,rating,comment,const DeepCollectionEquality().hash(images),itemName,category,const DeepCollectionEquality().hash(folderPath),itemId);

@override
String toString() {
  return 'ReviewForm(rating: $rating, comment: $comment, images: $images, itemName: $itemName, category: $category, folderPath: $folderPath, itemId: $itemId)';
}


}

/// @nodoc
abstract mixin class $ReviewFormCopyWith<$Res>  {
  factory $ReviewFormCopyWith(ReviewForm value, $Res Function(ReviewForm) _then) = _$ReviewFormCopyWithImpl;
@useResult
$Res call({
 double rating, String comment, List<ItemImage> images, String itemName, CategoryDomain? category, List<FolderDomain> folderPath, int? itemId
});


$CategoryDomainCopyWith<$Res>? get category;

}
/// @nodoc
class _$ReviewFormCopyWithImpl<$Res>
    implements $ReviewFormCopyWith<$Res> {
  _$ReviewFormCopyWithImpl(this._self, this._then);

  final ReviewForm _self;
  final $Res Function(ReviewForm) _then;

/// Create a copy of ReviewForm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rating = null,Object? comment = null,Object? images = null,Object? itemName = null,Object? category = freezed,Object? folderPath = null,Object? itemId = freezed,}) {
  return _then(_self.copyWith(
rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<ItemImage>,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryDomain?,folderPath: null == folderPath ? _self.folderPath : folderPath // ignore: cast_nullable_to_non_nullable
as List<FolderDomain>,itemId: freezed == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of ReviewForm
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryDomainCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryDomainCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReviewForm].
extension ReviewFormPatterns on ReviewForm {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewForm value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewForm() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewForm value)  $default,){
final _that = this;
switch (_that) {
case _ReviewForm():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewForm value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewForm() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double rating,  String comment,  List<ItemImage> images,  String itemName,  CategoryDomain? category,  List<FolderDomain> folderPath,  int? itemId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewForm() when $default != null:
return $default(_that.rating,_that.comment,_that.images,_that.itemName,_that.category,_that.folderPath,_that.itemId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double rating,  String comment,  List<ItemImage> images,  String itemName,  CategoryDomain? category,  List<FolderDomain> folderPath,  int? itemId)  $default,) {final _that = this;
switch (_that) {
case _ReviewForm():
return $default(_that.rating,_that.comment,_that.images,_that.itemName,_that.category,_that.folderPath,_that.itemId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double rating,  String comment,  List<ItemImage> images,  String itemName,  CategoryDomain? category,  List<FolderDomain> folderPath,  int? itemId)?  $default,) {final _that = this;
switch (_that) {
case _ReviewForm() when $default != null:
return $default(_that.rating,_that.comment,_that.images,_that.itemName,_that.category,_that.folderPath,_that.itemId);case _:
  return null;

}
}

}

/// @nodoc


class _ReviewForm extends ReviewForm {
  const _ReviewForm({this.rating = 0.0, this.comment = '', final  List<ItemImage> images = const [], this.itemName = '', this.category, final  List<FolderDomain> folderPath = const [], this.itemId}): _images = images,_folderPath = folderPath,super._();
  

@override@JsonKey() final  double rating;
@override@JsonKey() final  String comment;
 final  List<ItemImage> _images;
@override@JsonKey() List<ItemImage> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override@JsonKey() final  String itemName;
@override final  CategoryDomain? category;
 final  List<FolderDomain> _folderPath;
@override@JsonKey() List<FolderDomain> get folderPath {
  if (_folderPath is EqualUnmodifiableListView) return _folderPath;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_folderPath);
}

@override final  int? itemId;

/// Create a copy of ReviewForm
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewFormCopyWith<_ReviewForm> get copyWith => __$ReviewFormCopyWithImpl<_ReviewForm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewForm&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._folderPath, _folderPath)&&(identical(other.itemId, itemId) || other.itemId == itemId));
}


@override
int get hashCode => Object.hash(runtimeType,rating,comment,const DeepCollectionEquality().hash(_images),itemName,category,const DeepCollectionEquality().hash(_folderPath),itemId);

@override
String toString() {
  return 'ReviewForm(rating: $rating, comment: $comment, images: $images, itemName: $itemName, category: $category, folderPath: $folderPath, itemId: $itemId)';
}


}

/// @nodoc
abstract mixin class _$ReviewFormCopyWith<$Res> implements $ReviewFormCopyWith<$Res> {
  factory _$ReviewFormCopyWith(_ReviewForm value, $Res Function(_ReviewForm) _then) = __$ReviewFormCopyWithImpl;
@override @useResult
$Res call({
 double rating, String comment, List<ItemImage> images, String itemName, CategoryDomain? category, List<FolderDomain> folderPath, int? itemId
});


@override $CategoryDomainCopyWith<$Res>? get category;

}
/// @nodoc
class __$ReviewFormCopyWithImpl<$Res>
    implements _$ReviewFormCopyWith<$Res> {
  __$ReviewFormCopyWithImpl(this._self, this._then);

  final _ReviewForm _self;
  final $Res Function(_ReviewForm) _then;

/// Create a copy of ReviewForm
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rating = null,Object? comment = null,Object? images = null,Object? itemName = null,Object? category = freezed,Object? folderPath = null,Object? itemId = freezed,}) {
  return _then(_ReviewForm(
rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<ItemImage>,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryDomain?,folderPath: null == folderPath ? _self._folderPath : folderPath // ignore: cast_nullable_to_non_nullable
as List<FolderDomain>,itemId: freezed == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of ReviewForm
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryDomainCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryDomainCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on
