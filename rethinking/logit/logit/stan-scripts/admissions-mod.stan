
data {
int <lower = 1> n;
int <lower = 1> n_dept;
int <lower = 1> n_gid;
array[n] int gid;
  array[n] int dept;
  array[n] int applications;
  array[n] int<lower=0> admit;

}

parameters {
vector[n_gid] alpha;
vector[n_dept] beta;

}
model {

admit ~ binomial(applications, inv_logit(alpha[gid] + beta[dept]));

gid ~ normal(0, 1.5);

dept ~ normal(0, 1.5);


}



