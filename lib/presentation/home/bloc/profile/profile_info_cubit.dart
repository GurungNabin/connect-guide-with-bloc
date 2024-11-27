import 'package:connect_guide/domain/usecases/auth/get_user.dart';
import 'package:connect_guide/presentation/home/bloc/profile/profile_info_state.dart';
import 'package:connect_guide/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  ProfileInfoCubit() : super(ProfileInfoLoading());

  Future<void> getUser() async {
    print('Fetching user...');
    var user = await sl<GetUserUseCase>().call();
    print('object: $user');

    user.fold((ifLeft) {
      print('Error fetching user: $ifLeft');
      emit(ProfileInfoError());
    }, (userEntity) {
      // print('User fetched successfully: ${userEntity.fullName}');
      emit(ProfileInfoLoaded(userEntity: userEntity));
    });
  }
}
