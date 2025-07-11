CREATE TABLE "MEMBER" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"MEMBER_ID"	NVARCHAR2(20)		NOT NULL,
	"MEMBER_PW"	NVARCHAR2(100)		NOT NULL,
	"MEMBER_NICKNAME"	NVARCHAR2(10)		NOT NULL,
	"MEMBER_EMAIL"	NVARCHAR2(30)		NOT NULL,
	"MEMBER_ADDRESS"	NVARCHAR2(100)		NULL,
	"MEMBER_TEL"	CHAR(13)		NOT NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"MEMBER_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"MANAGER_CHECK"	CHAR(1)	DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원번호(PK)';

COMMENT ON COLUMN "MEMBER"."MEMBER_ID" IS '회원아이디';

COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '회원비밀번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_NICKNAME" IS '회원닉네임';

COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL" IS '회원이메일';

COMMENT ON COLUMN "MEMBER"."MEMBER_ADDRESS" IS '회원주소';

COMMENT ON COLUMN "MEMBER"."MEMBER_TEL" IS '회원전화번호';

COMMENT ON COLUMN "MEMBER"."ENROLL_DATE" IS '회원가입일';

COMMENT ON COLUMN "MEMBER"."MEMBER_DEL_FL" IS '회원탈퇴여부(Y/N)';

COMMENT ON COLUMN "MEMBER"."MANAGER_CHECK" IS '관리자 계정 판별(Y/N)';

