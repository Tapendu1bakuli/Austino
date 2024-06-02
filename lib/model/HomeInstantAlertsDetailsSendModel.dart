class HomeInstantAlertsDetailsSendModel {
  String? alertId;

  HomeInstantAlertsDetailsSendModel({this.alertId});

  HomeInstantAlertsDetailsSendModel.fromJson(Map<String, dynamic> json) {
    alertId = json['alert_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alert_id'] = this.alertId;
    return data;
  }
}
