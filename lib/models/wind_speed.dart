
import 'package:json_annotation/json_annotation.dart';

part 'wind_speed.g.dart';

Iterable<WindSpeed> WindSpeedFromJson(Iterable<Map<String, dynamic>> list) =>
    list.map((model) => WindSpeed.fromJson(model));

@JsonSerializable()
class WindSpeed {
    @JsonKey(name: "latitude")
    double? latitude;
    @JsonKey(name: "longitude")
    double? longitude;
    @JsonKey(name: "generationtime_ms")
    double? generationtimeMs;
    @JsonKey(name: "utc_offset_seconds")
    int? utcOffsetSeconds;
    @JsonKey(name: "timezone")
    String? timezone;
    @JsonKey(name: "timezone_abbreviation")
    String? timezoneAbbreviation;
    @JsonKey(name: "elevation")
    double? elevation;
    @JsonKey(name: "hourly_units")
    HourlyUnits? hourlyUnits;
    @JsonKey(name: "hourly")
    Hourly? hourly;

    WindSpeed({
        required this.latitude,
        required this.longitude,
        required this.generationtimeMs,
        required this.utcOffsetSeconds,
        required this.timezone,
        required this.timezoneAbbreviation,
        required this.elevation,
        required this.hourlyUnits,
        required this.hourly,
    });

    factory WindSpeed.fromJson(Map<String, dynamic> json) => _$WindSpeedFromJson(json);

    Map<String, dynamic> toJson() => _$WindSpeedToJson(this);
}

@JsonSerializable()
class Hourly {
    @JsonKey(name: "time")
    List<String> time;
    @JsonKey(name: "windspeed_10m")
    List<double> windspeed10M;

    Hourly({
        required this.time,
        required this.windspeed10M,
    });

    factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);

    Map<String, dynamic> toJson() => _$HourlyToJson(this);
}

@JsonSerializable()
class HourlyUnits {
    @JsonKey(name: "time")
    String time;
    @JsonKey(name: "windspeed_10m")
    String windspeed10M;

    HourlyUnits({
        required this.time,
        required this.windspeed10M,
    });

    factory HourlyUnits.fromJson(Map<String, dynamic> json) => _$HourlyUnitsFromJson(json);

    Map<String, dynamic> toJson() => _$HourlyUnitsToJson(this);
}
