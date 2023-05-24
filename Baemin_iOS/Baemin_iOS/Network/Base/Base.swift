//
//  Base.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/16.
//

import Foundation

enum Config {
<<<<<<< HEAD

    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
        }
    }

=======
    
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
            static let api = "MOVIE_API"
        }
    }
    
<<<<<<< HEAD
>>>>>>> 8a1112a (#21 [Add] API 연결 파일, 폴더 추가)
=======
>>>>>>> 8f897ce (#22 [Merge] 로컬 feat/#22와 원격 feat/#22 브랜치 사이의 충돌 해결)
>>>>>>> 026436f (#22 [Merge] develop 브랜치와 로컬 feat/#22 브랜치 병합)
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot found.")
        }
        return dict
    }()
}

extension Config {
<<<<<<< HEAD

=======
    
<<<<<<< HEAD
>>>>>>> 8a1112a (#21 [Add] API 연결 파일, 폴더 추가)
=======
>>>>>>> 8f897ce (#22 [Merge] 로컬 feat/#22와 원격 feat/#22 브랜치 사이의 충돌 해결)
>>>>>>> 026436f (#22 [Merge] develop 브랜치와 로컬 feat/#22 브랜치 병합)
    static let baseURL: String = {
        guard let key = Config.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("Base URL is not set in plist for this configuration.")
        }
        return key
    }()
<<<<<<< HEAD
=======
    
    static let api: String = {
        guard let key = Config.infoDictionary[Keys.Plist.api] as? String else {
            fatalError("Base URL is not set in plist for this configuration.")
        }
        return key
    }()
<<<<<<< HEAD
>>>>>>> 8a1112a (#21 [Add] API 연결 파일, 폴더 추가)
=======
>>>>>>> 8f897ce (#22 [Merge] 로컬 feat/#22와 원격 feat/#22 브랜치 사이의 충돌 해결)
>>>>>>> 026436f (#22 [Merge] develop 브랜치와 로컬 feat/#22 브랜치 병합)
}
