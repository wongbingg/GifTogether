//
//  DIContainer.swift
//  GifTogether
//
//  Created by 이원빈 on 2023/03/17.
//

import Foundation

final class DIContainer {
    
    // MARK: - Persistent Storage
    lazy var gifticonQueriesStorage: GifticonQueriesStorage = CoreDataGifticonQueriesStorage(
        maxStorageLimit: 10
    )
    
    // MARK: - Login ViewModel
    func makeLoginViewModel() -> LoginViewModel {
        return LoginViewModel(
            loginUseCase: makeLoginUseCase(),
            createUserUseCase: makeCreateUserUseCase(),
            verifyPhoneNumberUseCase: makeVerifyPhoneNumberUseCase(),
            verifyCodeUseCase: makeVerifyCodeUseCase()
        )
    }
    
    // MARK: - Home ViewModel
    func makeHomeViewModel() -> HomeViewModel {
        return HomeViewModel(
            fetchAllGifticonsUseCase: makeFetchAllGifticonsUseCase(),
            registerGifticonUseCase: makeRegisterGifticonUseCase(),
            registerImageUseCase: makeRegisterImageUseCase()
        )
    }
    
    // MARK: - MyPage ViewModel
    func makeMyPageViewModel() -> MyPageViewModel {
        return MyPageViewModel(
            fetchUserInfoUseCase: makeFetchUserInfoUseCase(),
            fetchGifticonUseCase: makeFetchGifticonUseCase(),
            deleteAccountUseCase: makeDeleteAccountUseCase(),
            deleteGifticonUseCase: makeDeleteGifticonUseCase(),
            deleteImageUseCase: makeDeleteImageUseCase()
        )
    }
    
    // MARK: - Search ViewModel
    func makeSearchViewModel() -> SearchViewModel {
        return SearchViewModel(
            searchGifticonUseCase: makeSearchGifticonUseCase(),
            searchBrandUseCase: makeSearchBrandUseCase(),
            fetchRecentGifticonQueriesUseCase: makeFetchRecentGifticonQueriesUseCase(),
            deleteAllGifticonQueriesUseCase: makeDeleteAllGifticonQueriesUseCase()
        )
    }
    
    func makeFavoriteViewModel() -> FavoriteViewModel {
        return FavoriteViewModel(
            fetchUserInfoUseCase: makeFetchUserInfoUseCase(),
            fetchAllGifticonsUseCase: makeFetchAllGifticonsUseCase(),
            updateUserInfoUseCase: makeFavoriteUseCase(),
            updateGifticonUseCase: makeUpdateGifticonUsecase()
        )
    }
    
    func makeReportViewModel() -> ReportViewModel {
        return ReportViewModel(
            createReportUseCase: makeCreateReportUseCase()
        )
    }
    
    // MARK: - UseCases
    func makeLoginUseCase() -> LoginUseCase {
        return DefaultLoginUseCase(firebaseAuthService: makeFirebaseAuthService())
    }
    
    func makeCreateUserUseCase() -> CreateUserUseCase {
        return DefaultCreateUserUseCase(
            firebaseAuthService: makeFirebaseAuthService(),
            firestoreService: makeUserInfoRepository()
        )
    }
    
    func makeDeleteGifticonUseCase() -> DeleteGifticonUseCase {
        return DefaultDeleteGifticonUseCase(
            gifticonRepository: makeGifticonRepository(),
            userInfoRepository: makeUserInfoRepository()
        )
    }
    
    func makeFetchAllGifticonsUseCase() -> FetchAllGifticonsUseCase {
        return DefaultFetchAllGifticonsUseCase(
            gifticonRepository: makeGifticonRepository()
        )
    }
    
    func makeFetchUserInfoUseCase() -> FetchUseInfoUseCase {
        return DefaultFetchUseInfoUseCase(
            userInfoRepository: makeUserInfoRepository()
        )
    }
    
