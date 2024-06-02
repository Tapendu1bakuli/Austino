class AdimContactsListResponceModel {
  List<AdminUsers>? adminUsers;

  AdimContactsListResponceModel({this.adminUsers});

  AdimContactsListResponceModel.fromJson(Map<String, dynamic> json) {
    if (json['admin_users'] != null) {
      adminUsers = <AdminUsers>[];
      json['admin_users'].forEach((v) {
        adminUsers!.add(new AdminUsers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.adminUsers != null) {
      data['admin_users'] = this.adminUsers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdminUsers {
  int? id;
  String? name;
  bool? isSelect = false;

  AdminUsers({this.id, this.name, this.isSelect});

  AdminUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
