
data {
int <lower=1> n;
vector[n] temp_feel_c;
vector[n] rides;

}

parameters {
real alpha;
real beta;
real <lower=0> sigma;

}

transformed parameters {

vector[n] mu;

mu = alpha + beta * temp_feel_c;
}

model {


rides ~ normal(mu, sigma);

temp_feel_c ~ normal(100, 40);

sigma ~ exponential(0.0008);

alpha ~ normal(5000, 1000);


}
generated quantities {

vector[n] y_reps;

for(i in 1:n){

y_reps[i] = normal_rng(mu[i], sigma);

}
}

