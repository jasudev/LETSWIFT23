//
//  PContentProvider.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/01.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

class PContentProvider {
    
    static let selfIntroductionTitle1 = "사용자 경험을 위해 끊임없이 노력하는 크리에이터"
    static let selfIntroductionTitle2 = "Let’Swift Speaker 노경섭(NCSOFT)"
    
    static let sectionTitles: [String] = ["01. 애플 개발 언어의 과거와 현재",
                                          "02. SwiftUI의 강점 및 개선된 워크플로",
                                          "03. SwiftUI의 강력한 기능",
                                          "04. UI 개발 방법론 - 컴포넌트",
                                          "05. 도전과 성장: 애플 플랫폼으로의 전환",
                                          "06. 도전과 보람: 즐거움이 있는 일(놀이)",
                                          "07. Let'Swift for SwiftUI"]
    static let datas: [PModel] = [
        PModel(depth: .hidden,
               title: "SwiftUI,",
               subtitle: "효율적인 개발 방법과 놀이에 관한 이야기",
               view: PWrapperView(PGStartCover()),
               script: PScriptModel(scripts: [
                "안녕하세요. NCSOFT에서 애플 플랫폼으로 개발하고 있는 노경섭입니다. 오늘 주제는 'SwiftUI, 효율적인 개발 방법과 놀이에 관한 이야기' 입니다. 애플의 UI프레임워크 SwiftUI에 대한 이야기를 하려고 합니다. 아무쪼록 오늘 오신 모든 분들에게 흥미로운 시간이 되었으면 좋겠습니다."
               ])),
        PModel(depth: .section,
               title: "START",
               view: PWrapperView(PGIndex()), script: PScriptModel(scripts: [
                "먼저 전체적인 개요를 간략하게 소개하겠습니다."
               ])),
        // ---------------------------------------------------
        // Section 01
        PModel(depth: .section,
               title: sectionTitles[0],
               view: PWrapperView(PGTitle(sectionTitles[0])),
               children: [
                PModel(title: "애플 개발 언어 히스토리",
                       view: PWrapperView(PGHistory1()),
                       script: PScriptModel(scripts: [
                        "-",
                        "1985년 맥의 미래를 놓고 애플 CEO 존 스컬리(John Sculley)와 대립하는 과정에서 스티브 잡스(Steve Jobs)는 애플에서 사임을 하게 됨, 스티브잡스는 애플을 나와서 NeXT Computer 설립",
                        "그로부터 12년이 지난 97년에 애플이 NeXT를 인수하면서 Objective-C 언어는 애플 역사에 합류, 스티브 잡스도 애플에 복귀",
                        "Objective-C로 작성된 NeXTSTEP 운영체제는 2001년에 출시된 Mac OS X의 기반",
                        "2007년에 iPhone을, 2008년에 iPhone SDK 발표, 이 때 모바일에서 UIKit이 AppKit을 대체",
                        "UIKit을 기반으로 하는 Swift 언어를 2014년 발표",
                        "그로부터 5년이 지난 2019년에 Swift언어를 기반으로 하는 SwiftUI를 발표"
                       ]))
               ]),
        // Section 02
        PModel(depth: .section,
               title: sectionTitles[1],
               view: PWrapperView(PGTitle(sectionTitles[1])),
               children: [
                PModel(title: "SwiftUI, 새로운 가능성",
                       view: PWrapperView(PGIntroduction1()),
                       script: PScriptModel(scripts: [
                        "-",
                        "SwiftUI는 Better apps. Less code, 적은 코드로 더 멋진 앱을 만들 수 있다는 슬로건으로 탄생",
                        "SwiftUI의 강점은 첫 번째로",
                        "한 번의 코드 작성으로 모든 애플 플랫폼에서 사용 가능",
                        "개발 효율성이 획기적으로 향상, 코드 변경 사항을 즉시 프리뷰로 확인",
                        "기존 방식보다 효율적이고 매우 빠른 애니메이션 처리",
                        "무엇보다도 선언적 구문을 사용하여 직관적이고 가독성이 좋은 코드를 작성할 수 있습니다.\n이해를 돕기 위해서 선언적 구문이 어떤 것인지 살펴보겠습니다."
                       ])),
                PModel(title: "명령형 방식과 선언형 방식",
                       view: PWrapperView(PGIntroduction2()),
                       script: PScriptModel(scripts: [
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "이처럼 명령형 프로그램은 알고리즘을 직접 구현하고 목표는 명시하지 않는 데 반해 선언형 프로그램은 목표를 명시하고 알고리즘은 캡슐화하는 것\n선언적 구문을 사용하는 모바일 개발 툴",
                        "구글의 안드로이드 앱 개발에 사용하는 Jetpack Compose",
                        "페이스북의 크로스 플랫폼 모바일 앱 개발 React Native",
                        "구글의 크로스 플랫폼 UI개발에 사용하는 Flutter",
                        "Microsoft의 크로스 플랫폼 UI개발에 사용하는 Xamarin.Forms 프레임워크도 있음\n개별 플랫폼의 구현 방법이 서로 달라도 캡슐화를 통해서 결과만 동일하게 처리하면 되기 때문에 선언적 프로그래밍은 클로스 플랫폼을 위한 프레임워크로 매우 효율적인 패러다임이라고 할 수 있습니다. 애플 생태계에서도 iOS, iPad, MacOS, Watch와 이번에 추가되는 VisionOS와 같이 다양한 플랫폼을 지원해야하기 때문에 채택할 수 밖에 없지 않았을까 싶습니다."])),
                PModel(title: "SwiftUI의 단점 및 요구사항",
                       view: PWrapperView(PGIntroduction3()),
                       script: PScriptModel(scripts: [
                        "그럼 SwiftUI의 단점도 살펴보겠습니다.",
                        "UIKit이나 AppKit에 비해 상대적으로 시스템에서 지원하는 컴포넌트가 많지 않음",
                        "새로운 개념의 패러다임을 제공하기 때문에 기존 방식으로 개발하던 개발자에게는 초기에 다소 학습 곡선이 있을 수 있음",
                        "UIKit이나 AppKit에 비해 문서나 자료가 부족할 수 있음",
                        "SwiftUI는 최소 버전 이상에서 지원하기 때문에 이전 버전의 OS를 타겟으로 하는 경우에는 SwiftUI를 사용할 수 없는 문제",
                        "OS 버전 요구사항으로 iOS 경우는 13버전 이상 이어야 합니다.",
                        "이 데이터는 올해 5월 30일에 App Store에서 처리된 결과를 측정한 수치 - iPhone 기준"]))
               ]),
        // Section 03
        PModel(depth: .section,
               title: sectionTitles[2],
               view: PWrapperView(PGTitle(sectionTitles[2])),
               children: [
                PModel(title: "직관적인 레이아웃 시스템",
                       view: PWrapperView(PGMethodology1()),
                       script: PScriptModel(scripts: [
                        "가장 기본적인 'Hello World'로 시작. \n Xcode에서 프로젝트를 생성하면 기본으로 생성되는 코드의 미리보기 화면",
                        "SwiftUI는 뷰의 기본적인 레이아웃 규칙이 있음",
                        "첫 번째로 부모 뷰는 자식 뷰에게 크기를 제안",
                        "두 번째로 부모 뷰의 크기를 바탕으로 자식 뷰는 자신의 사이즈를 선택합니다. 그리고 부모 뷰는 그 선택을 존중.",
                        "최종적으로 자식 뷰를 자신의 좌표 공간에 배치합니다. 이처럼 간단한 규칙이지만 SwiftUI의 모든 레이아웃은 이 규칙을 기반으로 효율적으로 관리됩니다.",
                        "코드를 통해서 살펴보겠습니다.",
                        "-",
                        "다른 UI를 살펴보겠습니다.",
                        "이런 UI가 있다고 가정하겠습니다."
                       ])),
                PModel(title: "편리하고 강력한 애니메이션",
                       view: PWrapperView(PGMethodology2()),
                       script: PScriptModel(scripts: [
                        "다음으로 애니메이션에 대해 살펴보겠습니다. SwiftUI는 프레임워크 전체에 통합된 애니메이션을 제공.\n그럼 어떻게 애니메이션을 생성하는지 알아보겠습니다.",
                        "먼저 애니메이션을 구현하려면 뷰가 있어야 함. 애니메이션을 적용할 때 뷰는 2개의 상태를 가집니다.",
                        "하나는 시작이고 다른 하나는 종료 상태",
                        "이 상태 간의 변화, 즉 값의 보간을 시각적으로 표현하는 것을 애니메이션이라고 이야기 함",
                        "SwiftUI에서는 위치, 크기, 색상, 회전 등과 같이 애니메이션 가능한 모든 속성을 애니메이션으로 처리 할수 있음",
                        "SwiftUI는 크게 명시적 애니메이션과 암시적 애니메이션으로 구분할 수 있음",
                        "이 애니메이션과 함께 보조 효과로 transition과 GeometryEffect를 지원",
                        "그럼 각각 어떻게 애니메이션을 적용하는지 알아보겠습니다.",
                        "-", "-", "-", "-", "-", "-", "-", "-", "-", "참고로 이번에 iOS 17 버전에서는 PhaseAnimator 기능도 추가되어 구간 별 애니메이션 처리를 더 쉽게 할 수 있습니다."
                       ])),
                PModel(title: "데이터 바인딩 및 상태 메카니즘",
                       view: PWrapperView(PGMethodology3()),
                       script: PScriptModel(scripts: [
                        "다음으로 SwiftUI의 상태 관리에 대한 이야기입니다. SwiftUI는 시스템에서 다양한 Property Wrapper를 제공\n\nSwiftUI에서 제공하는 이러한 Property Wrapper들은 상태 값이 바뀌면 바인딩된 UI를 자동으로 변경해 주는 역할을 합니다.",
                        "Wrapper 속성중에 활용도가 높은 EnvironmentObject에 대해 알아보겠습니다.",
                        "-",
                        "데이터 객체를 상위 뷰에 주입",
                        "하위 뷰는 Wrapper 속성을 선언하는 것만으로 객체 참조 가능",
                        "이처럼 EnvironmentObject를 통해서 디자인에 종속적이지 않은 컴포넌트 구조 설계가 가능할 수 있음, 그럼 좀 더 구체적으로 EnvironmentObject를 활용한 예를 보겠습니다."
                       ])),
                PModel(title: "효율적인 개발 방법론 - Radio 컴포넌트", view: PWrapperView(PGMethodology4()))
               ]),
        // Section 04
        PModel(depth: .section,
               title: sectionTitles[3],
               view: PWrapperView(PGTitle(sectionTitles[3])),
               children: [
                PModel(title: "Radio 컴포넌트",
                       view: PWrapperView(PGComponent1()),
                       script: PScriptModel(scripts: ["SwiftUI에서 컴포넌트를 어떻게 설계할 수 있는지 살펴보겠습니다."])),
                PModel(title: "Checkbox 컴포넌트",
                       view: PWrapperView(PGComponent2()),
                       script: PScriptModel(scripts: [])),
                PModel(title: "Switch 컴포넌트",
                       view: PWrapperView(PGComponent3()),
                       script: PScriptModel(scripts: []))
               ]),
        // Section 05
        PModel(depth: .section,
               title: sectionTitles[4],
               view: PWrapperView(PGTitle(sectionTitles[4])),
               children: [
                PModel(title: "스티브 잡스와 Adobe Flash",
                       view: PWrapperView(PGChallenge1()),
                       script: PScriptModel(scripts: [
                        "여러분들은 플래시라는 플랫폼을 아시는지 모르겠습니다. 저는 모바일 개발을 하기전에 Flash ActionScript로 개발하던 개발자였습니다, 그래서 플래시에 대한 이야기를 잠깐 하려고 합니다. 분위기를 보니 모르시는 분들이 많은 것 같아서 이 부분은 시간 관계상 빠르게 진행하도록 하겠습니다.",
                        "우리가 알고 있는 플래시 컨텐츠는 2000년 초에 신드롬을 일으켰던 마시마로",
                        "불의를 보면 변신해서 맞서 싸우는 졸라맨이라는 컨텐츠도 있었습니다.",
                        "애니팡 같은 게임도 있었죠. 이 모든 것이 플래시 플랫폼으로 개발이 되었습니다. 이 뿐만 아니라 RIA(Rich Internet Application) 개념으로 그 당시에는 웹에서 AJAX 기술과 함께 주목 받는 플랫폼이었습니다.",
                        "-",
                        "Flash는 초기 FutureWave Software사에서 개발한 'SmartSketch'라는 애플리케이션으로 시작. 이 당시에는 Window와 Mac에서 사용할 수 있는 벡터 드로잉 어플리케이션에 불과",
                        "3년 후, Macromedia는 FutureSplash를 인수, 이 때부터 Flash라는 이름으로 제품이 출시가 됩니다.",
                        "Macromedia는 Flash 5에서 UI와 상호 작용할 수 있는 ECMA스크립트 기반의 액션스크립트(ActionScript)를 도입",
                        "Adobe는 2005년에 Macromedia를 34억 달러에 인수 함, 그 당시 웹에 연결된 컴퓨터의 98% 이상이 FlashPlayer를 설치, 100개 이상의 제조업체에서 Flash가 내장된 제품을 제작할 정도로 애니메이션과 인터랙션 개발 플랫폼으로는 지배적인 위치에 있었음",
                        "2007년에 애플은 iPhone을 출시, 애플은 Flash를 포함하여 웹 플러그인을 허용하지 않음, Adobe는 이 때부터 애플과 소송전을 시작함",
                        "애플은 2008년에 앱스토어를 도입하지만 이 때까지도 플래시와 같은 다른 플랫폼으로 개발된 앱을 애플은 허용하지 않음",
                        "급기야 2010년 4월 29일에 스티브 잡스는 플래시 기술에 대한 비판적인 입장을 애플 공식 사이트를 통해서 밝힘. 이 소송 과정에서 5개월이 지난 시점이 되서야 애플은 앱스토어에서 플래시로 개발된 앱을 허용하게 되지만 이미 시장은 탈 flash로 진입, 이 시점에 iOS 개발자로 전향",
                        "결국 Adobe Flash는 2020년 12월 31일을 기점으로 공식적으로 서비스를 종료",
                        "Flash는 Adobe animate라는 툴에서 Keyframe 베이스의 Timeline 애니메이션 편집 기능만으로 그 명맥을 유지"
                       ])),
                PModel(title: "과거의 흔적, 그리고 성장과 본질",
                       view: PWrapperView(PGChallenge2()), script: PScriptModel(scripts: [
                        "저는 플래시 ActionScript로 개발을 할 당시에 다양한 개인 프로젝트를 진행"
                       ]))
               ]),
        // Section 06
        PModel(depth: .section,
               title: sectionTitles[5],
               view: PWrapperView(PGTitle(sectionTitles[5])),
               children: [
                PModel(title: "개발자들의 창작과 협업, Fabula 프로젝트", view: PWrapperView(PGWorkAndPlay1())),
                PModel(title: "Fabula 프로젝트를 통해 얻은 것", view: PWrapperView(PGWorkAndPlay2())),
                PModel(title: "Fabula 프로젝트 워크플로",
                       view: PWrapperView(PGWorkAndPlay3()),
                       script: PScriptModel(scripts: [
                        "Fabula 프로젝트는 2021년부터 시작하여 지금까지 진행하고 있습니다.",
                        "-",
                        "패키지는 개발자들이 자유롭게 사용할 수 있도록 공개, 맥을 사용자는 분들이라면 누구나 참여하실 수 있음",
                        "코드가 완벽할 필요는 없는 것 같습니다. 저 또한 코드를 보시면 부족한 부분이 많습니다. 개발자들은 서로 다른 생각을 문서가 아닌 결과물을 통해서 공유할 때, 인사이트를 주도 받기가 훨씬 수월한 것 같습니다. 기회가 되신다면 부담없이 참여해 보시면 좋을 것 같습니다."
                       ]))
               ]),
        // Section 07
        PModel(depth: .section,
               title: sectionTitles[6],
               view: PWrapperView(PGTitle(sectionTitles[6])),
               children: [
                PModel(title: "SwiftUI로 그려낸 프레젠테이션",
                       view: PWrapperView(PGPresentation1()), script: PScriptModel(scripts: [
                        "아미 알고 계신 분들도 있고 눈치 채신 분들도 있겠지만, 이 프레젠테이션은 100% SwiftUI로 개발, 말보다는 결과물로 보여드리는 것이 와닿으실 것 같아서 만들게 되었습니다.",
                        "이 프레젠테이션의 모체는 제가 소속되어 있는 C&E Center에서 작년에 진행한 연말 행사에서 발표했던 경험이었습니다. 그 버전을 범용적인 내용으로 수정해서 올해 NCDP 2023에서 발표를 했고, 그 버전에서 다시 내용을 추가하고 수정하여 오늘 발표하게 되었습니다.",
                        "이 화면은 제가 스크립트를 확인하는 화면입니다.",
                        "프레젠테이션의 구조를 간단하게 설명 드리면 데이터 구조를 바탕으로 기본 설계 했습니다.",
                        "세션과",
                        "서브섹션, 그리고 여러개의 페이지로 구성",
                        "이렇게 3Depth로 이루어진 데이터를 키보드의 방향키로 탐색할 수 있도록 1차원 시퀀스로 단순화했고 모든 페이지는 키보드의 방향키로 이동이 가능하도록 설계했습니다.",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "이 프레젠테이션 소스를 오늘 아침에 오픈소스로 공개 했습니다. 구조적으로 잘 짜여진 결과물은 아니지만 SwiftUI의 부족한 레퍼런스에 조금이나마 도움이 되었으면 좋겠습니다."
                       ]))
               ]),
        // ---------------------------------------------------
        PModel(depth: .hidden,
               title: "개발자의 생각",
               view: PWrapperView(PGEndCover()), isAnimationEnabled: false, script: PScriptModel(scripts: [
                "프레젠테이션 첫 화면에서 저를 소개할 때 “사용자 경험을 위해 끊임없이 노력하는 크리에이터”라고 표기했습니다.",
                "저는 개발을 할 때 개인적으로 한 가지 지향하는 것이 있습니다. 그건 예상되는 결과만을 기대하는 오퍼레이터가 아니라 새로운 것을 창조하는 크리에이터가 되고 싶다는 것입니다.\n\n개발자 중에는 아름다운 코드를 지향하는 분들도 있고\n완벽한 아키텍처를 고민하시는 분들도 있습니다. 그리고\n저처럼 코드의 완벽함 보다는 최종 사용자의 사용성에 무게를 두는 분들도 있을 겁니다.\n\n이 모든 노력은 누구의 강요가 아니라 개발자 스스로 만족과 보람을 추구하는 재밌는 일이자 놀이라고 생각합니다. 창작의 범위는 개발자의 상상에 달려있는 것 같습니다. 오늘 참석하신 모든 분들도 평범하고 그저 그런 오퍼레이터가 아니라 새로운 것을 창조하는",
                "훌륭한 크리에이터가 되시기를 바랍니다.\n\n이것으로 저의 오늘 강연을 모두 마치도록 하겠습니다. 감사합니다."])),
        PModel(depth: .section,
               title: "END OF DOCUMENT",
               view: PWrapperView(PGEndOfDocument())),
        PModel(depth: .hidden,
               title: "End",
               view: PWrapperView(PGEnd()))
    ]
}
