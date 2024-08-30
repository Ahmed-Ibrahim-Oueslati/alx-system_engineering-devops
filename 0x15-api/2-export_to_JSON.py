#!/usr/bin/python3
""" a Python script to export data in JSON"""
import json
import requests
import sys


if __name__ == '__main__':
    url = 'https://jsonplaceholder.typicode.com/users?id=' + sys.argv[1]
    rq = requests.get(url)
    if rq.status_code == 200:
        data = {sys.argv[1]: []}
        user_name = rq.json()[0].get("username")
        url2 = 'https://jsonplaceholder.typicode.com/todos'
        rq2 = requests.get(url2)
        for item in rq2.json():
            if item.get("userId") == int(sys.argv[1]):
                data2 = {'task': item.get('title'),
                         'completed': item.get('completed'),
                         'username': user_name}
                data[sys.argv[1]].append(data2)
    filename = sys.argv[1] + '.json'
    with open(filename, 'w') as f:
        json.dump(data, f)
