class CustomerListModel {
  List<Server>? server;

  CustomerListModel({this.server});

  CustomerListModel.fromJson(Map<String, dynamic> json) {
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
  String? customername;
  String? customercompanyname;
  String? customercontactno;
  String? customeremailid;
  String? customerid;

  Server(
      {this.customername,
        this.customercompanyname,
        this.customercontactno,
        this.customeremailid,
        this.customerid});

  Server.fromJson(Map<String, dynamic> json) {
    customername = json['customername'];
    customercompanyname = json['customercompanyname'];
    customercontactno = json['customercontactno'];
    customeremailid = json['customeremailid'];
    customerid = json['customerid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customername'] = this.customername;
    data['customercompanyname'] = this.customercompanyname;
    data['customercontactno'] = this.customercontactno;
    data['customeremailid'] = this.customeremailid;
    data['customerid'] = this.customerid;
    return data;
  }
}
