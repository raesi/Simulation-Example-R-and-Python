#First Approach
# Buit a data from with 100 row and 10000 columns incuding rolling a dice
b = replicate(10000,sample(x = c(1,2,3,4,5,6),size = 100,replace = TRUE))

# conver each dice to step
for (i in 1:10000){
b[,i] = ifelse(b[,i] ==1 | b[,i] ==2,-1,ifelse(b[,i]==6,3.5,1))
}
# return sum each column which is the total steps user can take
c = apply(b,2,sum)
sum(c>=60)/10000




#Second Approach
set.seed(123)
# initialize a random walk
result=list()

# simulate the distribution by repeating the exprince 10,000 times and keep the final steps
# in the result list
for(j in 1:10000){
          random_walk=list()
          step=0
          # simulate the steps with 100 dice rolls
          for ( i in 1:100){
                    dice = sample(x = c(1,2,3,4,5,6),size =1)
                    if (dice <= 2) {
                              step = max(step-1,0)
                    } else if (dice <= 5 ) {
                              step=step + 1
                    } else{step = step + sample(x = c(1,2,3,4,5,6),size =1)}
                    random_walk[i]=step
          }
          result[j]=random_walk[100]
}
plot(type = "l",1:100,random_walk)
hist(as.numeric(result))





