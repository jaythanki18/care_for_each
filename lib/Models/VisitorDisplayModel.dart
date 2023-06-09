class VisitorDisplayModel {
  List<Server>? server;

  VisitorDisplayModel({this.server});

  VisitorDisplayModel.fromJson(Map<String, dynamic> json) {
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
  String? veid;
  String? eEmailid;
  String? photo;
  String? date;
  String? visitername;
  String? companyname;
  String? area;
  String? address;
  String? discussion;
  String? time;
  String? contactnum;
  String? visiterEmailid;
  String? ename;
  String? result;

  Server(
      {this.veid,
        this.eEmailid,
        this.photo,
        this.date,
        this.visitername,
        this.companyname,
        this.area,
        this.address,
        this.discussion,
        this.time,
        this.contactnum,
        this.visiterEmailid,
        this.ename,
        this.result});

  Server.fromJson(Map<String, dynamic> json) {
    veid = json['veid'];
    eEmailid = json['e_emailid'];
    photo = json['photo'];
    date = json['date'];
    visitername = json['visitername'];
    companyname = json['companyname'];
    area = json['area'];
    address = json['address'];
    discussion = json['discussion'];
    time = json['time'];
    contactnum = json['contactnum'];
    visiterEmailid = json['visiter_emailid'];
    ename = json['ename'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['veid'] = this.veid;
    data['e_emailid'] = this.eEmailid;
    data['photo'] = this.photo;
    data['date'] = this.date;
    data['visitername'] = this.visitername;
    data['companyname'] = this.companyname;
    data['area'] = this.area;
    data['address'] = this.address;
    data['discussion'] = this.discussion;
    data['time'] = this.time;
    data['contactnum'] = this.contactnum;
    data['visiter_emailid'] = this.visiterEmailid;
    data['ename'] = this.ename;
    data['result'] = this.result;
    return data;
  }
}
