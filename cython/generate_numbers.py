import random

minimum = 0
maximum = 1000

with open("numbers.txt", "w") as file:
    for i in range(0, 1000000):
        random_number =  int(minimum + (random.random() * (maximum - minimum)))
        file.write(str(random_number) + "\n")
