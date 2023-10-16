import pickle
from flask import Flask
from flask import request
from flask import jsonify

with open('dv.bin', 'rb') as f: 
    dv = pickle.load(f)
    
with open('model1.bin', 'rb') as f: 
    model = pickle.load(f)
    
print(model.coef_)