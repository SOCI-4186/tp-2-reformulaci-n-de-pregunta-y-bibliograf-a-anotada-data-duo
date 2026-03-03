#!/usr/bin/env Rscript
# =============================================================================
# VERIFICADOR DE ENTREGA - TAREA DE PROYECTO 2
# SOCI 4186 - Técnicas de computadora en la investigación social
# Universidad de Puerto Rico, Recinto de Río Piedras
# =============================================================================
#
# IMPORTANTE: Este script NO califica tu tarea.
# Solo verifica que cumple los requisitos técnicos mínimos para renderizarse.
#
# Uso:
#   En RStudio: Abre este archivo y haz clic en "Source" (o Ctrl+Shift+S)
#   En terminal: Rscript verificar_tarea.R
#
# Nota técnica: este script no requiere paquetes externos.
# Usa readLines() + grepl() directamente, igual que el CI bash.
# Funciona correctamente tanto para autor individual (string YAML)
# como para autor múltiple (lista YAML para grupos).
#
# =============================================================================

# --- Configuración -----------------------------------------------------------

ARCHIVO_QMD      <- "tarea_proyecto_02.qmd"
ARCHIVO_BIB      <- "Referencias.bib"
ARCHIVOS_SOPORTE <- c("apa-clacso.csl", "uprrp-theme.css")

# Minimum citations required for TP2 (bibliografía anotada: 5-8 fuentes)
CITAS_MINIMO <- 5L

# Example citation key shipped with the template — excluded from the count
# so students cannot meet the minimum by leaving the example untouched.
CITA_EJEMPLO <- "@hall2009institutional"

# --- Funciones auxiliares ----------------------------------------------------

msg <- function(texto, tipo = "info") {
  simbolo <- switch(tipo,
    ok    = "\u2714",
    error = "\u2718",
    warn  = "\u26A0",
    info  = "\u2139",
    "\u2022"
  )
  prefijo <- switch(tipo,
    ok    = "[OK]   ",
    error = "[ERROR]",
    warn  = "[AVISO]",
    info  = "[INFO] ",
    "       "
  )
  cat(sprintf("%s %s %s\n", simbolo, prefijo, texto))
}

# Read all lines from a file, returning NULL on error
leer_lineas <- function(archivo) {
  tryCatch(
    readLines(archivo, warn = FALSE, encoding = "UTF-8"),
    error = function(e) NULL
  )
}

# --- Encabezado --------------------------------------------------------------

cat("\n")
cat("===========================================================================\n")
cat("   VERIFICADOR DE ENTREGA - TAREA DE PROYECTO 2\n")
cat("===========================================================================\n")
cat("\n")
cat("   NOTA: Este script NO califica tu tarea.\n")
cat("   Solo verifica que pueda renderizarse correctamente.\n")
cat("   La evaluación del contenido la realiza el profesor.\n")
cat("\n")
cat("---------------------------------------------------------------------------\n")
cat("\n")

errores <- 0L
avisos  <- 0L

# --- 1. Verificar directorio de trabajo --------------------------------------
cat("1. Verificando directorio de trabajo...\n\n")

if (!file.exists(ARCHIVO_QMD)) {
  msg(sprintf("No se encuentra '%s' en el directorio actual", ARCHIVO_QMD), "error")
  msg(sprintf("Directorio actual: %s", getwd()), "info")
  msg("Asegúrate de abrir el proyecto en RStudio o cambiar al directorio correcto.", "info")
  cat("\n")
  stop("Verificación abortada: archivo principal no encontrado.")
}
msg(sprintf("Archivo principal '%s' encontrado", ARCHIVO_QMD), "ok")

# Read all lines once; reused by subsequent checks
lineas <- leer_lineas(ARCHIVO_QMD)

# --- 2. Verificar archivos de soporte ----------------------------------------
cat("\n2. Verificando archivos de soporte...\n\n")

