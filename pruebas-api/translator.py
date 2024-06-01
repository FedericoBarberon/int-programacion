from googletrans import Translator

def traducirTexto(nombre_archivo: str, idioma_origen: str, idioma_destino: str):
    translator: Translator = Translator()

    input_file = open(nombre_archivo, "r", encoding="utf-8")
    contenido: str = input_file.read()
    input_file.close()

    contenido_traducido: str = translator.translate(contenido, src=idioma_origen, dest=idioma_destino).text

    output_file = open(f"{idioma_destino}-{nombre_archivo.split('/')[-1]}", "w", encoding="utf-8")
    output_file.write(contenido_traducido)
    output_file.close()