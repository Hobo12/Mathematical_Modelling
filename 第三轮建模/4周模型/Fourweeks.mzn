enum disease={bai,bai_double,qing,shi,wai};%The type of disease
array[disease] of int: duration = [5,7,11,13,7];%The time one patient need to stay in hospital

%Total number of each type of patient
set of int:bai_total=1..57;
set of int:bai_double_total=1..76;
set of int:qing_total=1..36;
set of int:shi_total=1..97
set of int:wai_total=1..37;
%the start time of every patient
array[bai_total] of var int:start_bai;
array[bai_double_total] of var int:start_bai_double; 
array[qing_total] of var int:start_qing; 
array[shi_total] of var int:start_shi; 
array[wai_total] of var int:start_wai;
 

array[]