    func makeFavoriteUseCase() -> UpdateUserInfoUseCase {
        return DefaultUpdateUserInfoUseCase(
            userInfoRepository: makeUserInfoRepository()
        )
    }
    
    func makeSearchGifticonUseCase() -> SearchGifticonUseCase {
        return DefaultSearchGifticonUseCase(
            gifticonRepository: makeGifticonRepository(),
            gifticonQueriesRepository: makeGifticonQueriesRepository()
        )
    }
    
    func makeFetchRecentGifticonQueriesUseCase() -> FetchRecentGifticonQueriesUseCase {
        return DefaultFetchRecentGifticonQueriesUseCase(
            gifticonQueriesRepository: makeGifticonQueriesRepository()
        )
    }
    
    func makeDeleteAllGifticonQueriesUseCase() -> DeleteAllGifticonQueriesUseCase {
        return DefaultDeleteAllGifticonQueriesUseCase(
            gifticonQueriesRepository: makeGifticonQueriesRepository()
        )
    }
    
    func makeUpdateGifticonUsecase() -> UpdateGifticonUseCase {
        return DefaultUpdateGifticonUseCase(
            gifticonRepository: makeGifticonRepository()
        )
    }
    
    func makeDeleteAccountUseCase() -> DeleteAccountUseCase {
        return DefaultDeleteAccountUseCase(
            firebaseAuthService: makeFirebaseAuthService(),
            userInfoRepository: makeUserInfoRepository(),
            gifticonRepository: makeGifticonRepository(),
            firestorageRepository: makeFirestorageRepository()
        )
    }
    
    func makeRegisterGifticonUseCase() -> RegisterGifticonUseCase {
        return DefaultRegisterGifticonUseCase(
            userInfoRepository: makeUserInfoRepository(),
            gifticonRepository: makeGifticonRepository()
        )
    }
    
    func makeSearchBrandUseCase() -> SearchBrandUseCase {
        return DefaultSearchBrandUseCase(
            gifticonRepository: makeGifticonRepository()
        )
    }
    
    func makeFetchGifticonUseCase() -> FetchGifticonUseCase {
        return DefaultFetchGifticonUseCase(
            gifticonRepository: makeGifticonRepository()
        )
    }
    
    func makeCreateReportUseCase() -> CreateReportUseCase {
        return DefaultCreateReportUseCase(
            reportRepository: makeReportRepository()
        )
    }
    
    func makeRegisterImageUseCase() -> RegisterImageUseCase {
        return DefaultRegisterImageUseCase(
            firestorageRepository: makeFirestorageRepository()
		)
	}

    func makeVerifyPhoneNumberUseCase() -> RequestVerificationCodeUseCase {
        return DefaultRequestVerificationCodeUseCase(
            firebaseAuthService: makeFirebaseAuthService()
        )
    }
    
    func makeVerifyCodeUseCase() -> VerifyCodeUseCase {
        return DefaultVerifyCodeUseCase(
            firebaseAuthService: makeFirebaseAuthService()
        )
    }
    
    func makeDeleteImageUseCase() -> DeleteImageUseCase {
        return DefaultDeleteImageUseCase(
            firestorageRepository: makeFirestorageRepository()
        )
    }
    
    // MARK: - Data
    func makeFirebaseAuthService() -> DefaultFirebaseAuthService {
        return DefaultFirebaseAuthService()
    }
    
    func makeUserInfoRepository() -> UserInfoRepository {
        return UserInfoRepository()
    }
    
    func makeGifticonRepository() -> GifticonRepository {
        return GifticonRepository()
    }
    
    func makeReportRepository() -> ReportRepository {
        return ReportRepository()
    }
    
    func makeGifticonQueriesRepository() -> GifticonQueriesRepository {
        return DefaultGifticonQueriesRepository(
            gifticonQueriesPersistentStorage: gifticonQueriesStorage
        )
    }
    
    func makeFirestorageRepository() -> FirestorageRepository {
        return DefaultFirestorageRepository()
    }
}
