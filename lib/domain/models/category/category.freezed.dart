// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryDomain {

 int get id; String get name; CategoryColor get color; String get icon; DateTime get createdAt; bool get isDeleted; DateTime? get deletedAt;
/// Create a copy of CategoryDomain
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryDomainCopyWith<CategoryDomain> get copyWith => _$CategoryDomainCopyWithImpl<CategoryDomain>(this as CategoryDomain, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryDomain&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,color,icon,createdAt,isDeleted,deletedAt);

@override
String toString() {
  return 'CategoryDomain(id: $id, name: $name, color: $color, icon: $icon, createdAt: $createdAt, isDeleted: $isDeleted, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $CategoryDomainCopyWith<$Res>  {
  factory $CategoryDomainCopyWith(CategoryDomain value, $Res Function(CategoryDomain) _then) = _$CategoryDomainCopyWithImpl;
@useResult
$Res call({
 int id, String name, CategoryColor color, String icon, DateTime createdAt, bool isDeleted, DateTime? deletedAt
});


$CategoryColorCopyWith<$Res> get color;

}
/// @nodoc
class _$CategoryDomainCopyWithImpl<$Res>
    implements $CategoryDomainCopyWith<$Res> {
  _$CategoryDomainCopyWithImpl(this._self, this._then);

  final CategoryDomain _self;
  final $Res Function(CategoryDomain) _then;

/// Create a copy of CategoryDomain
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? color = null,Object? icon = null,Object? createdAt = null,Object? isDeleted = null,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as CategoryColor,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of CategoryDomain
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryColorCopyWith<$Res> get color {
  
  return $CategoryColorCopyWith<$Res>(_self.color, (value) {
    return _then(_self.copyWith(color: value));
  });
}
}


/// Adds pattern-matching-related methods to [CategoryDomain].
extension CategoryDomainPatterns on CategoryDomain {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryDomain value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryDomain() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryDomain value)  $default,){
final _that = this;
switch (_that) {
case _CategoryDomain():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryDomain value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryDomain() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  CategoryColor color,  String icon,  DateTime createdAt,  bool isDeleted,  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryDomain() when $default != null:
return $default(_that.id,_that.name,_that.color,_that.icon,_that.createdAt,_that.isDeleted,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  CategoryColor color,  String icon,  DateTime createdAt,  bool isDeleted,  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _CategoryDomain():
return $default(_that.id,_that.name,_that.color,_that.icon,_that.createdAt,_that.isDeleted,_that.deletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  CategoryColor color,  String icon,  DateTime createdAt,  bool isDeleted,  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _CategoryDomain() when $default != null:
return $default(_that.id,_that.name,_that.color,_that.icon,_that.createdAt,_that.isDeleted,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryDomain implements CategoryDomain {
  const _CategoryDomain({required this.id, required this.name, required this.color, required this.icon, required this.createdAt, this.isDeleted = false, this.deletedAt});
  

@override final  int id;
@override final  String name;
@override final  CategoryColor color;
@override final  String icon;
@override final  DateTime createdAt;
@override@JsonKey() final  bool isDeleted;
@override final  DateTime? deletedAt;

/// Create a copy of CategoryDomain
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryDomainCopyWith<_CategoryDomain> get copyWith => __$CategoryDomainCopyWithImpl<_CategoryDomain>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryDomain&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,color,icon,createdAt,isDeleted,deletedAt);

@override
String toString() {
  return 'CategoryDomain(id: $id, name: $name, color: $color, icon: $icon, createdAt: $createdAt, isDeleted: $isDeleted, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$CategoryDomainCopyWith<$Res> implements $CategoryDomainCopyWith<$Res> {
  factory _$CategoryDomainCopyWith(_CategoryDomain value, $Res Function(_CategoryDomain) _then) = __$CategoryDomainCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, CategoryColor color, String icon, DateTime createdAt, bool isDeleted, DateTime? deletedAt
});


@override $CategoryColorCopyWith<$Res> get color;

}
/// @nodoc
class __$CategoryDomainCopyWithImpl<$Res>
    implements _$CategoryDomainCopyWith<$Res> {
  __$CategoryDomainCopyWithImpl(this._self, this._then);

  final _CategoryDomain _self;
  final $Res Function(_CategoryDomain) _then;

/// Create a copy of CategoryDomain
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? color = null,Object? icon = null,Object? createdAt = null,Object? isDeleted = null,Object? deletedAt = freezed,}) {
  return _then(_CategoryDomain(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as CategoryColor,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of CategoryDomain
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryColorCopyWith<$Res> get color {
  
  return $CategoryColorCopyWith<$Res>(_self.color, (value) {
    return _then(_self.copyWith(color: value));
  });
}
}

/// @nodoc
mixin _$CategoryColor {

 String get hex;
/// Create a copy of CategoryColor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryColorCopyWith<CategoryColor> get copyWith => _$CategoryColorCopyWithImpl<CategoryColor>(this as CategoryColor, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryColor&&(identical(other.hex, hex) || other.hex == hex));
}


@override
int get hashCode => Object.hash(runtimeType,hex);

@override
String toString() {
  return 'CategoryColor(hex: $hex)';
}


}

/// @nodoc
abstract mixin class $CategoryColorCopyWith<$Res>  {
  factory $CategoryColorCopyWith(CategoryColor value, $Res Function(CategoryColor) _then) = _$CategoryColorCopyWithImpl;
@useResult
$Res call({
 String hex
});




}
/// @nodoc
class _$CategoryColorCopyWithImpl<$Res>
    implements $CategoryColorCopyWith<$Res> {
  _$CategoryColorCopyWithImpl(this._self, this._then);

  final CategoryColor _self;
  final $Res Function(CategoryColor) _then;

/// Create a copy of CategoryColor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hex = null,}) {
  return _then(_self.copyWith(
hex: null == hex ? _self.hex : hex // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryColor].
extension CategoryColorPatterns on CategoryColor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PresetCategoryColor value)?  preset,TResult Function( CustomCategoryColor value)?  custom,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PresetCategoryColor() when preset != null:
return preset(_that);case CustomCategoryColor() when custom != null:
return custom(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PresetCategoryColor value)  preset,required TResult Function( CustomCategoryColor value)  custom,}){
final _that = this;
switch (_that) {
case PresetCategoryColor():
return preset(_that);case CustomCategoryColor():
return custom(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PresetCategoryColor value)?  preset,TResult? Function( CustomCategoryColor value)?  custom,}){
final _that = this;
switch (_that) {
case PresetCategoryColor() when preset != null:
return preset(_that);case CustomCategoryColor() when custom != null:
return custom(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String name,  String hex)?  preset,TResult Function( String hex)?  custom,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PresetCategoryColor() when preset != null:
return preset(_that.name,_that.hex);case CustomCategoryColor() when custom != null:
return custom(_that.hex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String name,  String hex)  preset,required TResult Function( String hex)  custom,}) {final _that = this;
switch (_that) {
case PresetCategoryColor():
return preset(_that.name,_that.hex);case CustomCategoryColor():
return custom(_that.hex);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String name,  String hex)?  preset,TResult? Function( String hex)?  custom,}) {final _that = this;
switch (_that) {
case PresetCategoryColor() when preset != null:
return preset(_that.name,_that.hex);case CustomCategoryColor() when custom != null:
return custom(_that.hex);case _:
  return null;

}
}

}

/// @nodoc


class PresetCategoryColor extends CategoryColor {
  const PresetCategoryColor({required this.name, required this.hex}): super._();
  

