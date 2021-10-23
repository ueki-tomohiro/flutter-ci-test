class Version {
  final String version;

  late int major;
  late int minor;
  late int patch;
  late String notice;

  static final versionExp =
      RegExp(r'^([0-9]+)\.([0-9]+)\.([0-9]+)([\-\+]*.*?)$');

  Version(this.version) {
    if (!_parse()) {
      major = 0;
      minor = 0;
      patch = 0;
      notice = "";
    }
  }

  bool _parse() {
    final match = versionExp.firstMatch(version);
    if (match == null) return false;
    major = int.parse(match[1] ?? "0");
    minor = int.parse(match[2] ?? "0");
    patch = int.parse(match[3] ?? "0");
    if (match.groupCount == 4) {
      notice = match[4] ?? "";
    } else {
      notice = "";
    }

    return true;
  }

  @override
  String toString() {
    return "$major.$minor.$patch$notice";
  }
}
