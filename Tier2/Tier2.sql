select * from USER_ROLE
SELECT * FROM APP_USER WHERE role_id = 3
INSERT INTO app_user (username,password,first_name,last_name, role_id ) VALUES
	('Wu','Tang', 'Clan','4eva',4);
select * from app_user inner Join study_set on app_user.user_id=study_set.owner_id where user_id=4 