 final  String name;
@override final  String hex;

/// Create a copy of CategoryColor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresetCategoryColorCopyWith<PresetCategoryColor> get copyWith => _$PresetCategoryColorCopyWithImpl<PresetCategoryColor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresetCategoryColor&&(identical(other.name, name) || other.name == name)&&(identical(other.hex, hex) || other.hex == hex));
}


@override
int get hashCode => Object.hash(runtimeType,name,hex);

@override
String toString() {
  return 'CategoryColor.preset(name: $name, hex: $hex)';
}


}

/// @nodoc
abstract mixin class $PresetCategoryColorCopyWith<$Res> implements $CategoryColorCopyWith<$Res> {
  factory $PresetCategoryColorCopyWith(PresetCategoryColor value, $Res Function(PresetCategoryColor) _then) = _$PresetCategoryColorCopyWithImpl;
@override @useResult
$Res call({
 String name, String hex
});




}
/// @nodoc
class _$PresetCategoryColorCopyWithImpl<$Res>
    implements $PresetCategoryColorCopyWith<$Res> {
  _$PresetCategoryColorCopyWithImpl(this._self, this._then);

  final PresetCategoryColor _self;
  final $Res Function(PresetCategoryColor) _then;

/// Create a copy of CategoryColor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? hex = null,}) {
  return _then(PresetCategoryColor(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hex: null == hex ? _self.hex : hex // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CustomCategoryColor extends CategoryColor {
  const CustomCategoryColor({required this.hex}): super._();
  

@override final  String hex;

/// Create a copy of CategoryColor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomCategoryColorCopyWith<CustomCategoryColor> get copyWith => _$CustomCategoryColorCopyWithImpl<CustomCategoryColor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomCategoryColor&&(identical(other.hex, hex) || other.hex == hex));
}


@override
int get hashCode => Object.hash(runtimeType,hex);

@override
String toString() {
  return 'CategoryColor.custom(hex: $hex)';
}


}

/// @nodoc
abstract mixin class $CustomCategoryColorCopyWith<$Res> implements $CategoryColorCopyWith<$Res> {
  factory $CustomCategoryColorCopyWith(CustomCategoryColor value, $Res Function(CustomCategoryColor) _then) = _$CustomCategoryColorCopyWithImpl;
@override @useResult
$Res call({
 String hex
});




}
/// @nodoc
class _$CustomCategoryColorCopyWithImpl<$Res>
    implements $CustomCategoryColorCopyWith<$Res> {
  _$CustomCategoryColorCopyWithImpl(this._self, this._then);

  final CustomCategoryColor _self;
  final $Res Function(CustomCategoryColor) _then;

/// Create a copy of CategoryColor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hex = null,}) {
  return _then(CustomCategoryColor(
hex: null == hex ? _self.hex : hex // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
