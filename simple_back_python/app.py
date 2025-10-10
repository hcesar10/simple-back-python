from fastapi import FastAPI

app = FastAPI(root_path="/api-lasante")

@app.get("/")
def read_root():
    return {"Hello": "World"}
