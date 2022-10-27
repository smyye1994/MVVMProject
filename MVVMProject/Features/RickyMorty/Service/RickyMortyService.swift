//
//  RickyMortyService.swift
//  MVVMProject
//
//  Created by Sümeyye Kılıçoğlu on 26.10.2022.
//

import Alamofire


enum RickyMortiServiceEndPoint: String {
    case BASE_URL = "https://rickandmortyapi.com/api"
    case PATH = "/character"
    
    static func characterPath() -> String{
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}

protocol IRickyMortyService {
    func fetchAllDatas(response: @escaping ([Result]?) -> Void)
}


struct RickyMortyService: IRickyMortyService {
    
    
    func fetchAllDatas(response: @escaping ([Result]?) -> Void) {
        AF.request(RickyMortiServiceEndPoint.characterPath()).responseDecodable(of: PostModel.self) { (model) in
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data.results)
        }
        
    }
}
