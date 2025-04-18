
data {
int <lower = 0> n;
int <lower = 1> n_location;
array[n] int location;
vector[n] temp3pm;

}
parameters {
vector[n_location] beta;
real <lower=0> sigma;

}
transformed parameters {
vector[n] mu;
for(i in 1:n){
mu[i] = beta[location[i]];

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



