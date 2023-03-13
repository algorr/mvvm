//* convert the response into a non nullable model

import 'package:mvvm/app/extentions.dart';
import 'package:mvvm/data/responses/responses.dart';
import 'package:mvvm/domain/model.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        id: this?.id.orEmpty() ?? "",
        name: this?.name.orEmpty() ?? "",
        numOfNotifications: this?.numOfNotifications?.orZero() ?? 0);
  }
}
