SELECT PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버, HEIGHT 키
FROM PLAYER
WHERE HEIGHT BETWEEN 170 AND 180;

SELECT PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버, HEIGHT 키
FROM PLAYER
WHERE POSITION = NULL;

SELECT PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버, HEIGHT 키
FROM PLAYER
WHERE POSITION IS NULL;

SELECT PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버, HEIGHT 키
FROM PLAYER
WHERE TEAM_ID = 'K02'
    AND HEIGHT >= 170;
    
SELECT TEAM_ID 팀ID, PLAYER_NAME 선수명, POSITION 포지션,
       BACK_NO 백넘버, HEIGHT 키
FROM PLAYER
WHERE TEAM_ID IN ('K02', 'K07') AND POSITION = 'MF';

SELECT TEAM_ID 팀ID, PLAYER_NAME 선수명, POSITION 포지션,
       BACK_NO 백넘버, HEIGHT 키
FROM PLAYER
WHERE TEAM_ID = 'K02'
OR TEAM_ID = 'K07'
AND POSITION = 'MF'
AND HEIGHT >= 170
AND HEIGHT <= 180;

SELECT TEAM_ID 팀ID, PLAYER_NAME 선수명, POSITION 포지션,
       BACK_NO 백넘버, HEIGHT 키
FROM PLAYER
WHERE (TEAM_ID = 'K02' OR TEAM_ID = 'K07')
    AND POSITION = 'MF'
    AND HEIGHT >= 170
    AND HEIGHT <= 180;
    
SELECT TEAM_ID 팀ID, PLAYER_NAME 선수명, POSITION 포지션,
       BACK_NO 백넘버, HEIGHT 키
FROM PLAYER
WHERE TEAM_ID IN ('K02', 'K07')
    AND POSITION = 'MF'
    AND HEIGHT BETWEEN 170 AND 180;
 
SELECT PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버, HEIGHT 키
FROM PLAYER
WHERE TEAM_ID = 'K02'
    AND POSITION <> 'MF'
    AND HEIGHT NOT BETWEEN 175 AND 185;

SELECT PLAYER_NAME 선수명, NATION 국적
FROM PLAYER
WHERE NATION IS NOT NULL;
