from flask import Flask, render_template, request
from flask_mysqldb import MySQL
app = Flask(__name__)

app.config['MYSQL_HOST'] = "mysqldb-service"
app.config['MYSQL_USER'] = "admin"
app.config['MYSQL_PASSWORD'] = "password"
app.config['MYSQL_PORT'] = "3306"
app.config['MYSQL_DB'] = "patientsdb"

mysql = MySQL(app)

@app.route("/", methods=["GET", "POST"])
def index():
    if request.method == "POST":
        full_name = request.form["full_name"]
        phone = request.form["phone "]
        age = request.form["age"]
        address = request.form["address"]
        gender =request.form["gender"]
        prescription = request.form["prescription"]

        cur = mysql.connection.cursor()

        cur.execute( "INSERT INTO patients (full_name, phone, age, gender, address, prescription) VALUES(%s, %s, %s, %s,%s, %s)",(full_name,  phone, age, address, gender,prescription))
        mysql.connection.commit()
        cur.close()
        return "success"
        # Submit the form data to the backend function/API

        # Save the form data into the MySQL database

    return render_template('index.html')

if __name__ == "__main__":
    app.run(debug=True)
