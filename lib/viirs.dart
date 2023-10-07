
import 'package:json_annotation/json_annotation.dart';

part 'viirs.g.dart';

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
}
