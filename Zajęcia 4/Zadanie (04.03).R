# Instalacja i ??adowanie wymaganych pakietow ----
# install.packages(c("tm", "wordcloud", "RColorBrewer", "ggplot2"))
library(tm)
library(wordcloud)
library(RColorBrewer)
library(ggplot2)



# Stworzenie funkcji do przetwarzania tekstu ----
process_text <- function(file_path) {
  # Wczytanie tekstu z pliku
  text <- tolower(readLines(file_path, encoding = "UTF-8"))
  # Usuni??cie znakow interpunkcyjnych i cyfr
  text <- removePunctuation(text)
  text <- removeNumbers(text)
  # Usuni??cie stop s??ow angielskich
  text <- removeWords(text, stopwords("en"))
  # Podzia?? tekstu na s??owa
  words <- unlist(strsplit(text, "\\s+"))
  # Usuni??cie pustych elementow
  words <- words[words != ""]
  return(words)
  
}


# Stworzenie funkcji do obliczania cz??sto??ci wyst??powania s??ow ----
word_frequency <- function(words) {
  freq <- table(words)
  freq_df <- data.frame(word = names(freq), freq = as.numeric(freq))
  freq_df <- freq_df[order(-freq_df$freq), ]
  return(freq_df)
}

# Stworzenie funkcji do tworzenia chmury s??ow ----
plot_wordcloud <- function(freq_df, title, color_palette = "Dark2") {
  wordcloud(words = freq_df$word, freq = freq_df$freq, min.freq = 16,
            colors = brewer.pal(8, color_palette))
  title(title)
}


# Przyk??adowe u??ycie funkcji ----

# Jeden plik txt ----


# Wczytanie i przetworzenie tekstu
# file_path <- "sciezka/do/pliku.txt"  <= Uzupe??nij nazw?? pliku i ustaw Working Directory!
setwd("C:/Users/mj/Downloads")
file_path <- "Biden2021.txt"
words <- process_text(file_path)


# Obliczenie cz??sto??ci wyst??powania s??ow
freq_df <- word_frequency(words)


# Tworzenie chmury s??ow
plot_wordcloud(freq_df, "Chmura s??ow", "Dark2")


# Wy??wietlenie 10 najcz????ciej wyst??puj??cych s??ow
print(head(freq_df, 10))



# Potrzeba dodatkowych stop s??ow do usuni??cia ----
custom_stopwords <- c("\", "???", "fs", "fre")


# Usuni??cie dodatkowych stop s??ow z przetworzonego tekstu 
# za pomoc?? indeksowania logicznego
words <- words[!words %in% custom_stopwords]

# Obliczenie cz??sto??ci wyst??powania s??ow
freq_df <- word_frequency(words)

# Tworzenie chmury s??ow
plot_wordcloud(freq_df, "Chmura s??ow", "Dark2")

# Wy??wietlenie 10 najcz????ciej wyst??puj??cych s??ow
print(head(freq_df, 10))




# Dwa pliki txt rownocze??nie ----


# Lista plikow do wczytania
file_paths <- c("Biden2021.txt", "Biden2024.txt")  # Uzupe??nij nazwy plikow i ustaw Working Directory!


# Przetwarzanie ka??dego pliku osobno
for (file_path in file_paths) {
  # Wczytanie i przetworzenie tekstu
  words <- process_text(file_path)
  
  # Obliczenie cz??sto??ci wyst??powania s??ow
  freq_df <- word_frequency(words)
  
  # Tworzenie chmury s??ow
  plot_wordcloud(freq_df, paste("Chmura s??ow -", file_path), "Dark2")
  
  # Wy??wietlenie 10 najcz????ciej wyst??puj??cych s??ow
  cat("Najcz????ciej wyst??puj??ce s??owa w pliku", file_path, ":\n")
  print(head(freq_df, 10))
  cat("\n")
}




# Potrzeba dodatkowych stop s??ow do usuni??cia ----
custom_stopwords <- c("\", "???", "fs", "fre")

# Przetwarzanie ka??dego pliku osobno
for (file_path in file_paths) {
  # Wczytanie i przetworzenie tekstu
  words <- process_text(file_path)
  
  # Usuni??cie dodatkowych stop s??ow z przetworzonego tekstu
  # za pomoc?? indeksowania logicznego
  words <- words[!words %in% custom_stopwords]
  
  # Obliczenie cz??sto??ci wyst??powania s??ow
  freq_df <- word_frequency(words)
  
  # Tworzenie chmury s??ow
  plot_wordcloud(freq_df, paste("Chmura s??ow -", file_path), "Dark2")
  
  # Wy??wietlenie 10 najcz????ciej wyst??puj??cych s??ow
  cat("Najcz????ciej wyst??puj??ce s??owa w pliku", file_path, ":\n")
  print(head(freq_df, 10))
  cat("\n")
}








