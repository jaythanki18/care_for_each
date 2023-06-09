class EmployeeComplainModel {
  List<Server>? server;

  EmployeeComplainModel({this.server});

  EmployeeComplainModel.fromJson(Map<String, dynamic> json) {
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
  String? cid;
  String? date;
  String? description;
  String? subject;
  String? ename;
  String? designation;
  String? photo;
  String? result;

  Server(
      {this.cid,
        this.date,
        this.description,
        this.subject,
        this.ename,
        this.designation,
        this.photo,
        this.result});

  Server.fromJson(Map<String, dynamic> json) {
    cid = json['cid'];
    date = json['date'];
    description = json['description'];
    subject = json['subject'];
    ename = json['ename'];
    designation = json['designation'];
    photo = json['photo'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cid'] = this.cid;
    data['date'] = this.date;
    data['description'] = this.description;
    data['subject'] = this.subject;
    data['ename'] = this.ename;
    data['designation'] = this.designation;
    data['photo'] = this.photo;
    data['result'] = this.result;
    return data;
  }
}
