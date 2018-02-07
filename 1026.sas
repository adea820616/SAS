*P55 Variable=expression;
data home;
infile 'D:\SAS DATA\MyRawData\Garden.dat' ;
input Name $ 1-7 Tomato Zucchini Peas Grapes ;
Zone = 14;
Type = 'home';
Zucchini = Zucchini *10;
Total = Tomato +Zucchini+ Peas + Grapes;
PerTom = (Tomato / Total)*100;
proc print data = home;
title'home gardening survey';
run;

*P56 SAS��?;
data contest;
infile ' D:\SAS DATA\MyRawData\Pumpkin.dat' ;
input Name $ 16. Age 3. +1 Type $1. +1 Date MMDDYY10.
	(scr1 scr2 scr3 scr4 scr5) (4.1);
AvgScore = MEAN(scr1, scr2, scr3, scr4, scr5) ;
DayEntered = DAY(Date);
Type = UPCASE(Type);
proc print data= contest;
title 'pumkin';
run;

*���G�b��x��log file�A���γФ@��data set;
data _null_;
input name $1-10 sex $ 12 age 15-16 ;
put name sex age;
datalines;
Joseph     M 13
Michel     M 14
Sue Ellen  F 11
;

*trim-�װŪŮ�
cat concatenate -���p
s - �Ů泣�h��;
*trim() �h���r�Ŧ�����Ů�A�p�G�r�Ŧ�?�šA?��^�@?�Ů�
left() ��r�Ŧ�??���Ů沾�����
strip() �h���r�Ŧ�??�M?�����Ҧ��Ů�
cat() �O||�@��?���A�O�d���������Ů�
catt() ���O?�����e?�h���U�r�Ŧ�����Ů�A��?�_?����?�Xtrim()�ϥ�
cats() ���O?�����e?�h�����������Ů�A��?�_?����?�Xstrip()�ϥ�
catx() ���O?�����e?�h�����������Ů�A�}�B�b�r�Ŧꤧ?�[�W�@?���w���r�Ŧ�
;
data test_cat;
a = ' a ';
b = ' b ';
c =  ' c ';
cat_example = cat(a,b,c) ; *concatenate��s;
catt_example = catt(a,b,c) ; *�װŪť�;
trim_cat = cat( trim(a), trim(b), trim(c) ); *�]�O�װŪť�;
cats_ex = cats(a,b,c) ; *�ťճ��h��;
trimleft_ex = cat( trim(left(a)), trim(left(b)), trim(left(c)) ); *�]�O�ťճ��h��;
catx_ex = catx( ',' , a,b,c );
put cat_example $char; 
put catt_example $char; 
put trim_cat $char; 
put cats_ex $char; 
put trimleft_ex $char; 
put catx_ex $char; 
run;

*length(string)
anyspace(string <, start> ) ��Xspace����l�A���wspace����ĴX�Ӽ�
anydigit( string <,start>) ���Ʀr����l�A�i�H���Ω�_�l��l
anyalpha(string<,start>) 
substr( �ܼ�, ��m, ����) �Q�I�����ܶ��W��
;

data contest ; 
infile 'D:\SAS DATA\MyRawData\Pumpkin.dat' ;
input Name $ 16. Age 3. +1 Type $1. +1 Date MMDDYY10.
	(scr1 scr2 scr3 scr4 scr5) (4.1);
Last_Name = substr( Name , anyspace(Name,1));
Last_Name1 = substr( Name , length(Name), 1 );
run;
proc print data= contest;
title 'pumkin';
run;



data _null_;
input Phone $22. ;
substr( Phone, anydigit(Phone,1) , 3 ) =773;

put Phone ;
datalines;
Phone = (312) 555-1212
;


*lms chapter3 exercise2;
data exercise;
input First $ Last $ ;
First = lowcase(First);
Last = lowcase(Last);

substr( First ,1,1) = upcase (substr( First ,1,1));
*substr(First, 2) = lowcase( substr(First, 2));
substr( Last, 1,1) = upcase( substr( Last, 1,1));
*substr(Last,2) = lowcase( substr(Last,2)); 

datalines;
ronald cODy
THomaS eDISON
albert einstein
;
run;
proc print data = exercise;
title ' exercise';
run;

*input(source,informat)
returns the value that is produced when sas.....;
data test;
input sale $9. ;
put sale;
*comma9��,����;
fmtsale = input(sale, comma9.) ;
put fmtsale;

datalines;
2,115,353
;

*lms chapter3 exercise3;
data exercise1;
input String $36. ;
Start = anydigit(String) ;
End = anyspace( String, anydigit(String))   ;
Num = input( substr( String, anydigit(String), (End-Start) ),9. );
datalines;
This line has a 56 in it
two numbers 123 and 456 in this line
No digits here
;
run;

proc print data=exercise1;
title 'exercise1';
run;

*Start = length ( substr( String, 1, length(anydigit(String,1,1) ) ));
*End = length( substr( String, 1, length(anydigit(String,1))));
*um = substr( String, anydigit(String,1) );
