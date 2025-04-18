
data {

int <lower=1> n;

int <lower=1> n_cid;

real avg_rugged;

array[n] int cid;

vector[n]  log_gdp_z;

vector[n]  rugged_std;
}
parameters {

vector[n_cid] alpha;

vector[n_cid] beta_rugged;

real <lower=0> sigma;

}
transformed parameters {

vector[n] mu;

mu = alpha[cid] + beta_rugged[cid] .* (rugged_std - avg_rugged);

}

model {

log_gdp_z ~ normal(mu, sigma);

alpha ~ normal(1, 0.1);

beta_rugged ~ normal(0, 0.3);

sigma ~ exponential(1);

}
generated quantities {
vector[n] log_lik; // so we can calculate fit statistics
for(i in 1:n) log_lik[i] = normal_lpdf(log_gdp_z[i] | mu[i], sigma);

}


