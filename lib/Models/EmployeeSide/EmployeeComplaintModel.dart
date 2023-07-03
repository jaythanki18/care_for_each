class EmployeeComplaintModel {
  List<Server>? server;

  EmployeeComplaintModel({this.server});

  EmployeeComplaintModel.fromJson(Map<String, dynamic> json) {
    if (json['server'] != null) {
      server = <Server>[];
      json['server'].forEach((v) {
        server!.add(new Server.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.server != null) {
      data['server'] = this.server!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Server {
  String? date;
  String? description;
  String? subject;
  String? comid;

  Server({this.date, this.description, this.subject, this.comid});

  Server.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    description = json['description'];
    subject = json['subject'];
    comid = json['comid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['description'] = this.description;
    data['subject'] = this.subject;
    data['comid'] = this.comid;
    return data;
  }
}
