// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explorer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExplorerState {

 List<FolderDetailedNode> get folders; List<ItemWithLastReview> get items; ElementsSort get sort; ElementsFilter get filter; String get searchQuery; bool get isLoading;
/// Create a copy of ExplorerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExplorerStateCopyWith<ExplorerState> get copyWith => _$ExplorerStateCopyWithImpl<ExplorerState>(this as ExplorerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExplorerState&&const DeepCollectionEquality().equals(other.folders, folders)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(folders),const DeepCollectionEquality().hash(items),sort,filter,searchQuery,isLoading);

@override
String toString() {
  return 'ExplorerState(folders: $folders, items: $items, sort: $sort, filter: $filter, searchQuery: $searchQuery, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $ExplorerStateCopyWith<$Res>  {
  factory $ExplorerStateCopyWith(ExplorerState value, $Res Function(ExplorerState) _then) = _$ExplorerStateCopyWithImpl;
@useResult
$Res call({
 List<FolderDetailedNode> folders, List<ItemWithLastReview> items, ElementsSort sort, ElementsFilter filter, String searchQuery, bool isLoading
});




}
/// @nodoc
class _$ExplorerStateCopyWithImpl<$Res>
    implements $ExplorerStateCopyWith<$Res> {
  _$ExplorerStateCopyWithImpl(this._self, this._then);

  final ExplorerState _self;
  final $Res Function(ExplorerState) _then;

/// Create a copy of ExplorerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? folders = null,Object? items = null,Object? sort = null,Object? filter = null,Object? searchQuery = null,Object? isLoading = null,}) {
  return _then(_self.copyWith(
folders: null == folders ? _self.folders : folders // ignore: cast_nullable_to_non_nullable
as List<FolderDetailedNode>,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ItemWithLastReview>,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as ElementsSort,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ElementsFilter,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ExplorerState].
extension ExplorerStatePatterns on ExplorerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExplorerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExplorerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExplorerState value)  $default,){
final _that = this;
switch (_that) {
case _ExplorerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExplorerState value)?  $default,){
final _that = this;
switch (_that) {
case _ExplorerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<FolderDetailedNode> folders,  List<ItemWithLastReview> items,  ElementsSort sort,  ElementsFilter filter,  String searchQuery,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExplorerState() when $default != null:
return $default(_that.folders,_that.items,_that.sort,_that.filter,_that.searchQuery,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<FolderDetailedNode> folders,  List<ItemWithLastReview> items,  ElementsSort sort,  ElementsFilter filter,  String searchQuery,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _ExplorerState():
return $default(_that.folders,_that.items,_that.sort,_that.filter,_that.searchQuery,_that.isLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<FolderDetailedNode> folders,  List<ItemWithLastReview> items,  ElementsSort sort,  ElementsFilter filter,  String searchQuery,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _ExplorerState() when $default != null:
return $default(_that.folders,_that.items,_that.sort,_that.filter,_that.searchQuery,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _ExplorerState implements ExplorerState {
  const _ExplorerState({final  List<FolderDetailedNode> folders = const [], final  List<ItemWithLastReview> items = const [], this.sort = const ElementsSort(), this.filter = const ElementsFilter(), this.searchQuery = '', this.isLoading = false}): _folders = folders,_items = items;
  

 final  List<FolderDetailedNode> _folders;
@override@JsonKey() List<FolderDetailedNode> get folders {
  if (_folders is EqualUnmodifiableListView) return _folders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_folders);
}

 final  List<ItemWithLastReview> _items;
@override@JsonKey() List<ItemWithLastReview> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  ElementsSort sort;
@override@JsonKey() final  ElementsFilter filter;
@override@JsonKey() final  String searchQuery;
@override@JsonKey() final  bool isLoading;

/// Create a copy of ExplorerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExplorerStateCopyWith<_ExplorerState> get copyWith => __$ExplorerStateCopyWithImpl<_ExplorerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExplorerState&&const DeepCollectionEquality().equals(other._folders, _folders)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_folders),const DeepCollectionEquality().hash(_items),sort,filter,searchQuery,isLoading);

@override
String toString() {
  return 'ExplorerState(folders: $folders, items: $items, sort: $sort, filter: $filter, searchQuery: $searchQuery, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$ExplorerStateCopyWith<$Res> implements $ExplorerStateCopyWith<$Res> {
  factory _$ExplorerStateCopyWith(_ExplorerState value, $Res Function(_ExplorerState) _then) = __$ExplorerStateCopyWithImpl;
@override @useResult
$Res call({
 List<FolderDetailedNode> folders, List<ItemWithLastReview> items, ElementsSort sort, ElementsFilter filter, String searchQuery, bool isLoading
});




}
/// @nodoc
class __$ExplorerStateCopyWithImpl<$Res>
    implements _$ExplorerStateCopyWith<$Res> {
  __$ExplorerStateCopyWithImpl(this._self, this._then);

  final _ExplorerState _self;
  final $Res Function(_ExplorerState) _then;

/// Create a copy of ExplorerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? folders = null,Object? items = null,Object? sort = null,Object? filter = null,Object? searchQuery = null,Object? isLoading = null,}) {
  return _then(_ExplorerState(
folders: null == folders ? _self._folders : folders // ignore: cast_nullable_to_non_nullable
as List<FolderDetailedNode>,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ItemWithLastReview>,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as ElementsSort,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ElementsFilter,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
