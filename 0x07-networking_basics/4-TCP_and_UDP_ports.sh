#!/usr/bin/env bash

# Display listening ports with PID and program name
netstat -tuln | grep LISTEN | while read -r line; do
    # Extract the protocol, local address, and port
    proto=$(echo "$line" | awk '{print $1}')
    addr=$(echo "$line" | awk '{print $4}')
    port=$(echo "$addr" | awk -F: '{print $NF}')
    
    # Get the PID and program name
    pid=$(lsof -i:"$port" -nP | grep LISTEN | awk '{print $2}' | head -n 1)
    prog=$(ps -p "$pid" -o comm=)
    
    # Display the results
    printf "%s\t%s\t%s\n" "$proto" "$port" "$pid/$prog"
done
