
class Urls {
  String raw;
  String regular;
  String small;

  Urls({this.raw, this.regular, this.small});

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    regular = json['regular'];
    small = json['small'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic> ();
    data['raw'] = this.raw;
    data['regular'] = this.regular;
    data['small'] = this.small;

    return data;
  }
}