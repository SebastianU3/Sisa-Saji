import 'package:supabase_flutter/supabase_flutter.dart';

class Database {

  // final testVariable = Supabase.instance.client.auth

  SupabaseClient get supabaseClientInstance {
    return Supabase.instance.client;
  }

  void signUp({email,password}){
    supabaseClientInstance.auth.signUp(email: email, password: password,);
  }

  void signIn({email,password}){
    supabaseClientInstance.auth.signInWithPassword(email: email, password: password,);
  }

  User? get currentUser{
    return supabaseClientInstance.auth.currentUser;
  }

  
}
