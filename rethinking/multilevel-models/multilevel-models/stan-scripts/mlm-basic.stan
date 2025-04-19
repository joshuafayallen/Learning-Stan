
data {
int <lower=0> n;
array[n] int tank;
array[n] int density;
array[n] int surv;

}
parameters {

///global tank variation
real abar;
real <lower=0> sigma;
vector[n] alpha;

}

model {

surv ~ binomial(density, inv_logit(alpha[tank]));

/// remember we are trying to learn abar and sigma
alpha ~ normal(abar, sigma);
sigma ~ exponential(1);

}



