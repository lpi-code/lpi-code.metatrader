#!/usr/bin/env python3

import socket
import time
import tkinter as tk
from tkinter import messagebox

def port_knock(host, ports, delay=1, protocol='tcp'):
    """
    Perform port knocking on a specified host.

    :param host: The target host (IP address or hostname).
    :param ports: A list of ports to knock on.
    :param delay: The delay between knocks in seconds (default is 1 second).
    :param protocol: The protocol to use for knocking ('tcp' or 'udp', default is 'tcp').
    """
    for port in ports:
        try:
            if protocol == 'tcp':
                sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            elif protocol == 'udp':
                sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
            else:
                messagebox.showerror("Error", f"Unsupported protocol: {protocol}")
                return

            sock.settimeout(delay)
            sock.connect((host, port))
            print(f"Knocked on port {port}")
            sock.close()

        except socket.error as e:
            print(f"Failed to knock on port {port}: {e}")

        time.sleep(delay)

def start_knocking():
    target_host = host_entry.get()
    knock_ports = list(map(int, ports_entry.get().split(',')))
    knock_delay = int(delay_entry.get())
    knock_protocol = protocol_var.get()

    if not target_host or not knock_ports:
        messagebox.showerror("Error", "Please enter the target host and port sequence.")
        return

    port_knock(target_host, knock_ports, knock_delay, knock_protocol)
    messagebox.showinfo("Success", "Port knocking sequence completed.")

# Create the main window
root = tk.Tk()
root.title("Port Knocking Tool")

# Create and place the widgets
tk.Label(root, text="Target Host (IP address)").grid(row=0, column=0, padx=10, pady=5)
host_entry = tk.Entry(root)
host_entry.grid(row=0, column=1, padx=10, pady=5)

tk.Label(root, text="Port Sequence (comma-separated)").grid(row=1, column=0, padx=10, pady=5)
ports_entry = tk.Entry(root)
ports_entry.grid(row=1, column=1, padx=10, pady=5)

tk.Label(root, text="Delay between knocks (seconds)").grid(row=2, column=0, padx=10, pady=5)
delay_entry = tk.Entry(root)
delay_entry.grid(row=2, column=1, padx=10, pady=5)
delay_entry.insert(0, "1")  # Default delay

tk.Label(root, text="Protocol").grid(row=3, column=0, padx=10, pady=5)
protocol_var = tk.StringVar(value="tcp")
protocol_menu = tk.OptionMenu(root, protocol_var, "tcp", "udp")
protocol_menu.grid(row=3, column=1, padx=10, pady=5)

start_button = tk.Button(root, text="Start Knocking", command=start_knocking)
start_button.grid(row=4, column=0, columnspan=2, pady=10)

# Run the main event loop
root.mainloop()
