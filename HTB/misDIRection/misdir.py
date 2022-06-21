file = "/home/planet/Documents/MachineResult/HTB/misDIRection/sequence.txt"
secret = ""
with open(file, "r") as f:
        data = f.read()
        for item in data.split():
                 secret += item[0]
                 print(secret)
