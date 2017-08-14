load init_fare.txt;
load init_matrix.txt;
load FinalResult.txt;
load FinalFare.txt;
plused_matrix = abs(init_matrix-FinalResult);
solution_change = sum(sum(plused_matrix));
result_change = init_fare - FinalFare;
C=[C;solution_change];
R=[R;result_change]
