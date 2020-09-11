#!/usr/bin/env python3

#Diabetes Prediction Using Support Vector Machine
import pickle
import os
import sys
import pandas as pd
from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split
import numpy as np
#For training
def train():
    dataset = pd.read_csv('D:\SAHYADRI PORTAL\diabetes_recognizer\diabeties-flask\pima.csv')
    X = dataset[['F','D','E','B','C']]#preg,glucose,bp,skinthickness,insulin,bmi,dp,age,outcome
    Y = dataset[['I']]
    
    #train test split
    X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size = 0.2, random_state = 101)
    
    from sklearn.svm import SVC
    model = SVC(kernel='linear')
    svc=model.fit(X_train,Y_train)
    
    #Save Model As Pickle File
    with open('svc.pkl','wb') as m:
        pickle.dump(svc,m)
    test(X_test,Y_test)

#Test accuracy of the model
def test(X_test,Y_test):
    with open('svc.pkl','rb') as mod:
        p=pickle.load(mod)
    
    pre=p.predict(X_test)
    print (accuracy_score(Y_test,pre)) #Prints the accuracy of the model
def predict():
    #Change value in the list , values should be F,D,E,B,C
    x=[[30.5,70,40,197,70]]#
    x=np.array(x)
    # model=pickle.load(open('svc.pkl','rb'))
    model=pickle.load(open('D:\SAHYADRI PORTAL\diabetes_recognizer\diabeties-flask\svc.pkl','rb'))
    
    ans=model.predict(x)
    print(ans)

# def check_input(data) ->int :
#     df=pd.DataFrame(data=data,index=[0])
#     p=pickle.load(open('./svc.pkl','rb'))
#     op=p.predict(df)
#     return op[0]
if __name__=='__main__':
    # train()  
    predict()  
