SELECT S.HACKER_ID, H.NAME
FROM SUBMISSIONS AS S JOIN CHALLENGES AS C ON S.CHALLENGE_ID = C.CHALLENGE_ID
JOIN DIFFICULTY AS D ON C.DIFFICULTY_LEVEL = D.DIFFICULTY_LEVEL
JOIN HACKERS AS H ON S.HACKER_ID = H.HACKER_ID
WHERE D.SCORE = S.SCORE
GROUP BY S.HACKER_ID, H.NAME
HAVING COUNT(S.HACKER_ID) > 1
ORDER BY COUNT(S.HACKER_ID) DESC, S.HACKER_ID

/*
문제의 답은 위가 맞는데, 왜 맞는지 이유를 모르겠다.
문제의 예시를 보면, CHALLENGE_ID와 HACKER_ID는 다대다 관계를 이루고 있다.
그러면 SUBMISSIONS 테이블과 CHALLENGES 테이블을 조인할 경우 ON 조건에 CHALLENGE_ID 뿐만 아니라 HACKER_ID 또한 적용해야 한다고 생각했다.
그렇지 않다면 HACKER_ID가 서로 다른 행이 생길 것이라고 판단했기 때문이다.
하지만 문제에선 그러한 부분을 확인할 수 없었다.
나중에 의문이 해결되면 주석을 수정해보자.
*/