//
//  NFLSOauth2.swift
//  NFLSers-iOS
//
//  Created by Qingyang Hu on 18/01/2018.
//  Copyright © 2018 胡清阳. All rights reserved.
//

import Foundation
import p2_OAuth2
import Alamofire

class NFLSOauth2:OAuth2PasswordGrantDelegate {
    func loginController(oauth2: OAuth2PasswordGrant) -> AnyObject {
        return UIViewController()
    }
    
    var oauth2:OAuth2PasswordGrant
    init() {
        oauth2 = OAuth2PasswordGrant(settings: [
            "client_id": "0ZVYbRRc8n8WgbOGBCaWZUbJX7xRsU7BZGH3V+09ea8=",
            "client_secret": "Yda9kpPFTSuhRCzqqsdvzVJgwqpsr+lp6ulDxCbmJQIo1PcobX20ew7D5qKWxvUjbjNjdwv8m67JWjpZuwCFpQ==",
            "authorize_uri": "https://api-v3.nfls.io/oauth/authorize",
            "token_uri": "https://api-v3.nfls.io/oauth/accessToken",
            "scope": "",
            "secret_in_body": true,
            "keychain": true,
            "verbose": true
            ] as OAuth2JSON)
    }
    func login(username:String,password:String, completion: @escaping (_ success: Bool) -> Void) {
        oauth2.password = password
        oauth2.username = username
        oauth2.authorize { (_, error) in
            if error != nil {
                completion(false)
            }else{
                completion(true)
            }
        }
    }
    
}
