import 'package:faker/faker.dart';

import 'package:mydeardiary/app/domain/entities/user_entity.dart';

class FakeUserFactory {
  static Map<String, dynamic> makeApiJson() => {
        'token': faker.guid.guid(),
        'name': faker.person.name(),
      };

  static UserEntity makeEntity() => UserEntity(token: faker.guid.guid());
}
