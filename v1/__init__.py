from flask import Flask, render_template
import os

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('home.html')

@app.route('/environment')
def environment():
    environment = os.environ['ENV_VAR']
    return render_template('environment.html', environment = environment)

