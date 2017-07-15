import numpy as np
import matplotlib.pyplot as plt
np.random.seed(123)

#set the starting point
step = 0

result = []

for j in range(500):
    random_walk = [0]
    for i in range(100):
        step = random_walk[-1]
    # define the dice
        dice = np.random.randint(1,7)

    # if strtucture
        if dice <= 2:
            step = max(step-1,0);
        elif  dice <=5:
            step = step+1;
        else :
            step = step + np.random.randint(1,7)
        if np.random.rand() <= 0.001:
            step = 0
        random_walk.append(step)

    result.append(random_walk)


np_aw=np.array(result)

#plt.plot(np_aw)
#plt.show()

plt.clf()

np_aw_t = np.transpose(np_aw)
#plt.plot(np_aw_t)
#plt.show()

# Create and plot np_aw_t
np_aw_t = np.transpose(np.array(result))

# Select last row from np_aw_t: ends
ends=np_aw_t[-1,:]

# Plot histogram of ends, display plot
plt.hist(ends)
plt.show()

print(sum(ends>=60)/500)