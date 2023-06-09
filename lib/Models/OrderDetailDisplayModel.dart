class OrderDetailDisplayModel {
  List<Server>? server;
  List<Server1>? server1;

  OrderDetailDisplayModel({this.server, this.server1});

  OrderDetailDisplayModel.fromJson(Map<String, dynamic> json) {
    if (json['server'] != null) {
      server = <Server>[];
      json['server'].forEach((v) {
        server!.add(new Server.fromJson(v));
      });
    }
    if (json['server1'] != null) {
      server1 = <Server1>[];
      json['server1'].forEach((v) {
        server1!.add(new Server1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.server != null) {
      data['server'] = this.server!.map((v) => v.toJson()).toList();
    }
    if (this.server1 != null) {
      data['server1'] = this.server1!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Server {
  String? customername;
  String? ename;
  String? customercompanyname;
  String? customercontactno;
  String? customeremailid;
  String? date;
  String? eEmailid;
  String? grandtotal;
  int? paidamount;
  String? employeePhoto;
  String? employeeDesignation;
  String? remindDate;

  Server(
      {this.customername,
        this.ename,
        this.customercompanyname,
        this.customercontactno,
        this.customeremailid,
        this.date,
        this.eEmailid,
        this.grandtotal,
        this.paidamount,
        this.employeePhoto,
        this.employeeDesignation,
        this.remindDate});

  Server.fromJson(Map<String, dynamic> json) {
    customername = json['customername'];
    ename = json['ename'];
    customercompanyname = json['customercompanyname'];
    customercontactno = json['customercontactno'];
    customeremailid = json['customeremailid'];
    date = json['date'];
    eEmailid = json['e_emailid'];
    grandtotal = json['grandtotal'];
    paidamount = json['paidamount'];
    employeePhoto = json['employee_photo'];
    employeeDesignation = json['employee_designation'];
    remindDate = json['remind_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customername'] = this.customername;
    data['ename'] = this.ename;
    data['customercompanyname'] = this.customercompanyname;
    data['customercontactno'] = this.customercontactno;
    data['customeremailid'] = this.customeremailid;
    data['date'] = this.date;
    data['e_emailid'] = this.eEmailid;
    data['grandtotal'] = this.grandtotal;
    data['paidamount'] = this.paidamount;
    data['employee_photo'] = this.employeePhoto;
    data['employee_designation'] = this.employeeDesignation;
    data['remind_date'] = this.remindDate;
    return data;
  }
}

class Server1 {
  String? date;
  String? paymenttype;
  String? amount;
  int? pendingAmount;

  Server1({this.date, this.paymenttype, this.amount, this.pendingAmount});

  Server1.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    paymenttype = json['paymenttype'];
    amount = json['amount'];
    pendingAmount = json['pending_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['paymenttype'] = this.paymenttype;
    data['amount'] = this.amount;
    data['pending_amount'] = this.pendingAmount;
    return data;
  }
}
