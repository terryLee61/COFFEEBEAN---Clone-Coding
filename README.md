# ☕️ COFFEEBEAN 클론 코딩
- Used Skill Stacks
  
<img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=white"> <img src="https://img.shields.io/badge/css3-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/apachetomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white"> <img src="https://img.shields.io/badge/eclipseide-2C2255?style=for-the-badge&logo=eclipseide&logoColor=white"> <img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white"> <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">

## ⌛️ 프로젝트 메인 페이지(작업중, 23.12.01. 기준)
![image](https://github.com/terryLee61/cfbcopy/assets/128010347/0267e354-47f7-4b78-92d5-1f910ce6a91b)

23.10.09. 일자를 기준으로 하여 커피빈 페이지를 클론 코딩 하였습니다.

## 🔎 주요 기능 소개
### ❕ 회원가입 및 로그인, 로그아웃 기능(CSS 수정중, 23.12.01. 기준)
- 회원가입
  
![image](https://github.com/terryLee61/cfbcopy/assets/128010347/f7dc7048-be9e-45ce-92f0-c45bbe0b80d8)
  - 회원가입시, 서버 테이블에 있는 아이디의 값을 조회하여 아이디 중복체크
  - 이메일 인증
  - 다음 주소 API를 이용하여 주소 찾기 및 입력

### ❕ 검색 기능
  
  ![image](https://github.com/terryLee61/cfbcopy/assets/128010347/2942a046-1737-49f8-96be-0a796e8aef0d)

### ❕ 게시판 글쓰기 및 수정, 삭제 기능(CSS 수정중, 23.12.01. 기준)
- 글쓰기
  
![image](https://github.com/terryLee61/cfbcopy/assets/128010347/939ac160-af70-4059-8447-7d0db7213665)
- 수정
  
![image](https://github.com/terryLee61/cfbcopy/assets/128010347/ecf0ec05-df5f-4488-8b64-fed90d9b2476)
- 삭제
  
![image](https://github.com/terryLee61/cfbcopy/assets/128010347/2201188b-c353-4697-bc5c-2323f81ef070)


## ❗️ 이러한 것에 집중 했습니다.
### ❕개선점에 집중한 클론코딩
- 페이지 그대로의 클론 코딩을 지양하고, 더 나은점은 없을지 연구하며 코딩 하였습니다.

#### ⚠️ Top Bar와 검색창이 동시에 띄워져서 서로의 영역을 가리는 현상
https://github.com/terryLee61/cfbcopy/assets/128010347/85eb6b2a-2f9a-4480-980a-e830f7a4db7c

#### 💊 Top Bar와 검색창 중 하나라도 이미 열려져 있을 때, 다른 한쪽이 열리면서 자연스레 닫히도록 JS를 변경
https://github.com/terryLee61/cfbcopy/assets/128010347/4572e6fd-ee26-47f7-8e1f-420ccc26ed61

## 💣 Trouble Shooting

#### 📌 Salting

SHA-256만을 이용해서 비밀번호를 해싱하여 서버에 저장하는 방식은 보안성이 떨어지므로, 솔팅을 섞었습니다.
허나 솔팅이 생성시 매번 무작위로 만들어주기 때문에, 로그인시 그 값을 비교하기가 어려웠습니다..

그래서 유저 테이블에 'salt' 컬럼을 따로 만들어 최초 랜덤 생성된 고유의 솔트 값을 저장하여 
로그인시 그 값을 불러와 해싱된 값과 결합해서 비교할 수 있게 하였습니다.

이를 위해서 로그인시 salt값을 가져와서 비교할 수 있도록, UserDao - 'getUserById'에 salt 값을 가져오는 로직을 추가했습니다.

#### 📌 Mysql auto_increment 값 조정
- 테스트를 위해 글을 쓰고 지우고 하다 보니, 게시판 글의 번호가 띄엄띄엄 쓰여져 있어 보기가 깔끔하지 않았습니다.
![image](https://github.com/terryLee61/cfbcopy/assets/128010347/25703d80-85a2-4807-ab5d-1560f91cd8bf)

      ALTER TABLE `notice` AUTO_INCREMENT = 4;

이런식으로 값이 조정 가능합니다. 하지만 테이블에 이미 조정하려는 값보다 높은 값이 존재할 경우, 쿼리문이 적용되지 않습니다.
그래서 테이블에서 값을 삭제하여 조정하거나, 재설정하려는 값을 테이블에 존재하는 가장 큰 값보다 더 큰 값으로 조정하여 쿼리문을 만들어야 합니다.
