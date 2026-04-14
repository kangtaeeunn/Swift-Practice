//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by Taeeun on 4/13/26.
//

import SwiftUI

struct ContentView: View {
    //@State private var players: [String] = ["Anna", "Dana", "Kaya"]
    //@State private var scores: [Int] = [0, 0, 0]
    
    @State private var players: [Player] = [ //private var에 대해 알아보기
        Player(name: "Anna", score: 0),
        Player(name: "Dana", score: 0),
        Player(name: "Kaya", score: 0)
    ]
    
    
    var body: some View {
        VStack(alignment: .leading) { //왼쪽 병렬
            
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            Grid { //모든 행에서 같은 열끼리 너비 통일
                GridRow { //항목을 가로로 배치
                    Text("Player")
                        .gridColumnAlignment(.leading) //열 전체가 왼쪽 정렬
                    Text("Score")
                }
                .font(.headline)
                
                ForEach($players) {$player in //index에서 바인딩으로 전환
                    GridRow { //표의 한 행
                        TextField("Name", text: $player.name)
                        Text("\(player.score)")
                        //Foreach: 데이터를 돌면서 여러 개의 'View' 생성
                        //0..<players.count: ForEach문이 실행할 범위
                        //id: \.description: 배열의 인덱스 번호를 문자열로 변환하여 id로 사용
                        //클로저: ForEach가 인덱스 번호를 하나씩 넘겨줄 때마다 실행
                        //index in: ForEach가 넘겨주는 인덱스 번호를 index라는 이름으로 받음
                        //text: $players[index]: index번째 player 데이터와 양방향 연결
                        
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                        //"\(변수)": 변수를 문자열로 변환
                    }
                }
            }
            .padding(.vertical)
            
            Button("Add Player", systemImage: "plus") {
                //players.append("")
                //scores.append(0)
                //변수이름.append(""): 배열에 값 추가
                
                players.append(Player(name:"", score:0))
            }
        }
        
        
        Spacer()
    }
}

#Preview {
    ContentView()
}


