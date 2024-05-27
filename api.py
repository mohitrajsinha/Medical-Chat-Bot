from flask import Flask, request, jsonify
import medbot

app = Flask(__name__)

@app.route('/api/medical-response', methods=['POST'])
def medical_response():
    data = request.get_json()
    query = data['query']

    response = medbot.generate_medical_response(query)
    return jsonify({'response': response})


if __name__ == '__main__':
    app.run()


