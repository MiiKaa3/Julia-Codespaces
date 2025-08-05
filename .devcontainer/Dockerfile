FROM julia:1.10

RUN apt-get update && \
    apt-get install -y git curl wget build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN julia -e 'using Pkg; Pkg.add("IJulia")'

RUN mkdir -p /root/.jupyter && \
    echo "c.NotebookApp.ip = '0.0.0.0'" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.open_browser = False" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.allow_root = True" >> /root/.jupyter/jupyter_notebook_config.py

# Expose port for Jupyter
EXPOSE 8888

# Default command to launch Jupyter
CMD ["julia", "-e", "using IJulia; notebook(detached=true)"]
