# Use the official Julia image as base
FROM julia:1.10

# Install IJulia (which pulls in Jupyter)
RUN julia -e 'using Pkg; Pkg.add("IJulia")'

# Optional: configure Jupyter
RUN mkdir -p /root/.jupyter && \
    echo "c.NotebookApp.ip = '0.0.0.0'" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.open_browser = False" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.allow_root = True" >> /root/.jupyter/jupyter_notebook_config.py

EXPOSE 8888

CMD ["julia", "-e", "using IJulia; notebook(detached=true)"]