CREATE TABLE "SEED" (
	"SEED_NO"	NUMBER		NOT NULL,
	"SEED_NAME"	NVARCHAR2(15)		NOT NULL,
	"SEED_IMG"	VARCHAR2(300)		NULL,
	"SEED_PRICE"	NVARCHAR2(10)		NOT NULL,
	"SEED_TEMP"	NVARCHAR2(15)		NULL,
	"SEED_TIME"	NVARCHAR2(15)		NULL,
	"SEED_DISTANCE"	NVARCHAR2(15)		NULL,
	"SEED_RATE"	NVARCHAR2(15)		NOT NULL,
	"SEED_SOLD_OUT"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"SEED_CODE"	NUMBER		NOT NULL,
	"S_IMG_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "SEED"."SEED_NO" IS '씨앗 번호';

COMMENT ON COLUMN "SEED"."SEED_NAME" IS '씨앗 이름';

COMMENT ON COLUMN "SEED"."SEED_IMG" IS '씨앗 이미지';

COMMENT ON COLUMN "SEED"."SEED_PRICE" IS '가격';

COMMENT ON COLUMN "SEED"."SEED_TEMP" IS '온도';

COMMENT ON COLUMN "SEED"."SEED_TIME" IS '파종 시기';

COMMENT ON COLUMN "SEED"."SEED_DISTANCE" IS '재식 거리';

COMMENT ON COLUMN "SEED"."SEED_RATE" IS '발아율';

COMMENT ON COLUMN "SEED"."SEED_SOLD_OUT" IS '품절여부(Y/N)';

COMMENT ON COLUMN "SEED"."SEED_CODE" IS '품종코드(FK)';

COMMENT ON COLUMN "SEED"."S_IMG_NO" IS '씨앗 이미지 번호(FK)';

CREATE TABLE "SEED_GOOD" (
	"SEED_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "SEED_GOOD"."SEED_NO" IS '씨앗번호(PK)';

COMMENT ON COLUMN "SEED_GOOD"."MEMBER_NO" IS '회원번호(PK)';

CREATE TABLE "BOARD" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"BOARD_TITLE"	NVARCHAR2(100)		NOT NULL,
	"BOARD_CONTENT"	NVARCHAR2(2000)		NOT NULL,
	"BOARD_WRITE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"BOARD_UPDATE_DATE"	DATE		NULL,
	"READ_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"BOARD_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"LIKE_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"BOARD_CODE"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "BOARD"."BOARD_NO" IS '게시글 번호(PK)';

COMMENT ON COLUMN "BOARD"."BOARD_TITLE" IS '게시글 제목';

COMMENT ON COLUMN "BOARD"."BOARD_CONTENT" IS '게시글 내용';

COMMENT ON COLUMN "BOARD"."BOARD_WRITE_DATE" IS '게시글 작성일';

COMMENT ON COLUMN "BOARD"."BOARD_UPDATE_DATE" IS '게시글 마지막수정일';

COMMENT ON COLUMN "BOARD"."READ_COUNT" IS '조회수';

COMMENT ON COLUMN "BOARD"."BOARD_DEL_FL" IS '게시글삭제여부(Y/N)';

COMMENT ON COLUMN "BOARD"."LIKE_COUNT" IS '좋아요 수';

COMMENT ON COLUMN "BOARD"."MEMBER_NO" IS '작성한 회원번호(FK)';

COMMENT ON COLUMN "BOARD"."BOARD_CODE" IS '게시판 코드 번호(FK)';

CREATE TABLE "BOARD_TYPE" (
	"BOARD_CODE"	NUMBER		NOT NULL,
	"BOARD_NAME"	NVARCHAR2(10)		NOT NULL
);

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_CODE" IS '게시판 코드 번호(PK)';

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_NAME" IS '게시판 이름';

CREATE TABLE "BOARD_LIKE" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "BOARD_LIKE"."BOARD_NO" IS '게시글 번호(PK)';

COMMENT ON COLUMN "BOARD_LIKE"."MEMBER_NO" IS '회원번호(PK)';

CREATE TABLE "SEED_TYPE" (
	"SEED_CODE"	NUMBER		NOT NULL,
	"SEED_TYPE"	NVARCHAR2(15)		NOT NULL
);

COMMENT ON COLUMN "SEED_TYPE"."SEED_CODE" IS '품종코드(PK)';

COMMENT ON COLUMN "SEED_TYPE"."SEED_TYPE" IS '품종 이름';

CREATE TABLE "BOARD_IMG" (
	"BOARD_IMG_NO"	NUMBER		NOT NULL,
	"BOARD_IMG_PATH"	VARCHAR2(200)		NOT NULL,
	"BOARD_IMG_ORIGINAL_NAME"	NVARCHAR2(50)		NOT NULL,
	"BOARD_IMG_RENAME"	NVARCHAR2(50)		NOT NULL,
	"BOARD_IMG_ORDER"	NUMBER		NULL,
	"BOARD_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "BOARD_IMG"."BOARD_IMG_NO" IS '이미지번호(PK)';

COMMENT ON COLUMN "BOARD_IMG"."BOARD_IMG_PATH" IS '이미지요청경로';

COMMENT ON COLUMN "BOARD_IMG"."BOARD_IMG_ORIGINAL_NAME" IS '이미지 원본명';

COMMENT ON COLUMN "BOARD_IMG"."BOARD_IMG_RENAME" IS '이미지 변경명';

COMMENT ON COLUMN "BOARD_IMG"."BOARD_IMG_ORDER" IS '이미지 순서';

COMMENT ON COLUMN "BOARD_IMG"."BOARD_NO" IS '게시글 번호(PK)';

CREATE TABLE "COMMENT" (
	"COMMENT_NO"	NUMBER		NOT NULL,
	"COMMENT_CONTENT"	NVARCHAR2(500)		NOT NULL,
	"COMMENT_WRITE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"COMMENT_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"PARENT_COMMENT_NO"	NUMBER		NULL
);

COMMENT ON COLUMN "COMMENT"."COMMENT_NO" IS '댓글 번호';

COMMENT ON COLUMN "COMMENT"."COMMENT_CONTENT" IS '댓글 내용';

COMMENT ON COLUMN "COMMENT"."COMMENT_WRITE_DATE" IS '댓글 작성일';

COMMENT ON COLUMN "COMMENT"."COMMENT_DEL_FL" IS '댓글 삭제 여부';

COMMENT ON COLUMN "COMMENT"."BOARD_NO" IS '게시글 번호(PK)';

COMMENT ON COLUMN "COMMENT"."MEMBER_NO" IS '회원번호(PK)';

COMMENT ON COLUMN "COMMENT"."PARENT_COMMENT_NO" IS '부모 댓글 번호';

CREATE TABLE "UPLOAD_FILE" (
	"FILE_NO"	NUMBER		NOT NULL,
	"FILE_PATH"	NVARCHAR2(200)		NOT NULL,
	"FILE_ORIGINAL_NAME"	NVARCHAR2(100)		NOT NULL,
	"FILE_RENAME"	NVARCHAR2(100)		NOT NULL,
	"FILE_UPLOAD_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "UPLOAD_FILE"."FILE_NO" IS '파일 번호(PK)';

COMMENT ON COLUMN "UPLOAD_FILE"."FILE_PATH" IS '클라이언트 요청경로';

COMMENT ON COLUMN "UPLOAD_FILE"."FILE_ORIGINAL_NAME" IS '파일 원본명';

COMMENT ON COLUMN "UPLOAD_FILE"."FILE_RENAME" IS '변경된 파일';

COMMENT ON COLUMN "UPLOAD_FILE"."FILE_UPLOAD_DATE" IS '업로드 날짜';

COMMENT ON COLUMN "UPLOAD_FILE"."MEMBER_NO" IS '회원번호(PK)';

CREATE TABLE "CART" (
	"CART_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"SEED_NO"	NUMBER		NOT NULL,
	"COUNT"	NUMBER	DEFAULT 1	NOT NULL
);

COMMENT ON COLUMN "CART"."CART_NO" IS '장바구니 번호';

COMMENT ON COLUMN "CART"."MEMBER_NO" IS '회원 번호(FK)';

COMMENT ON COLUMN "CART"."SEED_NO" IS '씨앗 번호(FK)';

COMMENT ON COLUMN "CART"."COUNT" IS '수량';

CREATE TABLE "SEED_IMG" (
	"S_IMG_NO"	NUMBER		NOT NULL,
	"S_IMG_PATH"	VARCHAR2(200)		NOT NULL,
	"SEED_IMG_ORIGINAL_NAME"	NVARCHAR2(50)		NOT NULL,
	"SEED_IMG_RENAME"	NVARCHAR2(50)		NOT NULL
);

COMMENT ON COLUMN "SEED_IMG"."S_IMG_NO" IS '씨앗 이미지 번호(PK)';

COMMENT ON COLUMN "SEED_IMG"."S_IMG_PATH" IS '씨앗 이미지 요청 경로';

COMMENT ON COLUMN "SEED_IMG"."SEED_IMG_ORIGINAL_NAME" IS '씨앗 이미지 원본명';

COMMENT ON COLUMN "SEED_IMG"."SEED_IMG_RENAME" IS '씨앗 이미지 변경명';

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEMBER_NO"
);

ALTER TABLE "SEED" ADD CONSTRAINT "PK_SEED" PRIMARY KEY (
	"SEED_NO"
);

ALTER TABLE "SEED_GOOD" ADD CONSTRAINT "PK_SEED_GOOD" PRIMARY KEY (
	"SEED_NO",
	"MEMBER_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"BOARD_NO"
);

ALTER TABLE "BOARD_TYPE" ADD CONSTRAINT "PK_BOARD_TYPE" PRIMARY KEY (
	"BOARD_CODE"
);

ALTER TABLE "BOARD_LIKE" ADD CONSTRAINT "PK_BOARD_LIKE" PRIMARY KEY (
	"BOARD_NO",
	"MEMBER_NO"
);

ALTER TABLE "SEED_TYPE" ADD CONSTRAINT "PK_SEED_TYPE" PRIMARY KEY (
	"SEED_CODE"
);

ALTER TABLE "BOARD_IMG" ADD CONSTRAINT "PK_BOARD_IMG" PRIMARY KEY (
	"BOARD_IMG_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "PK_COMMENT" PRIMARY KEY (
	"COMMENT_NO"
);

ALTER TABLE "UPLOAD_FILE" ADD CONSTRAINT "PK_UPLOAD_FILE" PRIMARY KEY (
	"FILE_NO"
);

ALTER TABLE "CART" ADD CONSTRAINT "PK_CART" PRIMARY KEY (
	"CART_NO"
);

ALTER TABLE "SEED_IMG" ADD CONSTRAINT "PK_SEED_IMG" PRIMARY KEY (
	"S_IMG_NO"
);

ALTER TABLE "SEED" ADD CONSTRAINT "FK_SEED_TYPE_TO_SEED_1" FOREIGN KEY (
	"SEED_CODE"
)
REFERENCES "SEED_TYPE" (
	"SEED_CODE"
);

ALTER TABLE "SEED" ADD CONSTRAINT "FK_SEED_IMG_TO_SEED_1" FOREIGN KEY (
	"S_IMG_NO"
)
REFERENCES "SEED_IMG" (
	"S_IMG_NO"
);

ALTER TABLE "SEED_GOOD" ADD CONSTRAINT "FK_SEED_TO_SEED_GOOD_1" FOREIGN KEY (
	"SEED_NO"
)
REFERENCES "SEED" (
	"SEED_NO"
);

ALTER TABLE "SEED_GOOD" ADD CONSTRAINT "FK_MEMBER_TO_SEED_GOOD_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_BOARD_TYPE_TO_BOARD_1" FOREIGN KEY (
	"BOARD_CODE"
)
REFERENCES "BOARD_TYPE" (
	"BOARD_CODE"
);

ALTER TABLE "BOARD_LIKE" ADD CONSTRAINT "FK_BOARD_TO_BOARD_LIKE_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "BOARD_LIKE" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_LIKE_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "BOARD_IMG" ADD CONSTRAINT "FK_BOARD_TO_BOARD_IMG_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "FK_BOARD_TO_COMMENT_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "FK_MEMBER_TO_COMMENT_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "FK_COMMENT_TO_COMMENT_1" FOREIGN KEY (
	"PARENT_COMMENT_NO"
)
REFERENCES "COMMENT" (
	"COMMENT_NO"
);

ALTER TABLE "UPLOAD_FILE" ADD CONSTRAINT "FK_MEMBER_TO_UPLOAD_FILE_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "CART" ADD CONSTRAINT "FK_MEMBER_TO_CART_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "CART" ADD CONSTRAINT "FK_SEED_TO_CART_1" FOREIGN KEY (
	"SEED_NO"
)
REFERENCES "SEED" (
	"SEED_NO"
);

/* 이메일, 인증키 저장 테이블 생성 */
CREATE TABLE "TB_AUTH_KEY"(
	"KEY_NO"    NUMBER PRIMARY KEY,
	"EMAIL"	    NVARCHAR2(50) NOT NULL,
	"AUTH_KEY"  CHAR(6)	NOT NULL,
	"CREATE_TIME" DATE DEFAULT SYSDATE NOT NULL
);

COMMENT ON COLUMN "TB_AUTH_KEY"."KEY_NO"      IS '인증키 구분 번호(시퀀스)';
COMMENT ON COLUMN "TB_AUTH_KEY"."EMAIL"       IS '인증 이메일';
COMMENT ON COLUMN "TB_AUTH_KEY"."AUTH_KEY"    IS '인증 번호';
COMMENT ON COLUMN "TB_AUTH_KEY"."CREATE_TIME" IS '인증 번호 생성 시간';
CREATE SEQUENCE SEQ_KEY_NO NOCACHE; -- 인증키 구분 번호 시퀀스

CREATE SEQUENCE SEQ_CART_NO NOCACHE;
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE;
CREATE SEQUENCE SEQ_SEED_NO NOCACHE;
CREATE SEQUENCE SEQ_SEED_IMG_NO NOCACHE;
CREATE SEQUENCE SEQ_SEED_CODE NOCACHE;
CREATE SEQUENCE SEQ_FILE_NO NOCACHE;
CREATE SEQUENCE SEQ_BOARD_NO NOCACHE;
CREATE SEQUENCE SEQ_BOARD_CODE NOCACHE;
CREATE SEQUENCE SEQ_BOARD_IMG_NO NOCACHE;
CREATE SEQUENCE SEQ_COMMENT_NO NOCACHE;

COMMIT;



-- 품종 넣기
INSERT INTO "SEED_TYPE"
VALUES(SEQ_SEED_CODE.NEXTVAL, '가지/오이');

INSERT INTO "SEED_TYPE"
VALUES(SEQ_SEED_CODE.NEXTVAL, '무/당근');

INSERT INTO "SEED_TYPE"
VALUES(SEQ_SEED_CODE.NEXTVAL, '민속채소');

INSERT INTO "SEED_TYPE"
VALUES(SEQ_SEED_CODE.NEXTVAL, '배추/양배추');

INSERT INTO "SEED_TYPE"
VALUES(SEQ_SEED_CODE.NEXTVAL, '부추');

INSERT INTO "SEED_TYPE"
VALUES(SEQ_SEED_CODE.NEXTVAL, '시금치');

INSERT INTO "SEED_TYPE"
VALUES(SEQ_SEED_CODE.NEXTVAL, '쌈채소');

INSERT INTO "SEED_TYPE"
VALUES(SEQ_SEED_CODE.NEXTVAL, '참외/수박');

INSERT INTO "SEED_TYPE"
VALUES(SEQ_SEED_CODE.NEXTVAL, '콩/옥수수');

INSERT INTO "SEED_TYPE"
VALUES(SEQ_SEED_CODE.NEXTVAL, '호박');

SELECT * FROM "SEED_TYPE";

COMMIT;

-- 보드 타입
INSERT INTO "BOARD_TYPE"
VALUES(SEQ_BOARD_CODE.NEXTVAL, '자유 게시판');
INSERT INTO "BOARD_TYPE"
VALUES(SEQ_BOARD_CODE.NEXTVAL, '문의 게시판');
INSERT INTO "BOARD_TYPE"
VALUES(SEQ_BOARD_CODE.NEXTVAL, '팁과 노하우');

COMMIT;

SELECT * FROM BOARD_TYPE;


-- 게시판 이미지 시퀀스 함수


-- SEQ_IMG_NO 시퀀스의 다음 값을 반환하는 함수 생성
CREATE OR REPLACE FUNCTION NEXT_BOARD_IMG_NO
-- 반환형
RETURN NUMBER
-- 사용할 변수
IS BOARD_IMG_NO NUMBER;
BEGIN
   SELECT SEQ_BOARD_IMG_NO.NEXTVAL
   INTO BOARD_IMG_NO
   FROM DUAL;
   RETURN BOARD_IMG_NO;
END;
;
SELECT NEXT_BOARD_IMG_NO() FROM DUAL;
