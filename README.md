# [2025] 사진은 지켜줘야 사진이다!<br/>

**Claruty & Locking Of Authentic Teens**<br/>
CLOAT TEAM_PROJECT

### 🛡️ 프로젝트 개요
cloat는 인공지능 기반 딥페이크 생성으로부터 개인 이미지를 보호하기 위해, **Adversarial Perturbation(교란 패턴)** 을 이미지에 삽입해주는 서비스입니다.
사용자는 이미지를 업로드하고, 교란 삽입 후 다운로드하여 SNS에 안전하게 게시할 수 있습니다.

### 🧠 기획 배경
최근 디지털 기술 및 미디어 환경의 발달에 따라 SNS에 올린 일반인의 얼굴사진이 악용되는 사례가 급증하고 있으며<br/>
특히 얼굴인식 기반 이미지 생성 및 딥페이크 음란물 합성 등 피해자와 가해자의 다수가 **10~20대 청소년과 청년층**으로 확인되고 있습니다.<br/>
그중에서도 딥페이크 기반의 허위 영상물 제작 범죄가 전체의 90% 이상을 차지하고 있어, 기술적 예방 수단 마련이 시급한 상황입니다.<br/>
이에 따라, **피해를 사전에 방지하고** 사용자의 이미지 보호와 디지털 성범죄 인식 제고를 위한 웹서비스를 구축하였습니다.<br/>
<br/>

### 기술 스택
<p align="center">
  <img src="https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=html5&logoColor=white"/>
  <img src="https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=css3&logoColor=white"/>
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=javascript&logoColor=black"/>
  <img src="https://img.shields.io/badge/jQuery-0769AD?style=flat-square&logo=jquery&logoColor=white"/>
</p>
<p align="center">
  <img src="https://img.shields.io/badge/Java-007396?style=flat-square&logo=java&logoColor=white"/>
  <img src="https://img.shields.io/badge/Spring-6DB33F?style=flat-square&logo=spring&logoColor=white"/>
  <img src="https://img.shields.io/badge/eGovFrame-003478?style=flat-square&logoColor=white"/>
  <img src="https://img.shields.io/badge/Eclipse-2C2255?style=flat-square&logo=eclipseide&logoColor=white"/>
  <img src="https://img.shields.io/badge/Oracle-F80000?style=flat-square&logo=oracle&logoColor=white"/>
</p>
<p align="center">
  <img src="https://img.shields.io/badge/KakaoAPI-FFCD00?style=flat-square&logo=kakaotalk&logoColor=black"/>
  <img src="https://img.shields.io/badge/Figma-F24E1E?style=flat-square&logo=figma&logoColor=white"/>
  <img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white"/>
</p>
<br/>

