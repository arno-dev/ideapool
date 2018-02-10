//
//  Constants.swift
//  Idea Pool
//
//  Created by Arnaud Phommasone on 9/02/18.
//  Copyright © 2018 Arnaud Phommasone. All rights reserved.
//

import UIKit

/*
 Signup datas
 {
 "email": "arnaud.phommasone@codementor.io",
 "name": "Arnaud Phommasone",
 "password": "the-Secret-123"
 
 Response 201 :
 
 "jwt": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJleHAiOjE1MTgyMjUxNTEsImlkIjoiZ2wxcnkxZ2htIiwiZW1haWwiOiJhcm5hdWQucGhvbW1hc29uZUBjb2RlbWVudG9yLmlvIiwibmFtZSI6IkFybmF1ZCBQaG9tbWFzb25lIn0.cDrDVtT-bTBog7DGbMfvYUDbDSj1dB4xZgNYWIWiAKDOX-0-iFCx4GVVAB26vMll1-2DTYHDHUVsvx_Un8BGGlpZ1DL6fFRbHP18ZK230wmrbfz1Ry8EI3lsLg1r8Zx4Bi2d6-r1GiMFybCksmV-DMLkgSBmN9fPeU2RK4IF_3Mh3KKUNIL1mTFXcY9Bjt8fR7kYlG70gXGx6Z7QAegOwoe_w683Pk5ZlOVmseqfHVfNtqOEV5nkbDc2_1HcYCG3LY8NBbMZwucf0r7eOvrcG43t4BUg81s8EtIHvVutLtmV91893N4nY4Pys_IhrZfH1JQaqYmLZrjqmvaCATdg8SpwFrd2enRw-WspOYiIs27ozUXP6P1mUAhMmeL7LM5Vvpcp4qlcFH_j6mqAPiDF13f0P7xVHjSs1DwMQRINHqfHE7NJb4E-SuuaA56qqDR5eNIMQ97hVV1lIbXb7IxstN1scMHYgSj_BVVP3aMsXZsOxZT5AWl8HSiEKPMM83TqZ8N1obkLyu8VWBVtYuIeE0efx3AgytTgfUkI9eBTF12y4HuNI6Q9F0BICrmXLkYquF0NC1Cp9dt9swQejgt-p2tZzk_2c7qgQSvshr_-KeiBMN1ZWNxGHxDO3i-8QtSDm977I7XrjcgFdSK2HeWIdMzIC7V4TNn1LXnNnoArr0k",
 "refresh_token": "33be8dd8beab55b6f62ffd82d85c09297c4be8ac3b473bf34b6fa69348928bca878b47fff7c1a7b09fb17cdc9f242c124165"
 }
 
 */
struct Constants{
        struct Network {
            static let kBaseURL = "https://small-project-api.herokuapp.com"
            
            // Signup
            static let kSignupEndPoint = "/users"
            
            // Login
            static let kUserLoginTokenEndPoint = "/access-tokens"
            static let kUserLoginRefreshTokenEndPoint = "/access-tokens/refresh"
            
            // Me
            static let kUserInfoEndPoint = "/me"
    }
}
