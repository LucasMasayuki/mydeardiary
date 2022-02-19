import 'package:equatable/equatable.dart';
import 'package:mydeardiary/app/domain/entities/setting_entity.dart';

abstract class GetSetting {
  Future<SettingEntity?> getSetting(GetSettingParams params);
}

class GetSettingParams extends Equatable {
  final int userId;

  List get props => [
        userId,
      ];

  GetSettingParams({
    required this.userId,
  });
}
