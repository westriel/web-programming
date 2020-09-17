from bottle import route, run, template

@route('/') #If this doesn't handle my_name parameter, causes an error, the website will display an internal server error, 
            #this is because we don't want to give more information than needed
@route('/hello')
@route('/hello/<my_name>') # Defines which path in the url leads to (localhost:8080/hello/<parameter>)
def get_hello(my_name='unknown person'): # Function that determines what is served is called a route handler
    return (template("<html><i>Hello</i>, {{name}}!<hr>" + ("<img src=\"https://i.imgflip.com/2neebf.jpg\">" if my_name == "unknown person" else "") + "</html>",name=my_name))
    #<hr> is a horizontal rule (its a line that goes across the screen)
    #{{}} in bottle templates notates a substitution, if there is no template usages inside the template it assumes that the string is a template file

@route('/goodbye')
def get_goodbye():
    return("Well, goodbye, then!")
    

run(host="localhost",port=8080)