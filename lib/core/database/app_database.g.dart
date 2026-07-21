// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $InstitutionsTable extends Institutions
    with TableInfo<$InstitutionsTable, Institution> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InstitutionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('university'),
  );
  static const VerificationMeta _shortNameMeta = const VerificationMeta(
    'shortName',
  );
  @override
  late final GeneratedColumn<String> shortName = GeneratedColumn<String>(
    'short_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
    'slug',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('trial'),
  );
  static const VerificationMeta _planMeta = const VerificationMeta('plan');
  @override
  late final GeneratedColumn<String> plan = GeneratedColumn<String>(
    'plan',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('free'),
  );
  static const VerificationMeta _accessModeMeta = const VerificationMeta(
    'accessMode',
  );
  @override
  late final GeneratedColumn<String> accessMode = GeneratedColumn<String>(
    'access_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('public'),
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _timezoneMeta = const VerificationMeta(
    'timezone',
  );
  @override
  late final GeneratedColumn<String> timezone = GeneratedColumn<String>(
    'timezone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Asia/Dhaka'),
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    type,
    shortName,
    slug,
    status,
    plan,
    accessMode,
    location,
    timezone,
    active,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'institutions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Institution> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('short_name')) {
      context.handle(
        _shortNameMeta,
        shortName.isAcceptableOrUnknown(data['short_name']!, _shortNameMeta),
      );
    }
    if (data.containsKey('slug')) {
      context.handle(
        _slugMeta,
        slug.isAcceptableOrUnknown(data['slug']!, _slugMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('plan')) {
      context.handle(
        _planMeta,
        plan.isAcceptableOrUnknown(data['plan']!, _planMeta),
      );
    }
    if (data.containsKey('access_mode')) {
      context.handle(
        _accessModeMeta,
        accessMode.isAcceptableOrUnknown(data['access_mode']!, _accessModeMeta),
      );
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('timezone')) {
      context.handle(
        _timezoneMeta,
        timezone.isAcceptableOrUnknown(data['timezone']!, _timezoneMeta),
      );
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Institution map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Institution(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      shortName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}short_name'],
      )!,
      slug: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}slug'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      plan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plan'],
      )!,
      accessMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}access_mode'],
      )!,
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      )!,
      timezone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}timezone'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
    );
  }

  @override
  $InstitutionsTable createAlias(String alias) {
    return $InstitutionsTable(attachedDatabase, alias);
  }
}

class Institution extends DataClass implements Insertable<Institution> {
  final String id;
  final String name;
  final String type;
  final String shortName;
  final String slug;
  final String status;
  final String plan;
  final String accessMode;
  final String location;
  final String timezone;
  final bool active;
  const Institution({
    required this.id,
    required this.name,
    required this.type,
    required this.shortName,
    required this.slug,
    required this.status,
    required this.plan,
    required this.accessMode,
    required this.location,
    required this.timezone,
    required this.active,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['short_name'] = Variable<String>(shortName);
    map['slug'] = Variable<String>(slug);
    map['status'] = Variable<String>(status);
    map['plan'] = Variable<String>(plan);
    map['access_mode'] = Variable<String>(accessMode);
    map['location'] = Variable<String>(location);
    map['timezone'] = Variable<String>(timezone);
    map['active'] = Variable<bool>(active);
    return map;
  }

  InstitutionsCompanion toCompanion(bool nullToAbsent) {
    return InstitutionsCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      shortName: Value(shortName),
      slug: Value(slug),
      status: Value(status),
      plan: Value(plan),
      accessMode: Value(accessMode),
      location: Value(location),
      timezone: Value(timezone),
      active: Value(active),
    );
  }

  factory Institution.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Institution(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      shortName: serializer.fromJson<String>(json['shortName']),
      slug: serializer.fromJson<String>(json['slug']),
      status: serializer.fromJson<String>(json['status']),
      plan: serializer.fromJson<String>(json['plan']),
      accessMode: serializer.fromJson<String>(json['accessMode']),
      location: serializer.fromJson<String>(json['location']),
      timezone: serializer.fromJson<String>(json['timezone']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'shortName': serializer.toJson<String>(shortName),
      'slug': serializer.toJson<String>(slug),
      'status': serializer.toJson<String>(status),
      'plan': serializer.toJson<String>(plan),
      'accessMode': serializer.toJson<String>(accessMode),
      'location': serializer.toJson<String>(location),
      'timezone': serializer.toJson<String>(timezone),
      'active': serializer.toJson<bool>(active),
    };
  }

