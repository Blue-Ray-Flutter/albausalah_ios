class MontlyReportsModel {
  MontlyReportsModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.monthlyReports,
  });

  MontlyReportsModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    if (json['monthly_reports'] != null) {
      monthlyReports = [];
      json['monthly_reports'].forEach((v) {
        monthlyReports!.add(MonthlyReports.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  List<MonthlyReports>? monthlyReports;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (monthlyReports != null) {
      map['monthly_reports'] = monthlyReports!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class MonthlyReports {
  MonthlyReports({
    this.year,
    this.month,
    this.price,
  });

  MonthlyReports.fromJson(dynamic json) {
    year = json['year'];
    month = json['month'];
    price = json['price'];
  }
  int? year;
  int? month;
  String? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['year'] = year;
    map['month'] = month;
    map['price'] = price;
    return map;
  }
}
