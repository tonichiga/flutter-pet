class ChartData {
  String? value;

  ChartData(this.value);

  factory ChartData.fromJson(String data) {
    return ChartData(data);
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Chart{ name: $value}';
  }
}
