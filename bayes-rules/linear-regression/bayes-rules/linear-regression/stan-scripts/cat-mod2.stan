
data {
int <lower = 0> n;
int <lower = 1> n_location;
array[n] int<lower=1, upper=n_location> location;
vector[n] temp3pm;

}
parameters {
real alpha;
vector[n_location -1] beta_raw;
real <lower=0> sigma;

}
transformed parameters {
vector[n_location] beta;
vector[n] mu;
 beta[1] = 0; // reference level (e.g., oloroo)
  for (j in 2:n_location) {
    beta[j] = beta_raw[j - 1];
  }

  for (i in 1:n) {
    mu[i] = alpha + beta[location[i]];
  }

}

model {

temp3pm ~ normal(mu, sigma);

beta ~ normal(0, 10);
sigma ~ exponential(1);

}
generated quantities {

vector[n] y_rep;

for(i in 1:n){
y_rep[i] = normal_rng(mu[i], sigma);

}

}



