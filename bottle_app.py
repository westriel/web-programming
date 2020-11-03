import datetime as date
import sqlite3 as db
import random as r
import os
import uuid

from tinydb import TinyDB, Query
db = TinyDB("sessions.json")
query = Query()
from bottle import get, post, template, request, response, redirect

ON_PYTHONANYWHERE = "PYTHONANYWHERE_DOMAIN" in os.environ.keys()


if ON_PYTHONANYWHERE:
    from bottle import default_app
else:
    from bottle import run, debug


r.seed()


@get('/') # Get handlers are a kind of route handlers
def get_show_list():
    conn = db.connect("todo.db")
    cursor = conn.cursor()
    cursor.execute("select * from todo")
    result = cursor.fetchall()
    cursor.close()
    conn.close() # We should be using one singleton connection but because we aren't, close our connections
    return template("show_list", rows=result)


@get('/sandbox')
def get_sandbox():
    return template("sandbox")


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


@get('/set_status/<id:int>/<value:int>')
def get_set_status(id,value):
    conn = db.connect("todo.db")
    cursor = conn.cursor()
    cursor.execute("update todo set status=? where id=?", (value, id))
    conn.commit()
    cursor.close()
    conn.close()
    redirect('/')


@get('/update_item/<id:int>')
def get_update_item(id):
    conn = db.connect("todo.db")
    cursor = conn.cursor()
    cursor.execute("select * from todo where id=?", (id,))
    result = cursor.fetchall()
    cursor.close()
    conn.close() # We should be using one singleton connection but because we aren't, close our connections
    return template("update_item", row=result[0])


@post('/update_item') # Handles when an item is updated
def post_update_item():
    updated_item = request.forms.get("updated_item").strip()
    id = int(request.forms.get("id").strip())
    conn = db.connect("todo.db")
    cursor = conn.cursor()
    cursor.execute("update todo set task=? where id=?", (updated_item, id))
    conn.commit()
    cursor.close()
    conn.close()
    redirect('/')


@get('/visit')
def get_visit():
    sesID = request.cookies.get("sesID",str(uuid.uuid4()))
    result = db.search(query.session_id == sesID)
    if len(result) == 0:
        db.insert({"session_id":sesID, "visit_count":1})
        visit_count = 1
    else:
        session = result[0]
        visit_count = session["visit_count"] + 1
        db.update({"visit_count":visit_count},query.session_id == sesID)
    response.set_cookie("sesID",str(sesID))
    return(f"Welcome, user #{sesID}. This is visit #{visit_count}")


if ON_PYTHONANYWHERE:
    application = default_app()
else:
    debug(True)
    run(host="localhost",port=8080)