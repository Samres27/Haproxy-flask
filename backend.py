from flask import Flask, request, jsonify
import logging

app = Flask(__name__)
logging.basicConfig(level=logging.INFO)

@app.route('/', methods=['GET', 'POST'])
def main():
    # the next line is required for Transfer-Encoding support in the request
    request.environ['wsgi.input_terminated'] = True
    headers = {}
    for header in request.headers:
        headers[header[0]] = header[1]

    # Decodificamos request.data de bytes a string
    body_str = request.data.decode('utf-8') if request.data else ""
    
    return jsonify(body=body_str, headers=headers)
    #return jsonify(body=request.data, headers=headers)