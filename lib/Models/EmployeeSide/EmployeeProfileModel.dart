class EmployeeProfileModel {
  List<Server>? server;

  EmployeeProfileModel({this.server});

  EmployeeProfileModel.fromJson(Map<String, dynamic> json) {
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
  String? photo;
  String? ename;
  String? designation;
  String? emailid;
  String? mobilenum;
  String? edu;
  String? dob;
  String? joiningdate;
  String? address;

  Server(
      {this.photo,
        this.ename,
        this.designation,
        this.emailid,
        this.mobilenum,
        this.edu,
        this.dob,
        this.joiningdate,
        this.address});

  Server.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
    ename = json['ename'];
    designation = json['designation'];
    emailid = json['emailid'];
    mobilenum = json['mobilenum'];
    edu = json['edu'];
    dob = json['dob'];
    joiningdate = json['joiningdate'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo'] = this.photo;
    data['ename'] = this.ename;
    data['designation'] = this.designation;
    data['emailid'] = this.emailid;
    data['mobilenum'] = this.mobilenum;
    data['edu'] = this.edu;
    data['dob'] = this.dob;
    data['joiningdate'] = this.joiningdate;
    data['address'] = this.address;
    return data;
  }
}
