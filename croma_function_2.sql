CREATE DEFINER=`root`@`localhost` FUNCTION `fiscal_quators`( calander_date date ) RETURNS char(2) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
declare m tinyint;
declare qrt char(2);
set m=month(calander_date);
case 
when m in(9,10,11) then set  qrt="q1";
when m in(12,1,2) then set  qrt="q2";
when m in(5,3,4) then set  qrt="q3";
when m in(8,6,7) then set  qrt="q4";


end case;

RETURN qrt;
END