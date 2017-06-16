package simplelibrary

import com.simplelibrary.Book
import org.compass.core.engine.SearchEngineQueryParseException

class BooksController {
    def bookService
    def springSecurityService
    def searchableService

    def addBook() {}

    def addBookPost() {

        def book = new Book(params)
        def user = springSecurityService.currentUser
        book.setUser(user)
        book.save(flush: true, failOnError: true)
        def id = book.getId()
        def file = request.getFile('file')
        if (file.empty) {
            flash.message = 'file cannot be empty'
            render(view: 'addBook')
        }
        file.transferTo(new File('C:/Users/Женя/IdeaProjects/SimpleLibrary/web-app/file/' + id + '.txt'))
        redirect(controller: "user", action: "home")
    }

    def showBooks() {
        bookService.getBookList()
    }

    /**
     * Index page with search form and results
     */
    def search = {
        if (!params.q?.trim()) {
            return [:]
        }
        try {
            return [searchResult: searchableService.search(params.q, params)]
        } catch (SearchEngineQueryParseException ex) {
            return [parseException: true]
        }
    }

    /**
     * Perform a bulk index of every searchable object in the database
     */
    def indexAll = {
        Thread.start {
            searchableService.index()
        }
        render("bulk index started in a background thread")
    }

    /**
     * Perform a bulk index of every searchable object in the database
     */
    def unindexAll = {
        searchableService.unindex()
        render("unindexAll done")
    }

    def show() {
        [books: Book.get(params.id)]
    }

    def deleted() {
        def b = Book.get(params.id)
        b.delete(flush: true)
        redirect(controller: "user", action: "home")
    }
    def downloadFile = {
        def sub = Book.get(params.id)
        def file = new File("C:/Users/Женя/IdeaProjects/SimpleLibrary/web-app/file/${sub.id}.txt")

        response.setContentType("application/octet-stream") // or or image/JPEG or text/xml or whatever type the file is
        response.setHeader("Content-disposition", "attachment;filename=${file.name}")
        response.outputStream << file.bytes

    }

}
