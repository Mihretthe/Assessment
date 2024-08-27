import 'package:bloc/bloc.dart';
import 'package:grocery/features/grocery/domain/usecases/get_all_groceries.dart';
import 'package:grocery/features/grocery/presentation/bloc/events.dart';
import 'package:grocery/features/grocery/presentation/bloc/states.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  final GetAllGroceriesUseCase getAllGroceriesUseCase;
  GroceryBloc({required this.getAllGroceriesUseCase}) : super(InitialState()){

    on<GetAllGroceriesEvent>((event, emit) async {
      emit(LoadingState());
      try{
        final groceries = await getAllGroceriesUseCase.call();
        groceries.fold((l) => emit(ErrorState(message:  l.message)), (r) => emit(LoadedAllState(groceries: r)));
      }catch(e){
        emit(ErrorState(message: e.toString()));
      }
    });
  }

}
