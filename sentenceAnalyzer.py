# String Manipulation: take a sentence, print it in uppercase, count how many words it has, 
# and check if it contains a specific word

def analyze_sentence(sentence: str, search_word: str) -> None:
    print(sentence.upper())
    print(f"Word count: {len(sentence.split())}")
    print(f"Contains '{search_word}' : {search_word in sentence}")

analyze_sentence("I am learning Python", "learning")