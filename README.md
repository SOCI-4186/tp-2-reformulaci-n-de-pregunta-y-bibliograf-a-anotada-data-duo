[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/mVP8oHpX)
# Tarea de Proyecto № 2: Reformulación de pregunta y Bibliografía anotada

## Fecha límite: domingo, 8 de marzo de 2026 a las 23:59

---

## Archivos incluidos

| Archivo | Descripción | ¿Lo edito? |
|---------|-------------|------------|
| `tarea_proyecto_02.qmd` | Documento principal donde escribirán su tarea | **SÍ** |
| `Referencias.bib` | Archivo de bibliografía para sus citas | **SÍ** |
| `apa-clacso.csl` | Estilo de citas APA-CLACSO | No |
| `uprrp-theme.css` | Tema visual del documento | No |
| `verificar_tarea.R` | Script de verificación técnica (no califica) | No |
| `RUBRICA_TP2.md` | Rúbrica de evaluación (criterios y puntuación) | No |
| `GUIA_CONFIGURACION.md` | Guía de instalación de Git y RStudio | No |
| `.gitignore` | Configuración de Git | No |

---

## Opción A: Flujo básico (recomendado para principiantes)

Si están comenzando con GitHub, sigan estos pasos usando **solo el navegador web y RStudio**.

### Paso 1: Aceptar la asignación

1. El profesor les dará un **enlace de GitHub Classroom** (algo como `classroom.github.com/a/xxxxx`)
2. Hagan clic en el enlace
3. Si es la primera vez, GitHub les pedirá autorizar GitHub Classroom — acepten
4. **Seleccionen su equipo:**
   - Si ya existe su equipo en la lista, hagan clic en él para unirse
   - Si son el primer miembro de su equipo, escriban el **nombre exacto** que el profesor les indicó y créenlo
   - Si trabajan de forma individual, creen un equipo con su nombre de usuario de GitHub
5. Hagan clic en **"Accept this assignment"**
6. Esperen unos segundos mientras se crea el repositorio del equipo
7. Verán un mensaje de confirmación con un enlace al repositorio compartido

### Paso 2: Descargar los archivos

1. Vayan a su repositorio (el enlace que apareció en el paso anterior)
2. Hagan clic en el botón verde **"<> Code"**
3. Seleccionen **"Download ZIP"**
4. Extraigan el archivo ZIP en una carpeta de su computadora (por ejemplo, `Documentos/SOCI4186/TP2/`)

```
📁 Documentos/
   📁 SOCI4186/
      📁 TP2/
         📄 tarea_proyecto_02.qmd  ← Este es el archivo principal
         📄 Referencias.bib
         📄 apa-clacso.csl
         📄 uprrp-theme.css
         📄 verificar_tarea.R
```

### Paso 3: Trabajar en RStudio

1. Abran **RStudio**
2. Vayan a **File → Open File** (o Ctrl+O / Cmd+O)
3. Naveguen hasta la carpeta donde extrajeron los archivos
4. Seleccionen `tarea_proyecto_02.qmd` y hagan clic en **Abrir**

### Paso 4: Editar el documento

En el documento, cambien:

1. **Su nombre** (línea 4):
   ```yaml
   author: "Su Nombre Completo
Su número de estudiante"
   ```
   Si trabajan en grupo, usen el formato de lista YAML indicado en las instrucciones del QMD.

2. **Completen las dos partes**:
   - **Parte 1**: Pregunta de investigación refinada + respuesta a 4 componentes (250-500 palabras)
   - **Parte 2**: Bibliografía anotada (5-8 fuentes académicas con anotaciones)

3. **Agreguen citas** en `Referencias.bib` y cítenlas en el texto con `@clave`

### Paso 5: Verificar (opcional pero recomendado)

Antes de entregar, pueden correr el script de verificación:

1. En RStudio, abran `verificar_tarea.R`
2. Hagan clic en **Source** (o Ctrl+Shift+S)
3. El script verificará que el documento pueda renderizarse. **No califica** — solo revisa requisitos técnicos.

### Paso 6: Renderizar (generar el HTML)

1. Hagan clic en el botón **Render** en la barra superior de RStudio
   - O usen el atajo: Ctrl+Shift+K (Windows/Linux) o Cmd+Shift+K (Mac)
2. RStudio generará un archivo `tarea_proyecto_02.html`
3. El HTML se abrirá automáticamente en el visor de RStudio

### Paso 7: Subir su trabajo a GitHub

1. Vuelvan a su repositorio en GitHub (en el navegador web)
2. Hagan clic en **"Add file"** → **"Upload files"**
3. Arrastren estos archivos (o usen "choose your files"):
   - `tarea_proyecto_02.qmd` (su documento editado)
   - `tarea_proyecto_02.html` (el HTML generado)
   - `Referencias.bib` (con sus referencias añadidas)
4. Abajo, en **"Commit changes"**, escriban un mensaje como:
   ```
   Entrega de Tarea de Proyecto 2
   ```
5. Hagan clic en **"Commit changes"**

**¡Listo!** Su tarea está entregada.

---

## Opción B: Flujo con Git (para quienes quieren aprender más rápido)

Si quieren aprender a usar Git correctamente (útil para su carrera profesional), pueden usar una de estas opciones:

### Opción B1: RStudio + Git

Si ya configuraron Git en RStudio (ver `GUIA_CONFIGURACION.md`):

