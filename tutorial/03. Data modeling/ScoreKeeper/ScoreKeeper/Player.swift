//
//  Player.swift
//  ScoreKeeper
//
//  Created by Taeeun on 4/13/26.
//

import Foundation

struct Player: Identifiable { //Player 타입 설정, Identifiable: id가 필수인 프로토콜
    let id = UUID() //고유값 랜덤 생성 -> id: 코드 필요 X
    
    var name: String
    var score: Int //배열 불일치 문제 해결
}
