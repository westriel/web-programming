import datetime as date
import time
import uuid
import dataset
import json

db = dataset.connect('sqlite:///todo.db')

from bottle import get, post, request, response, template, redirect

import os
ON_PYTHONANYWHERE = "PYTHONANYWHERE_DOMAIN" in os.environ.keys()


if ON_PYTHONANYWHERE:
    from bottle import default_app
else:
    from bottle import run, debug


def get_session(request, response):
    session_id = request.cookies.get("session_id", None)
    if session_id == None:
        session_id = str(uuid.uuid4())
        session = {'session_id':session_id, 'username':'Guest', 'time':int(time.time())}
        db['session'].insert(session)
        response.set_cookie('session_id', session_id)
    else:
        session = db['session'].find_one(session_id=session_id)
        if session == None:
            response.delete_cookie('session_id')
            session = get_session(request, response)
    return session


def save_session(session):
    db['session'].update(session, ['session_id'])


@get('/old') # Get handlers are a kind of route handlers
def get_show_list():
    session = get_session(request, response)
    if session['username'] == 'Guest':
        redirect('/login')
        return
    result = db['todo'].all()
    result =[dict(r) for r in result]
    return template("show_list", rows=result, session=session)


@get('/')
def get_ajax():
    session = get_session(request, response)
    if session['username'] == 'Guest':
        redirect('/login')
        return
    return template("show_list_ajax", session=session)


@get('/login')
def get_login():
    session = get_session(request, response)
    if session['username'] != 'Guest':
        redirect('/')
        return
    return template("login",csrf_token="ABC")


@post('/login')
def post_login():
    session = get_session(request, response)
    if session['username'] != 'Guest':
        redirect('/')
        return

    csrf_token = request.forms.get("csrf_token").strip()
    if csrf_token != "ABC":
        redirect('/login_error')
        return

    username = request.forms.get("username").strip()
    password = request.forms.get("password").strip()
    profile = db['profile'].find_one(username=username)
    if profile == None or password != profile['password']:
        redirect('/login_error')
        return
    session['username'] = username
    save_session(session)
    redirect('/')


@get('/logout')
def get_logout():
    session = get_session(request, response)
    session['username'] = 'Guest'
    save_session(session)
    redirect('/login')


@get('/login_error')
def get_login_error():
    return template("login_error")


@get('/register')
def get_register():
    session = get_session(request, response)
    if session['username'] != 'Guest':
        redirect('/')
        return
    return template("register", csrf_token="ABC")


@post('/register')
def post_register():
    session = get_session(request, response)
    if session['username'] != 'Guest':
        redirect('/')
        return

    csrf_token = request.forms.get("csrf_token").strip()
    if csrf_token != "ABC":
        redirect('/resgister_error/unknown')
        return

    username = request.forms.get("username").strip()
    password = request.forms.get("password").strip()
    if len(password) < 8:
        redirect('/register_error/password')
        return
    profile = db['profile'].find_one(username=username)
    if profile:
        redirect('/register_error/username')
        return
    db['profile'].insert({'username':username, 'password':password})
    redirect('/')


@get('/register_error')
def get_register_error():
    return template("register_error", error="unknown")


@get('/register_error/<errorcode>')
def get_register_error(errorcode):
    return template("register_error", error=errorcode)


@get('/picture')
def get_picture():
    return template("picture")


@get('/sandbox')
def get_sandbox():
    session = get_session(request,response)
    return template("sandbox", session=session)


@get('/new_item')
def get_new_item():
    session = get_session(request, response)
    if session['username'] == 'Guest':
        redirect('/login')
        return
    return template("new_item", session=session, old=request.query.old)


@post('/new_item') # Handles when a new item is saved
def post_new_item():
    session = get_session(request, response)
    if session['username'] == 'Guest':
        redirect('/login')
        return
    new_task = request.forms.get("new_task").strip()
    db['todo'].insert({'task':new_task, 'status':False})
    if request.query.old:
        redirect('/old')
    else:
        redirect('/')


@get('/delete_item/<id:int>')
def get_delete_item(id):
    session = get_session(request, response)
    if session['username'] == 'Guest':
        redirect('/login')
        return
    db['todo'].delete(id=id)
    if request.query.old:
        redirect('/old')
    return


@get('/set_status/<id:int>/<value:int>')
def get_set_status(id,value):
    session = get_session(request, response)
    if session['username'] == 'Guest':
        redirect('/login')
        return
    db['todo'].update({'id':id, 'status':(value!=0)},['id'])
    if request.query.old:
        redirect('/old')
    return


@get('/update_item/<id:int>')
def get_update_item(id):
    session = get_session(request, response)
    if session['username'] == 'Guest':
        redirect('/login')
        return
    result = db['todo'].find_one(id=id)
    return template("update_item", session=session, row=result, old=request.query.old)


@post('/update_item') # Handles when an item is updated
def post_update_item():
    session = get_session(request, response)
    if session['username'] == 'Guest':
        redirect('/login')
        return
    id = int(request.forms.get("id").strip())
    updated_task = request.forms.get("updated_item").strip()
    db['todo'].update({'id':id, 'task':updated_task},['id'])
    if request.query.old:
        redirect('/old')
    else:
        redirect('/')


@get('/get_tasks')
def get_tasks():
    session = get_session(request, response)
    response.content_type = 'application/json'
    if session['username'] == 'Guest':
        return "[]"
    else:
        result = db['todo'].all()
        tasks = [dict(r) for r in result]
        text = json.dumps(tasks)
        return text


@get('/ajaxdemo')
def get_ajaxdemo():
    session = get_session(request, response)
    return template("ajaxdemo", session=session)


@get('/jquerydemo')
def get_jquerydemo():
    session = get_session(request, response)
    return template("jquerydemo", session=session)


if ON_PYTHONANYWHERE:
    application = default_app()
else:
    debug(True)
    run(host="localhost",port=8080)