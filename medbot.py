# # import requests
# # import json


# # url = "https://api.oneai.com/api/v0/pipeline"

# # headers = {
# #     "api-key": api_key,
# #     "content-type": "application/json"
# # }

# # def generate_response(prompt):
# #     # if not is_medical_input(prompt):
# #     #     return "Sorry, I don't have knowledge beyond the medical field."

# #     prompt = "Medical question: " + prompt
# #     payload = {
# #         "input": prompt,
# #         "input_type": "text",
# #         "output_type": "text",
# #         "multilingual": {
# #             "enabled": False
# #         },
# #         "steps": [
# #             {
# #                 "skill": "gpt"
# #             }
# #         ]
# #     }

# #     response = requests.post(url, json=payload, headers=headers)
# #     data = response.json()
# #     return data["output"][0]["contents"][0]["utterance"]

# # # def is_medical_input(input_text):
# # #     payload = {
# # #         "input": input_text,
# # #         "input_type": "text",
# # #         "output_type": "classification",
# # #         "multilingual": {
# # #             "enabled": False
# # #         },
# # #         "steps": [
# # #             {
# # #                 "skill": "gpt"
# # #             }
# # #         ]
# # #     }

# #     # response = requests.post(url, json=payload, headers=headers)
# #     # data = response.json()
# #     # print(data)
# #     # classification = data["output"][0]["contents"][0]["utterance"]

# #     # Check if the classification indicates a medical topic
# #     return "medical" in classification.lower()

# # while True:
# #     user_input = input("User: ")
# #     response = generate_response(user_input)
# #     print("Bot: " + response)
# import requests
# import json


# url = "https://api.openai.com/v1/engines/davinci-codex/completions"

# headers = {
#     "Authorization": "Bearer " + api_key,
#     "Content-Type": "application/json"
# }

# def generate_medical_response(prompt):
#     prompt = "Medical question: " + prompt

#     payload = {
#         "prompt": prompt,
#         "max_tokens": 50
#     }

#     r = requests.post(url, json=payload, headers=headers)
#     data = r.json()
#     print(data)
#     return data["choices"][0]["text"]

# # # Example usage
# # while True:
# #     user_input = input("User: ")
# #     response = generate_medical_response(user_input)
# #     print("Bot: ", response)
import os
import sys

import openai
from langchain.chains import RetrievalQA
from langchain.chat_models import ChatOpenAI
from langchain.document_loaders import DirectoryLoader, TextLoader
from langchain.embeddings import OpenAIEmbeddings
from langchain.indexes import VectorstoreIndexCreator
from langchain.llms import OpenAI
from langchain.vectorstores import Chroma

import constants

os.environ["OPENAI_API_KEY"] = constants.APIKEY

# Enable to cache & reuse the model to disk (for repeated queries on the same data)
PERSIST = True



def generate_medical_response(query):
  query = "Medical : " + query
  if PERSIST and os.path.exists("persist"):
    print("Reusing index...\n")
    vectorstore = Chroma(persist_directory="persist", embedding_function=OpenAIEmbeddings())
    from langchain.indexes.vectorstore import VectorStoreIndexWrapper
    index = VectorStoreIndexWrapper(vectorstore=vectorstore)
  else:
    loader = TextLoader('D:/projects/Practicumm/app/api/medbot/data.txt')
    # This code can also import folders, including various filetypes like PDFs using the DirectoryLoader.
    # loader = DirectoryLoader(".", glob="*.txt")
    if PERSIST:
      index = VectorstoreIndexCreator(vectorstore_kwargs={"persist_directory": "persist"}).from_loaders([loader])
    else:
      index = VectorstoreIndexCreator().from_loaders([loader])

  chain = RetrievalQA.from_chain_type(
    llm=ChatOpenAI(model="gpt-3.5-turbo"),
    retriever=index.vectorstore.as_retriever(search_kwargs={"k": 1}),
  )
  return chain.run(query)
