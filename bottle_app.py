import datetime as date
import sqlite3 as db
import random as r
import os

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


visit_times = {}
first_visit = {}


@get('/visit')
def get_visit():
    visitCounter = int(request.cookies.get("visitCounter",'0'))
    userID = request.cookies.get("userID",str(r.randint(1000000000,2000000000)))
    visitCounter = visitCounter + 1
    response.set_cookie("visitCounter",str(visitCounter))
    response.set_cookie("userID",str(userID))
    # set_cookie options:
    #    max_age = #, in seconds
    #    httponly = T/F, disallows javascript from messing with the cookie
    #    secure = T/F
    #    secret = "", allows you to cryptographically encrypt the cookie, use request.get_cookie("cookie_name", 'default val', secret="")
    lastVisit = visit_times.get(userID,"never")
    visit_times[userID] = str(date.datetime.now())
    if lastVisit == "never":
        first_visit[userID] = visit_times[userID]
    #cookie = request.cookies["visitCounter"] Can be treated as a dictionary but errors if the cookie doesn't exist
    return("User #" + str(userID) + ", you have visited " + str(visitCounter) + " times, and your last visit was at: " + lastVisit + ", and your first visit was on " + first_visit[userID] + ".")


if ON_PYTHONANYWHERE:
    application = default_app()
else:
    debug(True)
    run(host="localhost",port=8080)