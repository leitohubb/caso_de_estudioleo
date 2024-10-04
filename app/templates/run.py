from flask import Flask, render_template, request, redirect, url_for, flash
from flask_bcrypt import Bcrypt

app = Flask(_name_)
bcrypt = Bcrypt(app)

app.config['SECRET_KEY'] = 'clave_secreta'

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        password = bcrypt.generate_password_hash(request.form['password']).decode('utf-8')
        flash('Usuario registrado con éxito', 'success')
        return redirect(url_for('login'))
    return render_template('register.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        flash('Inicio de sesión exitoso', 'success')
        return redirect(url_for('home'))
    return render_template('login.html')

@app.route('/')
def home():
    return 'Bienvenido a Motos Bogotá S.A.'

if _name_ == '_main_':
    app.run(debug=True)