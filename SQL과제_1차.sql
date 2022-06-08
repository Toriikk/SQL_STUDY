SELECT PLAYER_NAME AS 선수명,
       POSITION AS 위치,
       HEIGHT AS 키,
       WEIGHT AS 몸무게
FROM PLAYER
WHERE PLAYER_NAME = '정상수';

SELECT  PLAYER_NAME AS "선수 명",
       POSITION AS 포지션,
       HEIGHT AS 키,
       WEIGHT AS 몸무게
FROM PLAYER;

SELECT PLAYER_NAME AS 선수명,
       HEIGHT - WEIGHT AS "키-몸무게"
FROM PLAYER;

SELECT PLAYER_NAME AS 선수명, 
       ROUND (WEIGHT / ((HEIGHT / 100) * (HEIGHT / 100)), 2) AS BMI비만지수
FROM PLAYER;

SELECT PLAYER_NAME || ' 선수, ' || HEIGHT  || ' cm, ' || WEIGHT || ' kg' AS 체격정보
FROM player;
       

