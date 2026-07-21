import 'package:equatable/equatable.dart';

enum OrganizationType { school, college, university, corporate, factory, other }

enum OrganizationStatus { trial, active, suspended }

enum OrganizationPlan { free, starter, pro, enterprise }

enum OrganizationAccessMode { public, codeRequired, approvalRequired, private }

class Organization extends Equatable {
  const Organization({
    required this.id,
    required this.name,
    required this.shortName,
    required this.slug,
    required this.type,
    this.status = OrganizationStatus.trial,
    this.plan = OrganizationPlan.free,
    this.accessMode = OrganizationAccessMode.public,
    this.location = '',
    this.timezone = 'Asia/Dhaka',
    this.features = const OrganizationFeatures(),
  });
  final String id, name, shortName, slug, location, timezone;
  final OrganizationType type;
  final OrganizationStatus status;
  final OrganizationPlan plan;
  final OrganizationAccessMode accessMode;
  final OrganizationFeatures features;
  bool get active => status != OrganizationStatus.suspended;
  @override
  List<Object> get props => [
    id,
    name,
    shortName,
    slug,
    type,
    status,
    plan,
    accessMode,
    location,
    timezone,
    features,
  ];
}

class OrganizationFeatures extends Equatable {
  const OrganizationFeatures({
    this.crowdsourcedTracking = true,
    this.tokenPremium = true,
    this.publicBusSearch = true,
    this.schedules = true,
  });
  final bool crowdsourcedTracking, tokenPremium, publicBusSearch, schedules;
  @override
  List<Object> get props => [
    crowdsourcedTracking,
    tokenPremium,
    publicBusSearch,
    schedules,
  ];
}

@Deprecated('Use Organization. Kept temporarily for source compatibility.')
typedef Institution = Organization;
@Deprecated('Use OrganizationType.')
typedef InstitutionType = OrganizationType;
