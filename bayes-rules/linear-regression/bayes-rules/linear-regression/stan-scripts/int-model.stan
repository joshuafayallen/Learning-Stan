
data {
int <lower = 0> n;
int <lower =1> n_location;
array[n] int location;
vector[n] temp3pm;
vector[n] temp9am_c;

}
parameters {
real <lower=0> sigma;
vector[n_location] beta_location;
vector [n_location] beta_temp;

}
transformed parameters {
vector[n] mu;
mu = beta_location[location] + beta_temp[location] .* temp9am_c;


}
model {

temp3pm ~ normal(mu, sigma);

beta_location ~ normal(0, 10);
beta_temp ~ normal(0, 2.5);
sigma ~ exponential(1);

}
generated quantities {

vector[n] y_rep;

for(i in 1:n){
y_rep[i] = normal_rng(mu[i], sigma);

}

}
