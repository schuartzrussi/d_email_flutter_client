import 'package:d_email_flutter_client/bloc/home/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(fetchError: false, loading: false));

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LoadEvent) {
      yield* _loadEmails(event);
    }
  }

  Stream<HomeState> _loadEmails(LoadEvent event) async* {
    yield state.copyWith(loading: true);

    // TODO
  }
}
