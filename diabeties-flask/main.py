import flask
import re
from flask import request, jsonify
import json
import pickle
import numpy as np

app = flask.Flask(__name__)
app.config["DEBUG"] = True

@app.route('/hi', methods=['GET'])
def home():
    return '''<h1>Distant Reading Archive</h1>
<p>A prototype API for distant reading of science fiction novels.</p>'''


@app.route('/upload', methods = ['GET', 'POST'])
def upload_file():
   if request.method == 'POST':
    request_data = request.get_json()
   x=[[float(request_data["bmi"]),float(request_data["skin"],),
   float(request_data["insulin"]),float(request_data["glucose"]),float(request_data["bp"])]]
   print(x)
   x=np.array(x)
   model=pickle.load(open('D:\SAHYADRI PORTAL\diabetes_recognizer\diabeties-flask\svc.pkl','rb'))
   ans=model.predict(x)
   print(ans)
   answer=ans[0]
   
   return str(answer)

app.run(host="0.0.0.0")
