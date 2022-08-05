


class GlobalCases {
  GlobalCases(
    this.newConfirmed,
    this.totalConfirmed,
    this.newDeaths,
    this.totalDeaths,
    this.newRecovered,
    this.totalRecovered,
    this.date,
  );

  final int newConfirmed;
  final int totalConfirmed;
  final int newDeaths;
  final int totalDeaths;
  final int newRecovered;
  final int totalRecovered;
  final DateTime date;

  factory GlobalCases.fromJson(Map<String, dynamic> json) => GlobalCases(
    json["Global"]["NewConfirmed"],
    json["Global"]["TotalConfirmed"],
    json["Global"]["NewDeaths"],
    json["Global"]["TotalDeaths"],
    json["Global"]["NewRecovered"],
    json["Global"]["TotalRecovered"],
    DateTime.parse(json["Date"]),
  );

  Map<String, dynamic> toJson() => {
    "NewConfirmed": newConfirmed,
    "TotalConfirmed": totalConfirmed,
    "NewDeaths": newDeaths,
    "TotalDeaths": totalDeaths,
    "NewRecovered": newRecovered,
    "TotalRecovered": totalRecovered,
    "Date": date.toIso8601String(),
  };
}