for (archivo in ARCHIVOS_SOPORTE) {
  if (!file.exists(archivo)) {
    msg(sprintf("Falta '%s' — no borres los archivos originales", archivo), "error")
    errores <- errores + 1L
  } else {
    msg(sprintf("'%s' presente", archivo), "ok")
  }
}

if (!file.exists(ARCHIVO_BIB)) {
  msg(sprintf("Falta '%s'", ARCHIVO_BIB), "error")
  errores <- errores + 1L
} else {
  msg(sprintf("'%s' presente", ARCHIVO_BIB), "ok")
}

# --- 3. Verificar que la plantilla fue editada -------------------------------
# Scans raw lines with grepl() — no yaml:: package needed.
# Correctly handles both single-author strings and multi-author YAML lists.
cat("\n3. Verificando que editaste la plantilla...\n\n")

if (is.null(lineas)) {
  msg("No se pudo leer el archivo", "error")
  errores <- errores + 1L
} else {

  # 3a. Author placeholder check
  if (any(grepl("Pon tu nombre aquí", lineas, fixed = TRUE))) {
    msg("No has cambiado tu nombre en el campo 'author'", "error")
    msg("Edita la línea 4 del documento con tu nombre real", "info")
    msg("Para trabajo grupal, usa el formato de lista YAML indicado en las instrucciones", "info")
    errores <- errores + 1L
  } else {
    msg("Campo 'author' fue modificado", "ok")
  }

  # 3b. Example citation left in document
  if (any(grepl("@hall2009institutional", lineas, fixed = TRUE))) {
    msg("El ejemplo de Hall & Thelen sigue en el documento", "warn")
    msg("Borra la sección de ejemplo y sustituye con tus propias fuentes", "info")
    avisos <- avisos + 1L
  } else {
    msg("Ejemplo ilustrativo eliminado correctamente", "ok")
  }

  # 3c. CSL reference in YAML
  if (!any(grepl("apa-clacso.csl", lineas, fixed = TRUE))) {
    msg("El YAML no referencia 'apa-clacso.csl' — no borres esa línea", "error")
    errores <- errores + 1L
  } else {
    msg("Referencia a 'apa-clacso.csl' presente en el YAML", "ok")
  }

  # 3d. Section number advisory (00_ = placeholder not edited)
  if (any(grepl("SOCI 4186-00_", lineas, fixed = TRUE))) {
    msg("El número de sección no fue editado (sigue como '00_')", "warn")
    msg("Cambia '00_' en el título por tu número de sección (001 o 002)", "info")
    avisos <- avisos + 1L
  } else {
    msg("Número de sección editado en el título", "ok")
  }

}

# --- 4. Verificar declaración de MEL -----------------------------------------
cat("\n4. Verificando declaración de MEL...\n\n")

if (is.null(lineas)) {
  msg("No se pudo verificar la declaración de MEL (archivo no legible)", "warn")
  avisos <- avisos + 1L
} else if (any(grepl("complete esta sección según las instrucciones del sílabo",
                      lineas, fixed = TRUE))) {
  msg("No has completado la declaración de uso de MEL/LLM", "warn")
  msg("Indica si usaste herramientas de IA, o escribe:", "info")
  msg("  'No se utilizaron herramientas de MEL en esta tarea.'", "info")
  avisos <- avisos + 1L
} else {
  msg("Sección de declaración de MEL completada", "ok")
}

# --- 5. Verificar número de citas --------------------------------------------
# TP2 requires 5-8 academic sources; warn if fewer than 5 are detected.
cat("\n5. Verificando citas bibliográficas...\n\n")

