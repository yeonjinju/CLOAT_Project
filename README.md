# [2025] 사진은 지켜줘야 사진이다! CLOAT TEAM_PROJECT.<br/>
#### 기술 스택
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
### 🛡️ 프로젝트 개요
cloat는 인공지능 기반 딥페이크 생성으로부터 개인 이미지를 보호하기 위해, **Adversarial Perturbation(교란 패턴)**을 이미지에 삽입해주는 서비스입니다.
사용자는 이미지를 업로드하고, 교란 삽입 후 다운로드하여 SNS에 안전하게 게시할 수 있습니다.

### 🧠 기획 배경
최근 디지털 기술 및 미디어 환경의 발달에 따라 SNS에 올린 일반인의 얼굴사진이 악용되는 사례가 급증하고 있으며<br/>
특히 얼굴인식 기반 이미지 생성 및 딥페이크 음란물 합성 등 피해자와 가해자의 다수가 **10~20대 청소년과 청년층**으로 확인되고 있습니다.<br/>
그중에서도 딥페이크 기반의 허위 영상물 제작 범죄가 전체의 90% 이상을 차지하고 있어, 기술적 예방 수단 마련이 시급한 상황입니다.<br/>
이에 따라, **피해를 사전에 방지하고** 사용자의 이미지 보호와 디지털 성범죄 인식 제고를 위한 웹서비스를 구축하였습니다.<br/>
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
| ![7  카카오톡상담](https://github.com/user-attachments/assets/39403200-25d6-4353-b696-d834e5c47959) | <p align="center">
<P><img src="![전](https://github.com/user-attachments/assets/e563a110-fafc-4a58-b4ef-90833cdbdd5d)
" width="100" height="200"/></P>

-> ![후](https://github.com/user-attachments/assets/f6f8eab4-397d-4382-9acb-db8986124a5c)
 </P> |

### 🚀 주요 기능
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


## 서비스 아키텍쳐
![image](https://github.com/user-attachments/assets/377d3f38-b0fe-437b-b4fa-e35e6b03aade)

## ☠️트러블 슈팅
| 트러블슈팅 #1 | 트러블슈팅 #2|
| --- | --- |
| ![image](https://github.com/user-attachments/assets/436b09bd-5b54-4b10-8680-31b95f956818) |  ![image](https://github.com/user-attachments/assets/064e8000-230c-48c4-a831-e4e3efee2d1a) |
