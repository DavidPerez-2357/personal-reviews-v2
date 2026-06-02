// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder_tree.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FolderNode {

 int get id; String get name; int get categoryId; String? get imagePath; DateTime get createdAt; bool get isDeleted; DateTime? get deletedAt; int? get parentId; List<FolderNode> get children;
/// Create a copy of FolderNode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FolderNodeCopyWith<FolderNode> get copyWith => _$FolderNodeCopyWithImpl<FolderNode>(this as FolderNode, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FolderNode&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&const DeepCollectionEquality().equals(other.children, children));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,categoryId,imagePath,createdAt,isDeleted,deletedAt,parentId,const DeepCollectionEquality().hash(children));

@override
String toString() {
  return 'FolderNode(id: $id, name: $name, categoryId: $categoryId, imagePath: $imagePath, createdAt: $createdAt, isDeleted: $isDeleted, deletedAt: $deletedAt, parentId: $parentId, children: $children)';
}


}

/// @nodoc
abstract mixin class $FolderNodeCopyWith<$Res>  {
  factory $FolderNodeCopyWith(FolderNode value, $Res Function(FolderNode) _then) = _$FolderNodeCopyWithImpl;
@useResult
$Res call({
 int id, String name, int categoryId, String? imagePath, DateTime createdAt, bool isDeleted, DateTime? deletedAt, int? parentId, List<FolderNode> children
});




}
/// @nodoc
class _$FolderNodeCopyWithImpl<$Res>
    implements $FolderNodeCopyWith<$Res> {
  _$FolderNodeCopyWithImpl(this._self, this._then);

  final FolderNode _self;
  final $Res Function(FolderNode) _then;

/// Create a copy of FolderNode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? categoryId = null,Object? imagePath = freezed,Object? createdAt = null,Object? isDeleted = null,Object? deletedAt = freezed,Object? parentId = freezed,Object? children = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,children: null == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as List<FolderNode>,
  ));
}

}


/// Adds pattern-matching-related methods to [FolderNode].
extension FolderNodePatterns on FolderNode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FolderNode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FolderNode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FolderNode value)  $default,){
final _that = this;
switch (_that) {
case _FolderNode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FolderNode value)?  $default,){
final _that = this;
switch (_that) {
case _FolderNode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  int categoryId,  String? imagePath,  DateTime createdAt,  bool isDeleted,  DateTime? deletedAt,  int? parentId,  List<FolderNode> children)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FolderNode() when $default != null:
return $default(_that.id,_that.name,_that.categoryId,_that.imagePath,_that.createdAt,_that.isDeleted,_that.deletedAt,_that.parentId,_that.children);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  int categoryId,  String? imagePath,  DateTime createdAt,  bool isDeleted,  DateTime? deletedAt,  int? parentId,  List<FolderNode> children)  $default,) {final _that = this;
switch (_that) {
case _FolderNode():
return $default(_that.id,_that.name,_that.categoryId,_that.imagePath,_that.createdAt,_that.isDeleted,_that.deletedAt,_that.parentId,_that.children);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  int categoryId,  String? imagePath,  DateTime createdAt,  bool isDeleted,  DateTime? deletedAt,  int? parentId,  List<FolderNode> children)?  $default,) {final _that = this;
switch (_that) {
case _FolderNode() when $default != null:
return $default(_that.id,_that.name,_that.categoryId,_that.imagePath,_that.createdAt,_that.isDeleted,_that.deletedAt,_that.parentId,_that.children);case _:
  return null;

}
}

}

/// @nodoc


class _FolderNode extends FolderNode {
  const _FolderNode({required this.id, required this.name, required this.categoryId, this.imagePath, required this.createdAt, required this.isDeleted, this.deletedAt, this.parentId, final  List<FolderNode> children = const []}): _children = children,super._();
  

@override final  int id;
@override final  String name;
@override final  int categoryId;
@override final  String? imagePath;
@override final  DateTime createdAt;
@override final  bool isDeleted;
@override final  DateTime? deletedAt;
@override final  int? parentId;
 final  List<FolderNode> _children;
@override@JsonKey() List<FolderNode> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}


/// Create a copy of FolderNode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FolderNodeCopyWith<_FolderNode> get copyWith => __$FolderNodeCopyWithImpl<_FolderNode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FolderNode&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&const DeepCollectionEquality().equals(other._children, _children));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,categoryId,imagePath,createdAt,isDeleted,deletedAt,parentId,const DeepCollectionEquality().hash(_children));

@override
String toString() {
  return 'FolderNode(id: $id, name: $name, categoryId: $categoryId, imagePath: $imagePath, createdAt: $createdAt, isDeleted: $isDeleted, deletedAt: $deletedAt, parentId: $parentId, children: $children)';
}


}

/// @nodoc
abstract mixin class _$FolderNodeCopyWith<$Res> implements $FolderNodeCopyWith<$Res> {
  factory _$FolderNodeCopyWith(_FolderNode value, $Res Function(_FolderNode) _then) = __$FolderNodeCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int categoryId, String? imagePath, DateTime createdAt, bool isDeleted, DateTime? deletedAt, int? parentId, List<FolderNode> children
});




}
/// @nodoc
class __$FolderNodeCopyWithImpl<$Res>
    implements _$FolderNodeCopyWith<$Res> {
  __$FolderNodeCopyWithImpl(this._self, this._then);

  final _FolderNode _self;
  final $Res Function(_FolderNode) _then;

/// Create a copy of FolderNode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? categoryId = null,Object? imagePath = freezed,Object? createdAt = null,Object? isDeleted = null,Object? deletedAt = freezed,Object? parentId = freezed,Object? children = null,}) {
  return _then(_FolderNode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,children: null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<FolderNode>,
  ));
}


}

// dart format on
