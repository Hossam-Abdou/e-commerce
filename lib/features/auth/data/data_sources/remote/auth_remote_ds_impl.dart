import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/api/status_codes.dart';
import 'package:e_commerce/core/cache/shared_pref.dart';
import 'package:e_commerce/core/exceptions/exceptions.dart';
import 'package:e_commerce/features/auth/data/data_sources/remote/auth_remote_ds.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:e_commerce/features/auth/domain/entities/sign_up_entity.dart';
import 'package:flutter/material.dart';

class AuthRemoteDsImpl implements AuthRemoteDs{
   ApiManager apiManager;

   AuthRemoteDsImpl(this.apiManager);

  @override
  Future<bool> signIn(String email, String password) async{
    try{
      final response = await apiManager.postData(
          endPoint: EndPoints.signIn,
          body: {"email": email, "password": password});

      if (response.statusCode == StatusCodes.success) {

        bool set=  await CacheHelper.setData<String>("token", response.data['token']);
        String? token = CacheHelper.getData<String>("token");

        debugPrint('ROute $set');
        debugPrint('ROute $token');
        return true;
      }
return false;
    }
    catch(e){
      throw RemoteException(e.toString());

    }
  }

  @override
  Future<UserModel> signUp(SignUpEntity signUpEntity) {
    throw UnimplementedError();
  }
}