// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind_direction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WindDirection _$WindDirectionFromJson(Map<String, dynamic> json) =>
    WindDirection(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      generationtimeMs: (json['generationtime_ms'] as num).toDouble(),
      utcOffsetSeconds: json['utc_offset_seconds'] as int,
      timezone: json['timezone'] as String,
      timezoneAbbreviation: json['timezone_abbreviation'] as String,
      elevation: json['elevation'] as int,
      hourlyUnits:
          HourlyUnits.fromJson(json['hourly_units'] as Map<String, dynamic>),
      hourly: Hourly.fromJson(json['hourly'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WindDirectionToJson(WindDirection instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'generationtime_ms': instance.generationtimeMs,
      'utc_offset_seconds': instance.utcOffsetSeconds,
      'timezone': instance.timezone,
      'timezone_abbreviation': instance.timezoneAbbreviation,
      'elevation': instance.elevation,
      'hourly_units': instance.hourlyUnits,
      'hourly': instance.hourly,
    };

Hourly _$HourlyFromJson(Map<String, dynamic> json) => Hourly(
      time: (json['time'] as List<dynamic>).map((e) => e as String).toList(),
      winddirection10M: (json['winddirection_10m'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$HourlyToJson(Hourly instance) => <String, dynamic>{
      'time': instance.time,
      'winddirection_10m': instance.winddirection10M,
    };

HourlyUnits _$HourlyUnitsFromJson(Map<String, dynamic> json) => HourlyUnits(
      time: json['time'] as String,
      winddirection10M: json['winddirection_10m'] as String,
    );

Map<String, dynamic> _$HourlyUnitsToJson(HourlyUnits instance) =>
    <String, dynamic>{
      'time': instance.time,
      'winddirection_10m': instance.winddirection10M,
    };
