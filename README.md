# Web site agent using agentic RAG and scraping 

## Overview  
Inspired by Cole Medin's YouTube channel, this agent is designed to crawl documentation websites, store the content in a vector database, and deliver intelligent responses to user queries by retrieving and analyzing relevant sections of the documentation.

## Prerequisites
- Python 3.11+
- Supabase account and database
- OpenAI API key
- Streamlit (for web interface)
- crawl4ai
- Pydantic AI


## Conda Environment Setup

### Create a new conda environment
```shell
conda create -n website_agent
```

### Activate the environment
```shell
conda activate website_agent
```

### Export configuration to a file
```shell
conda env export > requirements.yml
```

### Create a new conda environment from the config file
```shell
conda env create -f requirements.yml
```

## Pip Environment Setup

### Create a new virtual environment
```shell
python -m venv website_agent
```

### Activate the environment
- On Windows:
  ```shell
  website_agent\Scripts\activate
  ```
- On macOS/Linux:
  ```shell
  source website_agent/bin/activate
  ```

### Install dependencies from a requirements file
1. Create a `requirements.txt` file with your dependencies.
2. Run:
   ```shell
   pip install -r requirements.txt
   ```

### Export the environment configuration to a file
```shell
pip freeze > requirements.txt
```
for pip packages from a conda environment
```
pip list --format=freeze > requirements.txt
```

### Create a new virtual environment and install dependencies from the `requirements.txt` file
1. Create a new virtual environment as shown above.
2. Activate the environment.
3. Run:
   ```shell
   pip install -r requirements.txt
   ```

## Acknowledgments
- https://youtu.be/_R-ff4ZMLC8?si=A_DL_ugRg3o7nAHB
- https://github.com/coleam00/ottomator-agents/tree/main/crawl4AI-agent
