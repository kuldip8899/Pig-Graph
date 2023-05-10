graph_input = LOAD '$G' USING PigStorage(',') AS (a:int, b:int);
neighbors = GROUP graph_input BY a;
n_neighbors = FOREACH neighbors GENERATE group, COUNT(graph_input) as new;
g_cnt = GROUP n_neighbors BY new;
final_cnt = FOREACH g_cnt GENERATE group, COUNT(n_neighbors);
STORE final_cnt INTO '$O' USING PigStorage('\t');





