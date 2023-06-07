class EmployeeDataModel {
  List<Server>? server;

  EmployeeDataModel({this.server});

  EmployeeDataModel.fromJson(Map<String, dynamic> json) {
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
  String? dob;
  String? joiningdate;
  String? designation;
  String? photo;
  String? edu;
  String? emailid;
  String? mobilenum;
  String? address;

  Server(
      {this.ename,
        this.dob,
        this.joiningdate,
        this.designation,
        this.photo,
        this.edu,
        this.emailid,
        this.mobilenum,
        this.address});

  Server.fromJson(Map<String, dynamic> json) {
    ename = json['ename'];
    dob = json['dob'];
    joiningdate = json['joiningdate'];
    designation = json['designation'];
    photo = json['photo'];
    edu = json['edu'];
    emailid = json['emailid'];
    mobilenum = json['mobilenum'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ename'] = this.ename;
    data['dob'] = this.dob;
    data['joiningdate'] = this.joiningdate;
    data['designation'] = this.designation;
    data['photo'] = this.photo;
    data['edu'] = this.edu;
    data['emailid'] = this.emailid;
    data['mobilenum'] = this.mobilenum;
    data['address'] = this.address;
    return data;
  }
}
