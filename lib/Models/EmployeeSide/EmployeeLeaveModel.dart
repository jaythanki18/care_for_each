class EmployeeLeaveModel {
  List<Server>? server;

  EmployeeLeaveModel({this.server});

  EmployeeLeaveModel.fromJson(Map<String, dynamic> json) {
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
  String? requestdate;
  String? reason;
  String? totaldays;
  String? leavestartdate;
  String? status;
  String? ephoto;
  String? leaveenddate;

  Server(
      {this.requestdate,
        this.reason,
        this.totaldays,
        this.leavestartdate,
        this.status,
        this.ephoto,
        this.leaveenddate});

  Server.fromJson(Map<String, dynamic> json) {
    requestdate = json['requestdate'];
    reason = json['reason'];
    totaldays = json['totaldays'];
    leavestartdate = json['leavestartdate'];
    status = json['status'];
    ephoto = json['ephoto'];
    leaveenddate = json['leaveenddate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requestdate'] = this.requestdate;
    data['reason'] = this.reason;
    data['totaldays'] = this.totaldays;
    data['leavestartdate'] = this.leavestartdate;
    data['status'] = this.status;
    data['ephoto'] = this.ephoto;
    data['leaveenddate'] = this.leaveenddate;
    return data;
  }
}
