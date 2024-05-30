class RelModule():
    def __init__(self, module_name: str):
        self.module_name = module_name
    
    def reload(self):
        exec(f"from importlib import reload\nimport {self.module_name}\nreload({self.module_name})")