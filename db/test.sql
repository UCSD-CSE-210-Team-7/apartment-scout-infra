-- get user details
SELECT * FROM USERS where email='shs004@ucsd.edu'


-- find all scouts in a zipcode
SELECT * FROM USERS
JOIN USERREGION USING (email)
WHERE ZIPCODE=92092

-- find tours done by X
SELECT * from TOURS WHERE scouted_by='skulkarn@ucsd.edu'

-- find tours requested by X
SELECT * from TOURS WHERE scouted_by='yaz083@ucsd.edu'


-- find all conversations involving person X
SELECT * FROM CONVERSATIONS
where person_a='maagrawa@ucsd.edu'
UNION
SELECT * FROM CONVERSATIONS
where person_b='maagrawa@ucsd.edu'

-- get all messages for a conversation
SELECT * from MESSAGES
where conversation_id=1

