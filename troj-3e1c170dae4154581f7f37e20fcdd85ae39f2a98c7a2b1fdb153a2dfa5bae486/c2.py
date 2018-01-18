#!/usr/bin/env python
from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer
import random

strobe = """
@echo off
:start
color cb
echo (%random%) (%random%) (%random%) (%random%)(%random%) (%random%) (%random%) (%random%)(%random%) (%random%) (%random%) (%random%)

color 01
echo (%random%) (%random%) (%random%) (%random%)(%random%) (%random%) (%random%) (%random%)(%random%) (%random%) (%random%) (%random%)

color f2
echo (%random%) (%random%) (%random%) (%random%)(%random%) (%random%) (%random%) (%random%)(%random%) (%random%) (%random%) (%random%)

color 58
echo (%random%) (%random%) (%random%) (%random%)(%random%) (%random%) (%random%) (%random%)(%random%) (%random%) (%random%) (%random%)

color 4f
echo (%random%) (%random%) (%random%) (%random%)(%random%) (%random%) (%random%) (%random%)(%random%) (%random%) (%random%) (%random%)
goto start
"""

class Handler(BaseHTTPRequestHandler):        
    def _set_headers(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
    
    def do_POST(self):
        def send_exit():
            return "Cl"

        def send_file():
            return "Sc|V|{0}|V|stobe.bat".format(strobe)

        def send_js():
            return "Ex|V|WScript.Echo(\"T moch\")"

        def send_new_hdd_serial():
            return "Rn|V|some_string"

        def send_new_script():
            return "Up|V|SplitDelim='|U|';WScript.Echo('Hello');|V|new_script.js"
        
        dispatch = [
            send_exit,              # rep = Cl
            send_file,              # rep = Sc, file_content, file_name
            send_js,                # rep = Ex, js_code
            send_new_hdd_serial,    # rep = Rn, new_serial
            send_new_script,        # rep = Up, file_content, file_name
            # send_format_str,        # rep = Un, format_string
            # send_script             # rep = RF, file_content, file_name
        ]

        print("contact from: " + self.headers['User-Agent'])
        print(dispatch[4]())
        self._set_headers()
        #self.wfile.write(dispatch[random.randint(0, 6)]())
        self.wfile.write(dispatch[4]())
        
def run(server_class=HTTPServer, handler_class=Handler, port=1993):
    server_address = ('', port)
    httpd = server_class(server_address, handler_class)
    httpd.serve_forever()

if __name__ == "__main__":
    from sys import argv

    if len(argv) == 2:
        run(port=int(argv[1]))
    else:
        run()
