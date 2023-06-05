class CompanyProfileModel {
  List<Server>? server;

  CompanyProfileModel({this.server});

  CompanyProfileModel.fromJson(Map<String, dynamic> json) {
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
  String? ctname;
  String? regdate;
  String? emailid;
  String? mobile;
  String? cname;
  String? personname;
  String? address;
  String? designation;
  String? totalemp;
  String? cPhoto;
  String? cStatus;
  int? lastDate;

  Server(
      {this.ctname,
        this.regdate,
        this.emailid,
        this.mobile,
        this.cname,
        this.personname,
        this.address,
        this.designation,
        this.totalemp,
        this.cPhoto,
        this.cStatus,
        this.lastDate});

  Server.fromJson(Map<String, dynamic> json) {
    ctname = json['ctname'];
    regdate = json['regdate'];
    emailid = json['emailid'];
    mobile = json['mobile'];
    cname = json['cname'];
    personname = json['personname'];
    address = json['address'];
    designation = json['designation'];
    totalemp = json['totalemp'];
    cPhoto = json['c_photo'];
    cStatus = json['c_status'];
    lastDate = json['last_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ctname'] = this.ctname;
    data['regdate'] = this.regdate;
    data['emailid'] = this.emailid;
    data['mobile'] = this.mobile;
    data['cname'] = this.cname;
    data['personname'] = this.personname;
    data['address'] = this.address;
    data['designation'] = this.designation;
    data['totalemp'] = this.totalemp;
    data['c_photo'] = this.cPhoto;
    data['c_status'] = this.cStatus;
    data['last_date'] = this.lastDate;
    return data;
  }
}
