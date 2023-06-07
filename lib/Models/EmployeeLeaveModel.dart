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
  String? ename;
  String? designation;
  String? mobilenum;
  String? reason;
  String? leaveenddate;
  String? leavestartdate;
  String? status;
  String? lrid;
  String? photo;

  Server(
      {this.ename,
        this.designation,
        this.mobilenum,
        this.reason,
        this.leaveenddate,
        this.leavestartdate,
        this.status,
        this.lrid,
        this.photo});

  Server.fromJson(Map<String, dynamic> json) {
    ename = json['ename'];
    designation = json['designation'];
    mobilenum = json['mobilenum'];
    reason = json['reason'];
    leaveenddate = json['leaveenddate'];
    leavestartdate = json['leavestartdate'];
    status = json['status'];
    lrid = json['lrid'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ename'] = this.ename;
    data['designation'] = this.designation;
    data['mobilenum'] = this.mobilenum;
    data['reason'] = this.reason;
    data['leaveenddate'] = this.leaveenddate;
    data['leavestartdate'] = this.leavestartdate;
    data['status'] = this.status;
    data['lrid'] = this.lrid;
    data['photo'] = this.photo;
    return data;
  }
}
