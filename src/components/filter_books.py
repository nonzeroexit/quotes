def hit(book, query):
    if query == book.book_id:
        return True
    if query in book.book_name.casefold().split():
        return True
    if query in book.str_authors.casefold().split():
        return True
    if query in book.tags:
        return True
    if query == book.reading_year:
        return True
    return False

def filter_books(books, query):
    '''
    filter books by book name, author or tag
    '''

    if query == 'all':
        return books
    if query == 'favs':
        filtered_books = [book for book in books if book.is_favorite]
    else:
        filtered_books = [book for book in books if hit(book, query)]

    return filtered_books
