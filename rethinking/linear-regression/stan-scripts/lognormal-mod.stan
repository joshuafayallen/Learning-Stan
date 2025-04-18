
data {
int <lower=1> n;
vector[n] height;
real avg_weight;
vector[n] weight;
}
parameters {
real alpha;
real <lower=0, upper = 50> sigma;
real <lower = 0> beta;
}
model {
vector[n] mu;
mu = alpha + beta * (weight - avg_weight);
height ~ normal(mu, sigma);
beta ~ lognormal(0, 1);
alpha ~ normal(178, 20);
sigma ~ uniform(0,50);
}



