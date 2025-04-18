
data{
int <lower=0> n;
int <lower=1> n_location;
array[n] int location;
vector[n] temp3pm;
vector[n] temp9am_c;
vector[n] humidity9am_c;
vector[n] pressure9am_c;
vector[n] windspeed9am_c;
}
parameters { 
real <lower=0> sigma;
vector[n_location] beta_location;
real beta_temp;
real beta_humidity;
real beta_pressure;
real beta_wind;
}
transformed parameters {
vector[n] mu;

for(i in 1:n){

mu[i] = beta_location[location[i]] + beta_temp * temp9am_c[i] + beta_humidity * humidity9am_c[i] + beta_pressure * pressure9am_c[i]+ beta_wind * windspeed9am_c[i];

}

}

model {

temp3pm ~ normal(mu, sigma);

beta_location ~ normal(0, 10);

[beta_temp, beta_humidity, beta_pressure, beta_wind] ~ normal(0, 2.5);

sigma ~ exponential(1);


}

generated quantities {
vector[n] yrep;

for(i in 1:n){
yrep[i] = normal_rng(mu[i], sigma);

}


}

