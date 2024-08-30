#!/usr/bin/python3
""" a Python script that, using a REST API, for a given employee ID,
    returns information about his/her TODO list progress."""
import json
import requests
import sys


if __name__ == '__main__':
    data = {}
    url = 'https://jsonplaceholder.typicode.com/todos'
    rq = requests.get(url)
    for item in rq.json():
        if str(item.get('userId')) not in data:
            data[str(item.get('userId'))] = []
        url2 = 'https://jsonplaceholder.typicode.com/users?id='\
               + str(item.get('userId'))
        rq2 = requests.get(url2)
        rq2 = rq2.json()
        user_name = rq2[0]['username']
        data2 = {}
        data2['task'] = item.get('title')
        data2['completed'] = item.get('completed')
        data2['username'] = user_name
        data[str(item.get('userId'))].append(data2)

    filename = 'todo_all_employees.json'
    with open(filename, 'w') as f:
        json.dump(data, f)
