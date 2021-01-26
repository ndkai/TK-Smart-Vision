import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:fai_kul/feature/attendance/attendance_method.dart';
import 'package:fai_kul/feature/attendance_his/data/repositories/history_attendance_repository_impl.dart';
import 'package:fai_kul/feature/dayoff/school_leave_list/data/data_sources/remote_school_leave_leave_dts.dart';
import 'package:fai_kul/feature/dayoff/school_leave_list/data/repositories/schooleave_repo_ipml.dart';
import 'package:fai_kul/feature/dayoff/school_leave_list/domain/repositories/school_leave_list_repo.dart';
import 'package:fai_kul/feature/dayoff/school_leave_list/domain/use_cases/get_school_leave_list.dart';
import 'package:fai_kul/feature/dayoff/school_leave_list/presentation/school_leave_list/school_leave_list_bloc.dart';
import 'package:fai_kul/feature/login/domain/use_cases/get_current_user.dart';
import 'package:fai_kul/feature/manger_feature/statictis/data/data_sources/remote_statistic_datasourse.dart';
import 'package:fai_kul/feature/manger_feature/statictis/data/repositories/manager_statistic_repository_impl.dart';
import 'package:fai_kul/feature/manger_feature/statictis/domain/repositories/manager_statistic_repository.dart';
import 'package:fai_kul/feature/manger_feature/statictis/domain/use_cases/get_overrall_statistic.dart';
import 'package:fai_kul/feature/manger_feature/statictis/presentation/statistic/statistic_bloc.dart';
import 'package:fai_kul/feature/point_input/api/class_student/data/data_sources/remote_class_student_datasource.dart';
import 'package:fai_kul/feature/point_input/api/class_student/data/repositories/class_student_repo_impl.dart';
import 'package:fai_kul/feature/point_input/api/class_student/domain/repositories/classdtudent_repo.dart';
import 'package:fai_kul/feature/point_input/api/class_student/domain/use_cases/get_studentclass.dart';
import 'package:fai_kul/feature/point_input/api/class_student/presentation/manager/class_student/class_student_bloc.dart';
import 'package:fai_kul/feature/point_input/api/contact_book/data/data_sources/remote_contactbook_datasource.dart';
import 'package:fai_kul/feature/point_input/api/contact_book/domain/repositories/contactbook_repo.dart';
import 'package:fai_kul/feature/point_input/api/contact_book/domain/use_cases/get_contactbook.dart';
import 'package:fai_kul/feature/point_input/api/contact_book/presentation/manager/contact_book/contact_book_bloc.dart';
import 'package:fai_kul/feature/point_input/api/school_class/data/data_sources/remote_schoolclass_datasource.dart';
import 'package:fai_kul/feature/point_input/api/school_class/data/repositories/schoolclass_repo_ipml.dart';
import 'package:fai_kul/feature/point_input/api/school_class/domain/use_cases/get_school_class.dart';
import 'package:fai_kul/feature/point_input/api/school_class/presentation/manager/school_class/school_class_bloc.dart';
import 'package:fai_kul/feature/study_point/data/data_sources/remote_datasource_studypoint.dart';
import 'package:fai_kul/feature/study_point/data/repositories/studypoint_repo_impl.dart';
import 'package:fai_kul/feature/study_point/domain/repositories/studypoint_repo.dart';
import 'package:fai_kul/feature/study_point/domain/use_cases/get_studypoint_data.dart';
import 'package:fai_kul/feature/study_point/presentation/manager/study_point/study_point_bloc.dart';
import 'package:fai_kul/feature/top_recorder/data/data_sources/remote_recorder_datasource.dart';
import 'package:fai_kul/feature/top_recorder/data/repositories/recorder_repository_impl.dart';
import 'package:fai_kul/feature/top_recorder/domain/repositories/toprecorder_repository.dart';
import 'package:fai_kul/feature/top_recorder/domain/use_cases/get_top_recorder_data.dart';
import 'package:fai_kul/feature/top_recorder/presentation/manager/top_recoder/top_recoder_bloc.dart';
import 'package:fai_kul/feature/tuition_fee/data/data_sources/remote_student_fee.dart';
import 'package:fai_kul/feature/tuition_fee/data/repositories/fee_reposiroty_impl.dart';
import 'package:fai_kul/feature/tuition_fee/domain/repositories/fee_repository.dart';
import 'package:fai_kul/feature/tuition_fee/presentation/manager/fee/fee_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'core/utils/input_converter.dart';
import 'feature/attendance_his/data/data_sources/local_attendance_history_datasource.dart';
import 'feature/attendance_his/data/data_sources/remote_attendance_history_datasource.dart';
import 'feature/attendance_his/domain/repositories/history_attendance_repository.dart';
import 'feature/attendance_his/domain/use_cases/get_attendance_history_by_page.dart';
import 'feature/attendance_his/domain/use_cases/get_attendence_history.dart';
import 'feature/attendance_his/presentation/manager/attendance_his/attendance_his_bloc.dart';
import 'feature/login/data/data_sources/login_local_data_sourse.dart';
import 'feature/login/data/data_sources/login_response-data_source.dart';
import 'feature/login/data/repositories/login_repository_impl.dart';
import 'feature/login/domain/repositories/login_response_repository.dart';
import 'feature/login/domain/use_cases/login.dart';
import 'feature/login/presentation/manager/login/login_bloc.dart';
import 'feature/point_input/api/contact_book/data/repositories/contactbook_repo_impl.dart';
import 'feature/point_input/api/school_class/domain/repositories/schoolclass_repo.dart';
import 'feature/teacher_attendance_his/data/data_sources/local_attendance_history_datasource.dart';
import 'feature/teacher_attendance_his/data/data_sources/remote_attendance_history_datasource.dart';
import 'feature/teacher_attendance_his/data/repositories/history_attendance_repository_impl.dart';
import 'feature/teacher_attendance_his/domain/repositories/history_attendance_repository.dart';
import 'feature/teacher_attendance_his/domain/use_cases/get_attendance_history_by_page.dart';
import 'feature/teacher_attendance_his/domain/use_cases/get_attendence_history.dart';
import 'feature/teacher_attendance_his/presentation/manager/tattendance_his/tattendance_his_bloc.dart';
import 'feature/tuition_fee/domain/use_cases/get_student_fee.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => LoginBloc(
      lg: sl(),
      cu: sl(),
    ),
  );

  sl.registerFactory(
    () => AttendanceHisBloc(ah: sl(), ahbp: sl(), inputConverter: sl()),
  );

  sl.registerFactory(
    () => SchoolLeaveListBloc(getSchoolLeaveList: sl()),
  );

  sl.registerFactory(
    () => TAttendanceHisBloc(ah: sl(), ahbp: sl(), inputConverter: sl()),
  );

  sl.registerFactory(
    () => ContactBookBloc(getContactBook: sl()),
  );

  sl.registerFactory(
    () => FeeBloc(getStudentFee: sl()),
  );

  sl.registerFactory(
    () => TopRecoderBloc(getTopRecorderUsecase: sl()),
  );

  sl.registerFactory(
    () => StatisticBloc(getOverall: sl()),
  );

  sl.registerFactory(
    () => StudyPointBloc(getStudyPointData: sl()),
  );

  sl.registerFactory(
    () => SchoolClassBloc(getSchoolClass: sl()),
  );

  sl.registerFactory(
    () => ClassStudentBloc(getClassStudent: sl()),
  );
  //use case
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => GetSchoolLeaveList(sl()));
  sl.registerLazySingleton(() => GetContactBook(sl()));
  sl.registerLazySingleton(() => GetCurrentUser(sl()));
  sl.registerLazySingleton(() => GetAttendanceHistoryByPage(sl()));
  sl.registerLazySingleton(() => GetTAttendanceHistoryByPage(sl()));
  sl.registerLazySingleton(() => GetAttendanceHistory(sl()));
  sl.registerLazySingleton(() => GetTAttendanceHistory(sl()));
  sl.registerLazySingleton(() => GetStudentFee(sl()));
  sl.registerLazySingleton(() => GetTopRecorderUsecase(sl()));
  sl.registerLazySingleton(() => GetOverRallStatistic(sl()));
  sl.registerLazySingleton(() => GetStudyPointData(sl()));
  sl.registerLazySingleton(() => GetSchoolClass(sl()));
  sl.registerLazySingleton(() => GetClassStudent(sl()));
  // sl.registerLazySingleton(() => GetLO(sl()));
  // repo
  sl.registerLazySingleton<LoginResponseRepository>(() => LoginRepositoryImpl(
      loginResponseDataSource: sl(),
      networkInfo: sl(),
      localLoginDataSource: sl()));

  sl.registerLazySingleton<ClassStudentRepo>(() => ClassStudentRepoImpl(
        datasource: sl(),
        networkInfo: sl(),
      ));

  sl.registerLazySingleton<SchoolLeaveListRepo>(() => SchoolLeaveRepoListImpl(
        dataSource: sl(),
        networkInfo: sl(),
      ));

  sl.registerLazySingleton<ContactBookRepo>(() => ContactBookRepoImpl(
        remoteContactbookDataSource: sl(),
        networkInfo: sl(),
      ));

  sl.registerLazySingleton<SchoolClassRepo>(() => SchoolClassRepoImpl(
        dataSource: sl(),
        networkInfo: sl(),
      ));

  sl.registerLazySingleton<StudypointRepo>(
      () => StudyPointRepoIpml(networkInfo: sl(), datasourceStudyPoint: sl()));

  sl.registerLazySingleton<AttendanceHistoryRepository>(() =>
      AttendanceHistoryRepositoryImpl(
          networkInfo: sl(), remoteDataSource: sl(), localDataSource: sl()));

  sl.registerLazySingleton<TAttendanceHistoryRepository>(() =>
      TAttendanceHistoryRepositoryImpl(
          networkInfo: sl(), remoteDataSource: sl(), localDataSource: sl()));

  sl.registerLazySingleton<FeeRepository>(
      () => FeeRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));

  sl.registerLazySingleton<TopRecorderRepo>(() =>
      TopRecorderRepositoryImpl(networkInfo: sl(), recorderDataSource: sl()));

  sl.registerLazySingleton<ManagerStatisticRepository>(() =>
      ManagerStatisticRepoImpl(networkInfo: sl(), remoteDataSource: sl()));
  //data sourse
  sl.registerLazySingleton<LoginResponseDataSource>(
    () => LoginResponseImpl(client: sl()),
  );

  sl.registerLazySingleton<SchoolLeaveListDataSource>(
    () => SchoolLeaveDataSourceIpm(client: sl()),
  );

  sl.registerLazySingleton<RemoteContactbookDataSource>(
    () => RemoteContactbookDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<RemoteClassStudentDatasource>(
    () => RemoteClassStudentDatasourceImpl(client: sl()),
  );

  sl.registerLazySingleton<RemoteSchoolClassDataSource>(
    () => RemoteSchoolClassDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<RemoteDatasourceStudyPoint>(
    () => RemoteDatasourceStudyPointImpl(client: sl()),
  );

  sl.registerLazySingleton<RemoteAttendanceHistoryDataSource>(
      () => RemoteAttendanceHistoryDataSourceImpl(client: sl()));

  sl.registerLazySingleton<RemoteTAttendanceHistoryDataSource>(
      () => RemoteTAttendanceHistoryDataSourceImpl(client: sl()));

  sl.registerLazySingleton<LocalLoginDataSource>(
      () => LocalLoginDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<LocalAttendanceHistoryDataSource>(
      () => LocalAttendanceHistoryDataSourceIml(sharedPreferences: sl()));

  sl.registerLazySingleton<LocalTAttendanceHistoryDataSource>(
      () => LocalTAttendanceHistoryDataSourceIml(sharedPreferences: sl()));

  sl.registerLazySingleton<RemoteFeeDataSource>(
      () => RemoteFeeDataSourceImpl(client: sl()));

  sl.registerLazySingleton<RemoteRecorderDataSource>(
      () => RemoteRecorderDataSourceImpl(client: sl()));

  sl.registerLazySingleton<RemoteStatisticDatasource>(
      () => RemoteStatisticDatasourceIpml(client: sl()));
  // core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
