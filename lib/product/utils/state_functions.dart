import 'package:fluttermentor/features/view/houses/houses_view.dart';
import '../../features/view-model/home/cubit/home_cubit.dart';
import '../../features/view/home/home_view.dart';
import '../../features/view/profile/profile_view.dart';

homeBottomContent(HomeCompleted state) {
  // this func is about bottom navigation condition.
  if (state.bottomNavigationIndex == 0) {
    return Home(
      state: state,
    );
  } else if (state.bottomNavigationIndex == 1) {
    return const HousesView();
  } else if (state.bottomNavigationIndex == 2) {
    return const ProfileView();
  }
}
