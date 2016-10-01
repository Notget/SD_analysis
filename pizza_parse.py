# parse the pizza csv

import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
from pylab import *

df = pd.read_csv("C:/Users/Daniel/Desktop/JOB_HUNT/McNall Enterprises/Skate_Deck_Analysis_SQL/pizza_raw.csv")

# remove "and" replace with ","
df = df.drop('Notes', 1)
df = df.drop('partyID', 1)
df.toppings = [item.split('and') for item in df.toppings]

loop_count = 0
toppings_count = {}
for item in df.toppings:
    for ind_item in item:
        ind_item = ind_item.strip(' ')
        if ind_item not in toppings_count:
            toppings_count.update({ind_item: df.pizzaNumber[loop_count]})
        else:
            toppings_count[ind_item] += df.pizzaNumber[loop_count]
    loop_count += 1
        #else:
            #toppings_count[ind_item] += 1

# remove erroneous values and duplicates
del toppings_count['']
del toppings_count['none']
del toppings_count['Nothing']
'''
toppings_count['Cheese'] = toppings_count['Cheese'] + toppings_count[' Cheese']
toppings_count['Artichoke Hearts'] = toppings_count['Artichoke Hearts ']
print toppings_count
'''

plt.bar(range(len(toppings_count)), toppings_count.values(), align='center')
plt.xticks(range(len(toppings_count)), toppings_count.keys(), rotation = 80)
plt.show()
