

data {
int <lower=0> n;
int <lower=0> n_pred;
vector[n] blooms_std;
vector[n] shade_cent;
vector[n] water_cent;
vector[n_pred] s_pred;
vector[n_pred] w_pred;

}
parameters {
real alpha;
real beta1;
real beta2;
real beta3;
real <lower=0> sigma;
}

model {

blooms_std ~ normal(alpha + beta1 * water_cent + beta2 * shade_cent + beta3.* water_cent .* shade_cent, sigma);

alpha ~ normal(0.5, 0.25);

 // long form
//beta1 ~ normal(0, 0.25);

//beta2 ~ normal(0, 0.25);

//beta3 ~ normal(0, 0.25);

[beta1, beta2, beta3] ~ normal(0, 0.25);

sigma ~ exponential(1);



}

generated quantities {

vector[n_pred] mu ;
mu = alpha + beta1 * w_pred + beta2 * s_pred + beta3 .* w_pred .* s_pred;

}


