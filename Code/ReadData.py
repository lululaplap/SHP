import numpy as np
import matplotlib.pyplot as plt
data = np.genfromtxt("../Data/data1.txt",skip_header=9,usecols=(0,1,2,3,4,5),skip_footer=0)

plt.plot(data[10000:20000,0])
#plt.plot(data[10000:12000,1])
#plt.plot(data[10000:20000,5])

plt.show()

plt.plot(abs(np.fft.fft(2*np.pi*data[10000:20000,0])))
plt.show()
