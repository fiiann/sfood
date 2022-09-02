// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class FoodsTableData extends DataClass implements Insertable<FoodsTableData> {
  final int idFood;
  final String category;
  final String nameFood;
  final String image;
  final String area;
  const FoodsTableData(
      {required this.idFood,
      required this.category,
      required this.nameFood,
      required this.image,
      required this.area});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_food'] = Variable<int>(idFood);
    map['category'] = Variable<String>(category);
    map['name_food'] = Variable<String>(nameFood);
    map['image'] = Variable<String>(image);
    map['area'] = Variable<String>(area);
    return map;
  }

  FoodsTableCompanion toCompanion(bool nullToAbsent) {
    return FoodsTableCompanion(
      idFood: Value(idFood),
      category: Value(category),
      nameFood: Value(nameFood),
      image: Value(image),
      area: Value(area),
    );
  }

  factory FoodsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FoodsTableData(
      idFood: serializer.fromJson<int>(json['idFood']),
      category: serializer.fromJson<String>(json['category']),
      nameFood: serializer.fromJson<String>(json['nameFood']),
      image: serializer.fromJson<String>(json['image']),
      area: serializer.fromJson<String>(json['area']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idFood': serializer.toJson<int>(idFood),
      'category': serializer.toJson<String>(category),
      'nameFood': serializer.toJson<String>(nameFood),
      'image': serializer.toJson<String>(image),
      'area': serializer.toJson<String>(area),
    };
  }

  FoodsTableData copyWith(
          {int? idFood,
          String? category,
          String? nameFood,
          String? image,
          String? area}) =>
      FoodsTableData(
        idFood: idFood ?? this.idFood,
        category: category ?? this.category,
        nameFood: nameFood ?? this.nameFood,
        image: image ?? this.image,
        area: area ?? this.area,
      );
  @override
  String toString() {
    return (StringBuffer('FoodsTableData(')
          ..write('idFood: $idFood, ')
          ..write('category: $category, ')
          ..write('nameFood: $nameFood, ')
          ..write('image: $image, ')
          ..write('area: $area')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idFood, category, nameFood, image, area);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FoodsTableData &&
          other.idFood == this.idFood &&
          other.category == this.category &&
          other.nameFood == this.nameFood &&
          other.image == this.image &&
          other.area == this.area);
}

class FoodsTableCompanion extends UpdateCompanion<FoodsTableData> {
  final Value<int> idFood;
  final Value<String> category;
  final Value<String> nameFood;
  final Value<String> image;
  final Value<String> area;
  const FoodsTableCompanion({
    this.idFood = const Value.absent(),
    this.category = const Value.absent(),
    this.nameFood = const Value.absent(),
    this.image = const Value.absent(),
    this.area = const Value.absent(),
  });
  FoodsTableCompanion.insert({
    required int idFood,
    required String category,
    required String nameFood,
    required String image,
    required String area,
  })  : idFood = Value(idFood),
        category = Value(category),
        nameFood = Value(nameFood),
        image = Value(image),
        area = Value(area);
  static Insertable<FoodsTableData> custom({
    Expression<int>? idFood,
    Expression<String>? category,
    Expression<String>? nameFood,
    Expression<String>? image,
    Expression<String>? area,
  }) {
    return RawValuesInsertable({
      if (idFood != null) 'id_food': idFood,
      if (category != null) 'category': category,
      if (nameFood != null) 'name_food': nameFood,
      if (image != null) 'image': image,
      if (area != null) 'area': area,
    });
  }

  FoodsTableCompanion copyWith(
      {Value<int>? idFood,
      Value<String>? category,
      Value<String>? nameFood,
      Value<String>? image,
      Value<String>? area}) {
    return FoodsTableCompanion(
      idFood: idFood ?? this.idFood,
      category: category ?? this.category,
      nameFood: nameFood ?? this.nameFood,
      image: image ?? this.image,
      area: area ?? this.area,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idFood.present) {
      map['id_food'] = Variable<int>(idFood.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (nameFood.present) {
      map['name_food'] = Variable<String>(nameFood.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (area.present) {
      map['area'] = Variable<String>(area.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodsTableCompanion(')
          ..write('idFood: $idFood, ')
          ..write('category: $category, ')
          ..write('nameFood: $nameFood, ')
          ..write('image: $image, ')
          ..write('area: $area')
          ..write(')'))
        .toString();
  }
}

class $FoodsTableTable extends FoodsTable
    with TableInfo<$FoodsTableTable, FoodsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoodsTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idFoodMeta = const VerificationMeta('idFood');
  @override
  late final GeneratedColumn<int> idFood = GeneratedColumn<int>(
      'id_food', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  final VerificationMeta _nameFoodMeta = const VerificationMeta('nameFood');
  @override
  late final GeneratedColumn<String> nameFood = GeneratedColumn<String>(
      'name_food', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 256),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  final VerificationMeta _areaMeta = const VerificationMeta('area');
  @override
  late final GeneratedColumn<String> area = GeneratedColumn<String>(
      'area', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [idFood, category, nameFood, image, area];
  @override
  String get aliasedName => _alias ?? 'foods_table';
  @override
  String get actualTableName => 'foods_table';
  @override
  VerificationContext validateIntegrity(Insertable<FoodsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_food')) {
      context.handle(_idFoodMeta,
          idFood.isAcceptableOrUnknown(data['id_food']!, _idFoodMeta));
    } else if (isInserting) {
      context.missing(_idFoodMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('name_food')) {
      context.handle(_nameFoodMeta,
          nameFood.isAcceptableOrUnknown(data['name_food']!, _nameFoodMeta));
    } else if (isInserting) {
      context.missing(_nameFoodMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('area')) {
      context.handle(
          _areaMeta, area.isAcceptableOrUnknown(data['area']!, _areaMeta));
    } else if (isInserting) {
      context.missing(_areaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  FoodsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FoodsTableData(
      idFood: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id_food'])!,
      category: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      nameFood: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name_food'])!,
      image: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      area: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}area'])!,
    );
  }

  @override
  $FoodsTableTable createAlias(String alias) {
    return $FoodsTableTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $FoodsTableTable foodsTable = $FoodsTableTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [foodsTable];
}
