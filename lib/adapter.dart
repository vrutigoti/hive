import 'package:hive/hive.dart';
part 'adapter.g.dart';

@HiveType(typeId: 2)
class adapter extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String Contact;

  adapter(this.name, this.Contact);

  @override
  String toString() {
    return 'adapter{name: $name, Contact: $Contact}';
  }
}
