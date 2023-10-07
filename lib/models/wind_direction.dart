import 'package:json_annotation/json_annotation.dart';

part 'wind_direction.g.dart';

@JsonSerializable()
class WindDirection {
    @JsonKey(name: "latitude")
    double latitude;
    @JsonKey(name: "longitude")
    double longitude;
    @JsonKey(name: "generationtime_ms")
    double generationtimeMs;
    @JsonKey(name: "utc_offset_seconds")
    int utcOffsetSeconds;
    @JsonKey(name: "timezone")
    String timezone;
    @JsonKey(name: "timezone_abbreviation")
    String timezoneAbbreviation;
    @JsonKey(name: "elevation")
    int elevation;
    @JsonKey(name: "hourly_units")
    HourlyUnits hourlyUnits;
    @JsonKey(name: "hourly")
    Hourly hourly;

    WindDirection({
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

    factory WindDirection.fromJson(Map<String, dynamic> json) => _$WindDirectionFromJson(json);

    Map<String, dynamic> toJson() => _$WindDirectionToJson(this);
}

@JsonSerializable()
class Hourly {
    @JsonKey(name: "time")
    List<String> time;
    @JsonKey(name: "winddirection_10m")
    List<int> winddirection10M;

    Hourly({
        required this.time,
        required this.winddirection10M,
    });

    factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);

    Map<String, dynamic> toJson() => _$HourlyToJson(this);
}

@JsonSerializable()
class HourlyUnits {
    @JsonKey(name: "time")
    String time;
    @JsonKey(name: "winddirection_10m")
    String winddirection10M;

    HourlyUnits({
        required this.time,
        required this.winddirection10M,
    });

    factory HourlyUnits.fromJson(Map<String, dynamic> json) => _$HourlyUnitsFromJson(json);

    Map<String, dynamic> toJson() => _$HourlyUnitsToJson(this);
}
