from classes.Quote import Quote

def filter_quotes(books, query):
    quotes = [Quote(book.book_name, book.authors, quote) for book in books for quote in book.quotes if query in quote]
    return quotes
