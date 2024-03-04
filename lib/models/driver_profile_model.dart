class DriverProfileModel {
  bool? status;
  String? message;
  Data? data;

  DriverProfileModel({this.status, this.message, this.data});

  DriverProfileModel.fromJson(Map<String, dynamic> json) {
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
  dynamic firstName;
  dynamic middleName;
  dynamic lastName;
  dynamic phone;
  dynamic email;
  dynamic location;
  dynamic dob;
  dynamic identityCard;
  dynamic insuranceNo;
  dynamic vehicleNo;
  dynamic licenceNo;
  dynamic address1;
  dynamic address2;
  dynamic city;
  dynamic state;
  dynamic code;
  dynamic licenceFrontImage;
  dynamic licenceBackImage;
  dynamic insurance;
  dynamic idFrontImage;
  dynamic idBackImage;
  dynamic profileImage;

  Data(
      {this.firstName,
        this.middleName,
        this.lastName,
        this.phone,
        this.email,
        this.location,
        this.dob,
        this.identityCard,
        this.insuranceNo,
        this.vehicleNo,
        this.licenceNo,
        this.address1,
        this.address2,
        this.city,
        this.state,
        this.code,
        this.licenceFrontImage,
        this.licenceBackImage,
        this.insurance,
        this.idFrontImage,
        this.idBackImage,
        this.profileImage});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    location = json['location'];
    dob = json['dob'];
    identityCard = json['identity_card'];
    insuranceNo = json['insurance_no'];
    vehicleNo = json['vehicle_no'];
    licenceNo = json['licence_no'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    code = json['code'];
    licenceFrontImage = json['licence_front_image'];
    licenceBackImage = json['licence_back_image'];
    insurance = json['insurance'];
    idFrontImage = json['id_front_image'];
    idBackImage = json['id_back_image'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['location'] = this.location;
    data['dob'] = this.dob;
    data['identity_card'] = this.identityCard;
    data['insurance_no'] = this.insuranceNo;
    data['vehicle_no'] = this.vehicleNo;
    data['licence_no'] = this.licenceNo;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['code'] = this.code;
    data['licence_front_image'] = this.licenceFrontImage;
    data['licence_back_image'] = this.licenceBackImage;
    data['insurance'] = this.insurance;
    data['id_front_image'] = this.idFrontImage;
    data['id_back_image'] = this.idBackImage;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
