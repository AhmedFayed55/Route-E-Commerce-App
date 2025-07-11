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
import '../../features/main_layout/categories/data/data_sources/categories_tab_ds.dart'
    as _i851;
import '../../features/main_layout/categories/data/data_sources/categories_tab_ds_impl.dart'
    as _i900;
import '../../features/main_layout/categories/data/repositories/categories_tab_repo_impl.dart'
    as _i277;
import '../../features/main_layout/categories/domain/repositories/categories_tab_repo.dart'
    as _i927;
import '../../features/main_layout/categories/domain/use_cases/get_sub_categories_use_case.dart'
    as _i356;
import '../../features/main_layout/categories/presentation/manager/categories_tab_cubit.dart'
    as _i625;
import '../../features/main_layout/home/data/data_sources/remote_ds/home_tab_remote_ds.dart'
    as _i263;
import '../../features/main_layout/home/data/data_sources/remote_ds_impl/home_tab_remote_ds_impl.dart'
    as _i422;
import '../../features/main_layout/home/data/repositories/home_tab_repo_impl.dart'
    as _i114;
import '../../features/main_layout/home/domain/repositories/home_tab_repo.dart'
    as _i786;
import '../../features/main_layout/home/domain/use_cases/get_all_brands_use_case.dart'
    as _i597;
import '../../features/main_layout/home/domain/use_cases/get_all_categories_use_case.dart'
    as _i1071;
import '../../features/main_layout/home/presentation/manager/home_tab_cubit.dart'
    as _i460;
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
    gh.factory<_i263.HomeTabRemoteDataSource>(
      () => _i422.HomeTabRemoteDataSourceImpl(
        apiManager: gh<_i1047.ApiManager>(),
      ),
    );
    gh.factory<_i851.CategoriesTabDataSource>(
      () => _i900.CategoriesTabDataSourceImpl(gh<_i1047.ApiManager>()),
    );
    gh.factory<_i212.AuthRepository>(
      () => _i409.AuthRepositoryImpl(dataSource: gh<_i364.AuthDataSource>()),
    );
    gh.factory<_i786.HomeTabRepository>(
      () => _i114.HomeTabRepositoryImpl(
        remoteDataSource: gh<_i263.HomeTabRemoteDataSource>(),
      ),
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
    gh.factory<_i927.CategoriesTabRepo>(
      () => _i277.CategoriesTabRepoImpl(gh<_i851.CategoriesTabDataSource>()),
    );
    gh.factory<_i356.GetSubCategoriesUseCase>(
      () => _i356.GetSubCategoriesUseCase(gh<_i927.CategoriesTabRepo>()),
    );
    gh.factory<_i597.GetAllBrandesUseCase>(
      () => _i597.GetAllBrandesUseCase(
        homeRepository: gh<_i786.HomeTabRepository>(),
      ),
    );
    gh.factory<_i1071.GetAllCategoriesUseCase>(
      () => _i1071.GetAllCategoriesUseCase(
        homeRepository: gh<_i786.HomeTabRepository>(),
      ),
    );
    gh.factory<_i625.CategoriesTabCubit>(
      () => _i625.CategoriesTabCubit(
        allCategoriesUseCase: gh<_i1071.GetAllCategoriesUseCase>(),
        subCategoriesUseCase: gh<_i356.GetSubCategoriesUseCase>(),
      ),
    );
    gh.factory<_i460.HomeTabCubit>(
      () => _i460.HomeTabCubit(
        getAllCategoriesUseCase: gh<_i1071.GetAllCategoriesUseCase>(),
        getAllBrandesUseCase: gh<_i597.GetAllBrandesUseCase>(),
      ),
    );
    return this;
  }
}
