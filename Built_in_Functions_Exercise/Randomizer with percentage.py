import numpy as np

drop_list = ["SEHH", "SEH", "SEU", "RW3", "UCH", "UCHH", "CRAP"]
rate_percent_list = [0.005, 0.05, 0.0005, 4.945, 10, 5, 80]

probabilities = [rate_list / sum(rate_percent_list) for rate_list in rate_percent_list]

SEH = 0
SEHH = 0
RW3 = 0
SEU = 0
counter = 0

while not SEU:
    select_element = np.random.choice(drop_list, p=probabilities)
    if select_element == "SEHH":
        SEHH += 1

    elif select_element == "SEH":
        SEH += 1

    elif select_element == "RW3":
        RW3 += 1

    elif select_element == "SEU":
        SEU += 1

    counter += 1

print("SEU = ", SEU)
print("SEHH = ", SEHH)
print("SEH = ", SEH)
print("RW3 = ", RW3)
print(counter)






