
drop table crowd.crowd_user_bitmap_bak;
create table crowd.crowd_user_bitmap_bak like crowd.crowd_user_bitmap;
select unix_timestamp('2024-10-07 00:00:00');
insert into crowd.crowd_user_bitmap_bak select * from crowd.crowd_user_bitmap where create_timestamp >= 1728230400000;
drop table crowd.crowd_user_bitmap;
alter table crowd.crowd_user_bitmap_bak rename crowd_user_bitmap;
