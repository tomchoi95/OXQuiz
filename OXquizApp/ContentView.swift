import SwiftUI

struct ContentView: View {
    private var quizData = quizs
    @State private var roundIndex: Int = 0
    @State private var countCorrect: Int = 0
    @State private var countWrong: Int = 0
    @State private var isQuizFinished: Bool = false // 퀴즈 종료 상태

    var body: some View {
        VStack {
            Text("알아맞춰 보세요")
                .font(.largeTitle)
                .padding(.top)

            Spacer()

            if roundIndex < quizData.count {
                Text(quizData[roundIndex].question)
                    .font(.title)
                    .frame(width: 300, height: 200)
                    .multilineTextAlignment(.center)
                    .padding()
            } else {
                Text("퀴즈가 종료되었습니다!")
                    .font(.title)
                    .frame(width: 300, height: 200)
                    .multilineTextAlignment(.center)
            }

            Spacer()

            HStack {
                Spacer()

                Button(action: { selectAnswer(isCorrect: true) }) {
                    Label("O", systemImage: "figure.wave")
                        .foregroundStyle(.green)
                        .font(.system(size: 30, weight: .bold))
                }

                Spacer()

                Button(action: { selectAnswer(isCorrect: false) }) {
                    Label("X", systemImage: "figure.kickboxing")
                        .foregroundStyle(.red)
                        .font(.system(size: 30, weight: .bold))
                }

                Spacer()
            }
            .padding()

            Spacer()

            HStack {
                Text("\(countCorrect)개 맞춤")
                    .font(.title)
                    .padding(.trailing)
                Text("\(countWrong)개 틀림")
                    .font(.title)
                    .padding(.leading)
            }

            Spacer()

            Button("카운트 초기화", action: reloadGame)
                .font(.largeTitle)
                .padding(.bottom)
        }
        .sheet(isPresented: $isQuizFinished) {
            QuizFinishedView(countCorrect: countCorrect, countWrong: countWrong, onRestart: reloadGame)
        }
    }

    func selectAnswer(isCorrect: Bool) {
        guard roundIndex < quizData.count else { return }

        if quizData[roundIndex].isCorrect == isCorrect {
            countCorrect += 1
        } else {
            countWrong += 1
        }
        nextRound()
    }

    func nextRound() {
        if roundIndex + 1 < quizData.count {
            roundIndex += 1
        } else {
            isQuizFinished = true // 퀴즈 종료
        }
    }

    func reloadGame() {
        roundIndex = 0
        countCorrect = 0
        countWrong = 0
        isQuizFinished = false
    }
}

struct QuizFinishedView: View {
    let countCorrect: Int
    let countWrong: Int
    let onRestart: () -> Void

    var body: some View {
        VStack {
            Text("퀴즈 종료!")
                .font(.largeTitle)
                .padding()

            Text("맞춘 문제: \(countCorrect)")
                .font(.title)
                .padding(.top)

            Text("틀린 문제: \(countWrong)")
                .font(.title)
                .padding(.top)

            Button("다시 시작하기") {
                onRestart()
            }
            .font(.title2)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

struct Quiz {
    let question: String
    let isCorrect: Bool
}

let q0 = Quiz(question: "코끼리는 날 수 있다.", isCorrect: false)
let q1 = Quiz(question: "물고기는 물 없이 살 수 없다.", isCorrect: true)
let q2 = Quiz(question: "우주는 끝이 있다.", isCorrect: false)
let q3 = Quiz(question: "사과는 원래 빨간색이다.", isCorrect: false)
let q4 = Quiz(question: "햄버거는 독일에서 유래되었다.", isCorrect: true)
let q5 = Quiz(question: "한반도의 모양은 호랑이를 닮았다.", isCorrect: true)
let q6 = Quiz(question: "초콜릿은 강아지가 먹어도 괜찮다.", isCorrect: false)
let q7 = Quiz(question: "바나나는 씨가 있다.", isCorrect: true)
let q8 = Quiz(question: "지구의 70%는 물로 덮여 있다.", isCorrect: true)
let q9 = Quiz(question: "사람은 하루에 평균 10시간을 잔다.", isCorrect: false)
let q10 = Quiz(question: "모든 곤충은 날개가 있다.", isCorrect: false)
let q11 = Quiz(question: "고양이는 독립적인 동물이다.", isCorrect: true)
let q12 = Quiz(question: "한국의 수도는 서울이다.", isCorrect: true)
let q13 = Quiz(question: "강물은 항상 북쪽으로 흐른다.", isCorrect: false)
let q14 = Quiz(question: "1+1은 2이다.", isCorrect: true)
let q15 = Quiz(question: "지구는 태양 주위를 돈다.", isCorrect: true)
let q16 = Quiz(question: "물은 H2O로 이루어져 있다.", isCorrect: true)
let q17 = Quiz(question: "바다는 모두 같은 색이다.", isCorrect: false)
let q18 = Quiz(question: "모든 나무는 열매를 맺는다.", isCorrect: false)
let q19 = Quiz(question: "비가 내리면 하늘이 젖는다.", isCorrect: false)
let q20 = Quiz(question: "냉장고는 음식을 따뜻하게 유지한다.", isCorrect: false)
let q21 = Quiz(question: "대한민국의 국기는 태극기이다.", isCorrect: true)
let q22 = Quiz(question: "모든 새는 날 수 있다.", isCorrect: false)
let q23 = Quiz(question: "피자는 이탈리아에서 시작되었다.", isCorrect: true)
let q24 = Quiz(question: "달은 지구 주위를 돈다.", isCorrect: true)
let q25 = Quiz(question: "모든 곰은 하얗다.", isCorrect: false)
let q26 = Quiz(question: "컴퓨터는 인간보다 똑똑하다.", isCorrect: false)
let q27 = Quiz(question: "인간의 평균 체온은 36.5도이다.", isCorrect: true)
let q28 = Quiz(question: "나는 지금 배가 고프다", isCorrect: false)
let q29 = Quiz(question: "모든 사람은 노래를 잘한다.", isCorrect: false)
let q30 = Quiz(question: "매미는 우는가", isCorrect: true)
let q31 = Quiz(question: "나는 바보인가", isCorrect: true)
let q32 = Quiz(question: "스위프트 Ios 7기인가", isCorrect: true)
let q33 = Quiz(question: "기쁘지 아니한가", isCorrect: false)

let quizs = [q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27, q28, q29, q30, q31, q32, q33]



#Preview {
    ContentView()
}

