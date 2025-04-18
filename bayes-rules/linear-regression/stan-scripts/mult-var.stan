
data { 
int <lower = 0> n;
int <lower = 1> n_location;
array[n] int location;
vector[n] temp3pm;
vector[n] temp9am_c;

}
parameters {
vector[n_location] beta_location;
real beta_temp;
real <lower = 0> sigma;

}
transformed parameters {
vector[n] mu;

for(i in 1:n){

mu[i] = beta_location[location[i]] + beta_temp * temp9am_c[i];

}
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



