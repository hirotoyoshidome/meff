import datetime
import random


# python3 generate_sample.py > ../sample.csv

print("date,view-count,buy-count")
now = datetime.datetime.now()
dateformat = "%Y-%m-%d"

for i in range(1,31+1):
    d = now + datetime.timedelta(days=i)
    date_str = d.strftime(dateformat)
    print("{0},{1},{2}".format(date_str, random.randint(1000,2000), random.randint(10,40)))

