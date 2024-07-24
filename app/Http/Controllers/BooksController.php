<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Book;

class BooksController extends Controller
{
    public function create(Request $request) {

        $validator = Validator::make($request->all(), [
            'title'  => 'required|max:255',
            'author' => 'required|max:50',
            'genre'  => 'required',
            'isbn'   => 'required|unique:books',
            'published_date' => 'date_format:Y-m-d|before:today',
        ]);

        if ($validator->fails()) {
            return response()->json([
               'status' => 'fail',
               'msg'    => $validator->errors()
            ], 
            200);
       }
       else {
            $validated = $validator->validated();

            $book = new Book;
            $book->book_name      = $validated['title'];
            $book->author_name    = $validated['author'];
            $book->genre          = $validated['genre'];
            $book->isbn           = $validated['isbn'];
            $book->published_date = $validated['published_date'];

            $book->save();

            return response()->json([
                'status'         => 'Success',
                'msg'            => 'Book  created successfully',
                'id'             => $book->id,
             ], 
             200);
       }

    }

    public function all_books(Request $request) {
        $books   = Book::orderBy('id', 'desc')->get();
        $results = array();

        if(!empty($books)) {
            foreach($books as $book) {
                $results[] = array(
                    'id'             => $book->id,
                    'title'          => $book->book_name,
                    'author'         => $book->author_name,
                    'genre'          => $book->genre,
                    'isbn'           => $book->isbn,
                    'published_date' => $book->published,
                    'available'      => $book->available
                );
            }
        }

        return response()->json([
            'status' => 'Success',
            'total'  => count($results),
            'result' => (count($results) == 0) ? 'No data found' : $results,
         ], 
         200);

    }

    public function view(Request $request) {
        $key    = $request->input('key');
        $book   = Book::where('id', $key)->orWhere('isbn', $key)->first();
        $result = array();
        if(!empty($book)) {
            $result = array(
                'id'             => $book->id,
                'title'          => $book->book_name,
                'author'         => $book->author_name,
                'genre'          => $book->genre,
                'isbn'           => $book->isbn,
                'published_date' => $book->published,
                'available'      => $book->available
            );
        }

        return response()->json([
            'status'         => 'Success',
            'result'         => (count($result) == 0) ? 'No data found' : $result,
         ], 
         200);
    }

    public function remove(Request $request) {
        $key    = $request->input('key');
        $book   = Book::where('id', $key)->orWhere('isbn', $key)->first();
        if(empty($book)) {
            return response()->json([
                'status' => 'fail',
                'result' => 'Book not found',
             ], 
             200);
        } else {
            $book->delete();
            return response()->json([
                'status' => 'Success',
                'result' => 'Book deleted successfully.',
             ], 
             200);
        }
    }

    public function update(Request $request) {
        $inputs = $request->all();
        $rules  = $bookInfo = array();
        $rules['id'] = 'required|integer|exists:books,id';
        if(!empty($inputs['title'])) {
            $rules['title'] = 'required|max:255';
        }
        if(!empty($inputs['author'])) {
            $rules['author'] = 'required|max:50';
        }
        if(!empty($inputs['genre'])) {
            $rules['genre'] = 'required|max:50';
        }
        if(!empty($inputs['isbn'])) {
            $rules['isbn'] = 'required|unique:books,isbn,'.$inputs['id'];
        }
        if(!empty($inputs['published_date'])) {
            $rules['published_date'] = 'date_format:Y-m-d|before:today';
        }

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json([
               'status' => 'fail',
               'msg'    => $validator->errors()
            ], 
            200);
       } else {
            $bookInfo = Book::find($inputs['id']);
            if(empty($bookInfo)) {
                return response()->json([
                    'status' => 'fail',
                    'msg'    => 'Book already deleted'
                 ], 
                 200);
            } else {
                $validated = $validator->validated();

                $bookInfo->book_name      = $validated['title'] ?? $bookInfo->book_name;
                $bookInfo->author_name    = $validated['author'] ?? $bookInfo->author_name;
                $bookInfo->genre          = $validated['genre'] ?? $bookInfo->genre;
                $bookInfo->isbn           = $validated['isbn'] ?? $bookInfo->isbn;
                $bookInfo->published_date = $validated['published_date'] ?? $bookInfo->published_date;

                $bookInfo->save();

                return response()->json([
                    'status'         => 'Success',
                    'msg'            => 'Book updated successfully',
                    'id'             => $bookInfo->id,
                ], 
                200);
            }
       }


    }

}
