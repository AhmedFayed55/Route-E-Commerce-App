// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_source/auth_data_source.dart' as _i364;
import '../../features/auth/data/data_source/auth_data_source_impl.dart'
    as _i985;
import '../../features/auth/data/repository/auth_repository_impl.dart' as _i409;
import '../../features/auth/domain/repos/repositories/auth_repository.dart'
    as _i212;
import '../../features/auth/domain/use_case/login_use_case.dart' as _i973;
import '../../features/auth/domain/use_case/register_use_case.dart' as _i463;
import '../../features/auth/presentation/manager/Auth_cubit.dart' as _i505;
import '../api/api_manager.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i364.AuthDataSource>(
      () => _i985.AuthDataSourceImpl(apiManager: gh<_i1047.ApiManager>()),
    );
    gh.factory<_i212.AuthRepository>(
      () => _i409.AuthRepositoryImpl(dataSource: gh<_i364.AuthDataSource>()),
    );
    gh.factory<_i973.LoginUseCase>(
      () => _i973.LoginUseCase(authRepository: gh<_i212.AuthRepository>()),
    );
    gh.factory<_i463.RegisterUseCase>(
      () => _i463.RegisterUseCase(authRepository: gh<_i212.AuthRepository>()),
    );
    gh.factory<_i505.AuthCubit>(
      () => _i505.AuthCubit(
        registerUseCase: gh<_i463.RegisterUseCase>(),
        loginUseCase: gh<_i973.LoginUseCase>(),
      ),
    );
    return this;
  }
}
