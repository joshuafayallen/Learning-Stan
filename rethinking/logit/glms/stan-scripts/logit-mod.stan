
data {
int <lower=1> n;
int <lower=1> n_pred;
int <lower=1> n_treatment;
int <lower=1> n_actor;
array[n] int actor;
array[n] int treatment;
array[n_pred] int pred_treatment;
array[n_pred] int pred_actor;
array[n] int<lower =0, upper=1> pulled_left;

}

parameters {
vector[n_actor] alpha;
vector[n_treatment] beta;

}

model {
pulled_left ~ binomial(1, inv_logit(alpha[actor] + beta[treatment]));

alpha ~ normal(0, 1.5);

beta ~ normal(0, 0.5);

}

generated quantities {

vector[n] log_lik;
vector[n_pred] preds;

preds = inv_logit(alpha[pred_actor] + beta[pred_treatment]);

for(i in 1:n) log_lik[i] = binomial_lpmf(pulled_left[i] | 1, inv_logit(alpha[actor[i]] + beta[treatment[i]]));


}


