function score = get_total_score(actual_score, number_zeros, cluster_score)
temp_score = actual_score + log(actual_score) * number_zeros - cluster_score;
score = max([temp_score, min([actual_score, 1])]);
