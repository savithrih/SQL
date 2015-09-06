INSERT INTO `mydb`.`students`(`student_id`,`first_name`,`last_name`)VALUES(1,'savithri','holagunda');
INSERT INTO `mydb`.`students`(`student_id`,`first_name`,`last_name`)VALUES(2,'srinivas','tirupati');
INSERT INTO `mydb`.`students`(`student_id`,`first_name`,`last_name`)VALUES(3,'sweety','hola');

INSERT INTO `mydb`.`friendships`(`id`,`student_id`,`friendship_id`)VALUES(1,1,2);
INSERT INTO `mydb`.`friendships`(`id`,`student_id`,`friendship_id`)VALUES(2,3,1);
INSERT INTO `mydb`.`friendships`(`id`,`student_id`,`friendship_id`)VALUES(3,2,3);

select * from friendships;
select * from students;

select students.first_name, students.last_name
, friends.first_name as friends_first_name, friends.last_name as friends_last_name
from students
left join  friendships
on students.student_id = friendships.student_id
left join students as friends
on friendships.friendship_id = friends.student_id
order by friends_last_name asc;



