
import 'package:json_annotation/json_annotation.dart';

part 'viirs.g.dart';

Iterable<Viirs> ViirsFromJson(Iterable<Map<String, dynamic>> list) =>
    list.map((model) => Viirs.fromMap(model));

@JsonSerializable()
class Viirs {
    @JsonKey(name: "country_id")
    String countryId;
    @JsonKey(name: "latitude")
    double latitude;
    @JsonKey(name: "longitude")
    double longitude;
    @JsonKey(name: "bright_ti4")
    double brightTi4;
    @JsonKey(name: "scan")
    double scan;
    @JsonKey(name: "track")
    double track;
    @JsonKey(name: "acq_date")
    DateTime acqDate;
    @JsonKey(name: "acq_time")
    int acqTime;
    @JsonKey(name: "satellite")
    int satellite;
    @JsonKey(name: "instrument")
    String instrument;
    @JsonKey(name: "confidence")
    String confidence;
    @JsonKey(name: "version")
    String version;
    @JsonKey(name: "bright_ti5")
    double brightTi5;
    @JsonKey(name: "frp")
    double frp;
    @JsonKey(name: "daynight")
    String daynight;

    Viirs({
        required this.countryId,
        required this.latitude,
        required this.longitude,
        required this.brightTi4,
        required this.scan,
        required this.track,
        required this.acqDate,
        required this.acqTime,
        required this.satellite,
        required this.instrument,
        required this.confidence,
        required this.version,
        required this.brightTi5,
        required this.frp,
        required this.daynight,
    });

    factory Viirs.fromJson(Map<String, dynamic> json) => _$ViirsFromJson(json);

    Map<String, dynamic> toJson() => _$ViirsToJson(this);


    factory Viirs.fromMap(Map<String, dynamic> json) => Viirs(
      countryId: json['country_id'] as String,
      latitude: num.tryParse(json['latitude'])?.toDouble() ??0,
      longitude: num.tryParse(json['longitude'])?.toDouble() ??0,
      brightTi4: num.tryParse(json['bright_ti4'])?.toDouble() ??0,
      scan: num.tryParse(json['scan'])?.toDouble() ??0,
      track: num.tryParse(json['track'])?.toDouble() ??0,
      acqDate: DateTime.parse(json['acq_date'] as String),
      acqTime: int.tryParse(json['acq_time']) ??0,
      satellite: int.tryParse(json['satellite']) ??0,
      instrument: json['instrument'] as String,
      confidence: json['confidence'] as String,
      version: json['version'] as String,
      brightTi5: num.tryParse(json['bright_ti5'])?.toDouble() ??0,
      frp: num.tryParse(json['frp'])?.toDouble() ??0,
      daynight: json['daynight'] as String,
    );

  @override
  String toString() {
    return "[$countryId, $latitude, $longitude, $brightTi4, $scan, $track, $acqDate, $acqTime, $satellite, $instrument, $confidence, $version, $brightTi5, $frp]";

  }
}