import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future<void> removeImage({required String bucket, required String path}) async {
  await supabase.storage.from(bucket).remove([path]);
}
