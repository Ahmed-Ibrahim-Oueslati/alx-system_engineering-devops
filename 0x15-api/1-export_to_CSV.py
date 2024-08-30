#!/usr/bin/python3
""" Python script to export data in the CSV format"""
import csv
import requests
import sys


if __name__ == '__main__':
    url = 'https://jsonplaceholder.typicode.com/users/' + sys.argv[1]
    rq = requests.get(url)
    if rq.status_code == 200:
        user_name = rq.json().get("username")
        url2 = 'https://jsonplaceholder.typicode.com/todos'
        rq2 = requests.get(url2)
        filename = sys.argv[1] + '.csv'
        with open(filename, 'w') as f:
            wr = csv.writer(f, quoting=csv.QUOTE_ALL, delimiter=',')
            for item in rq2.json():
                if item.get("userId") == int(sys.argv[1]):
                    line = [item.get("userId"),
                            user_name,
                            str(item.get("completed")),
                            item.get('title')]
                    wr.writerow(line)
