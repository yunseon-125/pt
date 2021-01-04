-- 기존 데이터를 모두 지운다.
delete from board_comment;
delete from board;

declare --선언부
  i number := 1; --i 변수에 1을 대입
begin --실행부
  while i<=991 loop
    insert into board
      (num,writer,subject,passwd,ref,re_step,re_level,content,ip) 
    values
      ( (select nvl(max(num)+1,1) from board)
        ,'kim'||i,'제목'||i,'1234'
        ,(select nvl(max(num)+1,1) from board)
        ,1,0,'내용'||i,'127.0.0.1');
    i := i + 1;
  end loop;
end;
/

select * from board order by num desc;

commit; 

