// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $FoldersTable extends Folders with TableInfo<$FoldersTable, Folder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoldersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _parentIdMeta =
      const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
      'parent_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isVisibleMeta =
      const VerificationMeta('isVisible');
  @override
  late final GeneratedColumn<bool> isVisible = GeneratedColumn<bool>(
      'is_visible', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_visible" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _sortOrderMeta =
      const VerificationMeta('sortOrder');
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
      'sort_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, parentId, name, icon, isVisible, sortOrder, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'folders';
  @override
  VerificationContext validateIntegrity(Insertable<Folder> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    }
    if (data.containsKey('is_visible')) {
      context.handle(_isVisibleMeta,
          isVisible.isAcceptableOrUnknown(data['is_visible']!, _isVisibleMeta));
    }
    if (data.containsKey('sort_order')) {
      context.handle(_sortOrderMeta,
          sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Folder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Folder(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon']),
      isVisible: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_visible'])!,
      sortOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort_order'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $FoldersTable createAlias(String alias) {
    return $FoldersTable(attachedDatabase, alias);
  }
}

class Folder extends DataClass implements Insertable<Folder> {
  final String id;
  final String? parentId;
  final String name;
  final String? icon;
  final bool isVisible;
  final int sortOrder;
  final DateTime createdAt;
  const Folder(
      {required this.id,
      this.parentId,
      required this.name,
      this.icon,
      required this.isVisible,
      required this.sortOrder,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<String>(parentId);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    map['is_visible'] = Variable<bool>(isVisible);
    map['sort_order'] = Variable<int>(sortOrder);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FoldersCompanion toCompanion(bool nullToAbsent) {
    return FoldersCompanion(
      id: Value(id),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      name: Value(name),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      isVisible: Value(isVisible),
      sortOrder: Value(sortOrder),
      createdAt: Value(createdAt),
    );
  }

  factory Folder.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Folder(
      id: serializer.fromJson<String>(json['id']),
      parentId: serializer.fromJson<String?>(json['parentId']),
      name: serializer.fromJson<String>(json['name']),
      icon: serializer.fromJson<String?>(json['icon']),
      isVisible: serializer.fromJson<bool>(json['isVisible']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'parentId': serializer.toJson<String?>(parentId),
      'name': serializer.toJson<String>(name),
      'icon': serializer.toJson<String?>(icon),
      'isVisible': serializer.toJson<bool>(isVisible),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Folder copyWith(
          {String? id,
          Value<String?> parentId = const Value.absent(),
          String? name,
          Value<String?> icon = const Value.absent(),
          bool? isVisible,
          int? sortOrder,
          DateTime? createdAt}) =>
      Folder(
        id: id ?? this.id,
        parentId: parentId.present ? parentId.value : this.parentId,
        name: name ?? this.name,
        icon: icon.present ? icon.value : this.icon,
        isVisible: isVisible ?? this.isVisible,
        sortOrder: sortOrder ?? this.sortOrder,
        createdAt: createdAt ?? this.createdAt,
      );
  Folder copyWithCompanion(FoldersCompanion data) {
    return Folder(
      id: data.id.present ? data.id.value : this.id,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      name: data.name.present ? data.name.value : this.name,
      icon: data.icon.present ? data.icon.value : this.icon,
      isVisible: data.isVisible.present ? data.isVisible.value : this.isVisible,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Folder(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('isVisible: $isVisible, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, parentId, name, icon, isVisible, sortOrder, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Folder &&
          other.id == this.id &&
          other.parentId == this.parentId &&
          other.name == this.name &&
          other.icon == this.icon &&
          other.isVisible == this.isVisible &&
          other.sortOrder == this.sortOrder &&
          other.createdAt == this.createdAt);
}

class FoldersCompanion extends UpdateCompanion<Folder> {
  final Value<String> id;
  final Value<String?> parentId;
  final Value<String> name;
  final Value<String?> icon;
  final Value<bool> isVisible;
  final Value<int> sortOrder;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const FoldersCompanion({
    this.id = const Value.absent(),
    this.parentId = const Value.absent(),
    this.name = const Value.absent(),
    this.icon = const Value.absent(),
    this.isVisible = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FoldersCompanion.insert({
    required String id,
    this.parentId = const Value.absent(),
    required String name,
    this.icon = const Value.absent(),
    this.isVisible = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<Folder> custom({
    Expression<String>? id,
    Expression<String>? parentId,
    Expression<String>? name,
    Expression<String>? icon,
    Expression<bool>? isVisible,
    Expression<int>? sortOrder,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentId != null) 'parent_id': parentId,
      if (name != null) 'name': name,
      if (icon != null) 'icon': icon,
      if (isVisible != null) 'is_visible': isVisible,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FoldersCompanion copyWith(
      {Value<String>? id,
      Value<String?>? parentId,
      Value<String>? name,
      Value<String?>? icon,
      Value<bool>? isVisible,
      Value<int>? sortOrder,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return FoldersCompanion(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      isVisible: isVisible ?? this.isVisible,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (isVisible.present) {
      map['is_visible'] = Variable<bool>(isVisible.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoldersCompanion(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('isVisible: $isVisible, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MapObjectsTable extends MapObjects
    with TableInfo<$MapObjectsTable, MapObject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MapObjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _folderIdMeta =
      const VerificationMeta('folderId');
  @override
  late final GeneratedColumn<String> folderId = GeneratedColumn<String>(
      'folder_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<MapObjectType, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<MapObjectType>($MapObjectsTable.$convertertype);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _styleJsonMeta =
      const VerificationMeta('styleJson');
  @override
  late final GeneratedColumn<String> styleJson = GeneratedColumn<String>(
      'style_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('{}'));
  static const VerificationMeta _coordinateJsonMeta =
      const VerificationMeta('coordinateJson');
  @override
  late final GeneratedColumn<String> coordinateJson = GeneratedColumn<String>(
      'coordinate_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _propertiesJsonMeta =
      const VerificationMeta('propertiesJson');
  @override
  late final GeneratedColumn<String> propertiesJson = GeneratedColumn<String>(
      'properties_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('{}'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        folderId,
        type,
        name,
        styleJson,
        coordinateJson,
        propertiesJson,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'map_objects';
  @override
  VerificationContext validateIntegrity(Insertable<MapObject> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('folder_id')) {
      context.handle(_folderIdMeta,
          folderId.isAcceptableOrUnknown(data['folder_id']!, _folderIdMeta));
    } else if (isInserting) {
      context.missing(_folderIdMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('style_json')) {
      context.handle(_styleJsonMeta,
          styleJson.isAcceptableOrUnknown(data['style_json']!, _styleJsonMeta));
    }
    if (data.containsKey('coordinate_json')) {
      context.handle(
          _coordinateJsonMeta,
          coordinateJson.isAcceptableOrUnknown(
              data['coordinate_json']!, _coordinateJsonMeta));
    } else if (isInserting) {
      context.missing(_coordinateJsonMeta);
    }
    if (data.containsKey('properties_json')) {
      context.handle(
          _propertiesJsonMeta,
          propertiesJson.isAcceptableOrUnknown(
              data['properties_json']!, _propertiesJsonMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MapObject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MapObject(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      folderId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}folder_id'])!,
      type: $MapObjectsTable.$convertertype.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      styleJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}style_json'])!,
      coordinateJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}coordinate_json'])!,
      propertiesJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}properties_json'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $MapObjectsTable createAlias(String alias) {
    return $MapObjectsTable(attachedDatabase, alias);
  }

  static TypeConverter<MapObjectType, String> $convertertype =
      const MapObjectTypeConverter();
}

class MapObject extends DataClass implements Insertable<MapObject> {
  final String id;
  final String folderId;
  final MapObjectType type;
  final String name;
  final String styleJson;
  final String coordinateJson;
  final String propertiesJson;
  final DateTime createdAt;
  final DateTime updatedAt;
  const MapObject(
      {required this.id,
      required this.folderId,
      required this.type,
      required this.name,
      required this.styleJson,
      required this.coordinateJson,
      required this.propertiesJson,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['folder_id'] = Variable<String>(folderId);
    {
      map['type'] =
          Variable<String>($MapObjectsTable.$convertertype.toSql(type));
    }
    map['name'] = Variable<String>(name);
    map['style_json'] = Variable<String>(styleJson);
    map['coordinate_json'] = Variable<String>(coordinateJson);
    map['properties_json'] = Variable<String>(propertiesJson);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MapObjectsCompanion toCompanion(bool nullToAbsent) {
    return MapObjectsCompanion(
      id: Value(id),
      folderId: Value(folderId),
      type: Value(type),
      name: Value(name),
      styleJson: Value(styleJson),
      coordinateJson: Value(coordinateJson),
      propertiesJson: Value(propertiesJson),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory MapObject.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MapObject(
      id: serializer.fromJson<String>(json['id']),
      folderId: serializer.fromJson<String>(json['folderId']),
      type: serializer.fromJson<MapObjectType>(json['type']),
      name: serializer.fromJson<String>(json['name']),
      styleJson: serializer.fromJson<String>(json['styleJson']),
      coordinateJson: serializer.fromJson<String>(json['coordinateJson']),
      propertiesJson: serializer.fromJson<String>(json['propertiesJson']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'folderId': serializer.toJson<String>(folderId),
      'type': serializer.toJson<MapObjectType>(type),
      'name': serializer.toJson<String>(name),
      'styleJson': serializer.toJson<String>(styleJson),
      'coordinateJson': serializer.toJson<String>(coordinateJson),
      'propertiesJson': serializer.toJson<String>(propertiesJson),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MapObject copyWith(
          {String? id,
          String? folderId,
          MapObjectType? type,
          String? name,
          String? styleJson,
          String? coordinateJson,
          String? propertiesJson,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      MapObject(
        id: id ?? this.id,
        folderId: folderId ?? this.folderId,
        type: type ?? this.type,
        name: name ?? this.name,
        styleJson: styleJson ?? this.styleJson,
        coordinateJson: coordinateJson ?? this.coordinateJson,
        propertiesJson: propertiesJson ?? this.propertiesJson,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  MapObject copyWithCompanion(MapObjectsCompanion data) {
    return MapObject(
      id: data.id.present ? data.id.value : this.id,
      folderId: data.folderId.present ? data.folderId.value : this.folderId,
      type: data.type.present ? data.type.value : this.type,
      name: data.name.present ? data.name.value : this.name,
      styleJson: data.styleJson.present ? data.styleJson.value : this.styleJson,
      coordinateJson: data.coordinateJson.present
          ? data.coordinateJson.value
          : this.coordinateJson,
      propertiesJson: data.propertiesJson.present
          ? data.propertiesJson.value
          : this.propertiesJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MapObject(')
          ..write('id: $id, ')
          ..write('folderId: $folderId, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('styleJson: $styleJson, ')
          ..write('coordinateJson: $coordinateJson, ')
          ..write('propertiesJson: $propertiesJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, folderId, type, name, styleJson,
      coordinateJson, propertiesJson, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MapObject &&
          other.id == this.id &&
          other.folderId == this.folderId &&
          other.type == this.type &&
          other.name == this.name &&
          other.styleJson == this.styleJson &&
          other.coordinateJson == this.coordinateJson &&
          other.propertiesJson == this.propertiesJson &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MapObjectsCompanion extends UpdateCompanion<MapObject> {
  final Value<String> id;
  final Value<String> folderId;
  final Value<MapObjectType> type;
  final Value<String> name;
  final Value<String> styleJson;
  final Value<String> coordinateJson;
  final Value<String> propertiesJson;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const MapObjectsCompanion({
    this.id = const Value.absent(),
    this.folderId = const Value.absent(),
    this.type = const Value.absent(),
    this.name = const Value.absent(),
    this.styleJson = const Value.absent(),
    this.coordinateJson = const Value.absent(),
    this.propertiesJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MapObjectsCompanion.insert({
    required String id,
    required String folderId,
    required MapObjectType type,
    required String name,
    this.styleJson = const Value.absent(),
    required String coordinateJson,
    this.propertiesJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        folderId = Value(folderId),
        type = Value(type),
        name = Value(name),
        coordinateJson = Value(coordinateJson);
  static Insertable<MapObject> custom({
    Expression<String>? id,
    Expression<String>? folderId,
    Expression<String>? type,
    Expression<String>? name,
    Expression<String>? styleJson,
    Expression<String>? coordinateJson,
    Expression<String>? propertiesJson,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (folderId != null) 'folder_id': folderId,
      if (type != null) 'type': type,
      if (name != null) 'name': name,
      if (styleJson != null) 'style_json': styleJson,
      if (coordinateJson != null) 'coordinate_json': coordinateJson,
      if (propertiesJson != null) 'properties_json': propertiesJson,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MapObjectsCompanion copyWith(
      {Value<String>? id,
      Value<String>? folderId,
      Value<MapObjectType>? type,
      Value<String>? name,
      Value<String>? styleJson,
      Value<String>? coordinateJson,
      Value<String>? propertiesJson,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return MapObjectsCompanion(
      id: id ?? this.id,
      folderId: folderId ?? this.folderId,
      type: type ?? this.type,
      name: name ?? this.name,
      styleJson: styleJson ?? this.styleJson,
      coordinateJson: coordinateJson ?? this.coordinateJson,
      propertiesJson: propertiesJson ?? this.propertiesJson,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (folderId.present) {
      map['folder_id'] = Variable<String>(folderId.value);
    }
    if (type.present) {
      map['type'] =
          Variable<String>($MapObjectsTable.$convertertype.toSql(type.value));
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (styleJson.present) {
      map['style_json'] = Variable<String>(styleJson.value);
    }
    if (coordinateJson.present) {
      map['coordinate_json'] = Variable<String>(coordinateJson.value);
    }
    if (propertiesJson.present) {
      map['properties_json'] = Variable<String>(propertiesJson.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MapObjectsCompanion(')
          ..write('id: $id, ')
          ..write('folderId: $folderId, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('styleJson: $styleJson, ')
          ..write('coordinateJson: $coordinateJson, ')
          ..write('propertiesJson: $propertiesJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TracksTable extends Tracks with TableInfo<$TracksTable, Track> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TracksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _folderIdMeta =
      const VerificationMeta('folderId');
  @override
  late final GeneratedColumn<String> folderId = GeneratedColumn<String>(
      'folder_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _styleJsonMeta =
      const VerificationMeta('styleJson');
  @override
  late final GeneratedColumn<String> styleJson = GeneratedColumn<String>(
      'style_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('{}'));
  static const VerificationMeta _totalDistanceMeta =
      const VerificationMeta('totalDistance');
  @override
  late final GeneratedColumn<double> totalDistance = GeneratedColumn<double>(
      'total_distance', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _maxElevationMeta =
      const VerificationMeta('maxElevation');
  @override
  late final GeneratedColumn<double> maxElevation = GeneratedColumn<double>(
      'max_elevation', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _minElevationMeta =
      const VerificationMeta('minElevation');
  @override
  late final GeneratedColumn<double> minElevation = GeneratedColumn<double>(
      'min_elevation', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _avgSpeedMeta =
      const VerificationMeta('avgSpeed');
  @override
  late final GeneratedColumn<double> avgSpeed = GeneratedColumn<double>(
      'avg_speed', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _durationSecMeta =
      const VerificationMeta('durationSec');
  @override
  late final GeneratedColumn<int> durationSec = GeneratedColumn<int>(
      'duration_sec', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        folderId,
        name,
        styleJson,
        totalDistance,
        maxElevation,
        minElevation,
        avgSpeed,
        durationSec,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tracks';
  @override
  VerificationContext validateIntegrity(Insertable<Track> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('folder_id')) {
      context.handle(_folderIdMeta,
          folderId.isAcceptableOrUnknown(data['folder_id']!, _folderIdMeta));
    } else if (isInserting) {
      context.missing(_folderIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('style_json')) {
      context.handle(_styleJsonMeta,
          styleJson.isAcceptableOrUnknown(data['style_json']!, _styleJsonMeta));
    }
    if (data.containsKey('total_distance')) {
      context.handle(
          _totalDistanceMeta,
          totalDistance.isAcceptableOrUnknown(
              data['total_distance']!, _totalDistanceMeta));
    }
    if (data.containsKey('max_elevation')) {
      context.handle(
          _maxElevationMeta,
          maxElevation.isAcceptableOrUnknown(
              data['max_elevation']!, _maxElevationMeta));
    }
    if (data.containsKey('min_elevation')) {
      context.handle(
          _minElevationMeta,
          minElevation.isAcceptableOrUnknown(
              data['min_elevation']!, _minElevationMeta));
    }
    if (data.containsKey('avg_speed')) {
      context.handle(_avgSpeedMeta,
          avgSpeed.isAcceptableOrUnknown(data['avg_speed']!, _avgSpeedMeta));
    }
    if (data.containsKey('duration_sec')) {
      context.handle(
          _durationSecMeta,
          durationSec.isAcceptableOrUnknown(
              data['duration_sec']!, _durationSecMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Track map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Track(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      folderId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}folder_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      styleJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}style_json'])!,
      totalDistance: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_distance'])!,
      maxElevation: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}max_elevation']),
      minElevation: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}min_elevation']),
      avgSpeed: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}avg_speed']),
      durationSec: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_sec'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $TracksTable createAlias(String alias) {
    return $TracksTable(attachedDatabase, alias);
  }
}

class Track extends DataClass implements Insertable<Track> {
  final String id;
  final String folderId;
  final String name;
  final String styleJson;
  final double totalDistance;
  final double? maxElevation;
  final double? minElevation;
  final double? avgSpeed;
  final int durationSec;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Track(
      {required this.id,
      required this.folderId,
      required this.name,
      required this.styleJson,
      required this.totalDistance,
      this.maxElevation,
      this.minElevation,
      this.avgSpeed,
      required this.durationSec,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['folder_id'] = Variable<String>(folderId);
    map['name'] = Variable<String>(name);
    map['style_json'] = Variable<String>(styleJson);
    map['total_distance'] = Variable<double>(totalDistance);
    if (!nullToAbsent || maxElevation != null) {
      map['max_elevation'] = Variable<double>(maxElevation);
    }
    if (!nullToAbsent || minElevation != null) {
      map['min_elevation'] = Variable<double>(minElevation);
    }
    if (!nullToAbsent || avgSpeed != null) {
      map['avg_speed'] = Variable<double>(avgSpeed);
    }
    map['duration_sec'] = Variable<int>(durationSec);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TracksCompanion toCompanion(bool nullToAbsent) {
    return TracksCompanion(
      id: Value(id),
      folderId: Value(folderId),
      name: Value(name),
      styleJson: Value(styleJson),
      totalDistance: Value(totalDistance),
      maxElevation: maxElevation == null && nullToAbsent
          ? const Value.absent()
          : Value(maxElevation),
      minElevation: minElevation == null && nullToAbsent
          ? const Value.absent()
          : Value(minElevation),
      avgSpeed: avgSpeed == null && nullToAbsent
          ? const Value.absent()
          : Value(avgSpeed),
      durationSec: Value(durationSec),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Track.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Track(
      id: serializer.fromJson<String>(json['id']),
      folderId: serializer.fromJson<String>(json['folderId']),
      name: serializer.fromJson<String>(json['name']),
      styleJson: serializer.fromJson<String>(json['styleJson']),
      totalDistance: serializer.fromJson<double>(json['totalDistance']),
      maxElevation: serializer.fromJson<double?>(json['maxElevation']),
      minElevation: serializer.fromJson<double?>(json['minElevation']),
      avgSpeed: serializer.fromJson<double?>(json['avgSpeed']),
      durationSec: serializer.fromJson<int>(json['durationSec']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'folderId': serializer.toJson<String>(folderId),
      'name': serializer.toJson<String>(name),
      'styleJson': serializer.toJson<String>(styleJson),
      'totalDistance': serializer.toJson<double>(totalDistance),
      'maxElevation': serializer.toJson<double?>(maxElevation),
      'minElevation': serializer.toJson<double?>(minElevation),
      'avgSpeed': serializer.toJson<double?>(avgSpeed),
      'durationSec': serializer.toJson<int>(durationSec),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Track copyWith(
          {String? id,
          String? folderId,
          String? name,
          String? styleJson,
          double? totalDistance,
          Value<double?> maxElevation = const Value.absent(),
          Value<double?> minElevation = const Value.absent(),
          Value<double?> avgSpeed = const Value.absent(),
          int? durationSec,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Track(
        id: id ?? this.id,
        folderId: folderId ?? this.folderId,
        name: name ?? this.name,
        styleJson: styleJson ?? this.styleJson,
        totalDistance: totalDistance ?? this.totalDistance,
        maxElevation:
            maxElevation.present ? maxElevation.value : this.maxElevation,
        minElevation:
            minElevation.present ? minElevation.value : this.minElevation,
        avgSpeed: avgSpeed.present ? avgSpeed.value : this.avgSpeed,
        durationSec: durationSec ?? this.durationSec,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Track copyWithCompanion(TracksCompanion data) {
    return Track(
      id: data.id.present ? data.id.value : this.id,
      folderId: data.folderId.present ? data.folderId.value : this.folderId,
      name: data.name.present ? data.name.value : this.name,
      styleJson: data.styleJson.present ? data.styleJson.value : this.styleJson,
      totalDistance: data.totalDistance.present
          ? data.totalDistance.value
          : this.totalDistance,
      maxElevation: data.maxElevation.present
          ? data.maxElevation.value
          : this.maxElevation,
      minElevation: data.minElevation.present
          ? data.minElevation.value
          : this.minElevation,
      avgSpeed: data.avgSpeed.present ? data.avgSpeed.value : this.avgSpeed,
      durationSec:
          data.durationSec.present ? data.durationSec.value : this.durationSec,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Track(')
          ..write('id: $id, ')
          ..write('folderId: $folderId, ')
          ..write('name: $name, ')
          ..write('styleJson: $styleJson, ')
          ..write('totalDistance: $totalDistance, ')
          ..write('maxElevation: $maxElevation, ')
          ..write('minElevation: $minElevation, ')
          ..write('avgSpeed: $avgSpeed, ')
          ..write('durationSec: $durationSec, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, folderId, name, styleJson, totalDistance,
      maxElevation, minElevation, avgSpeed, durationSec, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Track &&
          other.id == this.id &&
          other.folderId == this.folderId &&
          other.name == this.name &&
          other.styleJson == this.styleJson &&
          other.totalDistance == this.totalDistance &&
          other.maxElevation == this.maxElevation &&
          other.minElevation == this.minElevation &&
          other.avgSpeed == this.avgSpeed &&
          other.durationSec == this.durationSec &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TracksCompanion extends UpdateCompanion<Track> {
  final Value<String> id;
  final Value<String> folderId;
  final Value<String> name;
  final Value<String> styleJson;
  final Value<double> totalDistance;
  final Value<double?> maxElevation;
  final Value<double?> minElevation;
  final Value<double?> avgSpeed;
  final Value<int> durationSec;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const TracksCompanion({
    this.id = const Value.absent(),
    this.folderId = const Value.absent(),
    this.name = const Value.absent(),
    this.styleJson = const Value.absent(),
    this.totalDistance = const Value.absent(),
    this.maxElevation = const Value.absent(),
    this.minElevation = const Value.absent(),
    this.avgSpeed = const Value.absent(),
    this.durationSec = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TracksCompanion.insert({
    required String id,
    required String folderId,
    required String name,
    this.styleJson = const Value.absent(),
    this.totalDistance = const Value.absent(),
    this.maxElevation = const Value.absent(),
    this.minElevation = const Value.absent(),
    this.avgSpeed = const Value.absent(),
    this.durationSec = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        folderId = Value(folderId),
        name = Value(name);
  static Insertable<Track> custom({
    Expression<String>? id,
    Expression<String>? folderId,
    Expression<String>? name,
    Expression<String>? styleJson,
    Expression<double>? totalDistance,
    Expression<double>? maxElevation,
    Expression<double>? minElevation,
    Expression<double>? avgSpeed,
    Expression<int>? durationSec,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (folderId != null) 'folder_id': folderId,
      if (name != null) 'name': name,
      if (styleJson != null) 'style_json': styleJson,
      if (totalDistance != null) 'total_distance': totalDistance,
      if (maxElevation != null) 'max_elevation': maxElevation,
      if (minElevation != null) 'min_elevation': minElevation,
      if (avgSpeed != null) 'avg_speed': avgSpeed,
      if (durationSec != null) 'duration_sec': durationSec,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TracksCompanion copyWith(
      {Value<String>? id,
      Value<String>? folderId,
      Value<String>? name,
      Value<String>? styleJson,
      Value<double>? totalDistance,
      Value<double?>? maxElevation,
      Value<double?>? minElevation,
      Value<double?>? avgSpeed,
      Value<int>? durationSec,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return TracksCompanion(
      id: id ?? this.id,
      folderId: folderId ?? this.folderId,
      name: name ?? this.name,
      styleJson: styleJson ?? this.styleJson,
      totalDistance: totalDistance ?? this.totalDistance,
      maxElevation: maxElevation ?? this.maxElevation,
      minElevation: minElevation ?? this.minElevation,
      avgSpeed: avgSpeed ?? this.avgSpeed,
      durationSec: durationSec ?? this.durationSec,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (folderId.present) {
      map['folder_id'] = Variable<String>(folderId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (styleJson.present) {
      map['style_json'] = Variable<String>(styleJson.value);
    }
    if (totalDistance.present) {
      map['total_distance'] = Variable<double>(totalDistance.value);
    }
    if (maxElevation.present) {
      map['max_elevation'] = Variable<double>(maxElevation.value);
    }
    if (minElevation.present) {
      map['min_elevation'] = Variable<double>(minElevation.value);
    }
    if (avgSpeed.present) {
      map['avg_speed'] = Variable<double>(avgSpeed.value);
    }
    if (durationSec.present) {
      map['duration_sec'] = Variable<int>(durationSec.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TracksCompanion(')
          ..write('id: $id, ')
          ..write('folderId: $folderId, ')
          ..write('name: $name, ')
          ..write('styleJson: $styleJson, ')
          ..write('totalDistance: $totalDistance, ')
          ..write('maxElevation: $maxElevation, ')
          ..write('minElevation: $minElevation, ')
          ..write('avgSpeed: $avgSpeed, ')
          ..write('durationSec: $durationSec, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TrackPointsTable extends TrackPoints
    with TableInfo<$TrackPointsTable, TrackPoint> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrackPointsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _trackIdMeta =
      const VerificationMeta('trackId');
  @override
  late final GeneratedColumn<String> trackId = GeneratedColumn<String>(
      'track_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'longitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _elevationMeta =
      const VerificationMeta('elevation');
  @override
  late final GeneratedColumn<double> elevation = GeneratedColumn<double>(
      'elevation', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _accuracyMeta =
      const VerificationMeta('accuracy');
  @override
  late final GeneratedColumn<double> accuracy = GeneratedColumn<double>(
      'accuracy', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _speedMeta = const VerificationMeta('speed');
  @override
  late final GeneratedColumn<double> speed = GeneratedColumn<double>(
      'speed', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, trackId, latitude, longitude, elevation, timestamp, accuracy, speed];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'track_points';
  @override
  VerificationContext validateIntegrity(Insertable<TrackPoint> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('track_id')) {
      context.handle(_trackIdMeta,
          trackId.isAcceptableOrUnknown(data['track_id']!, _trackIdMeta));
    } else if (isInserting) {
      context.missing(_trackIdMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('elevation')) {
      context.handle(_elevationMeta,
          elevation.isAcceptableOrUnknown(data['elevation']!, _elevationMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('accuracy')) {
      context.handle(_accuracyMeta,
          accuracy.isAcceptableOrUnknown(data['accuracy']!, _accuracyMeta));
    }
    if (data.containsKey('speed')) {
      context.handle(
          _speedMeta, speed.isAcceptableOrUnknown(data['speed']!, _speedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrackPoint map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrackPoint(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      trackId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}track_id'])!,
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}latitude'])!,
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}longitude'])!,
      elevation: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}elevation']),
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      accuracy: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}accuracy']),
      speed: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}speed']),
    );
  }

  @override
  $TrackPointsTable createAlias(String alias) {
    return $TrackPointsTable(attachedDatabase, alias);
  }
}

class TrackPoint extends DataClass implements Insertable<TrackPoint> {
  final String id;
  final String trackId;
  final double latitude;
  final double longitude;
  final double? elevation;
  final DateTime timestamp;
  final double? accuracy;
  final double? speed;
  const TrackPoint(
      {required this.id,
      required this.trackId,
      required this.latitude,
      required this.longitude,
      this.elevation,
      required this.timestamp,
      this.accuracy,
      this.speed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['track_id'] = Variable<String>(trackId);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    if (!nullToAbsent || elevation != null) {
      map['elevation'] = Variable<double>(elevation);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    if (!nullToAbsent || accuracy != null) {
      map['accuracy'] = Variable<double>(accuracy);
    }
    if (!nullToAbsent || speed != null) {
      map['speed'] = Variable<double>(speed);
    }
    return map;
  }

  TrackPointsCompanion toCompanion(bool nullToAbsent) {
    return TrackPointsCompanion(
      id: Value(id),
      trackId: Value(trackId),
      latitude: Value(latitude),
      longitude: Value(longitude),
      elevation: elevation == null && nullToAbsent
          ? const Value.absent()
          : Value(elevation),
      timestamp: Value(timestamp),
      accuracy: accuracy == null && nullToAbsent
          ? const Value.absent()
          : Value(accuracy),
      speed:
          speed == null && nullToAbsent ? const Value.absent() : Value(speed),
    );
  }

  factory TrackPoint.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrackPoint(
      id: serializer.fromJson<String>(json['id']),
      trackId: serializer.fromJson<String>(json['trackId']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      elevation: serializer.fromJson<double?>(json['elevation']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      accuracy: serializer.fromJson<double?>(json['accuracy']),
      speed: serializer.fromJson<double?>(json['speed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'trackId': serializer.toJson<String>(trackId),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'elevation': serializer.toJson<double?>(elevation),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'accuracy': serializer.toJson<double?>(accuracy),
      'speed': serializer.toJson<double?>(speed),
    };
  }

  TrackPoint copyWith(
          {String? id,
          String? trackId,
          double? latitude,
          double? longitude,
          Value<double?> elevation = const Value.absent(),
          DateTime? timestamp,
          Value<double?> accuracy = const Value.absent(),
          Value<double?> speed = const Value.absent()}) =>
      TrackPoint(
        id: id ?? this.id,
        trackId: trackId ?? this.trackId,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        elevation: elevation.present ? elevation.value : this.elevation,
        timestamp: timestamp ?? this.timestamp,
        accuracy: accuracy.present ? accuracy.value : this.accuracy,
        speed: speed.present ? speed.value : this.speed,
      );
  TrackPoint copyWithCompanion(TrackPointsCompanion data) {
    return TrackPoint(
      id: data.id.present ? data.id.value : this.id,
      trackId: data.trackId.present ? data.trackId.value : this.trackId,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      elevation: data.elevation.present ? data.elevation.value : this.elevation,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      accuracy: data.accuracy.present ? data.accuracy.value : this.accuracy,
      speed: data.speed.present ? data.speed.value : this.speed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrackPoint(')
          ..write('id: $id, ')
          ..write('trackId: $trackId, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('elevation: $elevation, ')
          ..write('timestamp: $timestamp, ')
          ..write('accuracy: $accuracy, ')
          ..write('speed: $speed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, trackId, latitude, longitude, elevation, timestamp, accuracy, speed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrackPoint &&
          other.id == this.id &&
          other.trackId == this.trackId &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.elevation == this.elevation &&
          other.timestamp == this.timestamp &&
          other.accuracy == this.accuracy &&
          other.speed == this.speed);
}

class TrackPointsCompanion extends UpdateCompanion<TrackPoint> {
  final Value<String> id;
  final Value<String> trackId;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<double?> elevation;
  final Value<DateTime> timestamp;
  final Value<double?> accuracy;
  final Value<double?> speed;
  final Value<int> rowid;
  const TrackPointsCompanion({
    this.id = const Value.absent(),
    this.trackId = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.elevation = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.accuracy = const Value.absent(),
    this.speed = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TrackPointsCompanion.insert({
    required String id,
    required String trackId,
    required double latitude,
    required double longitude,
    this.elevation = const Value.absent(),
    required DateTime timestamp,
    this.accuracy = const Value.absent(),
    this.speed = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        trackId = Value(trackId),
        latitude = Value(latitude),
        longitude = Value(longitude),
        timestamp = Value(timestamp);
  static Insertable<TrackPoint> custom({
    Expression<String>? id,
    Expression<String>? trackId,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<double>? elevation,
    Expression<DateTime>? timestamp,
    Expression<double>? accuracy,
    Expression<double>? speed,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (trackId != null) 'track_id': trackId,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (elevation != null) 'elevation': elevation,
      if (timestamp != null) 'timestamp': timestamp,
      if (accuracy != null) 'accuracy': accuracy,
      if (speed != null) 'speed': speed,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TrackPointsCompanion copyWith(
      {Value<String>? id,
      Value<String>? trackId,
      Value<double>? latitude,
      Value<double>? longitude,
      Value<double?>? elevation,
      Value<DateTime>? timestamp,
      Value<double?>? accuracy,
      Value<double?>? speed,
      Value<int>? rowid}) {
    return TrackPointsCompanion(
      id: id ?? this.id,
      trackId: trackId ?? this.trackId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      elevation: elevation ?? this.elevation,
      timestamp: timestamp ?? this.timestamp,
      accuracy: accuracy ?? this.accuracy,
      speed: speed ?? this.speed,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (trackId.present) {
      map['track_id'] = Variable<String>(trackId.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (elevation.present) {
      map['elevation'] = Variable<double>(elevation.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (accuracy.present) {
      map['accuracy'] = Variable<double>(accuracy.value);
    }
    if (speed.present) {
      map['speed'] = Variable<double>(speed.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrackPointsCompanion(')
          ..write('id: $id, ')
          ..write('trackId: $trackId, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('elevation: $elevation, ')
          ..write('timestamp: $timestamp, ')
          ..write('accuracy: $accuracy, ')
          ..write('speed: $speed, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OfflinePackagesTable extends OfflinePackages
    with TableInfo<$OfflinePackagesTable, OfflinePackage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OfflinePackagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sourceIdMeta =
      const VerificationMeta('sourceId');
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
      'source_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _minLatMeta = const VerificationMeta('minLat');
  @override
  late final GeneratedColumn<double> minLat = GeneratedColumn<double>(
      'min_lat', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _maxLatMeta = const VerificationMeta('maxLat');
  @override
  late final GeneratedColumn<double> maxLat = GeneratedColumn<double>(
      'max_lat', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _minLonMeta = const VerificationMeta('minLon');
  @override
  late final GeneratedColumn<double> minLon = GeneratedColumn<double>(
      'min_lon', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _maxLonMeta = const VerificationMeta('maxLon');
  @override
  late final GeneratedColumn<double> maxLon = GeneratedColumn<double>(
      'max_lon', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _minZoomMeta =
      const VerificationMeta('minZoom');
  @override
  late final GeneratedColumn<int> minZoom = GeneratedColumn<int>(
      'min_zoom', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _maxZoomMeta =
      const VerificationMeta('maxZoom');
  @override
  late final GeneratedColumn<int> maxZoom = GeneratedColumn<int>(
      'max_zoom', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _tileCountMeta =
      const VerificationMeta('tileCount');
  @override
  late final GeneratedColumn<int> tileCount = GeneratedColumn<int>(
      'tile_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _filePathMeta =
      const VerificationMeta('filePath');
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
      'file_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fileSizeMeta =
      const VerificationMeta('fileSize');
  @override
  late final GeneratedColumn<int> fileSize = GeneratedColumn<int>(
      'file_size', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        sourceId,
        minLat,
        maxLat,
        minLon,
        maxLon,
        minZoom,
        maxZoom,
        tileCount,
        filePath,
        fileSize,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'offline_packages';
  @override
  VerificationContext validateIntegrity(Insertable<OfflinePackage> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('source_id')) {
      context.handle(_sourceIdMeta,
          sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta));
    } else if (isInserting) {
      context.missing(_sourceIdMeta);
    }
    if (data.containsKey('min_lat')) {
      context.handle(_minLatMeta,
          minLat.isAcceptableOrUnknown(data['min_lat']!, _minLatMeta));
    } else if (isInserting) {
      context.missing(_minLatMeta);
    }
    if (data.containsKey('max_lat')) {
      context.handle(_maxLatMeta,
          maxLat.isAcceptableOrUnknown(data['max_lat']!, _maxLatMeta));
    } else if (isInserting) {
      context.missing(_maxLatMeta);
    }
    if (data.containsKey('min_lon')) {
      context.handle(_minLonMeta,
          minLon.isAcceptableOrUnknown(data['min_lon']!, _minLonMeta));
    } else if (isInserting) {
      context.missing(_minLonMeta);
    }
    if (data.containsKey('max_lon')) {
      context.handle(_maxLonMeta,
          maxLon.isAcceptableOrUnknown(data['max_lon']!, _maxLonMeta));
    } else if (isInserting) {
      context.missing(_maxLonMeta);
    }
    if (data.containsKey('min_zoom')) {
      context.handle(_minZoomMeta,
          minZoom.isAcceptableOrUnknown(data['min_zoom']!, _minZoomMeta));
    } else if (isInserting) {
      context.missing(_minZoomMeta);
    }
    if (data.containsKey('max_zoom')) {
      context.handle(_maxZoomMeta,
          maxZoom.isAcceptableOrUnknown(data['max_zoom']!, _maxZoomMeta));
    } else if (isInserting) {
      context.missing(_maxZoomMeta);
    }
    if (data.containsKey('tile_count')) {
      context.handle(_tileCountMeta,
          tileCount.isAcceptableOrUnknown(data['tile_count']!, _tileCountMeta));
    }
    if (data.containsKey('file_path')) {
      context.handle(_filePathMeta,
          filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta));
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('file_size')) {
      context.handle(_fileSizeMeta,
          fileSize.isAcceptableOrUnknown(data['file_size']!, _fileSizeMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OfflinePackage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OfflinePackage(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      sourceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_id'])!,
      minLat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}min_lat'])!,
      maxLat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}max_lat'])!,
      minLon: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}min_lon'])!,
      maxLon: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}max_lon'])!,
      minZoom: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}min_zoom'])!,
      maxZoom: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_zoom'])!,
      tileCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tile_count'])!,
      filePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_path'])!,
      fileSize: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}file_size'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $OfflinePackagesTable createAlias(String alias) {
    return $OfflinePackagesTable(attachedDatabase, alias);
  }
}

class OfflinePackage extends DataClass implements Insertable<OfflinePackage> {
  final String id;
  final String name;
  final String sourceId;
  final double minLat;
  final double maxLat;
  final double minLon;
  final double maxLon;
  final int minZoom;
  final int maxZoom;
  final int tileCount;
  final String filePath;
  final int fileSize;
  final DateTime createdAt;
  const OfflinePackage(
      {required this.id,
      required this.name,
      required this.sourceId,
      required this.minLat,
      required this.maxLat,
      required this.minLon,
      required this.maxLon,
      required this.minZoom,
      required this.maxZoom,
      required this.tileCount,
      required this.filePath,
      required this.fileSize,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['source_id'] = Variable<String>(sourceId);
    map['min_lat'] = Variable<double>(minLat);
    map['max_lat'] = Variable<double>(maxLat);
    map['min_lon'] = Variable<double>(minLon);
    map['max_lon'] = Variable<double>(maxLon);
    map['min_zoom'] = Variable<int>(minZoom);
    map['max_zoom'] = Variable<int>(maxZoom);
    map['tile_count'] = Variable<int>(tileCount);
    map['file_path'] = Variable<String>(filePath);
    map['file_size'] = Variable<int>(fileSize);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  OfflinePackagesCompanion toCompanion(bool nullToAbsent) {
    return OfflinePackagesCompanion(
      id: Value(id),
      name: Value(name),
      sourceId: Value(sourceId),
      minLat: Value(minLat),
      maxLat: Value(maxLat),
      minLon: Value(minLon),
      maxLon: Value(maxLon),
      minZoom: Value(minZoom),
      maxZoom: Value(maxZoom),
      tileCount: Value(tileCount),
      filePath: Value(filePath),
      fileSize: Value(fileSize),
      createdAt: Value(createdAt),
    );
  }

  factory OfflinePackage.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OfflinePackage(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      sourceId: serializer.fromJson<String>(json['sourceId']),
      minLat: serializer.fromJson<double>(json['minLat']),
      maxLat: serializer.fromJson<double>(json['maxLat']),
      minLon: serializer.fromJson<double>(json['minLon']),
      maxLon: serializer.fromJson<double>(json['maxLon']),
      minZoom: serializer.fromJson<int>(json['minZoom']),
      maxZoom: serializer.fromJson<int>(json['maxZoom']),
      tileCount: serializer.fromJson<int>(json['tileCount']),
      filePath: serializer.fromJson<String>(json['filePath']),
      fileSize: serializer.fromJson<int>(json['fileSize']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'sourceId': serializer.toJson<String>(sourceId),
      'minLat': serializer.toJson<double>(minLat),
      'maxLat': serializer.toJson<double>(maxLat),
      'minLon': serializer.toJson<double>(minLon),
      'maxLon': serializer.toJson<double>(maxLon),
      'minZoom': serializer.toJson<int>(minZoom),
      'maxZoom': serializer.toJson<int>(maxZoom),
      'tileCount': serializer.toJson<int>(tileCount),
      'filePath': serializer.toJson<String>(filePath),
      'fileSize': serializer.toJson<int>(fileSize),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  OfflinePackage copyWith(
          {String? id,
          String? name,
          String? sourceId,
          double? minLat,
          double? maxLat,
          double? minLon,
          double? maxLon,
          int? minZoom,
          int? maxZoom,
          int? tileCount,
          String? filePath,
          int? fileSize,
          DateTime? createdAt}) =>
      OfflinePackage(
        id: id ?? this.id,
        name: name ?? this.name,
        sourceId: sourceId ?? this.sourceId,
        minLat: minLat ?? this.minLat,
        maxLat: maxLat ?? this.maxLat,
        minLon: minLon ?? this.minLon,
        maxLon: maxLon ?? this.maxLon,
        minZoom: minZoom ?? this.minZoom,
        maxZoom: maxZoom ?? this.maxZoom,
        tileCount: tileCount ?? this.tileCount,
        filePath: filePath ?? this.filePath,
        fileSize: fileSize ?? this.fileSize,
        createdAt: createdAt ?? this.createdAt,
      );
  OfflinePackage copyWithCompanion(OfflinePackagesCompanion data) {
    return OfflinePackage(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      minLat: data.minLat.present ? data.minLat.value : this.minLat,
      maxLat: data.maxLat.present ? data.maxLat.value : this.maxLat,
      minLon: data.minLon.present ? data.minLon.value : this.minLon,
      maxLon: data.maxLon.present ? data.maxLon.value : this.maxLon,
      minZoom: data.minZoom.present ? data.minZoom.value : this.minZoom,
      maxZoom: data.maxZoom.present ? data.maxZoom.value : this.maxZoom,
      tileCount: data.tileCount.present ? data.tileCount.value : this.tileCount,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      fileSize: data.fileSize.present ? data.fileSize.value : this.fileSize,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OfflinePackage(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sourceId: $sourceId, ')
          ..write('minLat: $minLat, ')
          ..write('maxLat: $maxLat, ')
          ..write('minLon: $minLon, ')
          ..write('maxLon: $maxLon, ')
          ..write('minZoom: $minZoom, ')
          ..write('maxZoom: $maxZoom, ')
          ..write('tileCount: $tileCount, ')
          ..write('filePath: $filePath, ')
          ..write('fileSize: $fileSize, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, sourceId, minLat, maxLat, minLon,
      maxLon, minZoom, maxZoom, tileCount, filePath, fileSize, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OfflinePackage &&
          other.id == this.id &&
          other.name == this.name &&
          other.sourceId == this.sourceId &&
          other.minLat == this.minLat &&
          other.maxLat == this.maxLat &&
          other.minLon == this.minLon &&
          other.maxLon == this.maxLon &&
          other.minZoom == this.minZoom &&
          other.maxZoom == this.maxZoom &&
          other.tileCount == this.tileCount &&
          other.filePath == this.filePath &&
          other.fileSize == this.fileSize &&
          other.createdAt == this.createdAt);
}

class OfflinePackagesCompanion extends UpdateCompanion<OfflinePackage> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> sourceId;
  final Value<double> minLat;
  final Value<double> maxLat;
  final Value<double> minLon;
  final Value<double> maxLon;
  final Value<int> minZoom;
  final Value<int> maxZoom;
  final Value<int> tileCount;
  final Value<String> filePath;
  final Value<int> fileSize;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const OfflinePackagesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.minLat = const Value.absent(),
    this.maxLat = const Value.absent(),
    this.minLon = const Value.absent(),
    this.maxLon = const Value.absent(),
    this.minZoom = const Value.absent(),
    this.maxZoom = const Value.absent(),
    this.tileCount = const Value.absent(),
    this.filePath = const Value.absent(),
    this.fileSize = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OfflinePackagesCompanion.insert({
    required String id,
    required String name,
    required String sourceId,
    required double minLat,
    required double maxLat,
    required double minLon,
    required double maxLon,
    required int minZoom,
    required int maxZoom,
    this.tileCount = const Value.absent(),
    required String filePath,
    this.fileSize = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        sourceId = Value(sourceId),
        minLat = Value(minLat),
        maxLat = Value(maxLat),
        minLon = Value(minLon),
        maxLon = Value(maxLon),
        minZoom = Value(minZoom),
        maxZoom = Value(maxZoom),
        filePath = Value(filePath);
  static Insertable<OfflinePackage> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? sourceId,
    Expression<double>? minLat,
    Expression<double>? maxLat,
    Expression<double>? minLon,
    Expression<double>? maxLon,
    Expression<int>? minZoom,
    Expression<int>? maxZoom,
    Expression<int>? tileCount,
    Expression<String>? filePath,
    Expression<int>? fileSize,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (sourceId != null) 'source_id': sourceId,
      if (minLat != null) 'min_lat': minLat,
      if (maxLat != null) 'max_lat': maxLat,
      if (minLon != null) 'min_lon': minLon,
      if (maxLon != null) 'max_lon': maxLon,
      if (minZoom != null) 'min_zoom': minZoom,
      if (maxZoom != null) 'max_zoom': maxZoom,
      if (tileCount != null) 'tile_count': tileCount,
      if (filePath != null) 'file_path': filePath,
      if (fileSize != null) 'file_size': fileSize,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OfflinePackagesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? sourceId,
      Value<double>? minLat,
      Value<double>? maxLat,
      Value<double>? minLon,
      Value<double>? maxLon,
      Value<int>? minZoom,
      Value<int>? maxZoom,
      Value<int>? tileCount,
      Value<String>? filePath,
      Value<int>? fileSize,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return OfflinePackagesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      sourceId: sourceId ?? this.sourceId,
      minLat: minLat ?? this.minLat,
      maxLat: maxLat ?? this.maxLat,
      minLon: minLon ?? this.minLon,
      maxLon: maxLon ?? this.maxLon,
      minZoom: minZoom ?? this.minZoom,
      maxZoom: maxZoom ?? this.maxZoom,
      tileCount: tileCount ?? this.tileCount,
      filePath: filePath ?? this.filePath,
      fileSize: fileSize ?? this.fileSize,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (minLat.present) {
      map['min_lat'] = Variable<double>(minLat.value);
    }
    if (maxLat.present) {
      map['max_lat'] = Variable<double>(maxLat.value);
    }
    if (minLon.present) {
      map['min_lon'] = Variable<double>(minLon.value);
    }
    if (maxLon.present) {
      map['max_lon'] = Variable<double>(maxLon.value);
    }
    if (minZoom.present) {
      map['min_zoom'] = Variable<int>(minZoom.value);
    }
    if (maxZoom.present) {
      map['max_zoom'] = Variable<int>(maxZoom.value);
    }
    if (tileCount.present) {
      map['tile_count'] = Variable<int>(tileCount.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (fileSize.present) {
      map['file_size'] = Variable<int>(fileSize.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OfflinePackagesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sourceId: $sourceId, ')
          ..write('minLat: $minLat, ')
          ..write('maxLat: $maxLat, ')
          ..write('minLon: $minLon, ')
          ..write('maxLon: $maxLon, ')
          ..write('minZoom: $minZoom, ')
          ..write('maxZoom: $maxZoom, ')
          ..write('tileCount: $tileCount, ')
          ..write('filePath: $filePath, ')
          ..write('fileSize: $fileSize, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CustomTileSourcesTable extends CustomTileSources
    with TableInfo<$CustomTileSourcesTable, CustomTileSource> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomTileSourcesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlTemplateMeta =
      const VerificationMeta('urlTemplate');
  @override
  late final GeneratedColumn<String> urlTemplate = GeneratedColumn<String>(
      'url_template', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _attributionMeta =
      const VerificationMeta('attribution');
  @override
  late final GeneratedColumn<String> attribution = GeneratedColumn<String>(
      'attribution', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _subdomainsMeta =
      const VerificationMeta('subdomains');
  @override
  late final GeneratedColumn<String> subdomains = GeneratedColumn<String>(
      'subdomains', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('abc'));
  static const VerificationMeta _maxZoomMeta =
      const VerificationMeta('maxZoom');
  @override
  late final GeneratedColumn<int> maxZoom = GeneratedColumn<int>(
      'max_zoom', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(18));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _sortOrderMeta =
      const VerificationMeta('sortOrder');
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
      'sort_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        urlTemplate,
        attribution,
        subdomains,
        maxZoom,
        isActive,
        sortOrder
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'custom_tile_sources';
  @override
  VerificationContext validateIntegrity(Insertable<CustomTileSource> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('url_template')) {
      context.handle(
          _urlTemplateMeta,
          urlTemplate.isAcceptableOrUnknown(
              data['url_template']!, _urlTemplateMeta));
    } else if (isInserting) {
      context.missing(_urlTemplateMeta);
    }
    if (data.containsKey('attribution')) {
      context.handle(
          _attributionMeta,
          attribution.isAcceptableOrUnknown(
              data['attribution']!, _attributionMeta));
    }
    if (data.containsKey('subdomains')) {
      context.handle(
          _subdomainsMeta,
          subdomains.isAcceptableOrUnknown(
              data['subdomains']!, _subdomainsMeta));
    }
    if (data.containsKey('max_zoom')) {
      context.handle(_maxZoomMeta,
          maxZoom.isAcceptableOrUnknown(data['max_zoom']!, _maxZoomMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('sort_order')) {
      context.handle(_sortOrderMeta,
          sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomTileSource map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomTileSource(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      urlTemplate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_template'])!,
      attribution: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}attribution']),
      subdomains: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subdomains'])!,
      maxZoom: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_zoom'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      sortOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort_order'])!,
    );
  }

  @override
  $CustomTileSourcesTable createAlias(String alias) {
    return $CustomTileSourcesTable(attachedDatabase, alias);
  }
}

class CustomTileSource extends DataClass
    implements Insertable<CustomTileSource> {
  final String id;
  final String name;
  final String urlTemplate;
  final String? attribution;
  final String subdomains;
  final int maxZoom;
  final bool isActive;
  final int sortOrder;
  const CustomTileSource(
      {required this.id,
      required this.name,
      required this.urlTemplate,
      this.attribution,
      required this.subdomains,
      required this.maxZoom,
      required this.isActive,
      required this.sortOrder});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['url_template'] = Variable<String>(urlTemplate);
    if (!nullToAbsent || attribution != null) {
      map['attribution'] = Variable<String>(attribution);
    }
    map['subdomains'] = Variable<String>(subdomains);
    map['max_zoom'] = Variable<int>(maxZoom);
    map['is_active'] = Variable<bool>(isActive);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  CustomTileSourcesCompanion toCompanion(bool nullToAbsent) {
    return CustomTileSourcesCompanion(
      id: Value(id),
      name: Value(name),
      urlTemplate: Value(urlTemplate),
      attribution: attribution == null && nullToAbsent
          ? const Value.absent()
          : Value(attribution),
      subdomains: Value(subdomains),
      maxZoom: Value(maxZoom),
      isActive: Value(isActive),
      sortOrder: Value(sortOrder),
    );
  }

  factory CustomTileSource.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomTileSource(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      urlTemplate: serializer.fromJson<String>(json['urlTemplate']),
      attribution: serializer.fromJson<String?>(json['attribution']),
      subdomains: serializer.fromJson<String>(json['subdomains']),
      maxZoom: serializer.fromJson<int>(json['maxZoom']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'urlTemplate': serializer.toJson<String>(urlTemplate),
      'attribution': serializer.toJson<String?>(attribution),
      'subdomains': serializer.toJson<String>(subdomains),
      'maxZoom': serializer.toJson<int>(maxZoom),
      'isActive': serializer.toJson<bool>(isActive),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  CustomTileSource copyWith(
          {String? id,
          String? name,
          String? urlTemplate,
          Value<String?> attribution = const Value.absent(),
          String? subdomains,
          int? maxZoom,
          bool? isActive,
          int? sortOrder}) =>
      CustomTileSource(
        id: id ?? this.id,
        name: name ?? this.name,
        urlTemplate: urlTemplate ?? this.urlTemplate,
        attribution: attribution.present ? attribution.value : this.attribution,
        subdomains: subdomains ?? this.subdomains,
        maxZoom: maxZoom ?? this.maxZoom,
        isActive: isActive ?? this.isActive,
        sortOrder: sortOrder ?? this.sortOrder,
      );
  CustomTileSource copyWithCompanion(CustomTileSourcesCompanion data) {
    return CustomTileSource(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      urlTemplate:
          data.urlTemplate.present ? data.urlTemplate.value : this.urlTemplate,
      attribution:
          data.attribution.present ? data.attribution.value : this.attribution,
      subdomains:
          data.subdomains.present ? data.subdomains.value : this.subdomains,
      maxZoom: data.maxZoom.present ? data.maxZoom.value : this.maxZoom,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomTileSource(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('urlTemplate: $urlTemplate, ')
          ..write('attribution: $attribution, ')
          ..write('subdomains: $subdomains, ')
          ..write('maxZoom: $maxZoom, ')
          ..write('isActive: $isActive, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, urlTemplate, attribution,
      subdomains, maxZoom, isActive, sortOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomTileSource &&
          other.id == this.id &&
          other.name == this.name &&
          other.urlTemplate == this.urlTemplate &&
          other.attribution == this.attribution &&
          other.subdomains == this.subdomains &&
          other.maxZoom == this.maxZoom &&
          other.isActive == this.isActive &&
          other.sortOrder == this.sortOrder);
}

class CustomTileSourcesCompanion extends UpdateCompanion<CustomTileSource> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> urlTemplate;
  final Value<String?> attribution;
  final Value<String> subdomains;
  final Value<int> maxZoom;
  final Value<bool> isActive;
  final Value<int> sortOrder;
  final Value<int> rowid;
  const CustomTileSourcesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.urlTemplate = const Value.absent(),
    this.attribution = const Value.absent(),
    this.subdomains = const Value.absent(),
    this.maxZoom = const Value.absent(),
    this.isActive = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CustomTileSourcesCompanion.insert({
    required String id,
    required String name,
    required String urlTemplate,
    this.attribution = const Value.absent(),
    this.subdomains = const Value.absent(),
    this.maxZoom = const Value.absent(),
    this.isActive = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        urlTemplate = Value(urlTemplate);
  static Insertable<CustomTileSource> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? urlTemplate,
    Expression<String>? attribution,
    Expression<String>? subdomains,
    Expression<int>? maxZoom,
    Expression<bool>? isActive,
    Expression<int>? sortOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (urlTemplate != null) 'url_template': urlTemplate,
      if (attribution != null) 'attribution': attribution,
      if (subdomains != null) 'subdomains': subdomains,
      if (maxZoom != null) 'max_zoom': maxZoom,
      if (isActive != null) 'is_active': isActive,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CustomTileSourcesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? urlTemplate,
      Value<String?>? attribution,
      Value<String>? subdomains,
      Value<int>? maxZoom,
      Value<bool>? isActive,
      Value<int>? sortOrder,
      Value<int>? rowid}) {
    return CustomTileSourcesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      urlTemplate: urlTemplate ?? this.urlTemplate,
      attribution: attribution ?? this.attribution,
      subdomains: subdomains ?? this.subdomains,
      maxZoom: maxZoom ?? this.maxZoom,
      isActive: isActive ?? this.isActive,
      sortOrder: sortOrder ?? this.sortOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (urlTemplate.present) {
      map['url_template'] = Variable<String>(urlTemplate.value);
    }
    if (attribution.present) {
      map['attribution'] = Variable<String>(attribution.value);
    }
    if (subdomains.present) {
      map['subdomains'] = Variable<String>(subdomains.value);
    }
    if (maxZoom.present) {
      map['max_zoom'] = Variable<int>(maxZoom.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomTileSourcesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('urlTemplate: $urlTemplate, ')
          ..write('attribution: $attribution, ')
          ..write('subdomains: $subdomains, ')
          ..write('maxZoom: $maxZoom, ')
          ..write('isActive: $isActive, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [key, value, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(Insertable<AppSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final String key;
  final String value;
  final DateTime updatedAt;
  const AppSetting(
      {required this.key, required this.value, required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      key: Value(key),
      value: Value(value),
      updatedAt: Value(updatedAt),
    );
  }

  factory AppSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AppSetting copyWith({String? key, String? value, DateTime? updatedAt}) =>
      AppSetting(
        key: key ?? this.key,
        value: value ?? this.value,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.key == this.key &&
          other.value == this.value &&
          other.updatedAt == this.updatedAt);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<String> key;
  final Value<String> value;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required String key,
    required String value,
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : key = Value(key),
        value = Value(value);
  static Insertable<AppSetting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith(
      {Value<String>? key,
      Value<String>? value,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return AppSettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FoldersTable folders = $FoldersTable(this);
  late final $MapObjectsTable mapObjects = $MapObjectsTable(this);
  late final $TracksTable tracks = $TracksTable(this);
  late final $TrackPointsTable trackPoints = $TrackPointsTable(this);
  late final $OfflinePackagesTable offlinePackages =
      $OfflinePackagesTable(this);
  late final $CustomTileSourcesTable customTileSources =
      $CustomTileSourcesTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        folders,
        mapObjects,
        tracks,
        trackPoints,
        offlinePackages,
        customTileSources,
        appSettings
      ];
}

typedef $$FoldersTableCreateCompanionBuilder = FoldersCompanion Function({
  required String id,
  Value<String?> parentId,
  required String name,
  Value<String?> icon,
  Value<bool> isVisible,
  Value<int> sortOrder,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$FoldersTableUpdateCompanionBuilder = FoldersCompanion Function({
  Value<String> id,
  Value<String?> parentId,
  Value<String> name,
  Value<String?> icon,
  Value<bool> isVisible,
  Value<int> sortOrder,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$FoldersTableFilterComposer
    extends Composer<_$AppDatabase, $FoldersTable> {
  $$FoldersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get parentId => $composableBuilder(
      column: $table.parentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isVisible => $composableBuilder(
      column: $table.isVisible, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$FoldersTableOrderingComposer
    extends Composer<_$AppDatabase, $FoldersTable> {
  $$FoldersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get parentId => $composableBuilder(
      column: $table.parentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isVisible => $composableBuilder(
      column: $table.isVisible, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$FoldersTableAnnotationComposer
    extends Composer<_$AppDatabase, $FoldersTable> {
  $$FoldersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<bool> get isVisible =>
      $composableBuilder(column: $table.isVisible, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FoldersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FoldersTable,
    Folder,
    $$FoldersTableFilterComposer,
    $$FoldersTableOrderingComposer,
    $$FoldersTableAnnotationComposer,
    $$FoldersTableCreateCompanionBuilder,
    $$FoldersTableUpdateCompanionBuilder,
    (Folder, BaseReferences<_$AppDatabase, $FoldersTable, Folder>),
    Folder,
    PrefetchHooks Function()> {
  $$FoldersTableTableManager(_$AppDatabase db, $FoldersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FoldersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FoldersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FoldersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> parentId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> icon = const Value.absent(),
            Value<bool> isVisible = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FoldersCompanion(
            id: id,
            parentId: parentId,
            name: name,
            icon: icon,
            isVisible: isVisible,
            sortOrder: sortOrder,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> parentId = const Value.absent(),
            required String name,
            Value<String?> icon = const Value.absent(),
            Value<bool> isVisible = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FoldersCompanion.insert(
            id: id,
            parentId: parentId,
            name: name,
            icon: icon,
            isVisible: isVisible,
            sortOrder: sortOrder,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FoldersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FoldersTable,
    Folder,
    $$FoldersTableFilterComposer,
    $$FoldersTableOrderingComposer,
    $$FoldersTableAnnotationComposer,
    $$FoldersTableCreateCompanionBuilder,
    $$FoldersTableUpdateCompanionBuilder,
    (Folder, BaseReferences<_$AppDatabase, $FoldersTable, Folder>),
    Folder,
    PrefetchHooks Function()>;
typedef $$MapObjectsTableCreateCompanionBuilder = MapObjectsCompanion Function({
  required String id,
  required String folderId,
  required MapObjectType type,
  required String name,
  Value<String> styleJson,
  required String coordinateJson,
  Value<String> propertiesJson,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$MapObjectsTableUpdateCompanionBuilder = MapObjectsCompanion Function({
  Value<String> id,
  Value<String> folderId,
  Value<MapObjectType> type,
  Value<String> name,
  Value<String> styleJson,
  Value<String> coordinateJson,
  Value<String> propertiesJson,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$MapObjectsTableFilterComposer
    extends Composer<_$AppDatabase, $MapObjectsTable> {
  $$MapObjectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get folderId => $composableBuilder(
      column: $table.folderId, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<MapObjectType, MapObjectType, String>
      get type => $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get styleJson => $composableBuilder(
      column: $table.styleJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get coordinateJson => $composableBuilder(
      column: $table.coordinateJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get propertiesJson => $composableBuilder(
      column: $table.propertiesJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$MapObjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $MapObjectsTable> {
  $$MapObjectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get folderId => $composableBuilder(
      column: $table.folderId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get styleJson => $composableBuilder(
      column: $table.styleJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get coordinateJson => $composableBuilder(
      column: $table.coordinateJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get propertiesJson => $composableBuilder(
      column: $table.propertiesJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$MapObjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MapObjectsTable> {
  $$MapObjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get folderId =>
      $composableBuilder(column: $table.folderId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MapObjectType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get styleJson =>
      $composableBuilder(column: $table.styleJson, builder: (column) => column);

  GeneratedColumn<String> get coordinateJson => $composableBuilder(
      column: $table.coordinateJson, builder: (column) => column);

  GeneratedColumn<String> get propertiesJson => $composableBuilder(
      column: $table.propertiesJson, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$MapObjectsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MapObjectsTable,
    MapObject,
    $$MapObjectsTableFilterComposer,
    $$MapObjectsTableOrderingComposer,
    $$MapObjectsTableAnnotationComposer,
    $$MapObjectsTableCreateCompanionBuilder,
    $$MapObjectsTableUpdateCompanionBuilder,
    (MapObject, BaseReferences<_$AppDatabase, $MapObjectsTable, MapObject>),
    MapObject,
    PrefetchHooks Function()> {
  $$MapObjectsTableTableManager(_$AppDatabase db, $MapObjectsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MapObjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MapObjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MapObjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> folderId = const Value.absent(),
            Value<MapObjectType> type = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> styleJson = const Value.absent(),
            Value<String> coordinateJson = const Value.absent(),
            Value<String> propertiesJson = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MapObjectsCompanion(
            id: id,
            folderId: folderId,
            type: type,
            name: name,
            styleJson: styleJson,
            coordinateJson: coordinateJson,
            propertiesJson: propertiesJson,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String folderId,
            required MapObjectType type,
            required String name,
            Value<String> styleJson = const Value.absent(),
            required String coordinateJson,
            Value<String> propertiesJson = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MapObjectsCompanion.insert(
            id: id,
            folderId: folderId,
            type: type,
            name: name,
            styleJson: styleJson,
            coordinateJson: coordinateJson,
            propertiesJson: propertiesJson,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MapObjectsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MapObjectsTable,
    MapObject,
    $$MapObjectsTableFilterComposer,
    $$MapObjectsTableOrderingComposer,
    $$MapObjectsTableAnnotationComposer,
    $$MapObjectsTableCreateCompanionBuilder,
    $$MapObjectsTableUpdateCompanionBuilder,
    (MapObject, BaseReferences<_$AppDatabase, $MapObjectsTable, MapObject>),
    MapObject,
    PrefetchHooks Function()>;
typedef $$TracksTableCreateCompanionBuilder = TracksCompanion Function({
  required String id,
  required String folderId,
  required String name,
  Value<String> styleJson,
  Value<double> totalDistance,
  Value<double?> maxElevation,
  Value<double?> minElevation,
  Value<double?> avgSpeed,
  Value<int> durationSec,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$TracksTableUpdateCompanionBuilder = TracksCompanion Function({
  Value<String> id,
  Value<String> folderId,
  Value<String> name,
  Value<String> styleJson,
  Value<double> totalDistance,
  Value<double?> maxElevation,
  Value<double?> minElevation,
  Value<double?> avgSpeed,
  Value<int> durationSec,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$TracksTableFilterComposer
    extends Composer<_$AppDatabase, $TracksTable> {
  $$TracksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get folderId => $composableBuilder(
      column: $table.folderId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get styleJson => $composableBuilder(
      column: $table.styleJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalDistance => $composableBuilder(
      column: $table.totalDistance, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get maxElevation => $composableBuilder(
      column: $table.maxElevation, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get minElevation => $composableBuilder(
      column: $table.minElevation, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get avgSpeed => $composableBuilder(
      column: $table.avgSpeed, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get durationSec => $composableBuilder(
      column: $table.durationSec, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$TracksTableOrderingComposer
    extends Composer<_$AppDatabase, $TracksTable> {
  $$TracksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get folderId => $composableBuilder(
      column: $table.folderId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get styleJson => $composableBuilder(
      column: $table.styleJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalDistance => $composableBuilder(
      column: $table.totalDistance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get maxElevation => $composableBuilder(
      column: $table.maxElevation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get minElevation => $composableBuilder(
      column: $table.minElevation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get avgSpeed => $composableBuilder(
      column: $table.avgSpeed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get durationSec => $composableBuilder(
      column: $table.durationSec, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$TracksTableAnnotationComposer
    extends Composer<_$AppDatabase, $TracksTable> {
  $$TracksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get folderId =>
      $composableBuilder(column: $table.folderId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get styleJson =>
      $composableBuilder(column: $table.styleJson, builder: (column) => column);

  GeneratedColumn<double> get totalDistance => $composableBuilder(
      column: $table.totalDistance, builder: (column) => column);

  GeneratedColumn<double> get maxElevation => $composableBuilder(
      column: $table.maxElevation, builder: (column) => column);

  GeneratedColumn<double> get minElevation => $composableBuilder(
      column: $table.minElevation, builder: (column) => column);

  GeneratedColumn<double> get avgSpeed =>
      $composableBuilder(column: $table.avgSpeed, builder: (column) => column);

  GeneratedColumn<int> get durationSec => $composableBuilder(
      column: $table.durationSec, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$TracksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TracksTable,
    Track,
    $$TracksTableFilterComposer,
    $$TracksTableOrderingComposer,
    $$TracksTableAnnotationComposer,
    $$TracksTableCreateCompanionBuilder,
    $$TracksTableUpdateCompanionBuilder,
    (Track, BaseReferences<_$AppDatabase, $TracksTable, Track>),
    Track,
    PrefetchHooks Function()> {
  $$TracksTableTableManager(_$AppDatabase db, $TracksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TracksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TracksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TracksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> folderId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> styleJson = const Value.absent(),
            Value<double> totalDistance = const Value.absent(),
            Value<double?> maxElevation = const Value.absent(),
            Value<double?> minElevation = const Value.absent(),
            Value<double?> avgSpeed = const Value.absent(),
            Value<int> durationSec = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TracksCompanion(
            id: id,
            folderId: folderId,
            name: name,
            styleJson: styleJson,
            totalDistance: totalDistance,
            maxElevation: maxElevation,
            minElevation: minElevation,
            avgSpeed: avgSpeed,
            durationSec: durationSec,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String folderId,
            required String name,
            Value<String> styleJson = const Value.absent(),
            Value<double> totalDistance = const Value.absent(),
            Value<double?> maxElevation = const Value.absent(),
            Value<double?> minElevation = const Value.absent(),
            Value<double?> avgSpeed = const Value.absent(),
            Value<int> durationSec = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TracksCompanion.insert(
            id: id,
            folderId: folderId,
            name: name,
            styleJson: styleJson,
            totalDistance: totalDistance,
            maxElevation: maxElevation,
            minElevation: minElevation,
            avgSpeed: avgSpeed,
            durationSec: durationSec,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TracksTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TracksTable,
    Track,
    $$TracksTableFilterComposer,
    $$TracksTableOrderingComposer,
    $$TracksTableAnnotationComposer,
    $$TracksTableCreateCompanionBuilder,
    $$TracksTableUpdateCompanionBuilder,
    (Track, BaseReferences<_$AppDatabase, $TracksTable, Track>),
    Track,
    PrefetchHooks Function()>;
typedef $$TrackPointsTableCreateCompanionBuilder = TrackPointsCompanion
    Function({
  required String id,
  required String trackId,
  required double latitude,
  required double longitude,
  Value<double?> elevation,
  required DateTime timestamp,
  Value<double?> accuracy,
  Value<double?> speed,
  Value<int> rowid,
});
typedef $$TrackPointsTableUpdateCompanionBuilder = TrackPointsCompanion
    Function({
  Value<String> id,
  Value<String> trackId,
  Value<double> latitude,
  Value<double> longitude,
  Value<double?> elevation,
  Value<DateTime> timestamp,
  Value<double?> accuracy,
  Value<double?> speed,
  Value<int> rowid,
});

class $$TrackPointsTableFilterComposer
    extends Composer<_$AppDatabase, $TrackPointsTable> {
  $$TrackPointsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get trackId => $composableBuilder(
      column: $table.trackId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get elevation => $composableBuilder(
      column: $table.elevation, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get accuracy => $composableBuilder(
      column: $table.accuracy, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get speed => $composableBuilder(
      column: $table.speed, builder: (column) => ColumnFilters(column));
}

class $$TrackPointsTableOrderingComposer
    extends Composer<_$AppDatabase, $TrackPointsTable> {
  $$TrackPointsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get trackId => $composableBuilder(
      column: $table.trackId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get elevation => $composableBuilder(
      column: $table.elevation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get accuracy => $composableBuilder(
      column: $table.accuracy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get speed => $composableBuilder(
      column: $table.speed, builder: (column) => ColumnOrderings(column));
}

class $$TrackPointsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrackPointsTable> {
  $$TrackPointsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get trackId =>
      $composableBuilder(column: $table.trackId, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<double> get elevation =>
      $composableBuilder(column: $table.elevation, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<double> get accuracy =>
      $composableBuilder(column: $table.accuracy, builder: (column) => column);

  GeneratedColumn<double> get speed =>
      $composableBuilder(column: $table.speed, builder: (column) => column);
}

class $$TrackPointsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TrackPointsTable,
    TrackPoint,
    $$TrackPointsTableFilterComposer,
    $$TrackPointsTableOrderingComposer,
    $$TrackPointsTableAnnotationComposer,
    $$TrackPointsTableCreateCompanionBuilder,
    $$TrackPointsTableUpdateCompanionBuilder,
    (TrackPoint, BaseReferences<_$AppDatabase, $TrackPointsTable, TrackPoint>),
    TrackPoint,
    PrefetchHooks Function()> {
  $$TrackPointsTableTableManager(_$AppDatabase db, $TrackPointsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrackPointsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrackPointsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TrackPointsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> trackId = const Value.absent(),
            Value<double> latitude = const Value.absent(),
            Value<double> longitude = const Value.absent(),
            Value<double?> elevation = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<double?> accuracy = const Value.absent(),
            Value<double?> speed = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TrackPointsCompanion(
            id: id,
            trackId: trackId,
            latitude: latitude,
            longitude: longitude,
            elevation: elevation,
            timestamp: timestamp,
            accuracy: accuracy,
            speed: speed,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String trackId,
            required double latitude,
            required double longitude,
            Value<double?> elevation = const Value.absent(),
            required DateTime timestamp,
            Value<double?> accuracy = const Value.absent(),
            Value<double?> speed = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TrackPointsCompanion.insert(
            id: id,
            trackId: trackId,
            latitude: latitude,
            longitude: longitude,
            elevation: elevation,
            timestamp: timestamp,
            accuracy: accuracy,
            speed: speed,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TrackPointsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TrackPointsTable,
    TrackPoint,
    $$TrackPointsTableFilterComposer,
    $$TrackPointsTableOrderingComposer,
    $$TrackPointsTableAnnotationComposer,
    $$TrackPointsTableCreateCompanionBuilder,
    $$TrackPointsTableUpdateCompanionBuilder,
    (TrackPoint, BaseReferences<_$AppDatabase, $TrackPointsTable, TrackPoint>),
    TrackPoint,
    PrefetchHooks Function()>;
typedef $$OfflinePackagesTableCreateCompanionBuilder = OfflinePackagesCompanion
    Function({
  required String id,
  required String name,
  required String sourceId,
  required double minLat,
  required double maxLat,
  required double minLon,
  required double maxLon,
  required int minZoom,
  required int maxZoom,
  Value<int> tileCount,
  required String filePath,
  Value<int> fileSize,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$OfflinePackagesTableUpdateCompanionBuilder = OfflinePackagesCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String> sourceId,
  Value<double> minLat,
  Value<double> maxLat,
  Value<double> minLon,
  Value<double> maxLon,
  Value<int> minZoom,
  Value<int> maxZoom,
  Value<int> tileCount,
  Value<String> filePath,
  Value<int> fileSize,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$OfflinePackagesTableFilterComposer
    extends Composer<_$AppDatabase, $OfflinePackagesTable> {
  $$OfflinePackagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceId => $composableBuilder(
      column: $table.sourceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get minLat => $composableBuilder(
      column: $table.minLat, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get maxLat => $composableBuilder(
      column: $table.maxLat, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get minLon => $composableBuilder(
      column: $table.minLon, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get maxLon => $composableBuilder(
      column: $table.maxLon, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get minZoom => $composableBuilder(
      column: $table.minZoom, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxZoom => $composableBuilder(
      column: $table.maxZoom, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get tileCount => $composableBuilder(
      column: $table.tileCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get fileSize => $composableBuilder(
      column: $table.fileSize, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$OfflinePackagesTableOrderingComposer
    extends Composer<_$AppDatabase, $OfflinePackagesTable> {
  $$OfflinePackagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceId => $composableBuilder(
      column: $table.sourceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get minLat => $composableBuilder(
      column: $table.minLat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get maxLat => $composableBuilder(
      column: $table.maxLat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get minLon => $composableBuilder(
      column: $table.minLon, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get maxLon => $composableBuilder(
      column: $table.maxLon, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minZoom => $composableBuilder(
      column: $table.minZoom, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxZoom => $composableBuilder(
      column: $table.maxZoom, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get tileCount => $composableBuilder(
      column: $table.tileCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get fileSize => $composableBuilder(
      column: $table.fileSize, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$OfflinePackagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $OfflinePackagesTable> {
  $$OfflinePackagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<double> get minLat =>
      $composableBuilder(column: $table.minLat, builder: (column) => column);

  GeneratedColumn<double> get maxLat =>
      $composableBuilder(column: $table.maxLat, builder: (column) => column);

  GeneratedColumn<double> get minLon =>
      $composableBuilder(column: $table.minLon, builder: (column) => column);

  GeneratedColumn<double> get maxLon =>
      $composableBuilder(column: $table.maxLon, builder: (column) => column);

  GeneratedColumn<int> get minZoom =>
      $composableBuilder(column: $table.minZoom, builder: (column) => column);

  GeneratedColumn<int> get maxZoom =>
      $composableBuilder(column: $table.maxZoom, builder: (column) => column);

  GeneratedColumn<int> get tileCount =>
      $composableBuilder(column: $table.tileCount, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<int> get fileSize =>
      $composableBuilder(column: $table.fileSize, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$OfflinePackagesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OfflinePackagesTable,
    OfflinePackage,
    $$OfflinePackagesTableFilterComposer,
    $$OfflinePackagesTableOrderingComposer,
    $$OfflinePackagesTableAnnotationComposer,
    $$OfflinePackagesTableCreateCompanionBuilder,
    $$OfflinePackagesTableUpdateCompanionBuilder,
    (
      OfflinePackage,
      BaseReferences<_$AppDatabase, $OfflinePackagesTable, OfflinePackage>
    ),
    OfflinePackage,
    PrefetchHooks Function()> {
  $$OfflinePackagesTableTableManager(
      _$AppDatabase db, $OfflinePackagesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OfflinePackagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OfflinePackagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OfflinePackagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> sourceId = const Value.absent(),
            Value<double> minLat = const Value.absent(),
            Value<double> maxLat = const Value.absent(),
            Value<double> minLon = const Value.absent(),
            Value<double> maxLon = const Value.absent(),
            Value<int> minZoom = const Value.absent(),
            Value<int> maxZoom = const Value.absent(),
            Value<int> tileCount = const Value.absent(),
            Value<String> filePath = const Value.absent(),
            Value<int> fileSize = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              OfflinePackagesCompanion(
            id: id,
            name: name,
            sourceId: sourceId,
            minLat: minLat,
            maxLat: maxLat,
            minLon: minLon,
            maxLon: maxLon,
            minZoom: minZoom,
            maxZoom: maxZoom,
            tileCount: tileCount,
            filePath: filePath,
            fileSize: fileSize,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String sourceId,
            required double minLat,
            required double maxLat,
            required double minLon,
            required double maxLon,
            required int minZoom,
            required int maxZoom,
            Value<int> tileCount = const Value.absent(),
            required String filePath,
            Value<int> fileSize = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              OfflinePackagesCompanion.insert(
            id: id,
            name: name,
            sourceId: sourceId,
            minLat: minLat,
            maxLat: maxLat,
            minLon: minLon,
            maxLon: maxLon,
            minZoom: minZoom,
            maxZoom: maxZoom,
            tileCount: tileCount,
            filePath: filePath,
            fileSize: fileSize,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$OfflinePackagesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OfflinePackagesTable,
    OfflinePackage,
    $$OfflinePackagesTableFilterComposer,
    $$OfflinePackagesTableOrderingComposer,
    $$OfflinePackagesTableAnnotationComposer,
    $$OfflinePackagesTableCreateCompanionBuilder,
    $$OfflinePackagesTableUpdateCompanionBuilder,
    (
      OfflinePackage,
      BaseReferences<_$AppDatabase, $OfflinePackagesTable, OfflinePackage>
    ),
    OfflinePackage,
    PrefetchHooks Function()>;
typedef $$CustomTileSourcesTableCreateCompanionBuilder
    = CustomTileSourcesCompanion Function({
  required String id,
  required String name,
  required String urlTemplate,
  Value<String?> attribution,
  Value<String> subdomains,
  Value<int> maxZoom,
  Value<bool> isActive,
  Value<int> sortOrder,
  Value<int> rowid,
});
typedef $$CustomTileSourcesTableUpdateCompanionBuilder
    = CustomTileSourcesCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> urlTemplate,
  Value<String?> attribution,
  Value<String> subdomains,
  Value<int> maxZoom,
  Value<bool> isActive,
  Value<int> sortOrder,
  Value<int> rowid,
});

class $$CustomTileSourcesTableFilterComposer
    extends Composer<_$AppDatabase, $CustomTileSourcesTable> {
  $$CustomTileSourcesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get urlTemplate => $composableBuilder(
      column: $table.urlTemplate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get attribution => $composableBuilder(
      column: $table.attribution, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subdomains => $composableBuilder(
      column: $table.subdomains, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxZoom => $composableBuilder(
      column: $table.maxZoom, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnFilters(column));
}

class $$CustomTileSourcesTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomTileSourcesTable> {
  $$CustomTileSourcesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get urlTemplate => $composableBuilder(
      column: $table.urlTemplate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get attribution => $composableBuilder(
      column: $table.attribution, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subdomains => $composableBuilder(
      column: $table.subdomains, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxZoom => $composableBuilder(
      column: $table.maxZoom, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnOrderings(column));
}

class $$CustomTileSourcesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomTileSourcesTable> {
  $$CustomTileSourcesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get urlTemplate => $composableBuilder(
      column: $table.urlTemplate, builder: (column) => column);

  GeneratedColumn<String> get attribution => $composableBuilder(
      column: $table.attribution, builder: (column) => column);

  GeneratedColumn<String> get subdomains => $composableBuilder(
      column: $table.subdomains, builder: (column) => column);

  GeneratedColumn<int> get maxZoom =>
      $composableBuilder(column: $table.maxZoom, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);
}

class $$CustomTileSourcesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CustomTileSourcesTable,
    CustomTileSource,
    $$CustomTileSourcesTableFilterComposer,
    $$CustomTileSourcesTableOrderingComposer,
    $$CustomTileSourcesTableAnnotationComposer,
    $$CustomTileSourcesTableCreateCompanionBuilder,
    $$CustomTileSourcesTableUpdateCompanionBuilder,
    (
      CustomTileSource,
      BaseReferences<_$AppDatabase, $CustomTileSourcesTable, CustomTileSource>
    ),
    CustomTileSource,
    PrefetchHooks Function()> {
  $$CustomTileSourcesTableTableManager(
      _$AppDatabase db, $CustomTileSourcesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomTileSourcesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomTileSourcesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomTileSourcesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> urlTemplate = const Value.absent(),
            Value<String?> attribution = const Value.absent(),
            Value<String> subdomains = const Value.absent(),
            Value<int> maxZoom = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CustomTileSourcesCompanion(
            id: id,
            name: name,
            urlTemplate: urlTemplate,
            attribution: attribution,
            subdomains: subdomains,
            maxZoom: maxZoom,
            isActive: isActive,
            sortOrder: sortOrder,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String urlTemplate,
            Value<String?> attribution = const Value.absent(),
            Value<String> subdomains = const Value.absent(),
            Value<int> maxZoom = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CustomTileSourcesCompanion.insert(
            id: id,
            name: name,
            urlTemplate: urlTemplate,
            attribution: attribution,
            subdomains: subdomains,
            maxZoom: maxZoom,
            isActive: isActive,
            sortOrder: sortOrder,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CustomTileSourcesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CustomTileSourcesTable,
    CustomTileSource,
    $$CustomTileSourcesTableFilterComposer,
    $$CustomTileSourcesTableOrderingComposer,
    $$CustomTileSourcesTableAnnotationComposer,
    $$CustomTileSourcesTableCreateCompanionBuilder,
    $$CustomTileSourcesTableUpdateCompanionBuilder,
    (
      CustomTileSource,
      BaseReferences<_$AppDatabase, $CustomTileSourcesTable, CustomTileSource>
    ),
    CustomTileSource,
    PrefetchHooks Function()>;
typedef $$AppSettingsTableCreateCompanionBuilder = AppSettingsCompanion
    Function({
  required String key,
  required String value,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$AppSettingsTableUpdateCompanionBuilder = AppSettingsCompanion
    Function({
  Value<String> key,
  Value<String> value,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AppSettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (AppSetting, BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>),
    AppSetting,
    PrefetchHooks Function()> {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AppSettingsCompanion(
            key: key,
            value: value,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String key,
            required String value,
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AppSettingsCompanion.insert(
            key: key,
            value: value,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppSettingsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (AppSetting, BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>),
    AppSetting,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FoldersTableTableManager get folders =>
      $$FoldersTableTableManager(_db, _db.folders);
  $$MapObjectsTableTableManager get mapObjects =>
      $$MapObjectsTableTableManager(_db, _db.mapObjects);
  $$TracksTableTableManager get tracks =>
      $$TracksTableTableManager(_db, _db.tracks);
  $$TrackPointsTableTableManager get trackPoints =>
      $$TrackPointsTableTableManager(_db, _db.trackPoints);
  $$OfflinePackagesTableTableManager get offlinePackages =>
      $$OfflinePackagesTableTableManager(_db, _db.offlinePackages);
  $$CustomTileSourcesTableTableManager get customTileSources =>
      $$CustomTileSourcesTableTableManager(_db, _db.customTileSources);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
}
