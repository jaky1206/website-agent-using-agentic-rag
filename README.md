# Web site agent using agentic RAG and scraping 

## Overview

This project implements a website agent inspired by Cole Medin's YouTube channel. It consists of three main scripts:

## Configuration

To configure the application, you need to create a `.env` file in the root directory. You can use the `.env.example` file as a template.

The following environment variables need to be configured:

*   `LLM_API_PROVIDER`: The LLM API provider to use. Example: OpenAI
*   `LLM_API_MODEL`: The LLM model to use. Example: gpt-4o-mini
*   `LLM_API_KEY`: The API key for the LLM provider. Only needed if you are not using local models.
*   `SUPABASE_PROJECT_URL`: The URL of your Supabase project.
*   `SUPABASE_PROJECT_SERVICE_ROLE_SECRET`: The service role secret of your Supabase project.
*   `SCRAP_TARGET_NAME`: The name of the target to scrape. Example: tourista
*   `SCRAP_TARGET_SITEMAP_URL`: The URL of the sitemap to scrape. Example: https://tourista.co/sitemap.xml
*   `SCRAP_TARGET_BASE_URL`: The base URL of the website to scrape. Example: https://tourista.co
*   `PYDANTIC_LOGFIRE_TOKEN`: The token for Pydantic Logfire. (Not being used for now. Will be implemented later.)
*   `KNOWLEDGE_BASE_NAME`: The name of the table. Example: knowledge_base


*   `website_agent.py`: This script contains the core logic of the agent. It uses agentic RAG (Retrieval-Augmented Generation) to process user queries, retrieve relevant information from a vector database, and generate intelligent responses.
*   `streamlit_ui.py`: This script creates a Streamlit-based web interface for interacting with the agent. It allows users to input queries and view the agent's responses in a user-friendly manner.
*   `scrape_pages.py`: This script is responsible for crawling documentation websites and extracting content from specified websites. It stores the extracted content in a vector database for later retrieval by the agent.

The agent works as follows:

1.  The `scrape_pages.py` script crawls specified documentation websites and extracts their content.
2.  The extracted content is stored in a vector database.
3.  When a user enters a query through the Streamlit interface (`streamlit_ui.py`), the `website_agent.py` script retrieves relevant information from the vector database.
4.  The agent uses the retrieved information to generate a response to the user's query.

## Prerequisites

*   Python 3.11+
*   Supabase: Account and database
*   OpenAI: API key
*   Streamlit: For the web interface
*   crawl4ai: For web scraping
*   Pydantic AI: For data validation and AI models


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
for pip packages from a conda environment:

```shell
pip list --format=freeze > requirements.txt
```

### Create a new virtual environment and install dependencies from the `requirements.txt` file

1.  Create a new virtual environment as shown above.
2.  Activate the environment.
3.  Run:

```shell
pip install -r requirements.txt
```

## Acknowledgments

*   [https://youtu.be/\_R-ff4ZMLC8?si=A\_DL\_ugRg3o7nAHB](https://youtu.be/_R-ff4ZMLC8?si=A_DL_ugRg3o7nAHB)
*   [https://github.com/coleam00/ottomator-agents/tree/main/crawl4AI-agent](https://github.com/coleam00/ottomator-agents/tree/main/crawl4AI-agent)
