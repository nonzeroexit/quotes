from classes.Quote import Quote

def filter_quotes(books, query):
    quotes = []
    for book in books:
        quotes += [Quote(book.book_name, book.authors, quote) for quote in book.quotes if query in quote]
    return quotes
