import stats_func
import time

numbers = []
lines = None

#Read lines and get time
read_lines_start_time = time.time()
with open("numbers.txt", 'r') as file:
    lines = file.readlines()
numbers = [int(line) for line in lines]
read_lines_end_time = time.time()
read_lines_time = read_lines_end_time - read_lines_start_time

#Compute time to get average
python_avg_start_time = time.time()
python_avg = stats_func.getAvg(numbers)
python_avg_end_time = time.time()
python_avg_time = python_avg_end_time - python_avg_start_time

#Compute time to get std
python_std_start_time = time.time()
python_std = stats_func.getSTD(numbers)
python_std_end_time = time.time()
python_std_time = python_std_end_time - python_std_start_time

#Print results
print("Python time to read file: " + str(read_lines_time))

print("Python computational average: " + str(python_avg))
print("Python computational average time: " + str(python_avg_time))

print("Python computaitonal standard deviation: " + str(python_std))
print("Python computaitonal standard deviation time: " + str(python_std_time))



# TODO: Call C++ average and standard deviation (using pybind11) code and compare results

# TODO: Add more cases (small list, large list, etc...)
# so we have more data to investigate and report
