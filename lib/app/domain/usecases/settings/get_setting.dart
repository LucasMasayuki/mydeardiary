import 'package:equatable/equatable.dart';
import 'package:mydeardiary/app/domain/entities/setting_entity.dart';

abstract class GetSetting {
  Future<SettingEntity?> getSetting(GetSettingParams params);
}

class GetSettingParams extends Equatable {
  final int userId;

  @override
  List get props => [
        userId,
      ];

  const GetSettingParams({
    required this.userId,
  });
}
