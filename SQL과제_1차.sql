SELECT PLAYER_NAME AS ������,
       POSITION AS ��ġ,
       HEIGHT AS Ű,
       WEIGHT AS ������
FROM PLAYER
WHERE PLAYER_NAME = '�����';

SELECT  PLAYER_NAME AS "���� ��",
       POSITION AS ������,
       HEIGHT AS Ű,
       WEIGHT AS ������
FROM PLAYER;

SELECT PLAYER_NAME AS ������,
       HEIGHT - WEIGHT AS "Ű-������"
FROM PLAYER;

SELECT PLAYER_NAME AS ������, 
       ROUND (WEIGHT / ((HEIGHT / 100) * (HEIGHT / 100)), 2) AS BMI������
FROM PLAYER;

SELECT PLAYER_NAME || ' ����, ' || HEIGHT  || ' cm, ' || WEIGHT || ' kg' AS ü������
FROM player;
       

