
data {
int <lower=1> n;
vector[n] height;
}
parameters {
real alpha;
real <lower = 0, upper = 50> sigma;
}
model {
height ~ normal(alpha, sigma); // likelihood
alpha ~ normal(178, 20); // height prior
sigma ~ uniform(0, 50);

}


