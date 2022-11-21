import psycopg2
from psycopg2.extras import RealDictCursor
from flask import Flask, render_template, request, url_for, flash, redirect
from werkzeug.exceptions import abort
from datetime import datetime
from init_db import do_init
import boto3
from botocore.exceptions import ClientError

def get_secret():
    secret_name = "group3project2"
    region_name = "us-east-2"

    # Create a Secrets Manager client
    session = boto3.session.Session()
    client = session.client(
        service_name='secretsmanager',
        region_name=region_name
    )

    try:
        get_secret_value_response = client.get_secret_value(
            SecretId=secret_name
        )
    except ClientError as e:
        # For a list of exceptions thrown, see
        # https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_GetSecretValue.html
        raise e

    # Decrypts secret using the associated KMS key.
    secret = get_secret_value_response['SecretString']

    return secret


def get_db_connection():
    database_secrets = eval(get_secret())
    con = psycopg2.connect(host=database_secrets['host'], database=database_secrets['database'], port=database_secrets['port'], user=database_secrets['user'], password=database_secrets['password'])
    return con


def get_post(post_id):
    con = get_db_connection()
    cursor = con.cursor()
    SQL = 'SELECT * FROM posts WHERE id = %s;'
    cursor.execute(SQL, (post_id,))
    post = cursor.fetchone()
    cursor.close()
    if post is None:
        abort(404)
    postal = {'id': post[0], 'created': post[1], 'title': post[2], 'content': post[3]}
    postal['created'] = format_date(postal['created'])
    return postal


app = Flask(__name__)


# this function is used to format date to a finnish time format from database format
# e.g. 2021-07-20 10:36:36 is formateed to 20.07.2021 klo 10:36
def format_date(post_date):
    return post_date.strftime('%d.%m.%Y') + ' klo ' + post_date.strftime('%H:%M')


# this index() gets executed on the front page where all the posts are
@app.route('/')
def index():
    conn = get_db_connection()
    cursor = conn.cursor()
    SQL = 'SELECT * FROM posts;'
    cursor.execute(SQL)
    posts = cursor.fetchall()
    cursor.close()
    # we need to iterate over all posts and format their date accordingly
    dictrows = []
    for post in posts:
        dictrows.append({'id': post[0], 'created': post[1], 'title': post[2], 'content': post[3]})
    for post in dictrows:
        # using our custom format_date(...)
        post['created'] = format_date(post['created'])
    return render_template('index.html', posts=dictrows)


# here we get a single post and return it to the browser
@app.route('/<int:post_id>')
def post(post_id):
    post = get_post(post_id)
    return render_template('post.html', post=post)


# here we create a new post
@app.route('/create', methods=('GET', 'POST'))
def create():
    if request.method == 'POST':
        title = request.form['title']
        content = request.form['content']
        if not title:
            flash('Title is required!')
        else:
            conn = get_db_connection()
            cursor = conn.cursor(cursor_factory=RealDictCursor)
            SQL = 'INSERT INTO posts (title, content) VALUES (%s, %s);'
            cursor.execute(SQL, (title, content))
            conn.commit()
            conn.close()
            return redirect(url_for('index'))

    return render_template('create.html')


@app.route('/<int:id>/edit', methods=('GET', 'POST'))
def edit(id):
    post = get_post(id)

    if request.method == 'POST':
        title = request.form['title']
        content = request.form['content']

        if not title:
            flash('Title is required!')
        else:
            conn = get_db_connection()
            cursor = conn.cursor(cursor_factory=RealDictCursor)
            SQL = 'UPDATE posts SET title = %s, content = %s WHERE id = %s;'
            cursor.execute(SQL, (title, content, id))
            conn.commit()
            conn.close()
            return redirect(url_for('index'))

    return render_template('edit.html', post=post)


# Here we delete a SINGLE post.
@app.route('/<int:id>/delete', methods=('GET', 'POST'))
def delete(id):
    post = get_post(id)
    conn = get_db_connection()
    cursor = conn.cursor(cursor_factory=RealDictCursor)
    SQL = 'DELETE FROM posts WHERE id = %s;'
    cursor.execute(SQL, (id,))
    conn.commit()
    conn.close()
    return redirect(url_for('index'))

if __name__ == "__main__":
    app.run(host="0.0.0.0")
