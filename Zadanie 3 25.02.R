# Tworzenie chmury słów za pomocą pakietu wordcloud i qdap
install.packages("wordcloud")
library(wordcloud)

install.packages("qdap")
library(qdap)

# Wczytaj dane tekstowe
# Wczytaj plik tekstowy z lokalnego dysku
text1 <- readLines("C:/Users/Marysia/Downloads/Biden - First address to Congress_2021.txt")
text1

text2 <- readLines("C:/Users/Marysia/Downloads/Biden - State of the Union 2024.txt")
text2

frequent_terms1 <- freq_terms(text1)
frequent_terms1
frequent_terms1 <- freq_terms(text1, stopwords = Top200Words)
plot(frequent_terms1)

frequent_terms2 <- freq_terms(text2)
frequent_terms2
frequent_terms2 <- freq_terms(text2, stopwords = Top200Words)
plot(frequent_terms2)

# Utwórz chmurę słów
wordcloud1 <- wordcloud(frequent_terms1$WORD, frequent_terms1$FREQ)

wordcloud2 <- wordcloud(frequent_terms1$WORD, frequent_terms1$FREQ)

# Opcje chmury słów
?wordcloud
# Zmiana wartości min.freq i max.words w celu wyświetlenia mniejszej/większej liczby słów.
# min.freq: słowa o częstości poniżej tej wartości nie będą wyświetlane
# max.words: maksymalna liczba słów do wyświetlenia

# Ograniczenie liczby słów w chmurze poprzez określenie minimalnej częstości
wordcloud(frequent_terms1$WORD, frequent_terms1$FREQ, min.freq = 4)

wordcloud(frequent_terms2$WORD, frequent_terms2$FREQ, min.freq = 4)

# Ograniczenie liczby słów w chmurze poprzez określenie maksymalnej liczby słów
wordcloud(frequent_terms1$WORD, frequent_terms1$FREQ, max.words = 5)

wordcloud(frequent_terms2$WORD, frequent_terms2$FREQ, max.words = 5)

# Optymalizacja i dostosowanie wyników
# Dodanie koloru do chmury słów dla lepszej wizualizacji
# Dodanie koloru
wordcloud(frequent_terms1$WORD, frequent_terms1$FREQ, min.freq = 4, colors = brewer.pal(8,"Dark2"))

wordcloud(frequent_terms2$WORD, frequent_terms2$FREQ, min.freq = 4, colors = brewer.pal(8,"Dark2"))

# Dodanie koloru
wordcloud(frequent_terms1$WORD, frequent_terms1$FREQ, max.words = 5, colors = brewer.pal(8,"Accent"))

wordcloud(frequent_terms2$WORD, frequent_terms2$FREQ, max.words = 5, colors = brewer.pal(8,"Accent"))

?brewer.pal
brewer.pal.info

# Dodanie różnych palet kolorystycznych
wordcloud(frequent_terms1$WORD, frequent_terms1$FREQ, min.freq = 4, colors = brewer.pal(9,"Blues"))

wordcloud(frequent_terms2$WORD, frequent_terms2$FREQ, min.freq = 4, colors = brewer.pal(9,"Blues"))

wordcloud(frequent_terms1$WORD, frequent_terms1$FREQ, min.freq = 4, colors = brewer.pal(9,"Reds"))

wordcloud(frequent_terms2$WORD, frequent_terms2$FREQ, min.freq = 4, colors = brewer.pal(9,"Reds"))

wordcloud(frequent_terms1$WORD, frequent_terms1$FREQ, min.freq = 4, colors = brewer.pal(9,"Greens"))

wordcloud(frequent_terms2$WORD, frequent_terms2$FREQ, min.freq = 4, colors = brewer.pal(9,"Greens"))

# WNIOSKI:
# W obu tekstach często pojawiają się takie słowa jak: american, americans, president i tax
# Można na tej podstawie zgadywać, że oba te przemówienia byłego prezydenta były kierowane do Amerykanów i dotyczyły podatków
# Jednak tylko w text1 przewijają się również często słowa: jobs, care, families i child
# Co może świadczyć o tym, że Biden w tym przemówieniu prawdopodobnie mówił o wsparciu dla rodzin z dziećmi