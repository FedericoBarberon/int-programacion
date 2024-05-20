def relModule(module: str):
    exec(f"from importlib import reload\nimport {module}\nreload({module})")