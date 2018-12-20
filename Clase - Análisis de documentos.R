# Análisis de texto -------------------------------------------------------

# Instalaciones -----------------------------------------------------------
install.packages("dplyr")
install.packages("tidytext")
install.packages("pdftools")
install.packages("gutenbergr")
install.packages("tm")
# Quitar comentario en los siguientes 2 si se requiere intstalar
# install.packages("openNLPmodels.en", dependencies=TRUE, repos = "http://datacube.wu.ac.at/")
# install.packages("openNLPmodels.es", dependencies=TRUE, repos = "http://datacube.wu.ac.at/")

# Cargando librerías ------------------------------------------------------
library(dplyr)
library(tidytext) # Libreria para crear texto ordenado
library(janeaustenr)
library(dplyr)
library(stringr)
library(scales)
library(pdftools)
library(gutenbergr)
library(NLP)
library(openNLP)
library(tm)
library(tidyr)
library(rvest)
library(wordcloud)
library(openNLPmodels.es)
library(openNLPmodels.en)

# Enlaces útiles ----------------------------------------------------------
# http://opennlp.apache.org/
# Modelos: http://opennlp.sourceforge.net/models-1.5/
# Lexicon: http://web.eecs.umich.edu/~mihalcea/downloads/SpanishSentimentLexicons.tar.gz
# Palabras de parada: http://bit.ly/2S1hHz1
# Documentos de prueba: http://bit.ly/2SNIsaa

# Leyendo los documentos

text1 <- pdf_text("mineria de texto/documentos/18001-23-31-000-2009-00339-01(46987).pdf")
text1 <- unlist(text1)
text2 <- pdf_text("mineria de texto/documentos/18001-23-31-001-2010-00027-01(46755).pdf")
text2 <- unlist(text2)

# Tokenizando los documentos

texto1 <- data_frame(linea = 1:length(text1), texto = text1) #Un tibble es una clase moderna de marco de datos dentro de R
texto1 <- texto1 %>% unnest_tokens(word, texto)
texto1$word <- iconv(texto1$word, from = 'UTF-8', to = 'ASCII//TRANSLIT')

texto2 <- data_frame(linea = 1:length(text2), texto = text2) #Un tibble es una clase moderna de marco de datos dentro de R
texto2 <- texto2 %>% unnest_tokens(word, texto)
texto2$word <- iconv(texto2$word, from = 'UTF-8', to = 'ASCII//TRANSLIT')

# Comparando los documentos
# Leyendo las palabras de parada
stop_es <- read.delim("mineria de texto/stop-words-spanish.txt", header = F, encoding = "UTF-8")
stop_es$V1 <- iconv(stop_es$V1, from = 'UTF-8', to = 'ASCII//TRANSLIT')
names(stop_es) <- "word"

# dejamos el texto sin caracteres
texto1 <- texto1 %>% anti_join(stop_es)
texto2 <- texto2 %>% anti_join(stop_es)

texto1 %>% count(word, sort = TRUE)
texto2 %>% count(word, sort = TRUE)

texto1[, "documento"] <- "Documento1"
texto2[, "documento"] <- "Documento2"

documentos1 <- rbind(texto1, texto2) %>% count(documento, word) %>% group_by(documento) %>% 
  mutate(proporcion = n/sum(n)) %>% 
  select(-n) %>% 
  spread(documento, proporcion)

documentos <- rbind(texto1, texto2) %>% count(documento, word) %>% group_by(documento) %>% 
  mutate(proporcion = n/sum(n)) %>% 
  select(-n) %>% 
  spread(documento, proporcion) %>% 
  gather(documento, proporcion, Documento1)

ggplot(documentos, aes(x = proporcion, y = Documento2, color = abs(Documento2 - proporcion))) +
  geom_abline(color = "gray40", lty = 2) +
  geom_jitter(alpha = 0.1, size = 2.5, width = 0.3, height = 0.3) +
  geom_text(aes(label = word), check_overlap = TRUE, vjust = 1.5) +
  scale_x_log10(labels = percent_format()) +
  scale_y_log10(labels = percent_format()) +
  scale_color_gradient(limits = c(0, 0.001), low = "darkslategray4", high = "gray75") +
  facet_wrap(~documento, ncol = 2) +
  theme(legend.position="none") +
  labs(y = "Documento2", x = NULL)

cor.test(documentos1$Documento1, documentos1$Documento2)

# Nubes de palabras
# Palabras que ocurren con mas frecuencia en los documentos

texto1 %>% count(word) %>% with(wordcloud(word, n, max.words = 100))
texto2 %>% count(word) %>% with(wordcloud(word, n, max.words = 100))


# Análisis de sentimientos ------------------------------------------------

# Lexicon

lexicon <- untar("mineria de texto/SpanishSentimentLexicons.tar.gz",list=TRUE)
lexicon <- untar("mineria de texto/SpanishSentimentLexicons.tar.gz")

lexicon1 <- read.delim("SpanishSentimentLexicons/fullStrengthLexicon.txt", header = FALSE)

names(lexicon1) <- c("word", "score", "sentimiento", "bin2")

doc1_sent <- texto1 %>% count(word) %>% inner_join(lexicon1)

doc1_sent %>%
  group_by(sentimiento) %>%
  top_n(10) %>%
  ungroup() %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n, fill = sentimiento)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~sentimiento, scales = "free_y") +
  labs(y = "Contribution del sentimiento",
       x = NULL) +
  coord_flip()

# Ejercicio: Hacerlo para el documento 2

# Extracción de entidades -------------------------------------------------

doc1_ent = paste(text1, collapse = " ")
doc1_ent = as.String(doc1_ent)

sent_annot = Maxent_Sent_Token_Annotator()
word_annot = Maxent_Word_Token_Annotator()
loc_annot = Maxent_Entity_Annotator(kind = "location", language = "es") #annotate location
people_annot = Maxent_Entity_Annotator(kind = "person", language = "es") #annotate person
date_annot = Maxent_Entity_Annotator(kind = "date", language = "en") #annotate person

annot.l1 = NLP::annotate(doc1_ent, list(sent_annot,word_annot,loc_annot,people_annot, date_annot))

k <- sapply(annot.l1$features, `[[`, "kind")
k1 <- which(annot.l1$type == "sentence") %>% annot.l1[.]

localizaciones = doc1_ent[annot.l1[k == "location"]]
berk_people = doc1_ent[annot.l1[k == "person"]]
fechas = doc1_ent[annot.l1[k == "date"]]

sentencias = doc1_ent[annot.l1[which(annot.l1$type == "sentence")]]
palabras = doc1_ent[annot.l1[which(annot.l1$type == "word")]]


