from bottle import get, post, template, request, redirect

import sqlite3 as db
import os


ON_PYTHONANYWHERE = "PYTHONANYWHERE_DOMAIN" in os.environ.keys()


if ON_PYTHONANYWHERE:
    from bottle import default_app
else:
    from bottle import run, debug


@get('/') # Get handlers are a kind of route handlers
def get_show_list():
    conn = db.connect("todo.db")
    cursor = conn.cursor()
    cursor.execute("select * from todo")
    result = cursor.fetchall()
    cursor.close()
    conn.close() # We should be using one singleton connection but because we aren't, close our connections
    return template("show_list", rows=result)


@get('/new_item')
def get_new_item():
    return template("new_item")


@post('/new_item') # Handles when a new item is saved
def post_new_item():
    new_item = request.forms.get("new_item").strip()
    conn = db.connect("todo.db")
    cursor = conn.cursor()
    cursor.execute("insert into todo (task, status) values (?,?)", (new_item,1))
    conn.commit()
    cursor.close()
    conn.close()
    redirect('/')

@get('/delete_item/<id:int>')
def get_delete_item(id):
    conn = db.connect("todo.db")
    cursor = conn.cursor()
    cursor.execute("delete from todo where id=?", (id,))
    conn.commit()
    cursor.close()
    conn.close()
    redirect('/')


if ON_PYTHONANYWHERE:
    application = default_app()
else:
    debug(True)
    run(host="localhost",port=8080)