  Institution copyWith({
    String? id,
    String? name,
    String? type,
    String? shortName,
    String? slug,
    String? status,
    String? plan,
    String? accessMode,
    String? location,
    String? timezone,
    bool? active,
  }) => Institution(
    id: id ?? this.id,
    name: name ?? this.name,
    type: type ?? this.type,
    shortName: shortName ?? this.shortName,
    slug: slug ?? this.slug,
    status: status ?? this.status,
    plan: plan ?? this.plan,
    accessMode: accessMode ?? this.accessMode,
    location: location ?? this.location,
    timezone: timezone ?? this.timezone,
    active: active ?? this.active,
  );
  Institution copyWithCompanion(InstitutionsCompanion data) {
    return Institution(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      shortName: data.shortName.present ? data.shortName.value : this.shortName,
      slug: data.slug.present ? data.slug.value : this.slug,
      status: data.status.present ? data.status.value : this.status,
      plan: data.plan.present ? data.plan.value : this.plan,
      accessMode: data.accessMode.present
          ? data.accessMode.value
          : this.accessMode,
      location: data.location.present ? data.location.value : this.location,
      timezone: data.timezone.present ? data.timezone.value : this.timezone,
      active: data.active.present ? data.active.value : this.active,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Institution(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('shortName: $shortName, ')
          ..write('slug: $slug, ')
          ..write('status: $status, ')
          ..write('plan: $plan, ')
          ..write('accessMode: $accessMode, ')
          ..write('location: $location, ')
          ..write('timezone: $timezone, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    type,
    shortName,
    slug,
    status,
    plan,
    accessMode,
    location,
    timezone,
    active,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Institution &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.shortName == this.shortName &&
          other.slug == this.slug &&
          other.status == this.status &&
          other.plan == this.plan &&
          other.accessMode == this.accessMode &&
          other.location == this.location &&
          other.timezone == this.timezone &&
          other.active == this.active);
}

class InstitutionsCompanion extends UpdateCompanion<Institution> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> type;
  final Value<String> shortName;
  final Value<String> slug;
  final Value<String> status;
  final Value<String> plan;
  final Value<String> accessMode;
  final Value<String> location;
  final Value<String> timezone;
  final Value<bool> active;
  final Value<int> rowid;
  const InstitutionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.shortName = const Value.absent(),
    this.slug = const Value.absent(),
    this.status = const Value.absent(),
    this.plan = const Value.absent(),
    this.accessMode = const Value.absent(),
    this.location = const Value.absent(),
    this.timezone = const Value.absent(),
    this.active = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InstitutionsCompanion.insert({
    required String id,
    required String name,
    this.type = const Value.absent(),
    this.shortName = const Value.absent(),
    this.slug = const Value.absent(),
    this.status = const Value.absent(),
    this.plan = const Value.absent(),
    this.accessMode = const Value.absent(),
    this.location = const Value.absent(),
    this.timezone = const Value.absent(),
    this.active = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<Institution> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? shortName,
    Expression<String>? slug,
    Expression<String>? status,
    Expression<String>? plan,
    Expression<String>? accessMode,
    Expression<String>? location,
    Expression<String>? timezone,
    Expression<bool>? active,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (shortName != null) 'short_name': shortName,
      if (slug != null) 'slug': slug,
      if (status != null) 'status': status,
      if (plan != null) 'plan': plan,
      if (accessMode != null) 'access_mode': accessMode,
      if (location != null) 'location': location,
      if (timezone != null) 'timezone': timezone,
      if (active != null) 'active': active,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InstitutionsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? type,
    Value<String>? shortName,
    Value<String>? slug,
    Value<String>? status,
    Value<String>? plan,
    Value<String>? accessMode,
    Value<String>? location,
    Value<String>? timezone,
    Value<bool>? active,
    Value<int>? rowid,
  }) {
    return InstitutionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      shortName: shortName ?? this.shortName,
      slug: slug ?? this.slug,
      status: status ?? this.status,
      plan: plan ?? this.plan,
      accessMode: accessMode ?? this.accessMode,
      location: location ?? this.location,
      timezone: timezone ?? this.timezone,
      active: active ?? this.active,
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
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (shortName.present) {
      map['short_name'] = Variable<String>(shortName.value);
    }
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (plan.present) {
      map['plan'] = Variable<String>(plan.value);
    }
    if (accessMode.present) {
      map['access_mode'] = Variable<String>(accessMode.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (timezone.present) {
      map['timezone'] = Variable<String>(timezone.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InstitutionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('shortName: $shortName, ')
          ..write('slug: $slug, ')
          ..write('status: $status, ')
          ..write('plan: $plan, ')
          ..write('accessMode: $accessMode, ')
          ..write('location: $location, ')
          ..write('timezone: $timezone, ')
          ..write('active: $active, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OrganizationMembershipsTable extends OrganizationMemberships
    with TableInfo<$OrganizationMembershipsTable, OrganizationMembership> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrganizationMembershipsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _organizationIdMeta = const VerificationMeta(
    'organizationId',
  );
  @override
  late final GeneratedColumn<String> organizationId = GeneratedColumn<String>(
    'organization_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('user'),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    organizationId,
    userId,
    role,
    status,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'organization_memberships';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrganizationMembership> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('organization_id')) {
      context.handle(
        _organizationIdMeta,
        organizationId.isAcceptableOrUnknown(
          data['organization_id']!,
          _organizationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_organizationIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {organizationId, userId};
  @override
  OrganizationMembership map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrganizationMembership(
      organizationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}organization_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $OrganizationMembershipsTable createAlias(String alias) {
    return $OrganizationMembershipsTable(attachedDatabase, alias);
  }
}

class OrganizationMembership extends DataClass
    implements Insertable<OrganizationMembership> {
  final String organizationId;
  final String userId;
  final String role;
  final String status;
  final DateTime createdAt;
  const OrganizationMembership({
    required this.organizationId,
    required this.userId,
    required this.role,
    required this.status,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['organization_id'] = Variable<String>(organizationId);
    map['user_id'] = Variable<String>(userId);
    map['role'] = Variable<String>(role);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  OrganizationMembershipsCompanion toCompanion(bool nullToAbsent) {
    return OrganizationMembershipsCompanion(
      organizationId: Value(organizationId),
      userId: Value(userId),
      role: Value(role),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory OrganizationMembership.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrganizationMembership(
      organizationId: serializer.fromJson<String>(json['organizationId']),
      userId: serializer.fromJson<String>(json['userId']),
      role: serializer.fromJson<String>(json['role']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'organizationId': serializer.toJson<String>(organizationId),
      'userId': serializer.toJson<String>(userId),
      'role': serializer.toJson<String>(role),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  OrganizationMembership copyWith({
    String? organizationId,
    String? userId,
    String? role,
    String? status,
    DateTime? createdAt,
  }) => OrganizationMembership(
    organizationId: organizationId ?? this.organizationId,
    userId: userId ?? this.userId,
    role: role ?? this.role,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
  );
  OrganizationMembership copyWithCompanion(
    OrganizationMembershipsCompanion data,
  ) {
    return OrganizationMembership(
      organizationId: data.organizationId.present
          ? data.organizationId.value
          : this.organizationId,
      userId: data.userId.present ? data.userId.value : this.userId,
      role: data.role.present ? data.role.value : this.role,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrganizationMembership(')
          ..write('organizationId: $organizationId, ')
          ..write('userId: $userId, ')
          ..write('role: $role, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(organizationId, userId, role, status, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrganizationMembership &&
          other.organizationId == this.organizationId &&
          other.userId == this.userId &&
          other.role == this.role &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class OrganizationMembershipsCompanion
    extends UpdateCompanion<OrganizationMembership> {
  final Value<String> organizationId;
  final Value<String> userId;
  final Value<String> role;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const OrganizationMembershipsCompanion({
    this.organizationId = const Value.absent(),
    this.userId = const Value.absent(),
    this.role = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OrganizationMembershipsCompanion.insert({
    required String organizationId,
    required String userId,
    this.role = const Value.absent(),
    this.status = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : organizationId = Value(organizationId),
       userId = Value(userId),
       createdAt = Value(createdAt);
  static Insertable<OrganizationMembership> custom({
    Expression<String>? organizationId,
    Expression<String>? userId,
    Expression<String>? role,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (organizationId != null) 'organization_id': organizationId,
      if (userId != null) 'user_id': userId,
      if (role != null) 'role': role,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OrganizationMembershipsCompanion copyWith({
    Value<String>? organizationId,
    Value<String>? userId,
    Value<String>? role,
    Value<String>? status,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return OrganizationMembershipsCompanion(
      organizationId: organizationId ?? this.organizationId,
      userId: userId ?? this.userId,
      role: role ?? this.role,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (organizationId.present) {
      map['organization_id'] = Variable<String>(organizationId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
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
    return (StringBuffer('OrganizationMembershipsCompanion(')
          ..write('organizationId: $organizationId, ')
          ..write('userId: $userId, ')
          ..write('role: $role, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OrganizationSubscriptionsTable extends OrganizationSubscriptions
    with TableInfo<$OrganizationSubscriptionsTable, OrganizationSubscription> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrganizationSubscriptionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _organizationIdMeta = const VerificationMeta(
    'organizationId',
  );
  @override
  late final GeneratedColumn<String> organizationId = GeneratedColumn<String>(
    'organization_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _planMeta = const VerificationMeta('plan');
  @override
  late final GeneratedColumn<String> plan = GeneratedColumn<String>(
    'plan',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('free'),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  static const VerificationMeta _periodEndsAtMeta = const VerificationMeta(
    'periodEndsAt',
  );
  @override
  late final GeneratedColumn<DateTime> periodEndsAt = GeneratedColumn<DateTime>(
    'period_ends_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    organizationId,
    plan,
    status,
    periodEndsAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'organization_subscriptions';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrganizationSubscription> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('organization_id')) {
      context.handle(
        _organizationIdMeta,
        organizationId.isAcceptableOrUnknown(
          data['organization_id']!,
          _organizationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_organizationIdMeta);
    }
    if (data.containsKey('plan')) {
      context.handle(
        _planMeta,
        plan.isAcceptableOrUnknown(data['plan']!, _planMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('period_ends_at')) {
      context.handle(
        _periodEndsAtMeta,
        periodEndsAt.isAcceptableOrUnknown(
          data['period_ends_at']!,
          _periodEndsAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {organizationId};
  @override
  OrganizationSubscription map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrganizationSubscription(
      organizationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}organization_id'],
      )!,
      plan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plan'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      periodEndsAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}period_ends_at'],
      ),
    );
  }

  @override
  $OrganizationSubscriptionsTable createAlias(String alias) {
    return $OrganizationSubscriptionsTable(attachedDatabase, alias);
  }
}

class OrganizationSubscription extends DataClass
    implements Insertable<OrganizationSubscription> {
  final String organizationId;
  final String plan;
  final String status;
  final DateTime? periodEndsAt;
  const OrganizationSubscription({
    required this.organizationId,
    required this.plan,
    required this.status,
    this.periodEndsAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['organization_id'] = Variable<String>(organizationId);
    map['plan'] = Variable<String>(plan);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || periodEndsAt != null) {
      map['period_ends_at'] = Variable<DateTime>(periodEndsAt);
    }
    return map;
  }

  OrganizationSubscriptionsCompanion toCompanion(bool nullToAbsent) {
    return OrganizationSubscriptionsCompanion(
      organizationId: Value(organizationId),
      plan: Value(plan),
      status: Value(status),
      periodEndsAt: periodEndsAt == null && nullToAbsent
          ? const Value.absent()
          : Value(periodEndsAt),
    );
  }

  factory OrganizationSubscription.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrganizationSubscription(
      organizationId: serializer.fromJson<String>(json['organizationId']),
      plan: serializer.fromJson<String>(json['plan']),
      status: serializer.fromJson<String>(json['status']),
      periodEndsAt: serializer.fromJson<DateTime?>(json['periodEndsAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'organizationId': serializer.toJson<String>(organizationId),
      'plan': serializer.toJson<String>(plan),
      'status': serializer.toJson<String>(status),
      'periodEndsAt': serializer.toJson<DateTime?>(periodEndsAt),
    };
  }

  OrganizationSubscription copyWith({
    String? organizationId,
    String? plan,
    String? status,
    Value<DateTime?> periodEndsAt = const Value.absent(),
  }) => OrganizationSubscription(
    organizationId: organizationId ?? this.organizationId,
    plan: plan ?? this.plan,
    status: status ?? this.status,
    periodEndsAt: periodEndsAt.present ? periodEndsAt.value : this.periodEndsAt,
  );
  OrganizationSubscription copyWithCompanion(
    OrganizationSubscriptionsCompanion data,
  ) {
    return OrganizationSubscription(
      organizationId: data.organizationId.present
          ? data.organizationId.value
          : this.organizationId,
      plan: data.plan.present ? data.plan.value : this.plan,
      status: data.status.present ? data.status.value : this.status,
      periodEndsAt: data.periodEndsAt.present
          ? data.periodEndsAt.value
          : this.periodEndsAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrganizationSubscription(')
          ..write('organizationId: $organizationId, ')
          ..write('plan: $plan, ')
          ..write('status: $status, ')
          ..write('periodEndsAt: $periodEndsAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(organizationId, plan, status, periodEndsAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrganizationSubscription &&
          other.organizationId == this.organizationId &&
          other.plan == this.plan &&
          other.status == this.status &&
          other.periodEndsAt == this.periodEndsAt);
}

class OrganizationSubscriptionsCompanion
    extends UpdateCompanion<OrganizationSubscription> {
  final Value<String> organizationId;
  final Value<String> plan;
  final Value<String> status;
  final Value<DateTime?> periodEndsAt;
  final Value<int> rowid;
  const OrganizationSubscriptionsCompanion({
    this.organizationId = const Value.absent(),
    this.plan = const Value.absent(),
    this.status = const Value.absent(),
    this.periodEndsAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OrganizationSubscriptionsCompanion.insert({
    required String organizationId,
    this.plan = const Value.absent(),
    this.status = const Value.absent(),
    this.periodEndsAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : organizationId = Value(organizationId);
  static Insertable<OrganizationSubscription> custom({
    Expression<String>? organizationId,
    Expression<String>? plan,
    Expression<String>? status,
    Expression<DateTime>? periodEndsAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (organizationId != null) 'organization_id': organizationId,
      if (plan != null) 'plan': plan,
      if (status != null) 'status': status,
      if (periodEndsAt != null) 'period_ends_at': periodEndsAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OrganizationSubscriptionsCompanion copyWith({
    Value<String>? organizationId,
    Value<String>? plan,
    Value<String>? status,
    Value<DateTime?>? periodEndsAt,
    Value<int>? rowid,
  }) {
    return OrganizationSubscriptionsCompanion(
      organizationId: organizationId ?? this.organizationId,
      plan: plan ?? this.plan,
      status: status ?? this.status,
      periodEndsAt: periodEndsAt ?? this.periodEndsAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (organizationId.present) {
      map['organization_id'] = Variable<String>(organizationId.value);
    }
    if (plan.present) {
      map['plan'] = Variable<String>(plan.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (periodEndsAt.present) {
      map['period_ends_at'] = Variable<DateTime>(periodEndsAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrganizationSubscriptionsCompanion(')
          ..write('organizationId: $organizationId, ')
          ..write('plan: $plan, ')
          ..write('status: $status, ')
          ..write('periodEndsAt: $periodEndsAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChatMessagesTable extends ChatMessages
    with TableInfo<$ChatMessagesTable, ChatMessage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatMessagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _organizationIdMeta = const VerificationMeta(
    'organizationId',
  );
  @override
  late final GeneratedColumn<String> organizationId = GeneratedColumn<String>(
    'organization_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _senderIdMeta = const VerificationMeta(
    'senderId',
  );
  @override
  late final GeneratedColumn<String> senderId = GeneratedColumn<String>(
    'sender_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _senderNameMeta = const VerificationMeta(
    'senderName',
  );
  @override
  late final GeneratedColumn<String> senderName = GeneratedColumn<String>(
    'sender_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageTextMeta = const VerificationMeta(
    'messageText',
  );
  @override
  late final GeneratedColumn<String> messageText = GeneratedColumn<String>(
    'message_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
    'expires_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    organizationId,
    senderId,
    senderName,
    messageText,
    createdAt,
    expiresAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chat_messages';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChatMessage> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('organization_id')) {
      context.handle(
        _organizationIdMeta,
        organizationId.isAcceptableOrUnknown(
          data['organization_id']!,
          _organizationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_organizationIdMeta);
    }
    if (data.containsKey('sender_id')) {
      context.handle(
        _senderIdMeta,
        senderId.isAcceptableOrUnknown(data['sender_id']!, _senderIdMeta),
      );
    } else if (isInserting) {
      context.missing(_senderIdMeta);
    }
    if (data.containsKey('sender_name')) {
      context.handle(
        _senderNameMeta,
        senderName.isAcceptableOrUnknown(data['sender_name']!, _senderNameMeta),
      );
    } else if (isInserting) {
      context.missing(_senderNameMeta);
    }
    if (data.containsKey('message_text')) {
      context.handle(
        _messageTextMeta,
        messageText.isAcceptableOrUnknown(
          data['message_text']!,
          _messageTextMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_messageTextMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChatMessage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChatMessage(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      organizationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}organization_id'],
      )!,
      senderId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sender_id'],
      )!,
      senderName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sender_name'],
      )!,
      messageText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message_text'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      )!,
    );
  }

  @override
  $ChatMessagesTable createAlias(String alias) {
    return $ChatMessagesTable(attachedDatabase, alias);
  }
}

class ChatMessage extends DataClass implements Insertable<ChatMessage> {
  final String id;
  final String organizationId;
  final String senderId;
  final String senderName;
  final String messageText;
  final DateTime createdAt;
  final DateTime expiresAt;
  const ChatMessage({
    required this.id,
    required this.organizationId,
    required this.senderId,
    required this.senderName,
    required this.messageText,
    required this.createdAt,
    required this.expiresAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['organization_id'] = Variable<String>(organizationId);
    map['sender_id'] = Variable<String>(senderId);
    map['sender_name'] = Variable<String>(senderName);
    map['message_text'] = Variable<String>(messageText);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['expires_at'] = Variable<DateTime>(expiresAt);
    return map;
  }

  ChatMessagesCompanion toCompanion(bool nullToAbsent) {
    return ChatMessagesCompanion(
      id: Value(id),
      organizationId: Value(organizationId),
      senderId: Value(senderId),
      senderName: Value(senderName),
      messageText: Value(messageText),
      createdAt: Value(createdAt),
      expiresAt: Value(expiresAt),
    );
  }

  factory ChatMessage.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatMessage(
      id: serializer.fromJson<String>(json['id']),
      organizationId: serializer.fromJson<String>(json['organizationId']),
      senderId: serializer.fromJson<String>(json['senderId']),
      senderName: serializer.fromJson<String>(json['senderName']),
      messageText: serializer.fromJson<String>(json['messageText']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'organizationId': serializer.toJson<String>(organizationId),
      'senderId': serializer.toJson<String>(senderId),
      'senderName': serializer.toJson<String>(senderName),
      'messageText': serializer.toJson<String>(messageText),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'expiresAt': serializer.toJson<DateTime>(expiresAt),
    };
  }

  ChatMessage copyWith({
    String? id,
    String? organizationId,
    String? senderId,
    String? senderName,
    String? messageText,
    DateTime? createdAt,
    DateTime? expiresAt,
  }) => ChatMessage(
    id: id ?? this.id,
    organizationId: organizationId ?? this.organizationId,
    senderId: senderId ?? this.senderId,
    senderName: senderName ?? this.senderName,
    messageText: messageText ?? this.messageText,
    createdAt: createdAt ?? this.createdAt,
    expiresAt: expiresAt ?? this.expiresAt,
  );
  ChatMessage copyWithCompanion(ChatMessagesCompanion data) {
    return ChatMessage(
      id: data.id.present ? data.id.value : this.id,
      organizationId: data.organizationId.present
          ? data.organizationId.value
          : this.organizationId,
      senderId: data.senderId.present ? data.senderId.value : this.senderId,
      senderName: data.senderName.present
          ? data.senderName.value
          : this.senderName,
      messageText: data.messageText.present
          ? data.messageText.value
          : this.messageText,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChatMessage(')
          ..write('id: $id, ')
          ..write('organizationId: $organizationId, ')
          ..write('senderId: $senderId, ')
          ..write('senderName: $senderName, ')
          ..write('messageText: $messageText, ')
          ..write('createdAt: $createdAt, ')
          ..write('expiresAt: $expiresAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    organizationId,
    senderId,
    senderName,
    messageText,
    createdAt,
    expiresAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatMessage &&
          other.id == this.id &&
          other.organizationId == this.organizationId &&
          other.senderId == this.senderId &&
          other.senderName == this.senderName &&
          other.messageText == this.messageText &&
          other.createdAt == this.createdAt &&
          other.expiresAt == this.expiresAt);
}

class ChatMessagesCompanion extends UpdateCompanion<ChatMessage> {
  final Value<String> id;
  final Value<String> organizationId;
  final Value<String> senderId;
  final Value<String> senderName;
  final Value<String> messageText;
  final Value<DateTime> createdAt;
  final Value<DateTime> expiresAt;
  final Value<int> rowid;
  const ChatMessagesCompanion({
    this.id = const Value.absent(),
    this.organizationId = const Value.absent(),
    this.senderId = const Value.absent(),
    this.senderName = const Value.absent(),
    this.messageText = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChatMessagesCompanion.insert({
    required String id,
    required String organizationId,
    required String senderId,
    required String senderName,
    required String messageText,
    required DateTime createdAt,
    required DateTime expiresAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       organizationId = Value(organizationId),
       senderId = Value(senderId),
       senderName = Value(senderName),
       messageText = Value(messageText),
       createdAt = Value(createdAt),
       expiresAt = Value(expiresAt);
  static Insertable<ChatMessage> custom({
    Expression<String>? id,
    Expression<String>? organizationId,
    Expression<String>? senderId,
    Expression<String>? senderName,
    Expression<String>? messageText,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? expiresAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (organizationId != null) 'organization_id': organizationId,
      if (senderId != null) 'sender_id': senderId,
      if (senderName != null) 'sender_name': senderName,
      if (messageText != null) 'message_text': messageText,
      if (createdAt != null) 'created_at': createdAt,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChatMessagesCompanion copyWith({
    Value<String>? id,
    Value<String>? organizationId,
    Value<String>? senderId,
    Value<String>? senderName,
    Value<String>? messageText,
    Value<DateTime>? createdAt,
    Value<DateTime>? expiresAt,
    Value<int>? rowid,
  }) {
    return ChatMessagesCompanion(
      id: id ?? this.id,
      organizationId: organizationId ?? this.organizationId,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      messageText: messageText ?? this.messageText,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (organizationId.present) {
      map['organization_id'] = Variable<String>(organizationId.value);
    }
    if (senderId.present) {
      map['sender_id'] = Variable<String>(senderId.value);
    }
    if (senderName.present) {
      map['sender_name'] = Variable<String>(senderName.value);
    }
    if (messageText.present) {
      map['message_text'] = Variable<String>(messageText.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatMessagesCompanion(')
          ..write('id: $id, ')
          ..write('organizationId: $organizationId, ')
          ..write('senderId: $senderId, ')
          ..write('senderName: $senderName, ')
          ..write('messageText: $messageText, ')
          ..write('createdAt: $createdAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserProfilesTable extends UserProfiles
    with TableInfo<$UserProfilesTable, UserProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
    'uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('user'),
  );
  static const VerificationMeta _institutionIdMeta = const VerificationMeta(
    'institutionId',
  );
  @override
  late final GeneratedColumn<String> institutionId = GeneratedColumn<String>(
    'institution_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _referralCodeMeta = const VerificationMeta(
    'referralCode',
  );
  @override
  late final GeneratedColumn<String> referralCode = GeneratedColumn<String>(
    'referral_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _referredByMeta = const VerificationMeta(
    'referredBy',
  );
  @override
  late final GeneratedColumn<String> referredBy = GeneratedColumn<String>(
    'referred_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _firstNameMeta = const VerificationMeta(
    'firstName',
  );
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastNameMeta = const VerificationMeta(
    'lastName',
  );
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _departmentMeta = const VerificationMeta(
    'department',
  );
  @override
  late final GeneratedColumn<String> department = GeneratedColumn<String>(
    'department',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _academicSessionMeta = const VerificationMeta(
    'academicSession',
  );
  @override
  late final GeneratedColumn<String> academicSession = GeneratedColumn<String>(
    'academic_session',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    displayName,
    email,
    role,
    institutionId,
    referralCode,
    referredBy,
    firstName,
    lastName,
    gender,
    department,
    academicSession,
    createdAt,
    active,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    }
    if (data.containsKey('institution_id')) {
      context.handle(
        _institutionIdMeta,
        institutionId.isAcceptableOrUnknown(
          data['institution_id']!,
          _institutionIdMeta,
        ),
      );
    }
    if (data.containsKey('referral_code')) {
      context.handle(
        _referralCodeMeta,
        referralCode.isAcceptableOrUnknown(
          data['referral_code']!,
          _referralCodeMeta,
        ),
      );
    }
    if (data.containsKey('referred_by')) {
      context.handle(
        _referredByMeta,
        referredBy.isAcceptableOrUnknown(data['referred_by']!, _referredByMeta),
      );
    }
    if (data.containsKey('first_name')) {
      context.handle(
        _firstNameMeta,
        firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta),
      );
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _lastNameMeta,
        lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta),
      );
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    }
    if (data.containsKey('department')) {
      context.handle(
        _departmentMeta,
        department.isAcceptableOrUnknown(data['department']!, _departmentMeta),
      );
    }
    if (data.containsKey('academic_session')) {
      context.handle(
        _academicSessionMeta,
        academicSession.isAcceptableOrUnknown(
          data['academic_session']!,
          _academicSessionMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  UserProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfile(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uid'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      institutionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}institution_id'],
      ),
      referralCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}referral_code'],
      ),
      referredBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}referred_by'],
      ),
      firstName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_name'],
      ),
      lastName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name'],
      ),
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      ),
      department: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}department'],
      ),
      academicSession: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}academic_session'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
    );
  }

  @override
  $UserProfilesTable createAlias(String alias) {
    return $UserProfilesTable(attachedDatabase, alias);
  }
}

class UserProfile extends DataClass implements Insertable<UserProfile> {
  final String uid;
  final String displayName;
  final String email;
  final String role;
  final String? institutionId;
  final String? referralCode;
  final String? referredBy;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? department;
  final String? academicSession;
  final DateTime createdAt;
  final bool active;
  const UserProfile({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.role,
    this.institutionId,
    this.referralCode,
    this.referredBy,
    this.firstName,
    this.lastName,
    this.gender,
    this.department,
    this.academicSession,
    required this.createdAt,
    required this.active,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['display_name'] = Variable<String>(displayName);
    map['email'] = Variable<String>(email);
    map['role'] = Variable<String>(role);
    if (!nullToAbsent || institutionId != null) {
      map['institution_id'] = Variable<String>(institutionId);
    }
    if (!nullToAbsent || referralCode != null) {
      map['referral_code'] = Variable<String>(referralCode);
    }
    if (!nullToAbsent || referredBy != null) {
      map['referred_by'] = Variable<String>(referredBy);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || department != null) {
      map['department'] = Variable<String>(department);
    }
    if (!nullToAbsent || academicSession != null) {
      map['academic_session'] = Variable<String>(academicSession);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['active'] = Variable<bool>(active);
    return map;
  }

  UserProfilesCompanion toCompanion(bool nullToAbsent) {
    return UserProfilesCompanion(
      uid: Value(uid),
      displayName: Value(displayName),
      email: Value(email),
      role: Value(role),
      institutionId: institutionId == null && nullToAbsent
          ? const Value.absent()
          : Value(institutionId),
      referralCode: referralCode == null && nullToAbsent
          ? const Value.absent()
          : Value(referralCode),
      referredBy: referredBy == null && nullToAbsent
          ? const Value.absent()
          : Value(referredBy),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      gender: gender == null && nullToAbsent
          ? const Value.absent()
          : Value(gender),
      department: department == null && nullToAbsent
          ? const Value.absent()
          : Value(department),
      academicSession: academicSession == null && nullToAbsent
          ? const Value.absent()
          : Value(academicSession),
      createdAt: Value(createdAt),
      active: Value(active),
    );
  }

  factory UserProfile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfile(
      uid: serializer.fromJson<String>(json['uid']),
      displayName: serializer.fromJson<String>(json['displayName']),
      email: serializer.fromJson<String>(json['email']),
      role: serializer.fromJson<String>(json['role']),
      institutionId: serializer.fromJson<String?>(json['institutionId']),
      referralCode: serializer.fromJson<String?>(json['referralCode']),
      referredBy: serializer.fromJson<String?>(json['referredBy']),
      firstName: serializer.fromJson<String?>(json['firstName']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      gender: serializer.fromJson<String?>(json['gender']),
      department: serializer.fromJson<String?>(json['department']),
      academicSession: serializer.fromJson<String?>(json['academicSession']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'displayName': serializer.toJson<String>(displayName),
      'email': serializer.toJson<String>(email),
      'role': serializer.toJson<String>(role),
      'institutionId': serializer.toJson<String?>(institutionId),
      'referralCode': serializer.toJson<String?>(referralCode),
      'referredBy': serializer.toJson<String?>(referredBy),
      'firstName': serializer.toJson<String?>(firstName),
      'lastName': serializer.toJson<String?>(lastName),
      'gender': serializer.toJson<String?>(gender),
      'department': serializer.toJson<String?>(department),
      'academicSession': serializer.toJson<String?>(academicSession),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'active': serializer.toJson<bool>(active),
    };
  }

  UserProfile copyWith({
    String? uid,
    String? displayName,
    String? email,
    String? role,
    Value<String?> institutionId = const Value.absent(),
    Value<String?> referralCode = const Value.absent(),
    Value<String?> referredBy = const Value.absent(),
    Value<String?> firstName = const Value.absent(),
    Value<String?> lastName = const Value.absent(),
    Value<String?> gender = const Value.absent(),
    Value<String?> department = const Value.absent(),
    Value<String?> academicSession = const Value.absent(),
    DateTime? createdAt,
    bool? active,
  }) => UserProfile(
    uid: uid ?? this.uid,
    displayName: displayName ?? this.displayName,
    email: email ?? this.email,
    role: role ?? this.role,
    institutionId: institutionId.present
        ? institutionId.value
        : this.institutionId,
    referralCode: referralCode.present ? referralCode.value : this.referralCode,
    referredBy: referredBy.present ? referredBy.value : this.referredBy,
    firstName: firstName.present ? firstName.value : this.firstName,
    lastName: lastName.present ? lastName.value : this.lastName,
    gender: gender.present ? gender.value : this.gender,
    department: department.present ? department.value : this.department,
    academicSession: academicSession.present
        ? academicSession.value
        : this.academicSession,
    createdAt: createdAt ?? this.createdAt,
    active: active ?? this.active,
  );
  UserProfile copyWithCompanion(UserProfilesCompanion data) {
    return UserProfile(
      uid: data.uid.present ? data.uid.value : this.uid,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      email: data.email.present ? data.email.value : this.email,
      role: data.role.present ? data.role.value : this.role,
      institutionId: data.institutionId.present
          ? data.institutionId.value
          : this.institutionId,
      referralCode: data.referralCode.present
          ? data.referralCode.value
          : this.referralCode,
      referredBy: data.referredBy.present
          ? data.referredBy.value
          : this.referredBy,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      gender: data.gender.present ? data.gender.value : this.gender,
      department: data.department.present
          ? data.department.value
          : this.department,
      academicSession: data.academicSession.present
          ? data.academicSession.value
          : this.academicSession,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      active: data.active.present ? data.active.value : this.active,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfile(')
          ..write('uid: $uid, ')
          ..write('displayName: $displayName, ')
          ..write('email: $email, ')
          ..write('role: $role, ')
          ..write('institutionId: $institutionId, ')
          ..write('referralCode: $referralCode, ')
          ..write('referredBy: $referredBy, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('gender: $gender, ')
          ..write('department: $department, ')
          ..write('academicSession: $academicSession, ')
          ..write('createdAt: $createdAt, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    displayName,
    email,
    role,
    institutionId,
    referralCode,
    referredBy,
    firstName,
    lastName,
    gender,
    department,
    academicSession,
    createdAt,
    active,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfile &&
          other.uid == this.uid &&
          other.displayName == this.displayName &&
          other.email == this.email &&
          other.role == this.role &&
          other.institutionId == this.institutionId &&
          other.referralCode == this.referralCode &&
          other.referredBy == this.referredBy &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.gender == this.gender &&
          other.department == this.department &&
          other.academicSession == this.academicSession &&
          other.createdAt == this.createdAt &&
          other.active == this.active);
}

class UserProfilesCompanion extends UpdateCompanion<UserProfile> {
  final Value<String> uid;
  final Value<String> displayName;
  final Value<String> email;
  final Value<String> role;
  final Value<String?> institutionId;
  final Value<String?> referralCode;
  final Value<String?> referredBy;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> gender;
  final Value<String?> department;
  final Value<String?> academicSession;
  final Value<DateTime> createdAt;
  final Value<bool> active;
  final Value<int> rowid;
  const UserProfilesCompanion({
    this.uid = const Value.absent(),
    this.displayName = const Value.absent(),
    this.email = const Value.absent(),
    this.role = const Value.absent(),
    this.institutionId = const Value.absent(),
    this.referralCode = const Value.absent(),
    this.referredBy = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.gender = const Value.absent(),
    this.department = const Value.absent(),
    this.academicSession = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.active = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserProfilesCompanion.insert({
    required String uid,
    required String displayName,
    required String email,
    this.role = const Value.absent(),
    this.institutionId = const Value.absent(),
    this.referralCode = const Value.absent(),
    this.referredBy = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.gender = const Value.absent(),
    this.department = const Value.absent(),
    this.academicSession = const Value.absent(),
    required DateTime createdAt,
    this.active = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : uid = Value(uid),
       displayName = Value(displayName),
       email = Value(email),
       createdAt = Value(createdAt);
  static Insertable<UserProfile> custom({
    Expression<String>? uid,
    Expression<String>? displayName,
    Expression<String>? email,
    Expression<String>? role,
    Expression<String>? institutionId,
    Expression<String>? referralCode,
    Expression<String>? referredBy,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? gender,
    Expression<String>? department,
    Expression<String>? academicSession,
    Expression<DateTime>? createdAt,
    Expression<bool>? active,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (displayName != null) 'display_name': displayName,
      if (email != null) 'email': email,
      if (role != null) 'role': role,
      if (institutionId != null) 'institution_id': institutionId,
      if (referralCode != null) 'referral_code': referralCode,
      if (referredBy != null) 'referred_by': referredBy,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (gender != null) 'gender': gender,
      if (department != null) 'department': department,
      if (academicSession != null) 'academic_session': academicSession,
      if (createdAt != null) 'created_at': createdAt,
      if (active != null) 'active': active,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserProfilesCompanion copyWith({
    Value<String>? uid,
    Value<String>? displayName,
    Value<String>? email,
    Value<String>? role,
    Value<String?>? institutionId,
    Value<String?>? referralCode,
    Value<String?>? referredBy,
    Value<String?>? firstName,
    Value<String?>? lastName,
    Value<String?>? gender,
    Value<String?>? department,
    Value<String?>? academicSession,
    Value<DateTime>? createdAt,
    Value<bool>? active,
    Value<int>? rowid,
  }) {
    return UserProfilesCompanion(
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      role: role ?? this.role,
      institutionId: institutionId ?? this.institutionId,
      referralCode: referralCode ?? this.referralCode,
      referredBy: referredBy ?? this.referredBy,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      department: department ?? this.department,
      academicSession: academicSession ?? this.academicSession,
      createdAt: createdAt ?? this.createdAt,
      active: active ?? this.active,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (institutionId.present) {
      map['institution_id'] = Variable<String>(institutionId.value);
    }
    if (referralCode.present) {
      map['referral_code'] = Variable<String>(referralCode.value);
    }
    if (referredBy.present) {
      map['referred_by'] = Variable<String>(referredBy.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (department.present) {
      map['department'] = Variable<String>(department.value);
    }
    if (academicSession.present) {
      map['academic_session'] = Variable<String>(academicSession.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfilesCompanion(')
          ..write('uid: $uid, ')
          ..write('displayName: $displayName, ')
          ..write('email: $email, ')
          ..write('role: $role, ')
          ..write('institutionId: $institutionId, ')
          ..write('referralCode: $referralCode, ')
          ..write('referredBy: $referredBy, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('gender: $gender, ')
          ..write('department: $department, ')
          ..write('academicSession: $academicSession, ')
          ..write('createdAt: $createdAt, ')
          ..write('active: $active, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BusesTable extends Buses with TableInfo<$BusesTable, BusRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BusesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _institutionIdMeta = const VerificationMeta(
    'institutionId',
  );
  @override
  late final GeneratedColumn<String> institutionId = GeneratedColumn<String>(
    'institution_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES institutions (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _busNumberMeta = const VerificationMeta(
    'busNumber',
  );
  @override
  late final GeneratedColumn<String> busNumber = GeneratedColumn<String>(
    'bus_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _plateNumberMeta = const VerificationMeta(
    'plateNumber',
  );
  @override
  late final GeneratedColumn<String> plateNumber = GeneratedColumn<String>(
    'plate_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _colorValueMeta = const VerificationMeta(
    'colorValue',
  );
  @override
  late final GeneratedColumn<int> colorValue = GeneratedColumn<int>(
    'color_value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _capacityMeta = const VerificationMeta(
    'capacity',
  );
  @override
  late final GeneratedColumn<int> capacity = GeneratedColumn<int>(
    'capacity',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    institutionId,
    name,
    busNumber,
    plateNumber,
    description,
    colorValue,
    capacity,
    active,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'buses';
  @override
  VerificationContext validateIntegrity(
    Insertable<BusRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('institution_id')) {
      context.handle(
        _institutionIdMeta,
        institutionId.isAcceptableOrUnknown(
          data['institution_id']!,
          _institutionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_institutionIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('bus_number')) {
      context.handle(
        _busNumberMeta,
        busNumber.isAcceptableOrUnknown(data['bus_number']!, _busNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_busNumberMeta);
    }
    if (data.containsKey('plate_number')) {
      context.handle(
        _plateNumberMeta,
        plateNumber.isAcceptableOrUnknown(
          data['plate_number']!,
          _plateNumberMeta,
        ),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('color_value')) {
      context.handle(
        _colorValueMeta,
        colorValue.isAcceptableOrUnknown(data['color_value']!, _colorValueMeta),
      );
    } else if (isInserting) {
      context.missing(_colorValueMeta);
    }
    if (data.containsKey('capacity')) {
      context.handle(
        _capacityMeta,
        capacity.isAcceptableOrUnknown(data['capacity']!, _capacityMeta),
      );
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BusRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BusRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      institutionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}institution_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      busNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bus_number'],
      )!,
      plateNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plate_number'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      colorValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color_value'],
      )!,
      capacity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}capacity'],
      ),
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
    );
  }

  @override
  $BusesTable createAlias(String alias) {
    return $BusesTable(attachedDatabase, alias);
  }
}

class BusRow extends DataClass implements Insertable<BusRow> {
  final String id;
  final String institutionId;
  final String name;
  final String busNumber;
  final String? plateNumber;
  final String? description;
  final int colorValue;
  final int? capacity;
  final bool active;
  const BusRow({
    required this.id,
    required this.institutionId,
    required this.name,
    required this.busNumber,
    this.plateNumber,
    this.description,
    required this.colorValue,
    this.capacity,
    required this.active,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['institution_id'] = Variable<String>(institutionId);
    map['name'] = Variable<String>(name);
    map['bus_number'] = Variable<String>(busNumber);
    if (!nullToAbsent || plateNumber != null) {
      map['plate_number'] = Variable<String>(plateNumber);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['color_value'] = Variable<int>(colorValue);
    if (!nullToAbsent || capacity != null) {
      map['capacity'] = Variable<int>(capacity);
    }
    map['active'] = Variable<bool>(active);
    return map;
  }

  BusesCompanion toCompanion(bool nullToAbsent) {
    return BusesCompanion(
      id: Value(id),
      institutionId: Value(institutionId),
      name: Value(name),
      busNumber: Value(busNumber),
      plateNumber: plateNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(plateNumber),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      colorValue: Value(colorValue),
      capacity: capacity == null && nullToAbsent
          ? const Value.absent()
          : Value(capacity),
      active: Value(active),
    );
  }

  factory BusRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BusRow(
      id: serializer.fromJson<String>(json['id']),
      institutionId: serializer.fromJson<String>(json['institutionId']),
      name: serializer.fromJson<String>(json['name']),
      busNumber: serializer.fromJson<String>(json['busNumber']),
      plateNumber: serializer.fromJson<String?>(json['plateNumber']),
      description: serializer.fromJson<String?>(json['description']),
      colorValue: serializer.fromJson<int>(json['colorValue']),
      capacity: serializer.fromJson<int?>(json['capacity']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'institutionId': serializer.toJson<String>(institutionId),
      'name': serializer.toJson<String>(name),
      'busNumber': serializer.toJson<String>(busNumber),
      'plateNumber': serializer.toJson<String?>(plateNumber),
      'description': serializer.toJson<String?>(description),
      'colorValue': serializer.toJson<int>(colorValue),
      'capacity': serializer.toJson<int?>(capacity),
      'active': serializer.toJson<bool>(active),
    };
  }

  BusRow copyWith({
    String? id,
    String? institutionId,
    String? name,
    String? busNumber,
    Value<String?> plateNumber = const Value.absent(),
    Value<String?> description = const Value.absent(),
    int? colorValue,
    Value<int?> capacity = const Value.absent(),
    bool? active,
  }) => BusRow(
    id: id ?? this.id,
    institutionId: institutionId ?? this.institutionId,
    name: name ?? this.name,
    busNumber: busNumber ?? this.busNumber,
    plateNumber: plateNumber.present ? plateNumber.value : this.plateNumber,
    description: description.present ? description.value : this.description,
    colorValue: colorValue ?? this.colorValue,
    capacity: capacity.present ? capacity.value : this.capacity,
    active: active ?? this.active,
  );
  BusRow copyWithCompanion(BusesCompanion data) {
    return BusRow(
      id: data.id.present ? data.id.value : this.id,
      institutionId: data.institutionId.present
          ? data.institutionId.value
          : this.institutionId,
      name: data.name.present ? data.name.value : this.name,
      busNumber: data.busNumber.present ? data.busNumber.value : this.busNumber,
      plateNumber: data.plateNumber.present
          ? data.plateNumber.value
          : this.plateNumber,
      description: data.description.present
          ? data.description.value
          : this.description,
      colorValue: data.colorValue.present
          ? data.colorValue.value
          : this.colorValue,
      capacity: data.capacity.present ? data.capacity.value : this.capacity,
      active: data.active.present ? data.active.value : this.active,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BusRow(')
          ..write('id: $id, ')
          ..write('institutionId: $institutionId, ')
          ..write('name: $name, ')
          ..write('busNumber: $busNumber, ')
          ..write('plateNumber: $plateNumber, ')
          ..write('description: $description, ')
          ..write('colorValue: $colorValue, ')
          ..write('capacity: $capacity, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    institutionId,
    name,
    busNumber,
    plateNumber,
    description,
    colorValue,
    capacity,
    active,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BusRow &&
          other.id == this.id &&
          other.institutionId == this.institutionId &&
          other.name == this.name &&
          other.busNumber == this.busNumber &&
          other.plateNumber == this.plateNumber &&
          other.description == this.description &&
          other.colorValue == this.colorValue &&
          other.capacity == this.capacity &&
          other.active == this.active);
}

class BusesCompanion extends UpdateCompanion<BusRow> {
  final Value<String> id;
  final Value<String> institutionId;
  final Value<String> name;
  final Value<String> busNumber;
  final Value<String?> plateNumber;
  final Value<String?> description;
  final Value<int> colorValue;
  final Value<int?> capacity;
  final Value<bool> active;
  final Value<int> rowid;
  const BusesCompanion({
    this.id = const Value.absent(),
    this.institutionId = const Value.absent(),
    this.name = const Value.absent(),
    this.busNumber = const Value.absent(),
    this.plateNumber = const Value.absent(),
    this.description = const Value.absent(),
    this.colorValue = const Value.absent(),
    this.capacity = const Value.absent(),
    this.active = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BusesCompanion.insert({
    required String id,
    required String institutionId,
    required String name,
    required String busNumber,
    this.plateNumber = const Value.absent(),
    this.description = const Value.absent(),
    required int colorValue,
    this.capacity = const Value.absent(),
    this.active = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       institutionId = Value(institutionId),
       name = Value(name),
       busNumber = Value(busNumber),
       colorValue = Value(colorValue);
  static Insertable<BusRow> custom({
    Expression<String>? id,
    Expression<String>? institutionId,
    Expression<String>? name,
    Expression<String>? busNumber,
    Expression<String>? plateNumber,
    Expression<String>? description,
    Expression<int>? colorValue,
    Expression<int>? capacity,
    Expression<bool>? active,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (institutionId != null) 'institution_id': institutionId,
      if (name != null) 'name': name,
      if (busNumber != null) 'bus_number': busNumber,
      if (plateNumber != null) 'plate_number': plateNumber,
      if (description != null) 'description': description,
      if (colorValue != null) 'color_value': colorValue,
      if (capacity != null) 'capacity': capacity,
      if (active != null) 'active': active,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BusesCompanion copyWith({
    Value<String>? id,
    Value<String>? institutionId,
    Value<String>? name,
    Value<String>? busNumber,
    Value<String?>? plateNumber,
    Value<String?>? description,
    Value<int>? colorValue,
    Value<int?>? capacity,
    Value<bool>? active,
    Value<int>? rowid,
  }) {
    return BusesCompanion(
      id: id ?? this.id,
      institutionId: institutionId ?? this.institutionId,
      name: name ?? this.name,
      busNumber: busNumber ?? this.busNumber,
      plateNumber: plateNumber ?? this.plateNumber,
      description: description ?? this.description,
      colorValue: colorValue ?? this.colorValue,
      capacity: capacity ?? this.capacity,
      active: active ?? this.active,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (institutionId.present) {
      map['institution_id'] = Variable<String>(institutionId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (busNumber.present) {
      map['bus_number'] = Variable<String>(busNumber.value);
    }
    if (plateNumber.present) {
      map['plate_number'] = Variable<String>(plateNumber.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (colorValue.present) {
      map['color_value'] = Variable<int>(colorValue.value);
    }
    if (capacity.present) {
      map['capacity'] = Variable<int>(capacity.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BusesCompanion(')
          ..write('id: $id, ')
          ..write('institutionId: $institutionId, ')
          ..write('name: $name, ')
          ..write('busNumber: $busNumber, ')
          ..write('plateNumber: $plateNumber, ')
          ..write('description: $description, ')
          ..write('colorValue: $colorValue, ')
          ..write('capacity: $capacity, ')
          ..write('active: $active, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoutesTable extends Routes with TableInfo<$RoutesTable, Route> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _institutionIdMeta = const VerificationMeta(
    'institutionId',
  );
  @override
  late final GeneratedColumn<String> institutionId = GeneratedColumn<String>(
    'institution_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES institutions (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startNameMeta = const VerificationMeta(
    'startName',
  );
  @override
  late final GeneratedColumn<String> startName = GeneratedColumn<String>(
    'start_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endNameMeta = const VerificationMeta(
    'endName',
  );
  @override
  late final GeneratedColumn<String> endName = GeneratedColumn<String>(
    'end_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _distanceMetersMeta = const VerificationMeta(
    'distanceMeters',
  );
  @override
  late final GeneratedColumn<int> distanceMeters = GeneratedColumn<int>(
    'distance_meters',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bidirectionalMeta = const VerificationMeta(
    'bidirectional',
  );
  @override
  late final GeneratedColumn<bool> bidirectional = GeneratedColumn<bool>(
    'bidirectional',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("bidirectional" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _routeCorridorMetersMeta =
      const VerificationMeta('routeCorridorMeters');
  @override
  late final GeneratedColumn<double> routeCorridorMeters =
      GeneratedColumn<double>(
        'route_corridor_meters',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const Constant(150),
      );
  static const VerificationMeta _encodedPointsMeta = const VerificationMeta(
    'encodedPoints',
  );
  @override
  late final GeneratedColumn<String> encodedPoints = GeneratedColumn<String>(
    'encoded_points',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    institutionId,
    name,
    startName,
    endName,
    distanceMeters,
    bidirectional,
    routeCorridorMeters,
    encodedPoints,
    active,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Route> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('institution_id')) {
      context.handle(
        _institutionIdMeta,
        institutionId.isAcceptableOrUnknown(
          data['institution_id']!,
          _institutionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_institutionIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('start_name')) {
      context.handle(
        _startNameMeta,
        startName.isAcceptableOrUnknown(data['start_name']!, _startNameMeta),
      );
    } else if (isInserting) {
      context.missing(_startNameMeta);
    }
    if (data.containsKey('end_name')) {
      context.handle(
        _endNameMeta,
        endName.isAcceptableOrUnknown(data['end_name']!, _endNameMeta),
      );
    } else if (isInserting) {
      context.missing(_endNameMeta);
    }
    if (data.containsKey('distance_meters')) {
      context.handle(
        _distanceMetersMeta,
        distanceMeters.isAcceptableOrUnknown(
          data['distance_meters']!,
          _distanceMetersMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_distanceMetersMeta);
    }
    if (data.containsKey('bidirectional')) {
      context.handle(
        _bidirectionalMeta,
        bidirectional.isAcceptableOrUnknown(
          data['bidirectional']!,
          _bidirectionalMeta,
        ),
      );
    }
    if (data.containsKey('route_corridor_meters')) {
      context.handle(
        _routeCorridorMetersMeta,
        routeCorridorMeters.isAcceptableOrUnknown(
          data['route_corridor_meters']!,
          _routeCorridorMetersMeta,
        ),
      );
    }
    if (data.containsKey('encoded_points')) {
      context.handle(
        _encodedPointsMeta,
        encodedPoints.isAcceptableOrUnknown(
          data['encoded_points']!,
          _encodedPointsMeta,
        ),
      );
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Route map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Route(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      institutionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}institution_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      startName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}start_name'],
      )!,
      endName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}end_name'],
      )!,
      distanceMeters: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}distance_meters'],
      )!,
      bidirectional: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}bidirectional'],
      )!,
      routeCorridorMeters: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}route_corridor_meters'],
      )!,
      encodedPoints: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}encoded_points'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
    );
  }

  @override
  $RoutesTable createAlias(String alias) {
    return $RoutesTable(attachedDatabase, alias);
  }
}

class Route extends DataClass implements Insertable<Route> {
  final String id;
  final String institutionId;
  final String name;
  final String startName;
  final String endName;
  final int distanceMeters;
  final bool bidirectional;
  final double routeCorridorMeters;
  final String encodedPoints;
  final bool active;
  const Route({
    required this.id,
    required this.institutionId,
    required this.name,
    required this.startName,
    required this.endName,
    required this.distanceMeters,
    required this.bidirectional,
    required this.routeCorridorMeters,
    required this.encodedPoints,
    required this.active,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['institution_id'] = Variable<String>(institutionId);
    map['name'] = Variable<String>(name);
    map['start_name'] = Variable<String>(startName);
    map['end_name'] = Variable<String>(endName);
    map['distance_meters'] = Variable<int>(distanceMeters);
    map['bidirectional'] = Variable<bool>(bidirectional);
    map['route_corridor_meters'] = Variable<double>(routeCorridorMeters);
    map['encoded_points'] = Variable<String>(encodedPoints);
    map['active'] = Variable<bool>(active);
    return map;
  }

  RoutesCompanion toCompanion(bool nullToAbsent) {
    return RoutesCompanion(
      id: Value(id),
      institutionId: Value(institutionId),
      name: Value(name),
      startName: Value(startName),
      endName: Value(endName),
      distanceMeters: Value(distanceMeters),
      bidirectional: Value(bidirectional),
      routeCorridorMeters: Value(routeCorridorMeters),
      encodedPoints: Value(encodedPoints),
      active: Value(active),
    );
  }

  factory Route.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Route(
      id: serializer.fromJson<String>(json['id']),
      institutionId: serializer.fromJson<String>(json['institutionId']),
      name: serializer.fromJson<String>(json['name']),
      startName: serializer.fromJson<String>(json['startName']),
      endName: serializer.fromJson<String>(json['endName']),
      distanceMeters: serializer.fromJson<int>(json['distanceMeters']),
      bidirectional: serializer.fromJson<bool>(json['bidirectional']),
      routeCorridorMeters: serializer.fromJson<double>(
        json['routeCorridorMeters'],
      ),
      encodedPoints: serializer.fromJson<String>(json['encodedPoints']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'institutionId': serializer.toJson<String>(institutionId),
      'name': serializer.toJson<String>(name),
      'startName': serializer.toJson<String>(startName),
      'endName': serializer.toJson<String>(endName),
      'distanceMeters': serializer.toJson<int>(distanceMeters),
      'bidirectional': serializer.toJson<bool>(bidirectional),
      'routeCorridorMeters': serializer.toJson<double>(routeCorridorMeters),
      'encodedPoints': serializer.toJson<String>(encodedPoints),
      'active': serializer.toJson<bool>(active),
    };
  }

  Route copyWith({
    String? id,
    String? institutionId,
    String? name,
    String? startName,
    String? endName,
    int? distanceMeters,
    bool? bidirectional,
    double? routeCorridorMeters,
    String? encodedPoints,
    bool? active,
  }) => Route(
    id: id ?? this.id,
    institutionId: institutionId ?? this.institutionId,
    name: name ?? this.name,
    startName: startName ?? this.startName,
    endName: endName ?? this.endName,
    distanceMeters: distanceMeters ?? this.distanceMeters,
    bidirectional: bidirectional ?? this.bidirectional,
    routeCorridorMeters: routeCorridorMeters ?? this.routeCorridorMeters,
    encodedPoints: encodedPoints ?? this.encodedPoints,
    active: active ?? this.active,
  );
  Route copyWithCompanion(RoutesCompanion data) {
    return Route(
      id: data.id.present ? data.id.value : this.id,
      institutionId: data.institutionId.present
          ? data.institutionId.value
          : this.institutionId,
      name: data.name.present ? data.name.value : this.name,
      startName: data.startName.present ? data.startName.value : this.startName,
      endName: data.endName.present ? data.endName.value : this.endName,
      distanceMeters: data.distanceMeters.present
          ? data.distanceMeters.value
          : this.distanceMeters,
      bidirectional: data.bidirectional.present
          ? data.bidirectional.value
          : this.bidirectional,
      routeCorridorMeters: data.routeCorridorMeters.present
          ? data.routeCorridorMeters.value
          : this.routeCorridorMeters,
      encodedPoints: data.encodedPoints.present
          ? data.encodedPoints.value
          : this.encodedPoints,
      active: data.active.present ? data.active.value : this.active,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Route(')
          ..write('id: $id, ')
          ..write('institutionId: $institutionId, ')
          ..write('name: $name, ')
          ..write('startName: $startName, ')
          ..write('endName: $endName, ')
          ..write('distanceMeters: $distanceMeters, ')
          ..write('bidirectional: $bidirectional, ')
          ..write('routeCorridorMeters: $routeCorridorMeters, ')
          ..write('encodedPoints: $encodedPoints, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    institutionId,
    name,
    startName,
    endName,
    distanceMeters,
    bidirectional,
    routeCorridorMeters,
    encodedPoints,
    active,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Route &&
          other.id == this.id &&
          other.institutionId == this.institutionId &&
          other.name == this.name &&
          other.startName == this.startName &&
          other.endName == this.endName &&
          other.distanceMeters == this.distanceMeters &&
          other.bidirectional == this.bidirectional &&
          other.routeCorridorMeters == this.routeCorridorMeters &&
          other.encodedPoints == this.encodedPoints &&
          other.active == this.active);
}

class RoutesCompanion extends UpdateCompanion<Route> {
  final Value<String> id;
  final Value<String> institutionId;
  final Value<String> name;
  final Value<String> startName;
  final Value<String> endName;
  final Value<int> distanceMeters;
  final Value<bool> bidirectional;
  final Value<double> routeCorridorMeters;
  final Value<String> encodedPoints;
  final Value<bool> active;
  final Value<int> rowid;
  const RoutesCompanion({
    this.id = const Value.absent(),
    this.institutionId = const Value.absent(),
    this.name = const Value.absent(),
    this.startName = const Value.absent(),
    this.endName = const Value.absent(),
    this.distanceMeters = const Value.absent(),
    this.bidirectional = const Value.absent(),
    this.routeCorridorMeters = const Value.absent(),
    this.encodedPoints = const Value.absent(),
    this.active = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoutesCompanion.insert({
    required String id,
    required String institutionId,
    required String name,
    required String startName,
    required String endName,
    required int distanceMeters,
    this.bidirectional = const Value.absent(),
    this.routeCorridorMeters = const Value.absent(),
    this.encodedPoints = const Value.absent(),
    this.active = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       institutionId = Value(institutionId),
       name = Value(name),
       startName = Value(startName),
       endName = Value(endName),
       distanceMeters = Value(distanceMeters);
  static Insertable<Route> custom({
    Expression<String>? id,
    Expression<String>? institutionId,
    Expression<String>? name,
    Expression<String>? startName,
    Expression<String>? endName,
    Expression<int>? distanceMeters,
    Expression<bool>? bidirectional,
    Expression<double>? routeCorridorMeters,
    Expression<String>? encodedPoints,
    Expression<bool>? active,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (institutionId != null) 'institution_id': institutionId,
      if (name != null) 'name': name,
      if (startName != null) 'start_name': startName,
      if (endName != null) 'end_name': endName,
      if (distanceMeters != null) 'distance_meters': distanceMeters,
      if (bidirectional != null) 'bidirectional': bidirectional,
      if (routeCorridorMeters != null)
        'route_corridor_meters': routeCorridorMeters,
      if (encodedPoints != null) 'encoded_points': encodedPoints,
      if (active != null) 'active': active,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoutesCompanion copyWith({
    Value<String>? id,
    Value<String>? institutionId,
    Value<String>? name,
    Value<String>? startName,
    Value<String>? endName,
    Value<int>? distanceMeters,
    Value<bool>? bidirectional,
    Value<double>? routeCorridorMeters,
    Value<String>? encodedPoints,
    Value<bool>? active,
    Value<int>? rowid,
  }) {
    return RoutesCompanion(
      id: id ?? this.id,
      institutionId: institutionId ?? this.institutionId,
      name: name ?? this.name,
      startName: startName ?? this.startName,
      endName: endName ?? this.endName,
      distanceMeters: distanceMeters ?? this.distanceMeters,
      bidirectional: bidirectional ?? this.bidirectional,
      routeCorridorMeters: routeCorridorMeters ?? this.routeCorridorMeters,
      encodedPoints: encodedPoints ?? this.encodedPoints,
      active: active ?? this.active,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (institutionId.present) {
      map['institution_id'] = Variable<String>(institutionId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (startName.present) {
      map['start_name'] = Variable<String>(startName.value);
    }
    if (endName.present) {
      map['end_name'] = Variable<String>(endName.value);
    }
    if (distanceMeters.present) {
      map['distance_meters'] = Variable<int>(distanceMeters.value);
    }
    if (bidirectional.present) {
      map['bidirectional'] = Variable<bool>(bidirectional.value);
    }
    if (routeCorridorMeters.present) {
      map['route_corridor_meters'] = Variable<double>(
        routeCorridorMeters.value,
      );
    }
    if (encodedPoints.present) {
      map['encoded_points'] = Variable<String>(encodedPoints.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutesCompanion(')
          ..write('id: $id, ')
          ..write('institutionId: $institutionId, ')
          ..write('name: $name, ')
          ..write('startName: $startName, ')
          ..write('endName: $endName, ')
          ..write('distanceMeters: $distanceMeters, ')
          ..write('bidirectional: $bidirectional, ')
          ..write('routeCorridorMeters: $routeCorridorMeters, ')
          ..write('encodedPoints: $encodedPoints, ')
          ..write('active: $active, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RouteStopsTable extends RouteStops
    with TableInfo<$RouteStopsTable, RouteStop> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RouteStopsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _routeIdMeta = const VerificationMeta(
    'routeId',
  );
  @override
  late final GeneratedColumn<String> routeId = GeneratedColumn<String>(
    'route_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES routes (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stopOrderMeta = const VerificationMeta(
    'stopOrder',
  );
  @override
  late final GeneratedColumn<int> stopOrder = GeneratedColumn<int>(
    'stop_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _routeProgressMeta = const VerificationMeta(
    'routeProgress',
  );
  @override
  late final GeneratedColumn<double> routeProgress = GeneratedColumn<double>(
    'route_progress',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    routeId,
    name,
    latitude,
    longitude,
    stopOrder,
    routeProgress,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'route_stops';
  @override
  VerificationContext validateIntegrity(
    Insertable<RouteStop> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('route_id')) {
      context.handle(
        _routeIdMeta,
        routeId.isAcceptableOrUnknown(data['route_id']!, _routeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_routeIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('stop_order')) {
      context.handle(
        _stopOrderMeta,
        stopOrder.isAcceptableOrUnknown(data['stop_order']!, _stopOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_stopOrderMeta);
    }
    if (data.containsKey('route_progress')) {
      context.handle(
        _routeProgressMeta,
        routeProgress.isAcceptableOrUnknown(
          data['route_progress']!,
          _routeProgressMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RouteStop map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RouteStop(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      routeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}route_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      stopOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stop_order'],
      )!,
      routeProgress: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}route_progress'],
      )!,
    );
  }

  @override
  $RouteStopsTable createAlias(String alias) {
    return $RouteStopsTable(attachedDatabase, alias);
  }
}

class RouteStop extends DataClass implements Insertable<RouteStop> {
  final String id;
  final String routeId;
  final String name;
  final double latitude;
  final double longitude;
  final int stopOrder;
  final double routeProgress;
  const RouteStop({
    required this.id,
    required this.routeId,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.stopOrder,
    required this.routeProgress,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['route_id'] = Variable<String>(routeId);
    map['name'] = Variable<String>(name);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['stop_order'] = Variable<int>(stopOrder);
    map['route_progress'] = Variable<double>(routeProgress);
    return map;
  }

  RouteStopsCompanion toCompanion(bool nullToAbsent) {
    return RouteStopsCompanion(
      id: Value(id),
      routeId: Value(routeId),
      name: Value(name),
      latitude: Value(latitude),
      longitude: Value(longitude),
      stopOrder: Value(stopOrder),
      routeProgress: Value(routeProgress),
    );
  }

  factory RouteStop.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RouteStop(
      id: serializer.fromJson<String>(json['id']),
      routeId: serializer.fromJson<String>(json['routeId']),
      name: serializer.fromJson<String>(json['name']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      stopOrder: serializer.fromJson<int>(json['stopOrder']),
      routeProgress: serializer.fromJson<double>(json['routeProgress']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'routeId': serializer.toJson<String>(routeId),
      'name': serializer.toJson<String>(name),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'stopOrder': serializer.toJson<int>(stopOrder),
      'routeProgress': serializer.toJson<double>(routeProgress),
    };
  }

  RouteStop copyWith({
    String? id,
    String? routeId,
    String? name,
    double? latitude,
    double? longitude,
    int? stopOrder,
    double? routeProgress,
  }) => RouteStop(
    id: id ?? this.id,
    routeId: routeId ?? this.routeId,
    name: name ?? this.name,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    stopOrder: stopOrder ?? this.stopOrder,
    routeProgress: routeProgress ?? this.routeProgress,
  );
  RouteStop copyWithCompanion(RouteStopsCompanion data) {
    return RouteStop(
      id: data.id.present ? data.id.value : this.id,
      routeId: data.routeId.present ? data.routeId.value : this.routeId,
      name: data.name.present ? data.name.value : this.name,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      stopOrder: data.stopOrder.present ? data.stopOrder.value : this.stopOrder,
      routeProgress: data.routeProgress.present
          ? data.routeProgress.value
          : this.routeProgress,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RouteStop(')
          ..write('id: $id, ')
          ..write('routeId: $routeId, ')
          ..write('name: $name, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('stopOrder: $stopOrder, ')
          ..write('routeProgress: $routeProgress')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    routeId,
    name,
    latitude,
    longitude,
    stopOrder,
    routeProgress,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RouteStop &&
          other.id == this.id &&
          other.routeId == this.routeId &&
          other.name == this.name &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.stopOrder == this.stopOrder &&
          other.routeProgress == this.routeProgress);
}

class RouteStopsCompanion extends UpdateCompanion<RouteStop> {
  final Value<String> id;
  final Value<String> routeId;
  final Value<String> name;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<int> stopOrder;
  final Value<double> routeProgress;
  final Value<int> rowid;
  const RouteStopsCompanion({
    this.id = const Value.absent(),
    this.routeId = const Value.absent(),
    this.name = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.stopOrder = const Value.absent(),
    this.routeProgress = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RouteStopsCompanion.insert({
    required String id,
    required String routeId,
    required String name,
    required double latitude,
    required double longitude,
    required int stopOrder,
    this.routeProgress = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       routeId = Value(routeId),
       name = Value(name),
       latitude = Value(latitude),
       longitude = Value(longitude),
       stopOrder = Value(stopOrder);
  static Insertable<RouteStop> custom({
    Expression<String>? id,
    Expression<String>? routeId,
    Expression<String>? name,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<int>? stopOrder,
    Expression<double>? routeProgress,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (routeId != null) 'route_id': routeId,
      if (name != null) 'name': name,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (stopOrder != null) 'stop_order': stopOrder,
      if (routeProgress != null) 'route_progress': routeProgress,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RouteStopsCompanion copyWith({
    Value<String>? id,
    Value<String>? routeId,
    Value<String>? name,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<int>? stopOrder,
    Value<double>? routeProgress,
    Value<int>? rowid,
  }) {
    return RouteStopsCompanion(
      id: id ?? this.id,
      routeId: routeId ?? this.routeId,
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      stopOrder: stopOrder ?? this.stopOrder,
      routeProgress: routeProgress ?? this.routeProgress,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (routeId.present) {
      map['route_id'] = Variable<String>(routeId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (stopOrder.present) {
      map['stop_order'] = Variable<int>(stopOrder.value);
    }
    if (routeProgress.present) {
      map['route_progress'] = Variable<double>(routeProgress.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RouteStopsCompanion(')
          ..write('id: $id, ')
          ..write('routeId: $routeId, ')
          ..write('name: $name, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('stopOrder: $stopOrder, ')
          ..write('routeProgress: $routeProgress, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BusSchedulesTable extends BusSchedules
    with TableInfo<$BusSchedulesTable, BusSchedule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BusSchedulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _institutionIdMeta = const VerificationMeta(
    'institutionId',
  );
  @override
  late final GeneratedColumn<String> institutionId = GeneratedColumn<String>(
    'institution_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES institutions (id)',
    ),
  );
  static const VerificationMeta _expectedBusIdMeta = const VerificationMeta(
    'expectedBusId',
  );
  @override
  late final GeneratedColumn<String> expectedBusId = GeneratedColumn<String>(
    'expected_bus_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _expectedRouteIdMeta = const VerificationMeta(
    'expectedRouteId',
  );
  @override
  late final GeneratedColumn<String> expectedRouteId = GeneratedColumn<String>(
    'expected_route_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _departureTimeMeta = const VerificationMeta(
    'departureTime',
  );
  @override
  late final GeneratedColumn<String> departureTime = GeneratedColumn<String>(
    'departure_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weekDaysMeta = const VerificationMeta(
    'weekDays',
  );
  @override
  late final GeneratedColumn<int> weekDays = GeneratedColumn<int>(
    'week_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(127),
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    institutionId,
    expectedBusId,
    expectedRouteId,
    label,
    departureTime,
    weekDays,
    active,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bus_schedules';
  @override
  VerificationContext validateIntegrity(
    Insertable<BusSchedule> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('institution_id')) {
      context.handle(
        _institutionIdMeta,
        institutionId.isAcceptableOrUnknown(
          data['institution_id']!,
          _institutionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_institutionIdMeta);
    }
    if (data.containsKey('expected_bus_id')) {
      context.handle(
        _expectedBusIdMeta,
        expectedBusId.isAcceptableOrUnknown(
          data['expected_bus_id']!,
          _expectedBusIdMeta,
        ),
      );
    }
    if (data.containsKey('expected_route_id')) {
      context.handle(
        _expectedRouteIdMeta,
        expectedRouteId.isAcceptableOrUnknown(
          data['expected_route_id']!,
          _expectedRouteIdMeta,
        ),
      );
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('departure_time')) {
      context.handle(
        _departureTimeMeta,
        departureTime.isAcceptableOrUnknown(
          data['departure_time']!,
          _departureTimeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_departureTimeMeta);
    }
    if (data.containsKey('week_days')) {
      context.handle(
        _weekDaysMeta,
        weekDays.isAcceptableOrUnknown(data['week_days']!, _weekDaysMeta),
      );
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BusSchedule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BusSchedule(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      institutionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}institution_id'],
      )!,
      expectedBusId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}expected_bus_id'],
      ),
      expectedRouteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}expected_route_id'],
      ),
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      departureTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}departure_time'],
      )!,
      weekDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}week_days'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
    );
  }

  @override
  $BusSchedulesTable createAlias(String alias) {
    return $BusSchedulesTable(attachedDatabase, alias);
  }
}

class BusSchedule extends DataClass implements Insertable<BusSchedule> {
  final String id;
  final String institutionId;
  final String? expectedBusId;
  final String? expectedRouteId;
  final String label;
  final String departureTime;
  final int weekDays;
  final bool active;
  const BusSchedule({
    required this.id,
    required this.institutionId,
    this.expectedBusId,
    this.expectedRouteId,
    required this.label,
    required this.departureTime,
    required this.weekDays,
    required this.active,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['institution_id'] = Variable<String>(institutionId);
    if (!nullToAbsent || expectedBusId != null) {
      map['expected_bus_id'] = Variable<String>(expectedBusId);
    }
    if (!nullToAbsent || expectedRouteId != null) {
      map['expected_route_id'] = Variable<String>(expectedRouteId);
    }
    map['label'] = Variable<String>(label);
    map['departure_time'] = Variable<String>(departureTime);
    map['week_days'] = Variable<int>(weekDays);
    map['active'] = Variable<bool>(active);
    return map;
  }

  BusSchedulesCompanion toCompanion(bool nullToAbsent) {
    return BusSchedulesCompanion(
      id: Value(id),
      institutionId: Value(institutionId),
      expectedBusId: expectedBusId == null && nullToAbsent
          ? const Value.absent()
          : Value(expectedBusId),
      expectedRouteId: expectedRouteId == null && nullToAbsent
          ? const Value.absent()
          : Value(expectedRouteId),
      label: Value(label),
      departureTime: Value(departureTime),
      weekDays: Value(weekDays),
      active: Value(active),
    );
  }

  factory BusSchedule.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BusSchedule(
      id: serializer.fromJson<String>(json['id']),
      institutionId: serializer.fromJson<String>(json['institutionId']),
      expectedBusId: serializer.fromJson<String?>(json['expectedBusId']),
      expectedRouteId: serializer.fromJson<String?>(json['expectedRouteId']),
      label: serializer.fromJson<String>(json['label']),
      departureTime: serializer.fromJson<String>(json['departureTime']),
      weekDays: serializer.fromJson<int>(json['weekDays']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'institutionId': serializer.toJson<String>(institutionId),
      'expectedBusId': serializer.toJson<String?>(expectedBusId),
      'expectedRouteId': serializer.toJson<String?>(expectedRouteId),
      'label': serializer.toJson<String>(label),
      'departureTime': serializer.toJson<String>(departureTime),
      'weekDays': serializer.toJson<int>(weekDays),
      'active': serializer.toJson<bool>(active),
    };
  }

  BusSchedule copyWith({
    String? id,
    String? institutionId,
    Value<String?> expectedBusId = const Value.absent(),
    Value<String?> expectedRouteId = const Value.absent(),
    String? label,
    String? departureTime,
    int? weekDays,
    bool? active,
  }) => BusSchedule(
    id: id ?? this.id,
    institutionId: institutionId ?? this.institutionId,
    expectedBusId: expectedBusId.present
        ? expectedBusId.value
        : this.expectedBusId,
    expectedRouteId: expectedRouteId.present
        ? expectedRouteId.value
        : this.expectedRouteId,
    label: label ?? this.label,
    departureTime: departureTime ?? this.departureTime,
    weekDays: weekDays ?? this.weekDays,
    active: active ?? this.active,
  );
  BusSchedule copyWithCompanion(BusSchedulesCompanion data) {
    return BusSchedule(
      id: data.id.present ? data.id.value : this.id,
      institutionId: data.institutionId.present
          ? data.institutionId.value
          : this.institutionId,
      expectedBusId: data.expectedBusId.present
          ? data.expectedBusId.value
          : this.expectedBusId,
      expectedRouteId: data.expectedRouteId.present
          ? data.expectedRouteId.value
          : this.expectedRouteId,
      label: data.label.present ? data.label.value : this.label,
      departureTime: data.departureTime.present
          ? data.departureTime.value
          : this.departureTime,
      weekDays: data.weekDays.present ? data.weekDays.value : this.weekDays,
      active: data.active.present ? data.active.value : this.active,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BusSchedule(')
          ..write('id: $id, ')
          ..write('institutionId: $institutionId, ')
          ..write('expectedBusId: $expectedBusId, ')
          ..write('expectedRouteId: $expectedRouteId, ')
          ..write('label: $label, ')
          ..write('departureTime: $departureTime, ')
          ..write('weekDays: $weekDays, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    institutionId,
    expectedBusId,
    expectedRouteId,
    label,
    departureTime,
    weekDays,
    active,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BusSchedule &&
          other.id == this.id &&
          other.institutionId == this.institutionId &&
          other.expectedBusId == this.expectedBusId &&
          other.expectedRouteId == this.expectedRouteId &&
          other.label == this.label &&
          other.departureTime == this.departureTime &&
          other.weekDays == this.weekDays &&
          other.active == this.active);
}

class BusSchedulesCompanion extends UpdateCompanion<BusSchedule> {
  final Value<String> id;
  final Value<String> institutionId;
  final Value<String?> expectedBusId;
  final Value<String?> expectedRouteId;
  final Value<String> label;
  final Value<String> departureTime;
  final Value<int> weekDays;
  final Value<bool> active;
  final Value<int> rowid;
  const BusSchedulesCompanion({
    this.id = const Value.absent(),
    this.institutionId = const Value.absent(),
    this.expectedBusId = const Value.absent(),
    this.expectedRouteId = const Value.absent(),
    this.label = const Value.absent(),
    this.departureTime = const Value.absent(),
    this.weekDays = const Value.absent(),
    this.active = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BusSchedulesCompanion.insert({
    required String id,
    required String institutionId,
    this.expectedBusId = const Value.absent(),
    this.expectedRouteId = const Value.absent(),
    required String label,
    required String departureTime,
    this.weekDays = const Value.absent(),
    this.active = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       institutionId = Value(institutionId),
       label = Value(label),
       departureTime = Value(departureTime);
  static Insertable<BusSchedule> custom({
    Expression<String>? id,
    Expression<String>? institutionId,
    Expression<String>? expectedBusId,
    Expression<String>? expectedRouteId,
    Expression<String>? label,
    Expression<String>? departureTime,
    Expression<int>? weekDays,
    Expression<bool>? active,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (institutionId != null) 'institution_id': institutionId,
      if (expectedBusId != null) 'expected_bus_id': expectedBusId,
      if (expectedRouteId != null) 'expected_route_id': expectedRouteId,
      if (label != null) 'label': label,
      if (departureTime != null) 'departure_time': departureTime,
      if (weekDays != null) 'week_days': weekDays,
      if (active != null) 'active': active,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BusSchedulesCompanion copyWith({
    Value<String>? id,
    Value<String>? institutionId,
    Value<String?>? expectedBusId,
    Value<String?>? expectedRouteId,
    Value<String>? label,
    Value<String>? departureTime,
    Value<int>? weekDays,
    Value<bool>? active,
    Value<int>? rowid,
  }) {
    return BusSchedulesCompanion(
      id: id ?? this.id,
      institutionId: institutionId ?? this.institutionId,
      expectedBusId: expectedBusId ?? this.expectedBusId,
      expectedRouteId: expectedRouteId ?? this.expectedRouteId,
      label: label ?? this.label,
      departureTime: departureTime ?? this.departureTime,
      weekDays: weekDays ?? this.weekDays,
      active: active ?? this.active,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (institutionId.present) {
      map['institution_id'] = Variable<String>(institutionId.value);
    }
    if (expectedBusId.present) {
      map['expected_bus_id'] = Variable<String>(expectedBusId.value);
    }
    if (expectedRouteId.present) {
      map['expected_route_id'] = Variable<String>(expectedRouteId.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (departureTime.present) {
      map['departure_time'] = Variable<String>(departureTime.value);
    }
    if (weekDays.present) {
      map['week_days'] = Variable<int>(weekDays.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BusSchedulesCompanion(')
          ..write('id: $id, ')
          ..write('institutionId: $institutionId, ')
          ..write('expectedBusId: $expectedBusId, ')
          ..write('expectedRouteId: $expectedRouteId, ')
          ..write('label: $label, ')
          ..write('departureTime: $departureTime, ')
          ..write('weekDays: $weekDays, ')
          ..write('active: $active, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedBusStatusesTable extends CachedBusStatuses
    with TableInfo<$CachedBusStatusesTable, CachedBusStatuse> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedBusStatusesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _busIdMeta = const VerificationMeta('busId');
  @override
  late final GeneratedColumn<String> busId = GeneratedColumn<String>(
    'bus_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isLiveMeta = const VerificationMeta('isLive');
  @override
  late final GeneratedColumn<bool> isLive = GeneratedColumn<bool>(
    'is_live',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_live" IN (0, 1))',
    ),
  );
  static const VerificationMeta _detectedRouteIdMeta = const VerificationMeta(
    'detectedRouteId',
  );
  @override
  late final GeneratedColumn<String> detectedRouteId = GeneratedColumn<String>(
    'detected_route_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _directionMeta = const VerificationMeta(
    'direction',
  );
  @override
  late final GeneratedColumn<String> direction = GeneratedColumn<String>(
    'direction',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('UNKNOWN'),
  );
  static const VerificationMeta _nearestStopMeta = const VerificationMeta(
    'nearestStop',
  );
  @override
  late final GeneratedColumn<String> nearestStop = GeneratedColumn<String>(
    'nearest_stop',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _confidenceMeta = const VerificationMeta(
    'confidence',
  );
  @override
  late final GeneratedColumn<String> confidence = GeneratedColumn<String>(
    'confidence',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('LOW'),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    busId,
    isLive,
    detectedRouteId,
    direction,
    nearestStop,
    confidence,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_bus_statuses';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedBusStatuse> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('bus_id')) {
      context.handle(
        _busIdMeta,
        busId.isAcceptableOrUnknown(data['bus_id']!, _busIdMeta),
      );
    } else if (isInserting) {
      context.missing(_busIdMeta);
    }
    if (data.containsKey('is_live')) {
      context.handle(
        _isLiveMeta,
        isLive.isAcceptableOrUnknown(data['is_live']!, _isLiveMeta),
      );
    } else if (isInserting) {
      context.missing(_isLiveMeta);
    }
    if (data.containsKey('detected_route_id')) {
      context.handle(
        _detectedRouteIdMeta,
        detectedRouteId.isAcceptableOrUnknown(
          data['detected_route_id']!,
          _detectedRouteIdMeta,
        ),
      );
    }
    if (data.containsKey('direction')) {
      context.handle(
        _directionMeta,
        direction.isAcceptableOrUnknown(data['direction']!, _directionMeta),
      );
    }
    if (data.containsKey('nearest_stop')) {
      context.handle(
        _nearestStopMeta,
        nearestStop.isAcceptableOrUnknown(
          data['nearest_stop']!,
          _nearestStopMeta,
        ),
      );
    }
    if (data.containsKey('confidence')) {
      context.handle(
        _confidenceMeta,
        confidence.isAcceptableOrUnknown(data['confidence']!, _confidenceMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {busId};
  @override
  CachedBusStatuse map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedBusStatuse(
      busId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bus_id'],
      )!,
      isLive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_live'],
      )!,
      detectedRouteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}detected_route_id'],
      ),
      direction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}direction'],
      )!,
      nearestStop: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nearest_stop'],
      ),
      confidence: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}confidence'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CachedBusStatusesTable createAlias(String alias) {
    return $CachedBusStatusesTable(attachedDatabase, alias);
  }
}

class CachedBusStatuse extends DataClass
    implements Insertable<CachedBusStatuse> {
  final String busId;
  final bool isLive;
  final String? detectedRouteId;
  final String direction;
  final String? nearestStop;
  final String confidence;
  final DateTime updatedAt;
  const CachedBusStatuse({
    required this.busId,
    required this.isLive,
    this.detectedRouteId,
    required this.direction,
    this.nearestStop,
    required this.confidence,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['bus_id'] = Variable<String>(busId);
    map['is_live'] = Variable<bool>(isLive);
    if (!nullToAbsent || detectedRouteId != null) {
      map['detected_route_id'] = Variable<String>(detectedRouteId);
    }
    map['direction'] = Variable<String>(direction);
    if (!nullToAbsent || nearestStop != null) {
      map['nearest_stop'] = Variable<String>(nearestStop);
    }
    map['confidence'] = Variable<String>(confidence);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CachedBusStatusesCompanion toCompanion(bool nullToAbsent) {
    return CachedBusStatusesCompanion(
      busId: Value(busId),
      isLive: Value(isLive),
      detectedRouteId: detectedRouteId == null && nullToAbsent
          ? const Value.absent()
          : Value(detectedRouteId),
      direction: Value(direction),
      nearestStop: nearestStop == null && nullToAbsent
          ? const Value.absent()
          : Value(nearestStop),
      confidence: Value(confidence),
      updatedAt: Value(updatedAt),
    );
  }

  factory CachedBusStatuse.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedBusStatuse(
      busId: serializer.fromJson<String>(json['busId']),
      isLive: serializer.fromJson<bool>(json['isLive']),
      detectedRouteId: serializer.fromJson<String?>(json['detectedRouteId']),
      direction: serializer.fromJson<String>(json['direction']),
      nearestStop: serializer.fromJson<String?>(json['nearestStop']),
      confidence: serializer.fromJson<String>(json['confidence']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'busId': serializer.toJson<String>(busId),
      'isLive': serializer.toJson<bool>(isLive),
      'detectedRouteId': serializer.toJson<String?>(detectedRouteId),
      'direction': serializer.toJson<String>(direction),
      'nearestStop': serializer.toJson<String?>(nearestStop),
      'confidence': serializer.toJson<String>(confidence),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CachedBusStatuse copyWith({
    String? busId,
    bool? isLive,
    Value<String?> detectedRouteId = const Value.absent(),
    String? direction,
    Value<String?> nearestStop = const Value.absent(),
    String? confidence,
    DateTime? updatedAt,
  }) => CachedBusStatuse(
    busId: busId ?? this.busId,
    isLive: isLive ?? this.isLive,
    detectedRouteId: detectedRouteId.present
        ? detectedRouteId.value
        : this.detectedRouteId,
    direction: direction ?? this.direction,
    nearestStop: nearestStop.present ? nearestStop.value : this.nearestStop,
    confidence: confidence ?? this.confidence,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CachedBusStatuse copyWithCompanion(CachedBusStatusesCompanion data) {
    return CachedBusStatuse(
      busId: data.busId.present ? data.busId.value : this.busId,
      isLive: data.isLive.present ? data.isLive.value : this.isLive,
      detectedRouteId: data.detectedRouteId.present
          ? data.detectedRouteId.value
          : this.detectedRouteId,
      direction: data.direction.present ? data.direction.value : this.direction,
      nearestStop: data.nearestStop.present
          ? data.nearestStop.value
          : this.nearestStop,
      confidence: data.confidence.present
          ? data.confidence.value
          : this.confidence,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedBusStatuse(')
          ..write('busId: $busId, ')
          ..write('isLive: $isLive, ')
          ..write('detectedRouteId: $detectedRouteId, ')
          ..write('direction: $direction, ')
          ..write('nearestStop: $nearestStop, ')
          ..write('confidence: $confidence, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    busId,
    isLive,
    detectedRouteId,
    direction,
    nearestStop,
    confidence,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedBusStatuse &&
          other.busId == this.busId &&
          other.isLive == this.isLive &&
          other.detectedRouteId == this.detectedRouteId &&
          other.direction == this.direction &&
          other.nearestStop == this.nearestStop &&
          other.confidence == this.confidence &&
          other.updatedAt == this.updatedAt);
}

class CachedBusStatusesCompanion extends UpdateCompanion<CachedBusStatuse> {
  final Value<String> busId;
  final Value<bool> isLive;
  final Value<String?> detectedRouteId;
  final Value<String> direction;
  final Value<String?> nearestStop;
  final Value<String> confidence;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CachedBusStatusesCompanion({
    this.busId = const Value.absent(),
    this.isLive = const Value.absent(),
    this.detectedRouteId = const Value.absent(),
    this.direction = const Value.absent(),
    this.nearestStop = const Value.absent(),
    this.confidence = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedBusStatusesCompanion.insert({
    required String busId,
    required bool isLive,
    this.detectedRouteId = const Value.absent(),
    this.direction = const Value.absent(),
    this.nearestStop = const Value.absent(),
    this.confidence = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : busId = Value(busId),
       isLive = Value(isLive),
       updatedAt = Value(updatedAt);
  static Insertable<CachedBusStatuse> custom({
    Expression<String>? busId,
    Expression<bool>? isLive,
    Expression<String>? detectedRouteId,
    Expression<String>? direction,
    Expression<String>? nearestStop,
    Expression<String>? confidence,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (busId != null) 'bus_id': busId,
      if (isLive != null) 'is_live': isLive,
      if (detectedRouteId != null) 'detected_route_id': detectedRouteId,
      if (direction != null) 'direction': direction,
      if (nearestStop != null) 'nearest_stop': nearestStop,
      if (confidence != null) 'confidence': confidence,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedBusStatusesCompanion copyWith({
    Value<String>? busId,
    Value<bool>? isLive,
    Value<String?>? detectedRouteId,
    Value<String>? direction,
    Value<String?>? nearestStop,
    Value<String>? confidence,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return CachedBusStatusesCompanion(
      busId: busId ?? this.busId,
      isLive: isLive ?? this.isLive,
      detectedRouteId: detectedRouteId ?? this.detectedRouteId,
      direction: direction ?? this.direction,
      nearestStop: nearestStop ?? this.nearestStop,
      confidence: confidence ?? this.confidence,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (busId.present) {
      map['bus_id'] = Variable<String>(busId.value);
    }
    if (isLive.present) {
      map['is_live'] = Variable<bool>(isLive.value);
    }
    if (detectedRouteId.present) {
      map['detected_route_id'] = Variable<String>(detectedRouteId.value);
    }
    if (direction.present) {
      map['direction'] = Variable<String>(direction.value);
    }
    if (nearestStop.present) {
      map['nearest_stop'] = Variable<String>(nearestStop.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<String>(confidence.value);
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
    return (StringBuffer('CachedBusStatusesCompanion(')
          ..write('busId: $busId, ')
          ..write('isLive: $isLive, ')
          ..write('detectedRouteId: $detectedRouteId, ')
          ..write('direction: $direction, ')
          ..write('nearestStop: $nearestStop, ')
          ..write('confidence: $confidence, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WalletsTable extends Wallets with TableInfo<$WalletsTable, Wallet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WalletsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tokensMeta = const VerificationMeta('tokens');
  @override
  late final GeneratedColumn<int> tokens = GeneratedColumn<int>(
    'tokens',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _premiumUntilMeta = const VerificationMeta(
    'premiumUntil',
  );
  @override
  late final GeneratedColumn<DateTime> premiumUntil = GeneratedColumn<DateTime>(
    'premium_until',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _freeTokensClaimedMeta = const VerificationMeta(
    'freeTokensClaimed',
  );
  @override
  late final GeneratedColumn<bool> freeTokensClaimed = GeneratedColumn<bool>(
    'free_tokens_claimed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("free_tokens_claimed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    userId,
    tokens,
    premiumUntil,
    freeTokensClaimed,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'wallets';
  @override
  VerificationContext validateIntegrity(
    Insertable<Wallet> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('tokens')) {
      context.handle(
        _tokensMeta,
        tokens.isAcceptableOrUnknown(data['tokens']!, _tokensMeta),
      );
    }
    if (data.containsKey('premium_until')) {
      context.handle(
        _premiumUntilMeta,
        premiumUntil.isAcceptableOrUnknown(
          data['premium_until']!,
          _premiumUntilMeta,
        ),
      );
    }
    if (data.containsKey('free_tokens_claimed')) {
      context.handle(
        _freeTokensClaimedMeta,
        freeTokensClaimed.isAcceptableOrUnknown(
          data['free_tokens_claimed']!,
          _freeTokensClaimedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  Wallet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Wallet(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      tokens: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tokens'],
      )!,
      premiumUntil: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}premium_until'],
      ),
      freeTokensClaimed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}free_tokens_claimed'],
      )!,
    );
  }

  @override
  $WalletsTable createAlias(String alias) {
    return $WalletsTable(attachedDatabase, alias);
  }
}

class Wallet extends DataClass implements Insertable<Wallet> {
  final String userId;
  final int tokens;
  final DateTime? premiumUntil;
  final bool freeTokensClaimed;
  const Wallet({
    required this.userId,
    required this.tokens,
    this.premiumUntil,
    required this.freeTokensClaimed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['tokens'] = Variable<int>(tokens);
    if (!nullToAbsent || premiumUntil != null) {
      map['premium_until'] = Variable<DateTime>(premiumUntil);
    }
    map['free_tokens_claimed'] = Variable<bool>(freeTokensClaimed);
    return map;
  }

  WalletsCompanion toCompanion(bool nullToAbsent) {
    return WalletsCompanion(
      userId: Value(userId),
      tokens: Value(tokens),
      premiumUntil: premiumUntil == null && nullToAbsent
          ? const Value.absent()
          : Value(premiumUntil),
      freeTokensClaimed: Value(freeTokensClaimed),
    );
  }

  factory Wallet.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Wallet(
      userId: serializer.fromJson<String>(json['userId']),
      tokens: serializer.fromJson<int>(json['tokens']),
      premiumUntil: serializer.fromJson<DateTime?>(json['premiumUntil']),
      freeTokensClaimed: serializer.fromJson<bool>(json['freeTokensClaimed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'tokens': serializer.toJson<int>(tokens),
      'premiumUntil': serializer.toJson<DateTime?>(premiumUntil),
      'freeTokensClaimed': serializer.toJson<bool>(freeTokensClaimed),
    };
  }

  Wallet copyWith({
    String? userId,
    int? tokens,
    Value<DateTime?> premiumUntil = const Value.absent(),
    bool? freeTokensClaimed,
  }) => Wallet(
    userId: userId ?? this.userId,
    tokens: tokens ?? this.tokens,
    premiumUntil: premiumUntil.present ? premiumUntil.value : this.premiumUntil,
    freeTokensClaimed: freeTokensClaimed ?? this.freeTokensClaimed,
  );
  Wallet copyWithCompanion(WalletsCompanion data) {
    return Wallet(
      userId: data.userId.present ? data.userId.value : this.userId,
      tokens: data.tokens.present ? data.tokens.value : this.tokens,
      premiumUntil: data.premiumUntil.present
          ? data.premiumUntil.value
          : this.premiumUntil,
      freeTokensClaimed: data.freeTokensClaimed.present
          ? data.freeTokensClaimed.value
          : this.freeTokensClaimed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Wallet(')
          ..write('userId: $userId, ')
          ..write('tokens: $tokens, ')
          ..write('premiumUntil: $premiumUntil, ')
          ..write('freeTokensClaimed: $freeTokensClaimed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(userId, tokens, premiumUntil, freeTokensClaimed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Wallet &&
          other.userId == this.userId &&
          other.tokens == this.tokens &&
          other.premiumUntil == this.premiumUntil &&
          other.freeTokensClaimed == this.freeTokensClaimed);
}

class WalletsCompanion extends UpdateCompanion<Wallet> {
  final Value<String> userId;
  final Value<int> tokens;
  final Value<DateTime?> premiumUntil;
  final Value<bool> freeTokensClaimed;
  final Value<int> rowid;
  const WalletsCompanion({
    this.userId = const Value.absent(),
    this.tokens = const Value.absent(),
    this.premiumUntil = const Value.absent(),
    this.freeTokensClaimed = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WalletsCompanion.insert({
    required String userId,
    this.tokens = const Value.absent(),
    this.premiumUntil = const Value.absent(),
    this.freeTokensClaimed = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : userId = Value(userId);
  static Insertable<Wallet> custom({
    Expression<String>? userId,
    Expression<int>? tokens,
    Expression<DateTime>? premiumUntil,
    Expression<bool>? freeTokensClaimed,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (tokens != null) 'tokens': tokens,
      if (premiumUntil != null) 'premium_until': premiumUntil,
      if (freeTokensClaimed != null) 'free_tokens_claimed': freeTokensClaimed,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WalletsCompanion copyWith({
    Value<String>? userId,
    Value<int>? tokens,
    Value<DateTime?>? premiumUntil,
    Value<bool>? freeTokensClaimed,
    Value<int>? rowid,
  }) {
    return WalletsCompanion(
      userId: userId ?? this.userId,
      tokens: tokens ?? this.tokens,
      premiumUntil: premiumUntil ?? this.premiumUntil,
      freeTokensClaimed: freeTokensClaimed ?? this.freeTokensClaimed,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (tokens.present) {
      map['tokens'] = Variable<int>(tokens.value);
    }
    if (premiumUntil.present) {
      map['premium_until'] = Variable<DateTime>(premiumUntil.value);
    }
    if (freeTokensClaimed.present) {
      map['free_tokens_claimed'] = Variable<bool>(freeTokensClaimed.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WalletsCompanion(')
          ..write('userId: $userId, ')
          ..write('tokens: $tokens, ')
          ..write('premiumUntil: $premiumUntil, ')
          ..write('freeTokensClaimed: $freeTokensClaimed, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TokenTransactionsTable extends TokenTransactions
    with TableInfo<$TokenTransactionsTable, TokenTransaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TokenTransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _balanceAfterMeta = const VerificationMeta(
    'balanceAfter',
  );
  @override
  late final GeneratedColumn<int> balanceAfter = GeneratedColumn<int>(
    'balance_after',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _detailsMeta = const VerificationMeta(
    'details',
  );
  @override
  late final GeneratedColumn<String> details = GeneratedColumn<String>(
    'details',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    type,
    amount,
    balanceAfter,
    details,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'token_transactions';
  @override
  VerificationContext validateIntegrity(
    Insertable<TokenTransaction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('balance_after')) {
      context.handle(
        _balanceAfterMeta,
        balanceAfter.isAcceptableOrUnknown(
          data['balance_after']!,
          _balanceAfterMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_balanceAfterMeta);
    }
    if (data.containsKey('details')) {
      context.handle(
        _detailsMeta,
        details.isAcceptableOrUnknown(data['details']!, _detailsMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TokenTransaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TokenTransaction(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      balanceAfter: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}balance_after'],
      )!,
      details: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}details'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $TokenTransactionsTable createAlias(String alias) {
    return $TokenTransactionsTable(attachedDatabase, alias);
  }
}

class TokenTransaction extends DataClass
    implements Insertable<TokenTransaction> {
  final String id;
  final String userId;
  final String type;
  final int amount;
  final int balanceAfter;
  final String? details;
  final DateTime createdAt;
  const TokenTransaction({
    required this.id,
    required this.userId,
    required this.type,
    required this.amount,
    required this.balanceAfter,
    this.details,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['type'] = Variable<String>(type);
    map['amount'] = Variable<int>(amount);
    map['balance_after'] = Variable<int>(balanceAfter);
    if (!nullToAbsent || details != null) {
      map['details'] = Variable<String>(details);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TokenTransactionsCompanion toCompanion(bool nullToAbsent) {
    return TokenTransactionsCompanion(
      id: Value(id),
      userId: Value(userId),
      type: Value(type),
      amount: Value(amount),
      balanceAfter: Value(balanceAfter),
      details: details == null && nullToAbsent
          ? const Value.absent()
          : Value(details),
      createdAt: Value(createdAt),
    );
  }

  factory TokenTransaction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TokenTransaction(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      type: serializer.fromJson<String>(json['type']),
      amount: serializer.fromJson<int>(json['amount']),
      balanceAfter: serializer.fromJson<int>(json['balanceAfter']),
      details: serializer.fromJson<String?>(json['details']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'type': serializer.toJson<String>(type),
      'amount': serializer.toJson<int>(amount),
      'balanceAfter': serializer.toJson<int>(balanceAfter),
      'details': serializer.toJson<String?>(details),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TokenTransaction copyWith({
    String? id,
    String? userId,
    String? type,
    int? amount,
    int? balanceAfter,
    Value<String?> details = const Value.absent(),
    DateTime? createdAt,
  }) => TokenTransaction(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    type: type ?? this.type,
    amount: amount ?? this.amount,
    balanceAfter: balanceAfter ?? this.balanceAfter,
    details: details.present ? details.value : this.details,
    createdAt: createdAt ?? this.createdAt,
  );
  TokenTransaction copyWithCompanion(TokenTransactionsCompanion data) {
    return TokenTransaction(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      type: data.type.present ? data.type.value : this.type,
      amount: data.amount.present ? data.amount.value : this.amount,
      balanceAfter: data.balanceAfter.present
          ? data.balanceAfter.value
          : this.balanceAfter,
      details: data.details.present ? data.details.value : this.details,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TokenTransaction(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('amount: $amount, ')
          ..write('balanceAfter: $balanceAfter, ')
          ..write('details: $details, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, type, amount, balanceAfter, details, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TokenTransaction &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.type == this.type &&
          other.amount == this.amount &&
          other.balanceAfter == this.balanceAfter &&
          other.details == this.details &&
          other.createdAt == this.createdAt);
}

class TokenTransactionsCompanion extends UpdateCompanion<TokenTransaction> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> type;
  final Value<int> amount;
  final Value<int> balanceAfter;
  final Value<String?> details;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const TokenTransactionsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.type = const Value.absent(),
    this.amount = const Value.absent(),
    this.balanceAfter = const Value.absent(),
    this.details = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TokenTransactionsCompanion.insert({
    required String id,
    required String userId,
    required String type,
    required int amount,
    required int balanceAfter,
    this.details = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       type = Value(type),
       amount = Value(amount),
       balanceAfter = Value(balanceAfter),
       createdAt = Value(createdAt);
  static Insertable<TokenTransaction> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? type,
    Expression<int>? amount,
    Expression<int>? balanceAfter,
    Expression<String>? details,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (type != null) 'type': type,
      if (amount != null) 'amount': amount,
      if (balanceAfter != null) 'balance_after': balanceAfter,
      if (details != null) 'details': details,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TokenTransactionsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? type,
    Value<int>? amount,
    Value<int>? balanceAfter,
    Value<String?>? details,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return TokenTransactionsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      balanceAfter: balanceAfter ?? this.balanceAfter,
      details: details ?? this.details,
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
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (balanceAfter.present) {
      map['balance_after'] = Variable<int>(balanceAfter.value);
    }
    if (details.present) {
      map['details'] = Variable<String>(details.value);
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
    return (StringBuffer('TokenTransactionsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('amount: $amount, ')
          ..write('balanceAfter: $balanceAfter, ')
          ..write('details: $details, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FavoritesTable extends Favorites
    with TableInfo<$FavoritesTable, Favorite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _institutionIdMeta = const VerificationMeta(
    'institutionId',
  );
  @override
  late final GeneratedColumn<String> institutionId = GeneratedColumn<String>(
    'institution_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _busIdMeta = const VerificationMeta('busId');
  @override
  late final GeneratedColumn<String> busId = GeneratedColumn<String>(
    'bus_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notificationsEnabledMeta =
      const VerificationMeta('notificationsEnabled');
  @override
  late final GeneratedColumn<bool> notificationsEnabled = GeneratedColumn<bool>(
    'notifications_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("notifications_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    userId,
    institutionId,
    busId,
    notificationsEnabled,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorites';
  @override
  VerificationContext validateIntegrity(
    Insertable<Favorite> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('institution_id')) {
      context.handle(
        _institutionIdMeta,
        institutionId.isAcceptableOrUnknown(
          data['institution_id']!,
          _institutionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_institutionIdMeta);
    }
    if (data.containsKey('bus_id')) {
      context.handle(
        _busIdMeta,
        busId.isAcceptableOrUnknown(data['bus_id']!, _busIdMeta),
      );
    } else if (isInserting) {
      context.missing(_busIdMeta);
    }
    if (data.containsKey('notifications_enabled')) {
      context.handle(
        _notificationsEnabledMeta,
        notificationsEnabled.isAcceptableOrUnknown(
          data['notifications_enabled']!,
          _notificationsEnabledMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId, busId};
  @override
  Favorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favorite(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      institutionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}institution_id'],
      )!,
      busId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bus_id'],
      )!,
      notificationsEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}notifications_enabled'],
      )!,
    );
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(attachedDatabase, alias);
  }
}

class Favorite extends DataClass implements Insertable<Favorite> {
  final String userId;
  final String institutionId;
  final String busId;
  final bool notificationsEnabled;
  const Favorite({
    required this.userId,
    required this.institutionId,
    required this.busId,
    required this.notificationsEnabled,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['institution_id'] = Variable<String>(institutionId);
    map['bus_id'] = Variable<String>(busId);
    map['notifications_enabled'] = Variable<bool>(notificationsEnabled);
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      userId: Value(userId),
      institutionId: Value(institutionId),
      busId: Value(busId),
      notificationsEnabled: Value(notificationsEnabled),
    );
  }

  factory Favorite.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favorite(
      userId: serializer.fromJson<String>(json['userId']),
      institutionId: serializer.fromJson<String>(json['institutionId']),
      busId: serializer.fromJson<String>(json['busId']),
      notificationsEnabled: serializer.fromJson<bool>(
        json['notificationsEnabled'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'institutionId': serializer.toJson<String>(institutionId),
      'busId': serializer.toJson<String>(busId),
      'notificationsEnabled': serializer.toJson<bool>(notificationsEnabled),
    };
  }

  Favorite copyWith({
    String? userId,
    String? institutionId,
    String? busId,
    bool? notificationsEnabled,
  }) => Favorite(
    userId: userId ?? this.userId,
    institutionId: institutionId ?? this.institutionId,
    busId: busId ?? this.busId,
    notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
  );
  Favorite copyWithCompanion(FavoritesCompanion data) {
    return Favorite(
      userId: data.userId.present ? data.userId.value : this.userId,
      institutionId: data.institutionId.present
          ? data.institutionId.value
          : this.institutionId,
      busId: data.busId.present ? data.busId.value : this.busId,
      notificationsEnabled: data.notificationsEnabled.present
          ? data.notificationsEnabled.value
          : this.notificationsEnabled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('userId: $userId, ')
          ..write('institutionId: $institutionId, ')
          ..write('busId: $busId, ')
          ..write('notificationsEnabled: $notificationsEnabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(userId, institutionId, busId, notificationsEnabled);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorite &&
          other.userId == this.userId &&
          other.institutionId == this.institutionId &&
          other.busId == this.busId &&
          other.notificationsEnabled == this.notificationsEnabled);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<String> userId;
  final Value<String> institutionId;
  final Value<String> busId;
  final Value<bool> notificationsEnabled;
  final Value<int> rowid;
  const FavoritesCompanion({
    this.userId = const Value.absent(),
    this.institutionId = const Value.absent(),
    this.busId = const Value.absent(),
    this.notificationsEnabled = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FavoritesCompanion.insert({
    required String userId,
    required String institutionId,
    required String busId,
    this.notificationsEnabled = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : userId = Value(userId),
       institutionId = Value(institutionId),
       busId = Value(busId);
  static Insertable<Favorite> custom({
    Expression<String>? userId,
    Expression<String>? institutionId,
    Expression<String>? busId,
    Expression<bool>? notificationsEnabled,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (institutionId != null) 'institution_id': institutionId,
      if (busId != null) 'bus_id': busId,
      if (notificationsEnabled != null)
        'notifications_enabled': notificationsEnabled,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FavoritesCompanion copyWith({
    Value<String>? userId,
    Value<String>? institutionId,
    Value<String>? busId,
    Value<bool>? notificationsEnabled,
    Value<int>? rowid,
  }) {
    return FavoritesCompanion(
      userId: userId ?? this.userId,
      institutionId: institutionId ?? this.institutionId,
      busId: busId ?? this.busId,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (institutionId.present) {
      map['institution_id'] = Variable<String>(institutionId.value);
    }
    if (busId.present) {
      map['bus_id'] = Variable<String>(busId.value);
    }
    if (notificationsEnabled.present) {
      map['notifications_enabled'] = Variable<bool>(notificationsEnabled.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesCompanion(')
          ..write('userId: $userId, ')
          ..write('institutionId: $institutionId, ')
          ..write('busId: $busId, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReferralClaimsTable extends ReferralClaims
    with TableInfo<$ReferralClaimsTable, ReferralClaim> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReferralClaimsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _claimantUserIdMeta = const VerificationMeta(
    'claimantUserId',
  );
  @override
  late final GeneratedColumn<String> claimantUserId = GeneratedColumn<String>(
    'claimant_user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _referrerUserIdMeta = const VerificationMeta(
    'referrerUserId',
  );
  @override
  late final GeneratedColumn<String> referrerUserId = GeneratedColumn<String>(
    'referrer_user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _referralCodeMeta = const VerificationMeta(
    'referralCode',
  );
  @override
  late final GeneratedColumn<String> referralCode = GeneratedColumn<String>(
    'referral_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('PENDING'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reviewedAtMeta = const VerificationMeta(
    'reviewedAt',
  );
  @override
  late final GeneratedColumn<DateTime> reviewedAt = GeneratedColumn<DateTime>(
    'reviewed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    claimantUserId,
    referrerUserId,
    referralCode,
    status,
    createdAt,
    reviewedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'referral_claims';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReferralClaim> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('claimant_user_id')) {
      context.handle(
        _claimantUserIdMeta,
        claimantUserId.isAcceptableOrUnknown(
          data['claimant_user_id']!,
          _claimantUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_claimantUserIdMeta);
    }
    if (data.containsKey('referrer_user_id')) {
      context.handle(
        _referrerUserIdMeta,
        referrerUserId.isAcceptableOrUnknown(
          data['referrer_user_id']!,
          _referrerUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_referrerUserIdMeta);
    }
    if (data.containsKey('referral_code')) {
      context.handle(
        _referralCodeMeta,
        referralCode.isAcceptableOrUnknown(
          data['referral_code']!,
          _referralCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_referralCodeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('reviewed_at')) {
      context.handle(
        _reviewedAtMeta,
        reviewedAt.isAcceptableOrUnknown(data['reviewed_at']!, _reviewedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {claimantUserId},
  ];
  @override
  ReferralClaim map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReferralClaim(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      claimantUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}claimant_user_id'],
      )!,
      referrerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}referrer_user_id'],
      )!,
      referralCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}referral_code'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      reviewedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}reviewed_at'],
      ),
    );
  }

  @override
  $ReferralClaimsTable createAlias(String alias) {
    return $ReferralClaimsTable(attachedDatabase, alias);
  }
}

class ReferralClaim extends DataClass implements Insertable<ReferralClaim> {
  final String id;
  final String claimantUserId;
  final String referrerUserId;
  final String referralCode;
  final String status;
  final DateTime createdAt;
  final DateTime? reviewedAt;
  const ReferralClaim({
    required this.id,
    required this.claimantUserId,
    required this.referrerUserId,
    required this.referralCode,
    required this.status,
    required this.createdAt,
    this.reviewedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['claimant_user_id'] = Variable<String>(claimantUserId);
    map['referrer_user_id'] = Variable<String>(referrerUserId);
    map['referral_code'] = Variable<String>(referralCode);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || reviewedAt != null) {
      map['reviewed_at'] = Variable<DateTime>(reviewedAt);
    }
    return map;
  }

  ReferralClaimsCompanion toCompanion(bool nullToAbsent) {
    return ReferralClaimsCompanion(
      id: Value(id),
      claimantUserId: Value(claimantUserId),
      referrerUserId: Value(referrerUserId),
      referralCode: Value(referralCode),
      status: Value(status),
      createdAt: Value(createdAt),
      reviewedAt: reviewedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(reviewedAt),
    );
  }

  factory ReferralClaim.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReferralClaim(
      id: serializer.fromJson<String>(json['id']),
      claimantUserId: serializer.fromJson<String>(json['claimantUserId']),
      referrerUserId: serializer.fromJson<String>(json['referrerUserId']),
      referralCode: serializer.fromJson<String>(json['referralCode']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      reviewedAt: serializer.fromJson<DateTime?>(json['reviewedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'claimantUserId': serializer.toJson<String>(claimantUserId),
      'referrerUserId': serializer.toJson<String>(referrerUserId),
      'referralCode': serializer.toJson<String>(referralCode),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'reviewedAt': serializer.toJson<DateTime?>(reviewedAt),
    };
  }

  ReferralClaim copyWith({
    String? id,
    String? claimantUserId,
    String? referrerUserId,
    String? referralCode,
    String? status,
    DateTime? createdAt,
    Value<DateTime?> reviewedAt = const Value.absent(),
  }) => ReferralClaim(
    id: id ?? this.id,
    claimantUserId: claimantUserId ?? this.claimantUserId,
    referrerUserId: referrerUserId ?? this.referrerUserId,
    referralCode: referralCode ?? this.referralCode,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    reviewedAt: reviewedAt.present ? reviewedAt.value : this.reviewedAt,
  );
  ReferralClaim copyWithCompanion(ReferralClaimsCompanion data) {
    return ReferralClaim(
      id: data.id.present ? data.id.value : this.id,
      claimantUserId: data.claimantUserId.present
          ? data.claimantUserId.value
          : this.claimantUserId,
      referrerUserId: data.referrerUserId.present
          ? data.referrerUserId.value
          : this.referrerUserId,
      referralCode: data.referralCode.present
          ? data.referralCode.value
          : this.referralCode,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      reviewedAt: data.reviewedAt.present
          ? data.reviewedAt.value
          : this.reviewedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReferralClaim(')
          ..write('id: $id, ')
          ..write('claimantUserId: $claimantUserId, ')
          ..write('referrerUserId: $referrerUserId, ')
          ..write('referralCode: $referralCode, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('reviewedAt: $reviewedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    claimantUserId,
    referrerUserId,
    referralCode,
    status,
    createdAt,
    reviewedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReferralClaim &&
          other.id == this.id &&
          other.claimantUserId == this.claimantUserId &&
          other.referrerUserId == this.referrerUserId &&
          other.referralCode == this.referralCode &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.reviewedAt == this.reviewedAt);
}

class ReferralClaimsCompanion extends UpdateCompanion<ReferralClaim> {
  final Value<String> id;
  final Value<String> claimantUserId;
  final Value<String> referrerUserId;
  final Value<String> referralCode;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<DateTime?> reviewedAt;
  final Value<int> rowid;
  const ReferralClaimsCompanion({
    this.id = const Value.absent(),
    this.claimantUserId = const Value.absent(),
    this.referrerUserId = const Value.absent(),
    this.referralCode = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.reviewedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReferralClaimsCompanion.insert({
    required String id,
    required String claimantUserId,
    required String referrerUserId,
    required String referralCode,
    this.status = const Value.absent(),
    required DateTime createdAt,
    this.reviewedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       claimantUserId = Value(claimantUserId),
       referrerUserId = Value(referrerUserId),
       referralCode = Value(referralCode),
       createdAt = Value(createdAt);
  static Insertable<ReferralClaim> custom({
    Expression<String>? id,
    Expression<String>? claimantUserId,
    Expression<String>? referrerUserId,
    Expression<String>? referralCode,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? reviewedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (claimantUserId != null) 'claimant_user_id': claimantUserId,
      if (referrerUserId != null) 'referrer_user_id': referrerUserId,
      if (referralCode != null) 'referral_code': referralCode,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (reviewedAt != null) 'reviewed_at': reviewedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReferralClaimsCompanion copyWith({
    Value<String>? id,
    Value<String>? claimantUserId,
    Value<String>? referrerUserId,
    Value<String>? referralCode,
    Value<String>? status,
    Value<DateTime>? createdAt,
    Value<DateTime?>? reviewedAt,
    Value<int>? rowid,
  }) {
    return ReferralClaimsCompanion(
      id: id ?? this.id,
      claimantUserId: claimantUserId ?? this.claimantUserId,
      referrerUserId: referrerUserId ?? this.referrerUserId,
      referralCode: referralCode ?? this.referralCode,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      reviewedAt: reviewedAt ?? this.reviewedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (claimantUserId.present) {
      map['claimant_user_id'] = Variable<String>(claimantUserId.value);
    }
    if (referrerUserId.present) {
      map['referrer_user_id'] = Variable<String>(referrerUserId.value);
    }
    if (referralCode.present) {
      map['referral_code'] = Variable<String>(referralCode.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (reviewedAt.present) {
      map['reviewed_at'] = Variable<DateTime>(reviewedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReferralClaimsCompanion(')
          ..write('id: $id, ')
          ..write('claimantUserId: $claimantUserId, ')
          ..write('referrerUserId: $referrerUserId, ')
          ..write('referralCode: $referralCode, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('reviewedAt: $reviewedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $InstitutionsTable institutions = $InstitutionsTable(this);
  late final $OrganizationMembershipsTable organizationMemberships =
      $OrganizationMembershipsTable(this);
  late final $OrganizationSubscriptionsTable organizationSubscriptions =
      $OrganizationSubscriptionsTable(this);
  late final $ChatMessagesTable chatMessages = $ChatMessagesTable(this);
  late final $UserProfilesTable userProfiles = $UserProfilesTable(this);
  late final $BusesTable buses = $BusesTable(this);
  late final $RoutesTable routes = $RoutesTable(this);
  late final $RouteStopsTable routeStops = $RouteStopsTable(this);
  late final $BusSchedulesTable busSchedules = $BusSchedulesTable(this);
  late final $CachedBusStatusesTable cachedBusStatuses =
      $CachedBusStatusesTable(this);
  late final $WalletsTable wallets = $WalletsTable(this);
  late final $TokenTransactionsTable tokenTransactions =
      $TokenTransactionsTable(this);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  late final $ReferralClaimsTable referralClaims = $ReferralClaimsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    institutions,
    organizationMemberships,
    organizationSubscriptions,
    chatMessages,
    userProfiles,
    buses,
    routes,
    routeStops,
    busSchedules,
    cachedBusStatuses,
    wallets,
    tokenTransactions,
    favorites,
    referralClaims,
  ];
}

typedef $$InstitutionsTableCreateCompanionBuilder =
    InstitutionsCompanion Function({
      required String id,
      required String name,
      Value<String> type,
      Value<String> shortName,
      Value<String> slug,
      Value<String> status,
      Value<String> plan,
      Value<String> accessMode,
      Value<String> location,
      Value<String> timezone,
      Value<bool> active,
      Value<int> rowid,
    });
typedef $$InstitutionsTableUpdateCompanionBuilder =
    InstitutionsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> type,
      Value<String> shortName,
      Value<String> slug,
      Value<String> status,
      Value<String> plan,
      Value<String> accessMode,
      Value<String> location,
      Value<String> timezone,
      Value<bool> active,
      Value<int> rowid,
    });

final class $$InstitutionsTableReferences
    extends BaseReferences<_$AppDatabase, $InstitutionsTable, Institution> {
  $$InstitutionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$BusesTable, List<BusRow>> _busesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.buses,
    aliasName: 'institutions__id__buses__institution_id',
  );

  $$BusesTableProcessedTableManager get busesRefs {
    final manager = $$BusesTableTableManager(
      $_db,
      $_db.buses,
    ).filter((f) => f.institutionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_busesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RoutesTable, List<Route>> _routesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.routes,
    aliasName: 'institutions__id__routes__institution_id',
  );

  $$RoutesTableProcessedTableManager get routesRefs {
    final manager = $$RoutesTableTableManager(
      $_db,
      $_db.routes,
    ).filter((f) => f.institutionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_routesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$BusSchedulesTable, List<BusSchedule>>
  _busSchedulesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.busSchedules,
    aliasName: 'institutions__id__bus_schedules__institution_id',
  );

  $$BusSchedulesTableProcessedTableManager get busSchedulesRefs {
    final manager = $$BusSchedulesTableTableManager(
      $_db,
      $_db.busSchedules,
    ).filter((f) => f.institutionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_busSchedulesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$InstitutionsTableFilterComposer
    extends Composer<_$AppDatabase, $InstitutionsTable> {
  $$InstitutionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shortName => $composableBuilder(
    column: $table.shortName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get plan => $composableBuilder(
    column: $table.plan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accessMode => $composableBuilder(
    column: $table.accessMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> busesRefs(
    Expression<bool> Function($$BusesTableFilterComposer f) f,
  ) {
    final $$BusesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.buses,
      getReferencedColumn: (t) => t.institutionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusesTableFilterComposer(
            $db: $db,
            $table: $db.buses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> routesRefs(
    Expression<bool> Function($$RoutesTableFilterComposer f) f,
  ) {
    final $$RoutesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.routes,
      getReferencedColumn: (t) => t.institutionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutesTableFilterComposer(
            $db: $db,
            $table: $db.routes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> busSchedulesRefs(
    Expression<bool> Function($$BusSchedulesTableFilterComposer f) f,
  ) {
    final $$BusSchedulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.busSchedules,
      getReferencedColumn: (t) => t.institutionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusSchedulesTableFilterComposer(
            $db: $db,
            $table: $db.busSchedules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InstitutionsTableOrderingComposer
    extends Composer<_$AppDatabase, $InstitutionsTable> {
  $$InstitutionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shortName => $composableBuilder(
    column: $table.shortName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get plan => $composableBuilder(
    column: $table.plan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accessMode => $composableBuilder(
    column: $table.accessMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InstitutionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InstitutionsTable> {
  $$InstitutionsTableAnnotationComposer({
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

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get shortName =>
      $composableBuilder(column: $table.shortName, builder: (column) => column);

  GeneratedColumn<String> get slug =>
      $composableBuilder(column: $table.slug, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get plan =>
      $composableBuilder(column: $table.plan, builder: (column) => column);

  GeneratedColumn<String> get accessMode => $composableBuilder(
    column: $table.accessMode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get timezone =>
      $composableBuilder(column: $table.timezone, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  Expression<T> busesRefs<T extends Object>(
    Expression<T> Function($$BusesTableAnnotationComposer a) f,
  ) {
    final $$BusesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.buses,
      getReferencedColumn: (t) => t.institutionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusesTableAnnotationComposer(
            $db: $db,
            $table: $db.buses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> routesRefs<T extends Object>(
    Expression<T> Function($$RoutesTableAnnotationComposer a) f,
  ) {
    final $$RoutesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.routes,
      getReferencedColumn: (t) => t.institutionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutesTableAnnotationComposer(
            $db: $db,
            $table: $db.routes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> busSchedulesRefs<T extends Object>(
    Expression<T> Function($$BusSchedulesTableAnnotationComposer a) f,
  ) {
    final $$BusSchedulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.busSchedules,
      getReferencedColumn: (t) => t.institutionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusSchedulesTableAnnotationComposer(
            $db: $db,
            $table: $db.busSchedules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InstitutionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InstitutionsTable,
          Institution,
          $$InstitutionsTableFilterComposer,
          $$InstitutionsTableOrderingComposer,
          $$InstitutionsTableAnnotationComposer,
          $$InstitutionsTableCreateCompanionBuilder,
          $$InstitutionsTableUpdateCompanionBuilder,
          (Institution, $$InstitutionsTableReferences),
          Institution,
          PrefetchHooks Function({
            bool busesRefs,
            bool routesRefs,
            bool busSchedulesRefs,
          })
        > {
  $$InstitutionsTableTableManager(_$AppDatabase db, $InstitutionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InstitutionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InstitutionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InstitutionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> shortName = const Value.absent(),
                Value<String> slug = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> plan = const Value.absent(),
                Value<String> accessMode = const Value.absent(),
                Value<String> location = const Value.absent(),
                Value<String> timezone = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InstitutionsCompanion(
                id: id,
                name: name,
                type: type,
                shortName: shortName,
                slug: slug,
                status: status,
                plan: plan,
                accessMode: accessMode,
                location: location,
                timezone: timezone,
                active: active,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String> type = const Value.absent(),
                Value<String> shortName = const Value.absent(),
                Value<String> slug = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> plan = const Value.absent(),
                Value<String> accessMode = const Value.absent(),
                Value<String> location = const Value.absent(),
                Value<String> timezone = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InstitutionsCompanion.insert(
                id: id,
                name: name,
                type: type,
                shortName: shortName,
                slug: slug,
                status: status,
                plan: plan,
                accessMode: accessMode,
                location: location,
                timezone: timezone,
                active: active,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InstitutionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                busesRefs = false,
                routesRefs = false,
                busSchedulesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (busesRefs) db.buses,
                    if (routesRefs) db.routes,
                    if (busSchedulesRefs) db.busSchedules,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (busesRefs)
                        await $_getPrefetchedData<
                          Institution,
                          $InstitutionsTable,
                          BusRow
                        >(
                          currentTable: table,
                          referencedTable: $$InstitutionsTableReferences
                              ._busesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$InstitutionsTableReferences(
                                db,
                                table,
                                p0,
                              ).busesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.institutionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (routesRefs)
                        await $_getPrefetchedData<
                          Institution,
                          $InstitutionsTable,
                          Route
                        >(
                          currentTable: table,
                          referencedTable: $$InstitutionsTableReferences
                              ._routesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$InstitutionsTableReferences(
                                db,
                                table,
                                p0,
                              ).routesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.institutionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (busSchedulesRefs)
                        await $_getPrefetchedData<
                          Institution,
                          $InstitutionsTable,
                          BusSchedule
                        >(
                          currentTable: table,
                          referencedTable: $$InstitutionsTableReferences
                              ._busSchedulesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$InstitutionsTableReferences(
                                db,
                                table,
                                p0,
                              ).busSchedulesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.institutionId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$InstitutionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InstitutionsTable,
      Institution,
      $$InstitutionsTableFilterComposer,
      $$InstitutionsTableOrderingComposer,
      $$InstitutionsTableAnnotationComposer,
      $$InstitutionsTableCreateCompanionBuilder,
      $$InstitutionsTableUpdateCompanionBuilder,
      (Institution, $$InstitutionsTableReferences),
      Institution,
      PrefetchHooks Function({
        bool busesRefs,
        bool routesRefs,
        bool busSchedulesRefs,
      })
    >;
typedef $$OrganizationMembershipsTableCreateCompanionBuilder =
    OrganizationMembershipsCompanion Function({
      required String organizationId,
      required String userId,
      Value<String> role,
      Value<String> status,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$OrganizationMembershipsTableUpdateCompanionBuilder =
    OrganizationMembershipsCompanion Function({
      Value<String> organizationId,
      Value<String> userId,
      Value<String> role,
      Value<String> status,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$OrganizationMembershipsTableFilterComposer
    extends Composer<_$AppDatabase, $OrganizationMembershipsTable> {
  $$OrganizationMembershipsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OrganizationMembershipsTableOrderingComposer
    extends Composer<_$AppDatabase, $OrganizationMembershipsTable> {
  $$OrganizationMembershipsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OrganizationMembershipsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrganizationMembershipsTable> {
  $$OrganizationMembershipsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$OrganizationMembershipsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrganizationMembershipsTable,
          OrganizationMembership,
          $$OrganizationMembershipsTableFilterComposer,
          $$OrganizationMembershipsTableOrderingComposer,
          $$OrganizationMembershipsTableAnnotationComposer,
          $$OrganizationMembershipsTableCreateCompanionBuilder,
          $$OrganizationMembershipsTableUpdateCompanionBuilder,
          (
            OrganizationMembership,
            BaseReferences<
              _$AppDatabase,
              $OrganizationMembershipsTable,
              OrganizationMembership
            >,
          ),
          OrganizationMembership,
          PrefetchHooks Function()
        > {
  $$OrganizationMembershipsTableTableManager(
    _$AppDatabase db,
    $OrganizationMembershipsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrganizationMembershipsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$OrganizationMembershipsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$OrganizationMembershipsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> organizationId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OrganizationMembershipsCompanion(
                organizationId: organizationId,
                userId: userId,
                role: role,
                status: status,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String organizationId,
                required String userId,
                Value<String> role = const Value.absent(),
                Value<String> status = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => OrganizationMembershipsCompanion.insert(
                organizationId: organizationId,
                userId: userId,
                role: role,
                status: status,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OrganizationMembershipsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrganizationMembershipsTable,
      OrganizationMembership,
      $$OrganizationMembershipsTableFilterComposer,
      $$OrganizationMembershipsTableOrderingComposer,
      $$OrganizationMembershipsTableAnnotationComposer,
      $$OrganizationMembershipsTableCreateCompanionBuilder,
      $$OrganizationMembershipsTableUpdateCompanionBuilder,
      (
        OrganizationMembership,
        BaseReferences<
          _$AppDatabase,
          $OrganizationMembershipsTable,
          OrganizationMembership
        >,
      ),
      OrganizationMembership,
      PrefetchHooks Function()
    >;
typedef $$OrganizationSubscriptionsTableCreateCompanionBuilder =
    OrganizationSubscriptionsCompanion Function({
      required String organizationId,
      Value<String> plan,
      Value<String> status,
      Value<DateTime?> periodEndsAt,
      Value<int> rowid,
    });
typedef $$OrganizationSubscriptionsTableUpdateCompanionBuilder =
    OrganizationSubscriptionsCompanion Function({
      Value<String> organizationId,
      Value<String> plan,
      Value<String> status,
      Value<DateTime?> periodEndsAt,
      Value<int> rowid,
    });

class $$OrganizationSubscriptionsTableFilterComposer
    extends Composer<_$AppDatabase, $OrganizationSubscriptionsTable> {
  $$OrganizationSubscriptionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get plan => $composableBuilder(
    column: $table.plan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get periodEndsAt => $composableBuilder(
    column: $table.periodEndsAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OrganizationSubscriptionsTableOrderingComposer
    extends Composer<_$AppDatabase, $OrganizationSubscriptionsTable> {
  $$OrganizationSubscriptionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get plan => $composableBuilder(
    column: $table.plan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get periodEndsAt => $composableBuilder(
    column: $table.periodEndsAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OrganizationSubscriptionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrganizationSubscriptionsTable> {
  $$OrganizationSubscriptionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get plan =>
      $composableBuilder(column: $table.plan, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get periodEndsAt => $composableBuilder(
    column: $table.periodEndsAt,
    builder: (column) => column,
  );
}

class $$OrganizationSubscriptionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrganizationSubscriptionsTable,
          OrganizationSubscription,
          $$OrganizationSubscriptionsTableFilterComposer,
          $$OrganizationSubscriptionsTableOrderingComposer,
          $$OrganizationSubscriptionsTableAnnotationComposer,
          $$OrganizationSubscriptionsTableCreateCompanionBuilder,
          $$OrganizationSubscriptionsTableUpdateCompanionBuilder,
          (
            OrganizationSubscription,
            BaseReferences<
              _$AppDatabase,
              $OrganizationSubscriptionsTable,
              OrganizationSubscription
            >,
          ),
          OrganizationSubscription,
          PrefetchHooks Function()
        > {
  $$OrganizationSubscriptionsTableTableManager(
    _$AppDatabase db,
    $OrganizationSubscriptionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrganizationSubscriptionsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$OrganizationSubscriptionsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$OrganizationSubscriptionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> organizationId = const Value.absent(),
                Value<String> plan = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> periodEndsAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OrganizationSubscriptionsCompanion(
                organizationId: organizationId,
                plan: plan,
                status: status,
                periodEndsAt: periodEndsAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String organizationId,
                Value<String> plan = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> periodEndsAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OrganizationSubscriptionsCompanion.insert(
                organizationId: organizationId,
                plan: plan,
                status: status,
                periodEndsAt: periodEndsAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OrganizationSubscriptionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrganizationSubscriptionsTable,
      OrganizationSubscription,
      $$OrganizationSubscriptionsTableFilterComposer,
      $$OrganizationSubscriptionsTableOrderingComposer,
      $$OrganizationSubscriptionsTableAnnotationComposer,
      $$OrganizationSubscriptionsTableCreateCompanionBuilder,
      $$OrganizationSubscriptionsTableUpdateCompanionBuilder,
      (
        OrganizationSubscription,
        BaseReferences<
          _$AppDatabase,
          $OrganizationSubscriptionsTable,
          OrganizationSubscription
        >,
      ),
      OrganizationSubscription,
      PrefetchHooks Function()
    >;
typedef $$ChatMessagesTableCreateCompanionBuilder =
    ChatMessagesCompanion Function({
      required String id,
      required String organizationId,
      required String senderId,
      required String senderName,
      required String messageText,
      required DateTime createdAt,
      required DateTime expiresAt,
      Value<int> rowid,
    });
typedef $$ChatMessagesTableUpdateCompanionBuilder =
    ChatMessagesCompanion Function({
      Value<String> id,
      Value<String> organizationId,
      Value<String> senderId,
      Value<String> senderName,
      Value<String> messageText,
      Value<DateTime> createdAt,
      Value<DateTime> expiresAt,
      Value<int> rowid,
    });

class $$ChatMessagesTableFilterComposer
    extends Composer<_$AppDatabase, $ChatMessagesTable> {
  $$ChatMessagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get senderId => $composableBuilder(
    column: $table.senderId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get senderName => $composableBuilder(
    column: $table.senderName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get messageText => $composableBuilder(
    column: $table.messageText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ChatMessagesTableOrderingComposer
    extends Composer<_$AppDatabase, $ChatMessagesTable> {
  $$ChatMessagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get senderId => $composableBuilder(
    column: $table.senderId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get senderName => $composableBuilder(
    column: $table.senderName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get messageText => $composableBuilder(
    column: $table.messageText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChatMessagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChatMessagesTable> {
  $$ChatMessagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get senderId =>
      $composableBuilder(column: $table.senderId, builder: (column) => column);

  GeneratedColumn<String> get senderName => $composableBuilder(
    column: $table.senderName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get messageText => $composableBuilder(
    column: $table.messageText,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);
}

class $$ChatMessagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChatMessagesTable,
          ChatMessage,
          $$ChatMessagesTableFilterComposer,
          $$ChatMessagesTableOrderingComposer,
          $$ChatMessagesTableAnnotationComposer,
          $$ChatMessagesTableCreateCompanionBuilder,
          $$ChatMessagesTableUpdateCompanionBuilder,
          (
            ChatMessage,
            BaseReferences<_$AppDatabase, $ChatMessagesTable, ChatMessage>,
          ),
          ChatMessage,
          PrefetchHooks Function()
        > {
  $$ChatMessagesTableTableManager(_$AppDatabase db, $ChatMessagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChatMessagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChatMessagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChatMessagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> organizationId = const Value.absent(),
                Value<String> senderId = const Value.absent(),
                Value<String> senderName = const Value.absent(),
                Value<String> messageText = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> expiresAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChatMessagesCompanion(
                id: id,
                organizationId: organizationId,
                senderId: senderId,
                senderName: senderName,
                messageText: messageText,
                createdAt: createdAt,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String organizationId,
                required String senderId,
                required String senderName,
                required String messageText,
                required DateTime createdAt,
                required DateTime expiresAt,
                Value<int> rowid = const Value.absent(),
              }) => ChatMessagesCompanion.insert(
                id: id,
                organizationId: organizationId,
                senderId: senderId,
                senderName: senderName,
                messageText: messageText,
                createdAt: createdAt,
                expiresAt: expiresAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ChatMessagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChatMessagesTable,
      ChatMessage,
      $$ChatMessagesTableFilterComposer,
      $$ChatMessagesTableOrderingComposer,
      $$ChatMessagesTableAnnotationComposer,
      $$ChatMessagesTableCreateCompanionBuilder,
      $$ChatMessagesTableUpdateCompanionBuilder,
      (
        ChatMessage,
        BaseReferences<_$AppDatabase, $ChatMessagesTable, ChatMessage>,
      ),
      ChatMessage,
      PrefetchHooks Function()
    >;
typedef $$UserProfilesTableCreateCompanionBuilder =
    UserProfilesCompanion Function({
      required String uid,
      required String displayName,
      required String email,
      Value<String> role,
      Value<String?> institutionId,
      Value<String?> referralCode,
      Value<String?> referredBy,
      Value<String?> firstName,
      Value<String?> lastName,
      Value<String?> gender,
      Value<String?> department,
      Value<String?> academicSession,
      required DateTime createdAt,
      Value<bool> active,
      Value<int> rowid,
    });
typedef $$UserProfilesTableUpdateCompanionBuilder =
    UserProfilesCompanion Function({
      Value<String> uid,
      Value<String> displayName,
      Value<String> email,
      Value<String> role,
      Value<String?> institutionId,
      Value<String?> referralCode,
      Value<String?> referredBy,
      Value<String?> firstName,
      Value<String?> lastName,
      Value<String?> gender,
      Value<String?> department,
      Value<String?> academicSession,
      Value<DateTime> createdAt,
      Value<bool> active,
      Value<int> rowid,
    });

class $$UserProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get institutionId => $composableBuilder(
    column: $table.institutionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get referralCode => $composableBuilder(
    column: $table.referralCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get referredBy => $composableBuilder(
    column: $table.referredBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get academicSession => $composableBuilder(
    column: $table.academicSession,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get institutionId => $composableBuilder(
    column: $table.institutionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get referralCode => $composableBuilder(
    column: $table.referralCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get referredBy => $composableBuilder(
    column: $table.referredBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get academicSession => $composableBuilder(
    column: $table.academicSession,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get institutionId => $composableBuilder(
    column: $table.institutionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get referralCode => $composableBuilder(
    column: $table.referralCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get referredBy => $composableBuilder(
    column: $table.referredBy,
    builder: (column) => column,
  );

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => column,
  );

  GeneratedColumn<String> get academicSession => $composableBuilder(
    column: $table.academicSession,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);
}

class $$UserProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserProfilesTable,
          UserProfile,
          $$UserProfilesTableFilterComposer,
          $$UserProfilesTableOrderingComposer,
          $$UserProfilesTableAnnotationComposer,
          $$UserProfilesTableCreateCompanionBuilder,
          $$UserProfilesTableUpdateCompanionBuilder,
          (
            UserProfile,
            BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfile>,
          ),
          UserProfile,
          PrefetchHooks Function()
        > {
  $$UserProfilesTableTableManager(_$AppDatabase db, $UserProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uid = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<String?> institutionId = const Value.absent(),
                Value<String?> referralCode = const Value.absent(),
                Value<String?> referredBy = const Value.absent(),
                Value<String?> firstName = const Value.absent(),
                Value<String?> lastName = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<String?> department = const Value.absent(),
                Value<String?> academicSession = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserProfilesCompanion(
                uid: uid,
                displayName: displayName,
                email: email,
                role: role,
                institutionId: institutionId,
                referralCode: referralCode,
                referredBy: referredBy,
                firstName: firstName,
                lastName: lastName,
                gender: gender,
                department: department,
                academicSession: academicSession,
                createdAt: createdAt,
                active: active,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uid,
                required String displayName,
                required String email,
                Value<String> role = const Value.absent(),
                Value<String?> institutionId = const Value.absent(),
                Value<String?> referralCode = const Value.absent(),
                Value<String?> referredBy = const Value.absent(),
                Value<String?> firstName = const Value.absent(),
                Value<String?> lastName = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<String?> department = const Value.absent(),
                Value<String?> academicSession = const Value.absent(),
                required DateTime createdAt,
                Value<bool> active = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserProfilesCompanion.insert(
                uid: uid,
                displayName: displayName,
                email: email,
                role: role,
                institutionId: institutionId,
                referralCode: referralCode,
                referredBy: referredBy,
                firstName: firstName,
                lastName: lastName,
                gender: gender,
                department: department,
                academicSession: academicSession,
                createdAt: createdAt,
                active: active,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserProfilesTable,
      UserProfile,
      $$UserProfilesTableFilterComposer,
      $$UserProfilesTableOrderingComposer,
      $$UserProfilesTableAnnotationComposer,
      $$UserProfilesTableCreateCompanionBuilder,
      $$UserProfilesTableUpdateCompanionBuilder,
      (
        UserProfile,
        BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfile>,
      ),
      UserProfile,
      PrefetchHooks Function()
    >;
typedef $$BusesTableCreateCompanionBuilder =
    BusesCompanion Function({
      required String id,
      required String institutionId,
      required String name,
      required String busNumber,
      Value<String?> plateNumber,
      Value<String?> description,
      required int colorValue,
      Value<int?> capacity,
      Value<bool> active,
      Value<int> rowid,
    });
typedef $$BusesTableUpdateCompanionBuilder =
    BusesCompanion Function({
      Value<String> id,
      Value<String> institutionId,
      Value<String> name,
      Value<String> busNumber,
      Value<String?> plateNumber,
      Value<String?> description,
      Value<int> colorValue,
      Value<int?> capacity,
      Value<bool> active,
      Value<int> rowid,
    });

final class $$BusesTableReferences
    extends BaseReferences<_$AppDatabase, $BusesTable, BusRow> {
  $$BusesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $InstitutionsTable _institutionIdTable(_$AppDatabase db) =>
      db.institutions.createAlias('buses__institution_id__institutions__id');

  $$InstitutionsTableProcessedTableManager get institutionId {
    final $_column = $_itemColumn<String>('institution_id')!;

    final manager = $$InstitutionsTableTableManager(
      $_db,
      $_db.institutions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_institutionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BusesTableFilterComposer extends Composer<_$AppDatabase, $BusesTable> {
  $$BusesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get busNumber => $composableBuilder(
    column: $table.busNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get plateNumber => $composableBuilder(
    column: $table.plateNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get capacity => $composableBuilder(
    column: $table.capacity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  $$InstitutionsTableFilterComposer get institutionId {
    final $$InstitutionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.institutionId,
      referencedTable: $db.institutions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InstitutionsTableFilterComposer(
            $db: $db,
            $table: $db.institutions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BusesTableOrderingComposer
    extends Composer<_$AppDatabase, $BusesTable> {
  $$BusesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get busNumber => $composableBuilder(
    column: $table.busNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get plateNumber => $composableBuilder(
    column: $table.plateNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get capacity => $composableBuilder(
    column: $table.capacity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  $$InstitutionsTableOrderingComposer get institutionId {
    final $$InstitutionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.institutionId,
      referencedTable: $db.institutions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InstitutionsTableOrderingComposer(
            $db: $db,
            $table: $db.institutions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BusesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BusesTable> {
  $$BusesTableAnnotationComposer({
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

  GeneratedColumn<String> get busNumber =>
      $composableBuilder(column: $table.busNumber, builder: (column) => column);

  GeneratedColumn<String> get plateNumber => $composableBuilder(
    column: $table.plateNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => column,
  );

  GeneratedColumn<int> get capacity =>
      $composableBuilder(column: $table.capacity, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  $$InstitutionsTableAnnotationComposer get institutionId {
    final $$InstitutionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.institutionId,
      referencedTable: $db.institutions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InstitutionsTableAnnotationComposer(
            $db: $db,
            $table: $db.institutions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BusesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BusesTable,
          BusRow,
          $$BusesTableFilterComposer,
          $$BusesTableOrderingComposer,
          $$BusesTableAnnotationComposer,
          $$BusesTableCreateCompanionBuilder,
          $$BusesTableUpdateCompanionBuilder,
          (BusRow, $$BusesTableReferences),
          BusRow,
          PrefetchHooks Function({bool institutionId})
        > {
  $$BusesTableTableManager(_$AppDatabase db, $BusesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BusesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BusesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BusesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> institutionId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> busNumber = const Value.absent(),
                Value<String?> plateNumber = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> colorValue = const Value.absent(),
                Value<int?> capacity = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BusesCompanion(
                id: id,
                institutionId: institutionId,
                name: name,
                busNumber: busNumber,
                plateNumber: plateNumber,
                description: description,
                colorValue: colorValue,
                capacity: capacity,
                active: active,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String institutionId,
                required String name,
                required String busNumber,
                Value<String?> plateNumber = const Value.absent(),
                Value<String?> description = const Value.absent(),
                required int colorValue,
                Value<int?> capacity = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BusesCompanion.insert(
                id: id,
                institutionId: institutionId,
                name: name,
                busNumber: busNumber,
                plateNumber: plateNumber,
                description: description,
                colorValue: colorValue,
                capacity: capacity,
                active: active,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$BusesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({institutionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (institutionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.institutionId,
                                referencedTable: $$BusesTableReferences
                                    ._institutionIdTable(db),
                                referencedColumn: $$BusesTableReferences
                                    ._institutionIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$BusesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BusesTable,
      BusRow,
      $$BusesTableFilterComposer,
      $$BusesTableOrderingComposer,
      $$BusesTableAnnotationComposer,
      $$BusesTableCreateCompanionBuilder,
      $$BusesTableUpdateCompanionBuilder,
      (BusRow, $$BusesTableReferences),
      BusRow,
      PrefetchHooks Function({bool institutionId})
    >;
typedef $$RoutesTableCreateCompanionBuilder =
    RoutesCompanion Function({
      required String id,
      required String institutionId,
      required String name,
      required String startName,
      required String endName,
      required int distanceMeters,
      Value<bool> bidirectional,
      Value<double> routeCorridorMeters,
      Value<String> encodedPoints,
      Value<bool> active,
      Value<int> rowid,
    });
typedef $$RoutesTableUpdateCompanionBuilder =
    RoutesCompanion Function({
      Value<String> id,
      Value<String> institutionId,
      Value<String> name,
      Value<String> startName,
      Value<String> endName,
      Value<int> distanceMeters,
      Value<bool> bidirectional,
      Value<double> routeCorridorMeters,
      Value<String> encodedPoints,
      Value<bool> active,
      Value<int> rowid,
    });

final class $$RoutesTableReferences
    extends BaseReferences<_$AppDatabase, $RoutesTable, Route> {
  $$RoutesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $InstitutionsTable _institutionIdTable(_$AppDatabase db) =>
      db.institutions.createAlias('routes__institution_id__institutions__id');

  $$InstitutionsTableProcessedTableManager get institutionId {
    final $_column = $_itemColumn<String>('institution_id')!;

    final manager = $$InstitutionsTableTableManager(
      $_db,
      $_db.institutions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_institutionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$RouteStopsTable, List<RouteStop>>
  _routeStopsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.routeStops,
    aliasName: 'routes__id__route_stops__route_id',
  );

  $$RouteStopsTableProcessedTableManager get routeStopsRefs {
    final manager = $$RouteStopsTableTableManager(
      $_db,
      $_db.routeStops,
    ).filter((f) => f.routeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_routeStopsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RoutesTableFilterComposer
    extends Composer<_$AppDatabase, $RoutesTable> {
  $$RoutesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startName => $composableBuilder(
    column: $table.startName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endName => $composableBuilder(
    column: $table.endName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get distanceMeters => $composableBuilder(
    column: $table.distanceMeters,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get bidirectional => $composableBuilder(
    column: $table.bidirectional,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get routeCorridorMeters => $composableBuilder(
    column: $table.routeCorridorMeters,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get encodedPoints => $composableBuilder(
    column: $table.encodedPoints,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  $$InstitutionsTableFilterComposer get institutionId {
    final $$InstitutionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.institutionId,
      referencedTable: $db.institutions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InstitutionsTableFilterComposer(
            $db: $db,
            $table: $db.institutions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> routeStopsRefs(
    Expression<bool> Function($$RouteStopsTableFilterComposer f) f,
  ) {
    final $$RouteStopsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.routeStops,
      getReferencedColumn: (t) => t.routeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RouteStopsTableFilterComposer(
            $db: $db,
            $table: $db.routeStops,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoutesTableOrderingComposer
    extends Composer<_$AppDatabase, $RoutesTable> {
  $$RoutesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startName => $composableBuilder(
    column: $table.startName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endName => $composableBuilder(
    column: $table.endName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get distanceMeters => $composableBuilder(
    column: $table.distanceMeters,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get bidirectional => $composableBuilder(
    column: $table.bidirectional,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get routeCorridorMeters => $composableBuilder(
    column: $table.routeCorridorMeters,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get encodedPoints => $composableBuilder(
    column: $table.encodedPoints,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  $$InstitutionsTableOrderingComposer get institutionId {
    final $$InstitutionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.institutionId,
      referencedTable: $db.institutions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InstitutionsTableOrderingComposer(
            $db: $db,
            $table: $db.institutions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoutesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoutesTable> {
  $$RoutesTableAnnotationComposer({
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

  GeneratedColumn<String> get startName =>
      $composableBuilder(column: $table.startName, builder: (column) => column);

  GeneratedColumn<String> get endName =>
      $composableBuilder(column: $table.endName, builder: (column) => column);

  GeneratedColumn<int> get distanceMeters => $composableBuilder(
    column: $table.distanceMeters,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get bidirectional => $composableBuilder(
    column: $table.bidirectional,
    builder: (column) => column,
  );

  GeneratedColumn<double> get routeCorridorMeters => $composableBuilder(
    column: $table.routeCorridorMeters,
    builder: (column) => column,
  );

  GeneratedColumn<String> get encodedPoints => $composableBuilder(
    column: $table.encodedPoints,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  $$InstitutionsTableAnnotationComposer get institutionId {
    final $$InstitutionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.institutionId,
      referencedTable: $db.institutions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InstitutionsTableAnnotationComposer(
            $db: $db,
            $table: $db.institutions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> routeStopsRefs<T extends Object>(
    Expression<T> Function($$RouteStopsTableAnnotationComposer a) f,
  ) {
    final $$RouteStopsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.routeStops,
      getReferencedColumn: (t) => t.routeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RouteStopsTableAnnotationComposer(
            $db: $db,
            $table: $db.routeStops,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoutesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoutesTable,
          Route,
          $$RoutesTableFilterComposer,
          $$RoutesTableOrderingComposer,
          $$RoutesTableAnnotationComposer,
          $$RoutesTableCreateCompanionBuilder,
          $$RoutesTableUpdateCompanionBuilder,
          (Route, $$RoutesTableReferences),
          Route,
          PrefetchHooks Function({bool institutionId, bool routeStopsRefs})
        > {
  $$RoutesTableTableManager(_$AppDatabase db, $RoutesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoutesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoutesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoutesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> institutionId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> startName = const Value.absent(),
                Value<String> endName = const Value.absent(),
                Value<int> distanceMeters = const Value.absent(),
                Value<bool> bidirectional = const Value.absent(),
                Value<double> routeCorridorMeters = const Value.absent(),
                Value<String> encodedPoints = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoutesCompanion(
                id: id,
                institutionId: institutionId,
                name: name,
                startName: startName,
                endName: endName,
                distanceMeters: distanceMeters,
                bidirectional: bidirectional,
                routeCorridorMeters: routeCorridorMeters,
                encodedPoints: encodedPoints,
                active: active,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String institutionId,
                required String name,
                required String startName,
                required String endName,
                required int distanceMeters,
                Value<bool> bidirectional = const Value.absent(),
                Value<double> routeCorridorMeters = const Value.absent(),
                Value<String> encodedPoints = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoutesCompanion.insert(
                id: id,
                institutionId: institutionId,
                name: name,
                startName: startName,
                endName: endName,
                distanceMeters: distanceMeters,
                bidirectional: bidirectional,
                routeCorridorMeters: routeCorridorMeters,
                encodedPoints: encodedPoints,
                active: active,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$RoutesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({institutionId = false, routeStopsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (routeStopsRefs) db.routeStops],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (institutionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.institutionId,
                                    referencedTable: $$RoutesTableReferences
                                        ._institutionIdTable(db),
                                    referencedColumn: $$RoutesTableReferences
                                        ._institutionIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (routeStopsRefs)
                        await $_getPrefetchedData<
                          Route,
                          $RoutesTable,
                          RouteStop
                        >(
                          currentTable: table,
                          referencedTable: $$RoutesTableReferences
                              ._routeStopsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RoutesTableReferences(
                                db,
                                table,
                                p0,
                              ).routeStopsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.routeId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RoutesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoutesTable,
      Route,
      $$RoutesTableFilterComposer,
      $$RoutesTableOrderingComposer,
      $$RoutesTableAnnotationComposer,
      $$RoutesTableCreateCompanionBuilder,
      $$RoutesTableUpdateCompanionBuilder,
      (Route, $$RoutesTableReferences),
      Route,
      PrefetchHooks Function({bool institutionId, bool routeStopsRefs})
    >;
typedef $$RouteStopsTableCreateCompanionBuilder =
    RouteStopsCompanion Function({
      required String id,
      required String routeId,
      required String name,
      required double latitude,
      required double longitude,
      required int stopOrder,
      Value<double> routeProgress,
      Value<int> rowid,
    });
typedef $$RouteStopsTableUpdateCompanionBuilder =
    RouteStopsCompanion Function({
      Value<String> id,
      Value<String> routeId,
      Value<String> name,
      Value<double> latitude,
      Value<double> longitude,
      Value<int> stopOrder,
      Value<double> routeProgress,
      Value<int> rowid,
    });

final class $$RouteStopsTableReferences
    extends BaseReferences<_$AppDatabase, $RouteStopsTable, RouteStop> {
  $$RouteStopsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RoutesTable _routeIdTable(_$AppDatabase db) =>
      db.routes.createAlias('route_stops__route_id__routes__id');

  $$RoutesTableProcessedTableManager get routeId {
    final $_column = $_itemColumn<String>('route_id')!;

    final manager = $$RoutesTableTableManager(
      $_db,
      $_db.routes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_routeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RouteStopsTableFilterComposer
    extends Composer<_$AppDatabase, $RouteStopsTable> {
  $$RouteStopsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stopOrder => $composableBuilder(
    column: $table.stopOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get routeProgress => $composableBuilder(
    column: $table.routeProgress,
    builder: (column) => ColumnFilters(column),
  );

  $$RoutesTableFilterComposer get routeId {
    final $$RoutesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routeId,
      referencedTable: $db.routes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutesTableFilterComposer(
            $db: $db,
            $table: $db.routes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RouteStopsTableOrderingComposer
    extends Composer<_$AppDatabase, $RouteStopsTable> {
  $$RouteStopsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stopOrder => $composableBuilder(
    column: $table.stopOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get routeProgress => $composableBuilder(
    column: $table.routeProgress,
    builder: (column) => ColumnOrderings(column),
  );

  $$RoutesTableOrderingComposer get routeId {
    final $$RoutesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routeId,
      referencedTable: $db.routes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutesTableOrderingComposer(
            $db: $db,
            $table: $db.routes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RouteStopsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RouteStopsTable> {
  $$RouteStopsTableAnnotationComposer({
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

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<int> get stopOrder =>
      $composableBuilder(column: $table.stopOrder, builder: (column) => column);

  GeneratedColumn<double> get routeProgress => $composableBuilder(
    column: $table.routeProgress,
    builder: (column) => column,
  );

  $$RoutesTableAnnotationComposer get routeId {
    final $$RoutesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routeId,
      referencedTable: $db.routes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutesTableAnnotationComposer(
            $db: $db,
            $table: $db.routes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RouteStopsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RouteStopsTable,
          RouteStop,
          $$RouteStopsTableFilterComposer,
          $$RouteStopsTableOrderingComposer,
          $$RouteStopsTableAnnotationComposer,
          $$RouteStopsTableCreateCompanionBuilder,
          $$RouteStopsTableUpdateCompanionBuilder,
          (RouteStop, $$RouteStopsTableReferences),
          RouteStop,
          PrefetchHooks Function({bool routeId})
        > {
  $$RouteStopsTableTableManager(_$AppDatabase db, $RouteStopsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RouteStopsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RouteStopsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RouteStopsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> routeId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<int> stopOrder = const Value.absent(),
                Value<double> routeProgress = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RouteStopsCompanion(
                id: id,
                routeId: routeId,
                name: name,
                latitude: latitude,
                longitude: longitude,
                stopOrder: stopOrder,
                routeProgress: routeProgress,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String routeId,
                required String name,
                required double latitude,
                required double longitude,
                required int stopOrder,
                Value<double> routeProgress = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RouteStopsCompanion.insert(
                id: id,
                routeId: routeId,
                name: name,
                latitude: latitude,
                longitude: longitude,
                stopOrder: stopOrder,
                routeProgress: routeProgress,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RouteStopsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({routeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (routeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.routeId,
                                referencedTable: $$RouteStopsTableReferences
                                    ._routeIdTable(db),
                                referencedColumn: $$RouteStopsTableReferences
                                    ._routeIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RouteStopsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RouteStopsTable,
      RouteStop,
      $$RouteStopsTableFilterComposer,
      $$RouteStopsTableOrderingComposer,
      $$RouteStopsTableAnnotationComposer,
      $$RouteStopsTableCreateCompanionBuilder,
      $$RouteStopsTableUpdateCompanionBuilder,
      (RouteStop, $$RouteStopsTableReferences),
      RouteStop,
      PrefetchHooks Function({bool routeId})
    >;
typedef $$BusSchedulesTableCreateCompanionBuilder =
    BusSchedulesCompanion Function({
      required String id,
      required String institutionId,
      Value<String?> expectedBusId,
      Value<String?> expectedRouteId,
      required String label,
      required String departureTime,
      Value<int> weekDays,
      Value<bool> active,
      Value<int> rowid,
    });
typedef $$BusSchedulesTableUpdateCompanionBuilder =
    BusSchedulesCompanion Function({
      Value<String> id,
      Value<String> institutionId,
      Value<String?> expectedBusId,
      Value<String?> expectedRouteId,
      Value<String> label,
      Value<String> departureTime,
      Value<int> weekDays,
      Value<bool> active,
      Value<int> rowid,
    });

final class $$BusSchedulesTableReferences
    extends BaseReferences<_$AppDatabase, $BusSchedulesTable, BusSchedule> {
  $$BusSchedulesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $InstitutionsTable _institutionIdTable(_$AppDatabase db) => db
      .institutions
      .createAlias('bus_schedules__institution_id__institutions__id');

  $$InstitutionsTableProcessedTableManager get institutionId {
    final $_column = $_itemColumn<String>('institution_id')!;

    final manager = $$InstitutionsTableTableManager(
      $_db,
      $_db.institutions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_institutionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BusSchedulesTableFilterComposer
    extends Composer<_$AppDatabase, $BusSchedulesTable> {
  $$BusSchedulesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get expectedBusId => $composableBuilder(
    column: $table.expectedBusId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get expectedRouteId => $composableBuilder(
    column: $table.expectedRouteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get departureTime => $composableBuilder(
    column: $table.departureTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weekDays => $composableBuilder(
    column: $table.weekDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  $$InstitutionsTableFilterComposer get institutionId {
    final $$InstitutionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.institutionId,
      referencedTable: $db.institutions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InstitutionsTableFilterComposer(
            $db: $db,
            $table: $db.institutions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BusSchedulesTableOrderingComposer
    extends Composer<_$AppDatabase, $BusSchedulesTable> {
  $$BusSchedulesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get expectedBusId => $composableBuilder(
    column: $table.expectedBusId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get expectedRouteId => $composableBuilder(
    column: $table.expectedRouteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get departureTime => $composableBuilder(
    column: $table.departureTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weekDays => $composableBuilder(
    column: $table.weekDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  $$InstitutionsTableOrderingComposer get institutionId {
    final $$InstitutionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.institutionId,
      referencedTable: $db.institutions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InstitutionsTableOrderingComposer(
            $db: $db,
            $table: $db.institutions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BusSchedulesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BusSchedulesTable> {
  $$BusSchedulesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get expectedBusId => $composableBuilder(
    column: $table.expectedBusId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get expectedRouteId => $composableBuilder(
    column: $table.expectedRouteId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get departureTime => $composableBuilder(
    column: $table.departureTime,
    builder: (column) => column,
  );

  GeneratedColumn<int> get weekDays =>
      $composableBuilder(column: $table.weekDays, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  $$InstitutionsTableAnnotationComposer get institutionId {
    final $$InstitutionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.institutionId,
      referencedTable: $db.institutions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InstitutionsTableAnnotationComposer(
            $db: $db,
            $table: $db.institutions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BusSchedulesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BusSchedulesTable,
          BusSchedule,
          $$BusSchedulesTableFilterComposer,
          $$BusSchedulesTableOrderingComposer,
          $$BusSchedulesTableAnnotationComposer,
          $$BusSchedulesTableCreateCompanionBuilder,
          $$BusSchedulesTableUpdateCompanionBuilder,
          (BusSchedule, $$BusSchedulesTableReferences),
          BusSchedule,
          PrefetchHooks Function({bool institutionId})
        > {
  $$BusSchedulesTableTableManager(_$AppDatabase db, $BusSchedulesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BusSchedulesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BusSchedulesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BusSchedulesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> institutionId = const Value.absent(),
                Value<String?> expectedBusId = const Value.absent(),
                Value<String?> expectedRouteId = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<String> departureTime = const Value.absent(),
                Value<int> weekDays = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BusSchedulesCompanion(
                id: id,
                institutionId: institutionId,
                expectedBusId: expectedBusId,
                expectedRouteId: expectedRouteId,
                label: label,
                departureTime: departureTime,
                weekDays: weekDays,
                active: active,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String institutionId,
                Value<String?> expectedBusId = const Value.absent(),
                Value<String?> expectedRouteId = const Value.absent(),
                required String label,
                required String departureTime,
                Value<int> weekDays = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BusSchedulesCompanion.insert(
                id: id,
                institutionId: institutionId,
                expectedBusId: expectedBusId,
                expectedRouteId: expectedRouteId,
                label: label,
                departureTime: departureTime,
                weekDays: weekDays,
                active: active,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BusSchedulesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({institutionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (institutionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.institutionId,
                                referencedTable: $$BusSchedulesTableReferences
                                    ._institutionIdTable(db),
                                referencedColumn: $$BusSchedulesTableReferences
                                    ._institutionIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$BusSchedulesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BusSchedulesTable,
      BusSchedule,
      $$BusSchedulesTableFilterComposer,
      $$BusSchedulesTableOrderingComposer,
      $$BusSchedulesTableAnnotationComposer,
      $$BusSchedulesTableCreateCompanionBuilder,
      $$BusSchedulesTableUpdateCompanionBuilder,
      (BusSchedule, $$BusSchedulesTableReferences),
      BusSchedule,
      PrefetchHooks Function({bool institutionId})
    >;
typedef $$CachedBusStatusesTableCreateCompanionBuilder =
    CachedBusStatusesCompanion Function({
      required String busId,
      required bool isLive,
      Value<String?> detectedRouteId,
      Value<String> direction,
      Value<String?> nearestStop,
      Value<String> confidence,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$CachedBusStatusesTableUpdateCompanionBuilder =
    CachedBusStatusesCompanion Function({
      Value<String> busId,
      Value<bool> isLive,
      Value<String?> detectedRouteId,
      Value<String> direction,
      Value<String?> nearestStop,
      Value<String> confidence,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$CachedBusStatusesTableFilterComposer
    extends Composer<_$AppDatabase, $CachedBusStatusesTable> {
  $$CachedBusStatusesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get busId => $composableBuilder(
    column: $table.busId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLive => $composableBuilder(
    column: $table.isLive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get detectedRouteId => $composableBuilder(
    column: $table.detectedRouteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get direction => $composableBuilder(
    column: $table.direction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nearestStop => $composableBuilder(
    column: $table.nearestStop,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedBusStatusesTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedBusStatusesTable> {
  $$CachedBusStatusesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get busId => $composableBuilder(
    column: $table.busId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLive => $composableBuilder(
    column: $table.isLive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get detectedRouteId => $composableBuilder(
    column: $table.detectedRouteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get direction => $composableBuilder(
    column: $table.direction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nearestStop => $composableBuilder(
    column: $table.nearestStop,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedBusStatusesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedBusStatusesTable> {
  $$CachedBusStatusesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get busId =>
      $composableBuilder(column: $table.busId, builder: (column) => column);

  GeneratedColumn<bool> get isLive =>
      $composableBuilder(column: $table.isLive, builder: (column) => column);

  GeneratedColumn<String> get detectedRouteId => $composableBuilder(
    column: $table.detectedRouteId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get direction =>
      $composableBuilder(column: $table.direction, builder: (column) => column);

  GeneratedColumn<String> get nearestStop => $composableBuilder(
    column: $table.nearestStop,
    builder: (column) => column,
  );

  GeneratedColumn<String> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CachedBusStatusesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedBusStatusesTable,
          CachedBusStatuse,
          $$CachedBusStatusesTableFilterComposer,
          $$CachedBusStatusesTableOrderingComposer,
          $$CachedBusStatusesTableAnnotationComposer,
          $$CachedBusStatusesTableCreateCompanionBuilder,
          $$CachedBusStatusesTableUpdateCompanionBuilder,
          (
            CachedBusStatuse,
            BaseReferences<
              _$AppDatabase,
              $CachedBusStatusesTable,
              CachedBusStatuse
            >,
          ),
          CachedBusStatuse,
          PrefetchHooks Function()
        > {
  $$CachedBusStatusesTableTableManager(
    _$AppDatabase db,
    $CachedBusStatusesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedBusStatusesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedBusStatusesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedBusStatusesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> busId = const Value.absent(),
                Value<bool> isLive = const Value.absent(),
                Value<String?> detectedRouteId = const Value.absent(),
                Value<String> direction = const Value.absent(),
                Value<String?> nearestStop = const Value.absent(),
                Value<String> confidence = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedBusStatusesCompanion(
                busId: busId,
                isLive: isLive,
                detectedRouteId: detectedRouteId,
                direction: direction,
                nearestStop: nearestStop,
                confidence: confidence,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String busId,
                required bool isLive,
                Value<String?> detectedRouteId = const Value.absent(),
                Value<String> direction = const Value.absent(),
                Value<String?> nearestStop = const Value.absent(),
                Value<String> confidence = const Value.absent(),
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => CachedBusStatusesCompanion.insert(
                busId: busId,
                isLive: isLive,
                detectedRouteId: detectedRouteId,
                direction: direction,
                nearestStop: nearestStop,
                confidence: confidence,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedBusStatusesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedBusStatusesTable,
      CachedBusStatuse,
      $$CachedBusStatusesTableFilterComposer,
      $$CachedBusStatusesTableOrderingComposer,
      $$CachedBusStatusesTableAnnotationComposer,
      $$CachedBusStatusesTableCreateCompanionBuilder,
      $$CachedBusStatusesTableUpdateCompanionBuilder,
      (
        CachedBusStatuse,
        BaseReferences<
          _$AppDatabase,
          $CachedBusStatusesTable,
          CachedBusStatuse
        >,
      ),
      CachedBusStatuse,
      PrefetchHooks Function()
    >;
typedef $$WalletsTableCreateCompanionBuilder =
    WalletsCompanion Function({
      required String userId,
      Value<int> tokens,
      Value<DateTime?> premiumUntil,
      Value<bool> freeTokensClaimed,
      Value<int> rowid,
    });
typedef $$WalletsTableUpdateCompanionBuilder =
    WalletsCompanion Function({
      Value<String> userId,
      Value<int> tokens,
      Value<DateTime?> premiumUntil,
      Value<bool> freeTokensClaimed,
      Value<int> rowid,
    });

class $$WalletsTableFilterComposer
    extends Composer<_$AppDatabase, $WalletsTable> {
  $$WalletsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tokens => $composableBuilder(
    column: $table.tokens,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get premiumUntil => $composableBuilder(
    column: $table.premiumUntil,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get freeTokensClaimed => $composableBuilder(
    column: $table.freeTokensClaimed,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WalletsTableOrderingComposer
    extends Composer<_$AppDatabase, $WalletsTable> {
  $$WalletsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tokens => $composableBuilder(
    column: $table.tokens,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get premiumUntil => $composableBuilder(
    column: $table.premiumUntil,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get freeTokensClaimed => $composableBuilder(
    column: $table.freeTokensClaimed,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WalletsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WalletsTable> {
  $$WalletsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get tokens =>
      $composableBuilder(column: $table.tokens, builder: (column) => column);

  GeneratedColumn<DateTime> get premiumUntil => $composableBuilder(
    column: $table.premiumUntil,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get freeTokensClaimed => $composableBuilder(
    column: $table.freeTokensClaimed,
    builder: (column) => column,
  );
}

class $$WalletsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WalletsTable,
          Wallet,
          $$WalletsTableFilterComposer,
          $$WalletsTableOrderingComposer,
          $$WalletsTableAnnotationComposer,
          $$WalletsTableCreateCompanionBuilder,
          $$WalletsTableUpdateCompanionBuilder,
          (Wallet, BaseReferences<_$AppDatabase, $WalletsTable, Wallet>),
          Wallet,
          PrefetchHooks Function()
        > {
  $$WalletsTableTableManager(_$AppDatabase db, $WalletsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WalletsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WalletsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WalletsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> userId = const Value.absent(),
                Value<int> tokens = const Value.absent(),
                Value<DateTime?> premiumUntil = const Value.absent(),
                Value<bool> freeTokensClaimed = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WalletsCompanion(
                userId: userId,
                tokens: tokens,
                premiumUntil: premiumUntil,
                freeTokensClaimed: freeTokensClaimed,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String userId,
                Value<int> tokens = const Value.absent(),
                Value<DateTime?> premiumUntil = const Value.absent(),
                Value<bool> freeTokensClaimed = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WalletsCompanion.insert(
                userId: userId,
                tokens: tokens,
                premiumUntil: premiumUntil,
                freeTokensClaimed: freeTokensClaimed,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WalletsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WalletsTable,
      Wallet,
      $$WalletsTableFilterComposer,
      $$WalletsTableOrderingComposer,
      $$WalletsTableAnnotationComposer,
      $$WalletsTableCreateCompanionBuilder,
      $$WalletsTableUpdateCompanionBuilder,
      (Wallet, BaseReferences<_$AppDatabase, $WalletsTable, Wallet>),
      Wallet,
      PrefetchHooks Function()
    >;
typedef $$TokenTransactionsTableCreateCompanionBuilder =
    TokenTransactionsCompanion Function({
      required String id,
      required String userId,
      required String type,
      required int amount,
      required int balanceAfter,
      Value<String?> details,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$TokenTransactionsTableUpdateCompanionBuilder =
    TokenTransactionsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> type,
      Value<int> amount,
      Value<int> balanceAfter,
      Value<String?> details,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$TokenTransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $TokenTransactionsTable> {
  $$TokenTransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get balanceAfter => $composableBuilder(
    column: $table.balanceAfter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get details => $composableBuilder(
    column: $table.details,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TokenTransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TokenTransactionsTable> {
  $$TokenTransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get balanceAfter => $composableBuilder(
    column: $table.balanceAfter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get details => $composableBuilder(
    column: $table.details,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TokenTransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TokenTransactionsTable> {
  $$TokenTransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get balanceAfter => $composableBuilder(
    column: $table.balanceAfter,
    builder: (column) => column,
  );

  GeneratedColumn<String> get details =>
      $composableBuilder(column: $table.details, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$TokenTransactionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TokenTransactionsTable,
          TokenTransaction,
          $$TokenTransactionsTableFilterComposer,
          $$TokenTransactionsTableOrderingComposer,
          $$TokenTransactionsTableAnnotationComposer,
          $$TokenTransactionsTableCreateCompanionBuilder,
          $$TokenTransactionsTableUpdateCompanionBuilder,
          (
            TokenTransaction,
            BaseReferences<
              _$AppDatabase,
              $TokenTransactionsTable,
              TokenTransaction
            >,
          ),
          TokenTransaction,
          PrefetchHooks Function()
        > {
  $$TokenTransactionsTableTableManager(
    _$AppDatabase db,
    $TokenTransactionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TokenTransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TokenTransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TokenTransactionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<int> balanceAfter = const Value.absent(),
                Value<String?> details = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TokenTransactionsCompanion(
                id: id,
                userId: userId,
                type: type,
                amount: amount,
                balanceAfter: balanceAfter,
                details: details,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String type,
                required int amount,
                required int balanceAfter,
                Value<String?> details = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => TokenTransactionsCompanion.insert(
                id: id,
                userId: userId,
                type: type,
                amount: amount,
                balanceAfter: balanceAfter,
                details: details,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TokenTransactionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TokenTransactionsTable,
      TokenTransaction,
      $$TokenTransactionsTableFilterComposer,
      $$TokenTransactionsTableOrderingComposer,
      $$TokenTransactionsTableAnnotationComposer,
      $$TokenTransactionsTableCreateCompanionBuilder,
      $$TokenTransactionsTableUpdateCompanionBuilder,
      (
        TokenTransaction,
        BaseReferences<
          _$AppDatabase,
          $TokenTransactionsTable,
          TokenTransaction
        >,
      ),
      TokenTransaction,
      PrefetchHooks Function()
    >;
typedef $$FavoritesTableCreateCompanionBuilder =
    FavoritesCompanion Function({
      required String userId,
      required String institutionId,
      required String busId,
      Value<bool> notificationsEnabled,
      Value<int> rowid,
    });
typedef $$FavoritesTableUpdateCompanionBuilder =
    FavoritesCompanion Function({
      Value<String> userId,
      Value<String> institutionId,
      Value<String> busId,
      Value<bool> notificationsEnabled,
      Value<int> rowid,
    });

class $$FavoritesTableFilterComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get institutionId => $composableBuilder(
    column: $table.institutionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get busId => $composableBuilder(
    column: $table.busId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoritesTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get institutionId => $composableBuilder(
    column: $table.institutionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get busId => $composableBuilder(
    column: $table.busId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoritesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get institutionId => $composableBuilder(
    column: $table.institutionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get busId =>
      $composableBuilder(column: $table.busId, builder: (column) => column);

  GeneratedColumn<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => column,
  );
}

class $$FavoritesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoritesTable,
          Favorite,
          $$FavoritesTableFilterComposer,
          $$FavoritesTableOrderingComposer,
          $$FavoritesTableAnnotationComposer,
          $$FavoritesTableCreateCompanionBuilder,
          $$FavoritesTableUpdateCompanionBuilder,
          (Favorite, BaseReferences<_$AppDatabase, $FavoritesTable, Favorite>),
          Favorite,
          PrefetchHooks Function()
        > {
  $$FavoritesTableTableManager(_$AppDatabase db, $FavoritesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoritesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoritesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoritesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> userId = const Value.absent(),
                Value<String> institutionId = const Value.absent(),
                Value<String> busId = const Value.absent(),
                Value<bool> notificationsEnabled = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoritesCompanion(
                userId: userId,
                institutionId: institutionId,
                busId: busId,
                notificationsEnabled: notificationsEnabled,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String userId,
                required String institutionId,
                required String busId,
                Value<bool> notificationsEnabled = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoritesCompanion.insert(
                userId: userId,
                institutionId: institutionId,
                busId: busId,
                notificationsEnabled: notificationsEnabled,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoritesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoritesTable,
      Favorite,
      $$FavoritesTableFilterComposer,
      $$FavoritesTableOrderingComposer,
      $$FavoritesTableAnnotationComposer,
      $$FavoritesTableCreateCompanionBuilder,
      $$FavoritesTableUpdateCompanionBuilder,
      (Favorite, BaseReferences<_$AppDatabase, $FavoritesTable, Favorite>),
      Favorite,
      PrefetchHooks Function()
    >;
typedef $$ReferralClaimsTableCreateCompanionBuilder =
    ReferralClaimsCompanion Function({
      required String id,
      required String claimantUserId,
      required String referrerUserId,
      required String referralCode,
      Value<String> status,
      required DateTime createdAt,
      Value<DateTime?> reviewedAt,
      Value<int> rowid,
    });
typedef $$ReferralClaimsTableUpdateCompanionBuilder =
    ReferralClaimsCompanion Function({
      Value<String> id,
      Value<String> claimantUserId,
      Value<String> referrerUserId,
      Value<String> referralCode,
      Value<String> status,
      Value<DateTime> createdAt,
      Value<DateTime?> reviewedAt,
      Value<int> rowid,
    });

class $$ReferralClaimsTableFilterComposer
    extends Composer<_$AppDatabase, $ReferralClaimsTable> {
  $$ReferralClaimsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get claimantUserId => $composableBuilder(
    column: $table.claimantUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get referrerUserId => $composableBuilder(
    column: $table.referrerUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get referralCode => $composableBuilder(
    column: $table.referralCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get reviewedAt => $composableBuilder(
    column: $table.reviewedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReferralClaimsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReferralClaimsTable> {
  $$ReferralClaimsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get claimantUserId => $composableBuilder(
    column: $table.claimantUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get referrerUserId => $composableBuilder(
    column: $table.referrerUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get referralCode => $composableBuilder(
    column: $table.referralCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get reviewedAt => $composableBuilder(
    column: $table.reviewedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReferralClaimsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReferralClaimsTable> {
  $$ReferralClaimsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get claimantUserId => $composableBuilder(
    column: $table.claimantUserId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get referrerUserId => $composableBuilder(
    column: $table.referrerUserId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get referralCode => $composableBuilder(
    column: $table.referralCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get reviewedAt => $composableBuilder(
    column: $table.reviewedAt,
    builder: (column) => column,
  );
}

class $$ReferralClaimsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReferralClaimsTable,
          ReferralClaim,
          $$ReferralClaimsTableFilterComposer,
          $$ReferralClaimsTableOrderingComposer,
          $$ReferralClaimsTableAnnotationComposer,
          $$ReferralClaimsTableCreateCompanionBuilder,
          $$ReferralClaimsTableUpdateCompanionBuilder,
          (
            ReferralClaim,
            BaseReferences<_$AppDatabase, $ReferralClaimsTable, ReferralClaim>,
          ),
          ReferralClaim,
          PrefetchHooks Function()
        > {
  $$ReferralClaimsTableTableManager(
    _$AppDatabase db,
    $ReferralClaimsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReferralClaimsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReferralClaimsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReferralClaimsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> claimantUserId = const Value.absent(),
                Value<String> referrerUserId = const Value.absent(),
                Value<String> referralCode = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> reviewedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReferralClaimsCompanion(
                id: id,
                claimantUserId: claimantUserId,
                referrerUserId: referrerUserId,
                referralCode: referralCode,
                status: status,
                createdAt: createdAt,
                reviewedAt: reviewedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String claimantUserId,
                required String referrerUserId,
                required String referralCode,
                Value<String> status = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime?> reviewedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReferralClaimsCompanion.insert(
                id: id,
                claimantUserId: claimantUserId,
                referrerUserId: referrerUserId,
                referralCode: referralCode,
                status: status,
                createdAt: createdAt,
                reviewedAt: reviewedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReferralClaimsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReferralClaimsTable,
      ReferralClaim,
      $$ReferralClaimsTableFilterComposer,
      $$ReferralClaimsTableOrderingComposer,
      $$ReferralClaimsTableAnnotationComposer,
      $$ReferralClaimsTableCreateCompanionBuilder,
      $$ReferralClaimsTableUpdateCompanionBuilder,
      (
        ReferralClaim,
        BaseReferences<_$AppDatabase, $ReferralClaimsTable, ReferralClaim>,
      ),
      ReferralClaim,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$InstitutionsTableTableManager get institutions =>
      $$InstitutionsTableTableManager(_db, _db.institutions);
  $$OrganizationMembershipsTableTableManager get organizationMemberships =>
      $$OrganizationMembershipsTableTableManager(
        _db,
        _db.organizationMemberships,
      );
  $$OrganizationSubscriptionsTableTableManager get organizationSubscriptions =>
      $$OrganizationSubscriptionsTableTableManager(
        _db,
        _db.organizationSubscriptions,
      );
  $$ChatMessagesTableTableManager get chatMessages =>
      $$ChatMessagesTableTableManager(_db, _db.chatMessages);
  $$UserProfilesTableTableManager get userProfiles =>
      $$UserProfilesTableTableManager(_db, _db.userProfiles);
  $$BusesTableTableManager get buses =>
      $$BusesTableTableManager(_db, _db.buses);
  $$RoutesTableTableManager get routes =>
      $$RoutesTableTableManager(_db, _db.routes);
  $$RouteStopsTableTableManager get routeStops =>
      $$RouteStopsTableTableManager(_db, _db.routeStops);
  $$BusSchedulesTableTableManager get busSchedules =>
      $$BusSchedulesTableTableManager(_db, _db.busSchedules);
  $$CachedBusStatusesTableTableManager get cachedBusStatuses =>
      $$CachedBusStatusesTableTableManager(_db, _db.cachedBusStatuses);
  $$WalletsTableTableManager get wallets =>
      $$WalletsTableTableManager(_db, _db.wallets);
  $$TokenTransactionsTableTableManager get tokenTransactions =>
      $$TokenTransactionsTableTableManager(_db, _db.tokenTransactions);
  $$FavoritesTableTableManager get favorites =>
      $$FavoritesTableTableManager(_db, _db.favorites);
  $$ReferralClaimsTableTableManager get referralClaims =>
      $$ReferralClaimsTableTableManager(_db, _db.referralClaims);
}
