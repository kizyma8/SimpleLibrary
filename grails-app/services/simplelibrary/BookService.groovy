package simplelibrary

import com.simplelibrary.Book
import grails.transaction.Transactional

@Transactional
class BookService {

    def getBookList(){
        def book=Book.list()
        [books:book]
    }
}
