// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viirs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Viirs _$ViirsFromJson(Map<String, dynamic> json) => Viirs(
      countryId: json['country_id'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      brightTi4: (json['bright_ti4'] as num).toDouble(),
      scan: (json['scan'] as num).toDouble(),
      track: (json['track'] as num).toDouble(),
      acqDate: DateTime.parse(json['acq_date'] as String),
      acqTime: json['acq_time'] as int,
      satellite: json['satellite'] as int,
      instrument: json['instrument'] as String,
      confidence: json['confidence'] as String,
      version: json['version'] as String,
      brightTi5: (json['bright_ti5'] as num).toDouble(),
      frp: (json['frp'] as num).toDouble(),
      daynight: json['daynight'] as String,
    );

Map<String, dynamic> _$ViirsToJson(Viirs instance) => <String, dynamic>{
      'country_id': instance.countryId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'bright_ti4': instance.brightTi4,
      'scan': instance.scan,
      'track': instance.track,
      'acq_date': instance.acqDate.toIso8601String(),
      'acq_time': instance.acqTime,
      'satellite': instance.satellite,
      'instrument': instance.instrument,
      'confidence': instance.confidence,
      'version': instance.version,
      'bright_ti5': instance.brightTi5,
      'frp': instance.frp,
      'daynight': instance.daynight,
    };
