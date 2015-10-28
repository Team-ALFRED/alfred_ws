import socket
import time
import sys

DISPENSER, PORT = "192.168.0.3", 5001
TIMEOUT = 8.0

def req(item):
  sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
  sock.sendto(item, (DISPENSER, PORT))
  sock.close()

def ack():
  sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
  sock.settimeout(TIMEOUT)
  sock.bind(("0.0.0.0", PORT))
  try:
    datagram = sock.recv(1024)
    sock.close()
  except socket.timeout:
    return False
  return True

