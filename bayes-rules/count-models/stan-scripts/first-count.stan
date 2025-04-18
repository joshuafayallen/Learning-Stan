
data {
int <lower = 0> n;
int <lower = 0> k;
matrix[n,k] x; 
array[n] int laws;
}
parameters {
real alpha;
vector[k] beta;

}
model {

laws ~ poisson_log_glm(x, alpha, beta);
alpha ~ normal(2, 0.5 );
beta[1] ~ student_t(2, 0, 1);
beta[2] ~ student_t(2, -0.5, 2);
beta[3] ~ student_t(2, 0, 2);


}
generated quantities {
array[n] int y_rep;
vector[n] log_lik;
vector[n] lambda_hat = alpha  + x * beta;
for(i in 1:n){

log_lik[i] = poisson_log_glm_lpmf({laws[i]} | x[i,], alpha, beta);

y_rep[i] = poisson_log_rng(lambda_hat[i]);

}


}

