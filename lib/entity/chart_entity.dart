class ChartEntity {
  String? value;

  ChartEntity(this.value);

  factory ChartEntity.fromJson(String data) {
    return ChartEntity(data);
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Chart{ name: $value}';
  }
}
