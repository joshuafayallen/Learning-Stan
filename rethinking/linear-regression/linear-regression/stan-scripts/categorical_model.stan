

data {
int <lower = 1> n;
int<lower = 1> n_sex;
array[n] int sex;
vector[n] height;
real avg_weight;
vector[n] weight;
}
parameters {
real <lower=0> beta_weight;
vector[n_sex] alpha;
real <lower = 0, upper = 50> sigma;

}
model {
vector[n] mu;

mu = alpha[sex] + beta_weight * (weight-avg_weight);

height ~ normal(mu, sigma);

alpha[1] ~ normal(178,20);

alpha[2] ~ normal(178, 20); // just assuming women are 5 cm shorter than men

beta_weight ~ lognormal(0, 1);

sigma ~ uniform(0, 50);

}