### 화면 구성
| 서비스화면 #1 | 서비스화면 #2 |
| --- | --- |
| ![1  첫화면](https://github.com/user-attachments/assets/589838a7-b7ea-407e-b51d-e6d568041a50) | ![2  서비스화면](https://github.com/user-attachments/assets/acfc865c-d063-405a-8d9f-8cc91497d827) |
| 서비스화면 #3 | 서비스화면 #4 |
| ![3  회원가입](https://github.com/user-attachments/assets/9de5c82f-9ab8-4158-aac5-44ce8a55d935) | ![4  마이페이지](https://github.com/user-attachments/assets/633ca638-cc83-4989-9f61-be97ce30d4f3) |
| 서비스화면 #5 | 서비스화면 #6 |
| ![5  게시판전체](https://github.com/user-attachments/assets/a75620ad-f04d-456c-980a-2cbccdc22eba) | ![6  지도](https://github.com/user-attachments/assets/9c559871-d348-44f7-8dca-728d6db7bb55) |
| 서비스화면 #7 | 교란 전 -> 후 이미지 예시 |
| ![7  카카오톡상담](https://github.com/user-attachments/assets/39403200-25d6-4353-b696-d834e5c47959) | <p align="center"> <img src="https://github.com/user-attachments/assets/90537284-3854-4856-97b2-af331272eeab" width="180"/> **->** <img src="https://github.com/user-attachments/assets/f6f8eab4-397d-4382-9acb-db8986124a5c" width="180"/> </p>|

### 🚀 주요 기능
---
- AI교란 삽인한 첨부파일 이미지 업로드 및 다운로드 (미리보기 가능)
- 로그인 후 마이페이지에서 내가 업로드한 사진을 한번에 볼 수 있는 클라우드 서비스 제공
- 반응형 웹으로 설계되어 테블릿, 모바일, 데스크탑 환경에서도 자동 최적화된 UI제공
- 피해자를 위한 도움기관 지도 게시판
  - 센터별/지역/명칭별 상담소 위치 및 정보제공용
  - 기관 목록 클릭 시 해당 위치로 지도 이동, 트리거를 통한 애니메이션 효과
  - 지도(카카오맵) 연동, 길찾기 기능 연동
  - 기관별 정보 수정 및 신규등록 가능(관리자)
- **공통기능**
  - 게시글 작성, 수정, 석제
  - 게시글 목록 조회 및 상세보기
  - 페이징 및 검색기능
  - 좋아요 자동증가 기능
  - 관리자 댓글에 대한 좋아요 포기 기능 (중복 방지 처리)


### 서비스 아키텍쳐
---
본 서비스는 Spring 기반의 eGovFrame 프레임워크와 MyBatis, Oracle DB를 활용하여 전체 시스템을 구성하였습니다.<br>
클라이언트는 HTML5, CSS, JavaScript(jQuery)를 통해 UI와 상호작용하며, Kakao 지도 API와 연동되어 위치 기반 기능도 제공합니다. <br>
<img src="https://github.com/user-attachments/assets/377d3f38-b0fe-437b-b4fa-e35e6b03aade" width="450" />


### ☠️트러블 슈팅
---
| 트러블슈팅 #1 | 트러블슈팅 #2|
| --- | --- |
| ![image](https://github.com/user-attachments/assets/436b09bd-5b54-4b10-8680-31b95f956818) |  ![image](https://github.com/user-attachments/assets/064e8000-230c-48c4-a831-e4e3efee2d1a) |
| 1. **이미지 업로드 제한 문제** <br> - 증상: 3MB 이상의 이미지 파일이 업로드되지 않음 <br> - 원인: 기본 설정에서 파일 업로드 용량 제한 <br> - 해결: `web.xml`과 `servlet-context.xml`에서 `maxUploadSize` 설정 추가 | 2. **기관 위치 클릭 시 지도 이동 안 됨** <br> - 증상: 마커 클릭 시 위치 이동 기능 작동 안 함 <br> - 원인: `var` 사용으로 인한 반복문 스코프 문제 <br> - 해결: `marker`, `overlay`를 배열로 저장하고 `let`을 사용해 이벤트별 개별 접근 |
<br>


### 개선사항
---
- 이미지 교란 퀄리티 강화 (Fawkes API의 한계점)
- 변환된 이미지 캡쳐시 클로킹 기능의 효과가 사라지는지 (논문 확인 필요)
- 어떻게 수익화를 할건지 생각해보기

### 팀원소개
| <p align="center">주연진 <br/>팀장/PM/백엔드 개발</P> | <p align="center">정병호<br/>DB/백엔드 개발 </p> |  <p align="center">한수연<br/> PMO/프론트엔드 개발 </p> | <p align="center">나규민 <br/> DB/프론트엔드 개발 </p> |
| --- | ---| --- | ---|
|  ![KakaoTalk_Photo_2025-05-28-21-57-22 001](https://github.com/user-attachments/assets/dd5eeb7d-be53-4f79-b2ac-f2c0c766a867) | ![KakaoTalk_Photo_2025-05-28-21-57-22 002](https://github.com/user-attachments/assets/0b2f523d-1e13-48f6-aab4-995f1af2b7bb)  | ![KakaoTalk_Photo_2025-05-28-21-57-22 004](https://github.com/user-attachments/assets/48892f69-7ecd-455f-b186-2fad331041d4) | ![KakaoTalk_Photo_2025-05-28-21-57-22 003](https://github.com/user-attachments/assets/22209042-0e96-4c5f-b3e6-07718d3060a7) |
| WBS 작성, 요구사항 분석 및 정의,웹/데이터 모델링 설계, <br> 공지사항·뉴스·고객문의·후기 게시판 로직 및 CRUD 구현, 페이징 처리, 테스트, PPT 작성 등 | 시스템 아키텍처 설계, 게시판 검색기능 구현, <br> Fawkes 이미지 교란 소스 분석·적용·유지보수, 사진 업로드/다운로드/공유 기능,<br> 지도 기능 전반(Kakao API, 마커, 검색 등), 디버깅 등 |메인 레이아웃 및 전체 UI·UX 설계, 화면설계서 및 메인 시안 제작, <br> 콘텐츠 디자인 및 퍼블리싱, 반응형 웹 구현, <br> CSS 스타일링 전반 담당, 시안 컨펌 및 수정 | 메뉴 구조 설계, 로그인/회원가입/중복 체크, 개인정보 수정 기능, <br> 요구사항 정의서 작성, UI 흐름 구성 협업, 회원 기능 연동, <br> 사용자 중심 기능 점검 및 테스트 | 

