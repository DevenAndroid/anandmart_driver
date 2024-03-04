class DriverDashboardModel {
  bool? status;
  String? message;
  Data? data;

  DriverDashboardModel({this.status, this.message, this.data});

  DriverDashboardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? username;
  bool? deliveryMode;
  int? deliveredOrders;
  int? pendingOrders;
  String? createdAt;
  int? todaysOrder;
  List<DriverList>? driverList;

  Data(
      {this.username,
        this.deliveryMode,
        this.deliveredOrders,
        this.pendingOrders,
        this.createdAt,
        this.todaysOrder,
        this.driverList});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    deliveryMode = json['delivery_mode'];
    deliveredOrders = json['deliveredOrders'];
    pendingOrders = json['pendingOrders'];
    createdAt = json['created_at'];
    todaysOrder = json['todaysOrder'];
    if (json['driverList'] != null) {
      driverList = <DriverList>[];
      json['driverList'].forEach((v) {
        driverList!.add(new DriverList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['delivery_mode'] = this.deliveryMode;
    data['deliveredOrders'] = this.deliveredOrders;
    data['pendingOrders'] = this.pendingOrders;
    data['created_at'] = this.createdAt;
    data['todaysOrder'] = this.todaysOrder;
    if (this.driverList != null) {
      data['driverList'] = this.driverList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DriverList {
  String? date;
  int? orderId;
  Address? address;

  DriverList({this.date, this.orderId, this.address});

  DriverList.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    orderId = json['order_id'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['order_id'] = this.orderId;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

class Address {
  int? id;
  String? address1;
  String? address2;
  String? city;
  String? state;
  int? zipCode;
  String? addressType;
  String? otherInstruction;

  Address(
      {this.id,
        this.address1,
        this.address2,
        this.city,
        this.state,
        this.zipCode,
        this.addressType,
        this.otherInstruction});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    addressType = json['address_type'];
    otherInstruction = json['other_instruction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip_code'] = this.zipCode;
    data['address_type'] = this.addressType;
    data['other_instruction'] = this.otherInstruction;
    return data;
  }
}
