//* convert the response into a non nullable model

import 'package:mvvm/app/extentions.dart';
import 'package:mvvm/data/responses/responses.dart';
import 'package:mvvm/domain/model.dart';

const empty = "";
const zero = 0;

//* Customer Response

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        id: this?.id.orEmpty() ?? empty,
        name: this?.name.orEmpty() ?? empty,
        numOfNotifications: this?.numOfNotifications?.orZero() ?? zero);
  }
}

//* Contact Response
extension ContactResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
        phone: this?.phone.orEmpty() ?? empty,
        link: this?.link.orEmpty() ?? empty,
        email: this?.link?.orEmpty() ?? empty);
  }
}

//* Authentication Response
extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
        customer: this!.customer.toDomain(),
        contacts: this!.contacts.toDomain());
  }
}