if (is.null(lineas)) {
  msg("No se pudo contar citas (archivo no legible)", "warn")
  avisos <- avisos + 1L
} else {
  # Extract @citation keys, excluding @fig- and @tbl- cross-references
  todas_citas <- unlist(regmatches(
    lineas,
    gregexpr("@[a-zA-Z0-9_:-]+", lineas)
  ))
  citas_bib <- unique(todas_citas[!grepl("^@(fig|tbl)-", todas_citas)])
  # Drop the template example citation so it does not inflate the count
  citas_bib <- setdiff(citas_bib, CITA_EJEMPLO)
  n_citas   <- length(citas_bib)

  if (n_citas < CITAS_MINIMO) {
    msg(sprintf(
      "Se detectaron %d cita(s) únicas — TP2 requiere entre 5 y 8 fuentes",
      n_citas
    ), "warn")
    msg("Agrega fuentes al archivo .bib y cítalas en el texto con @clave", "info")
    msg("(Este aviso NO bloquea tu entrega — es una recomendación)", "info")
    avisos <- avisos + 1L
  } else {
    msg(sprintf(
      "Se detectaron %d cita(s) únicas (mínimo: %d) ✓",
      n_citas, CITAS_MINIMO
    ), "ok")
  }
}

# --- 6. Verificar renderizado ------------------------------------------------
cat("\n6. Verificando que el documento renderiza...\n\n")

msg("Intentando renderizar (esto puede tomar unos segundos)...", "info")
cat("\n")

quarto_disponible <- tryCatch({
  resultado <- system("quarto --version", intern = TRUE, ignore.stderr = TRUE)
  length(resultado) > 0 && nchar(resultado[1]) > 0
}, error = function(e) FALSE)

if (!quarto_disponible) {
  msg("Quarto no está instalado o no está en el PATH", "error")
  msg("Instala Quarto desde https://quarto.org/docs/get-started/", "info")
  errores <- errores + 1L
} else {
  render_result <- tryCatch({
    # Render HTML only — faster, no LaTeX required
    # timeout prevents hanging on slow machines (matches CI limit)
    system2("quarto",
            args    = c("render", ARCHIVO_QMD, "--to", "html"),
            stdout  = TRUE,
            stderr  = TRUE,
            timeout = 120)
  }, error = function(e) {
    c("ERROR:", e$message)
  })

  html_file <- sub("\\.qmd$", ".html", ARCHIVO_QMD)

  if (file.exists(html_file)) {
    msg("Documento renderizado exitosamente", "ok")
  } else {
    msg("El documento no se pudo renderizar", "error")
    msg("Revisa los errores de Quarto mostrados arriba", "info")
    errores <- errores + 1L

    # Show up to 5 error lines for diagnosis
    errores_quarto <- grep("error|Error|ERROR", render_result, value = TRUE)
    if (length(errores_quarto) > 0) {
      cat("\n   Errores detectados:\n")
      for (err in head(errores_quarto, 5)) {
        cat(sprintf("   > %s\n", err))
      }
    }
  }
}

# --- Resumen final -----------------------------------------------------------

cat("\n")
cat("===========================================================================\n")
cat("   RESUMEN\n")
cat("===========================================================================\n")
cat("\n")

if (errores == 0L && avisos == 0L) {
  cat("\u2705 Tu tarea cumple los requisitos técnicos para ser entregada.\n")
  cat("\n")
  cat("   Recuerda:\n")
  cat("   - Esta verificación NO es una calificación\n")
  cat("   - El profesor evaluará el contenido académico\n")
  cat("   - Sube tu .qmd y .html a GitHub\n")
  cat("   - Sube el HTML renderizado a Microsoft Teams\n")
  cat("\n")
} else if (errores == 0L) {
  cat(sprintf("\u26A0\uFE0F  Tu tarea tiene %d aviso(s) pero puede entregarse.\n", avisos))
  cat("\n")
  cat("   Los avisos son recomendaciones, no bloquean la entrega.\n")
  cat("   Considera atenderlos antes de entregar.\n")
  cat("\n")
} else {
  cat(sprintf("\u274C Tu tarea tiene %d error(es) técnico(s).\n", errores))
  cat("\n")
  cat("   DEBES corregir los errores antes de entregar.\n")
  cat("   Los errores indican que el documento no puede procesarse.\n")
  cat("   Revisa los mensajes [ERROR] arriba.\n")
  cat("\n")
}

cat("===========================================================================\n")
cat("\n")

# Exit code for CI integration
if (errores > 0L) {
  quit(status = 1, save = "no")
}
