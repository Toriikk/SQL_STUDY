DROP TABLE t_Board CASCADE CONSTRAINTS;

--게시판 테이블 생성 
CREATE TABLE t_Board(
    articleNO number(10) primary key,
    parentNO number(10) default 0,
    title varchar2(500) not null,
    content varchar2(4000),
    imageFileName varchar2(30),
    writedate date default sysdate not null,
    id varchar2(10),
    CONSTRAINT FK_ID FOREIGN KEY(id) -- id 컬럼을 회원 테이블의 id 컬럼에 대해 외래키로 지정 
    REFERENCES t_member(id)
);

SELECT
    *
FROM t_board;

-- 테이블에 테스트 글 추가 
insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
values(1, 0, '테스트글입니다.', '테스트글입니다.', null, sysdate, 'hong');

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
values(2, 0, '안녕하세요.', '상품 후기입니다.', null, sysdate, 'hong');

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
values(3, 2, '답변입니다.', '상품 후기에 대한 답변입니다.', null, sysdate, 'hong');

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
values(5, 3, '답변입니다.', '상품 좋습니다.', null, sysdate, 'lee');

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
values(4, 0, '김유신입니다.', '김유신 테스트글입니다.', null, sysdate, 'kim');

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
values(6, 2, '상품 후기입니다..', '이순신씨의 상품 사용 후기를 올립니다!!.', null, sysdate, 'lee');

commit;