```
1. En RStudio: File → New Project → Version Control → Git
2. Peguen la URL de su repositorio (la copian del botón verde "Code" en GitHub)
3. Seleccionen dónde guardar el proyecto
4. Trabajen en el documento
5. En la pestaña "Git" (panel derecho superior):
   - Marquen los archivos modificados (checkbox)
   - Hagan clic en "Commit"
   - Escriban un mensaje descriptivo
   - Hagan clic en "Commit" y luego en "Push"
```

### Opción B2: VS Code + Git

Para quienes prefieren VS Code:

1. Instalen la extensión **"Quarto"** en VS Code
2. Clonen el repositorio:
   - Ctrl+Shift+P → "Git: Clone"
   - Peguen la URL del repositorio
3. Abran la carpeta clonada
4. Editen `tarea_proyecto_02.qmd`
5. Para renderizar: Ctrl+Shift+P → "Quarto: Render Document"
6. Para subir cambios:
   - Vayan al panel de Source Control (icono de branches en la barra lateral)
   - Escriban un mensaje de commit
   - Hagan clic en ✓ para hacer commit
   - Hagan clic en "Sync Changes" para subir

### Opción B3: GitKraken (interfaz gráfica)

Para quienes prefieren una interfaz visual para Git:

1. Descarguen [GitKraken](https://www.gitkraken.com/) (gratis para uso académico)
2. Conecten su cuenta de GitHub
3. Clonen el repositorio desde GitKraken
4. Editen los archivos en RStudio o VS Code
5. Vuelvan a GitKraken para ver los cambios
6. Hagan "Stage", escriban un mensaje, y "Commit"
7. Hagan "Push" para subir

---

## Cómo agregar citas bibliográficas

### 1. Agregar la referencia a `Referencias.bib`

Abran el archivo `Referencias.bib` y agreguen entradas como esta:

```bibtex
@book{apellido2024,
  title = {Título del Libro},
  author = {Apellido, Nombre Completo},
  year = {2024},
  publisher = {Editorial Universidad},
  address = {Ciudad}
}

@article{otroautor2023,
  title = {Título del Artículo},
  author = {Otro, Autor},
  journal = {Revista Académica},
  year = {2023},
  volume = {10},
  pages = {15-30}
}
```

En clase iremos trabajando con los detalles de los tipos de referencia y sus usos.

### 2. Citar en el texto

En su documento `.qmd`, usen:

| Lo que escriben | Lo que aparece |
|-----------------|----------------|
| `@apellido2024` | Apellido (2024) |
| `[@apellido2024]` | (Apellido, 2024) |
| `[@apellido2024, p. 25]` | (Apellido, 2024, p. 25) |
| `[@apellido2024; @otroautor2023]` | (Apellido, 2024; Otro, 2023) |

**Importante:** La clave (ej: `apellido2024`) debe coincidir exactamente en el `.bib` y en el texto.

---

## Solución de problemas comunes

### "No puedo generar el HTML"

**Posible causa:** Quarto no está instalado o configurado.

**Solución:**

1. En RStudio, vayan a la Terminal (no la Consola)
2. Escriban: `quarto --version`
3. Si no aparece un número de versión, instalen Quarto desde [quarto.org](https://quarto.org/docs/get-started/)

### "Las citas aparecen como @autor2024 en vez del formato correcto"

**Posible causa:** La clave no coincide con el archivo `.bib`.

**Solución:**

1. Verifiquen que el archivo `Referencias.bib` está en la misma carpeta
2. Verifiquen que escribieron la clave exactamente igual (mayúsculas y minúsculas importan)

### "Los acentos se ven mal"

**Solución:**

1. En RStudio: Tools → Global Options → Code → Saving
2. Cambien "Default text encoding" a **UTF-8**
3. Guarden y vuelvan a abrir el archivo. Si continúa así, bajen de nuevo el original.

### "No puedo subir archivos a GitHub"

**Posible causa:** El archivo es muy grande.

**Solución:**

- GitHub tiene límite de 100MB por archivo (no debieran tener un archivo tan grande)
- Las imágenes deben ser menores a 2MB cada una
- Si tienen imágenes grandes, redúzcanlas antes de subir

### "El verificar_tarea.R me da un AVISO sobre las citas"

**Explicación:** El script cuenta las citas únicas `@clave` en su documento. Si detecta menos de 5, le muestra un aviso. Este aviso **NO bloquea su entrega** — es solo una recomendación. Asegúrese de haber incluido sus 5-8 fuentes.

---

## Recursos de ayuda

- **Markdown básico:** [Guía de Quarto](https://quarto.org/docs/authoring/markdown-basics.html)
- **Citas en Quarto:** [Documentación oficial](https://quarto.org/docs/authoring/footnotes-and-citations.html)
- **Videos en español:** Busquen "Quarto tutorial español" en YouTube

---

## ¿Necesitan ayuda?

1. **Problemas técnicos:** Revisen esta guía primero, luego pregunten en clase o por correo
2. **Dudas sobre el contenido:** Consulten durante horas de oficina
3. **Errores extraños:** Copien el mensaje de error completo y envíenlo al profesor

---

**Nota sobre colaboración:** Si trabajan en grupo, pueden colaborar con estudiantes de cualquiera de las dos secciones del curso (sección 001 o sección 002).
