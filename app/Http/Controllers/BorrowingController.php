<?php

namespace App\Http\Controllers;
use App\Models\Book;
use App\Models\User;
use App\Models\Borrowing;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;


class BorrowingController extends Controller
{
    public function borrow_request(Request $request) {
        $validator = Validator::make($request->all(), [
            'book_id' => 'required|integer|exists:books,id',
            'user_id' => 'required|integer|exists:users,id',
        ]);
 
        if ($validator->fails()) {
             return response()->json([
                'status' => 'fail',
                'msg'    => $validator->errors()
             ], 
             200);
        }

        $validated = $validator->validated();

        $bookInfo = Book::find($validated['book_id']);
        $bookInfoArr = $bookInfo->toArray();
        $userInfoArr = User::find($validated['user_id'])->toArray();
        

        if($bookInfoArr['is_available'] == 0) {
            return response()->json([
                'status' => 'fail',
                'msg'    => 'Book is already borrowed'
             ], 
             200);
        } else {
            $validated['checkout_date'] = date('Y-m-d H:i:s');
            $borrowing_insert_data = Borrowing::create($validated);
            if(!empty($borrowing_insert_data)) {
                $bookInfo->is_available = 0;
                $bookInfo->save();
                return response()->json([
                    'status'         => 'Success',
                    'msg'            => 'Book is assigned successfully',
                    'transaction_id' => $borrowing_insert_data->id,
                    'book_name'      => $bookInfoArr['book_name'],
                    'user_name'      => $userInfoArr['name']
                 ], 
                 200);
            }
        }       

    }

    public function return_request(Request $request) {
        $validator = Validator::make($request->all(), [
            'book_id' => 'required|integer|exists:books,id',
            'user_id' => 'required|integer|exists:users,id',
        ]);
 
        if ($validator->fails()) {
             return response()->json([
                'status' => 'fail',
                'msg'    => $validator->errors()
             ], 
             200);
        }

        $validated = $validator->validated();

        $borrowingObj = Borrowing::where('book_id', $validated['book_id'])
                                 ->where('user_id', $validated['user_id'])
                                 ->whereNull('checkin_date')
                                 ->first();
        if(!empty($borrowingObj)) {
            $borrowingArr = $borrowingObj->toArray();
            $bookInfo     = Book::find($validated['book_id']);
            $bookInfoArr  = $bookInfo->toArray();
            $userInfoArr  = User::find($validated['user_id'])->toArray();
            $borrowingObj->checkin_date = date('Y-m-d H:i:s');
            if($borrowingObj->save()) {
                $bookInfo->is_available = 1;
                $bookInfo->save();

                return response()->json([
                    'status'         => 'Success',
                    'msg'            => 'Book  returened successfully',
                    'book_name'      => $bookInfoArr['book_name'],
                    'user_name'      => $userInfoArr['name']
                 ], 
                 200);
            }
            
        } else {
            return response()->json([
                'status' => 'fail',
                'msg'    => 'No data found'
             ], 
             200);
        }
    }

    public function borrow_history(Request $request) {
        $histories = Borrowing::with(['user', 'book'])->orderBy('id', 'desc')->get();
        $results = array();
        if(!empty($histories)) {
            foreach($histories as $history) {
                $results[] = array(
                    'book_name' => $history->book->book_name,
                    'user_name' => $history->user->name,
                    'checkout_date' => $history->checkout_date,
                    'checkin_date'  => (!empty($history->checkin_date)) ? $history->checkin_date : '-',
                );
            }

            return response()->json([
                'status'         => 'Success',
                'msg'            => $results,
             ], 
             200);
        } else {
            return response()->json([
                'status'         => 'fail',
                'msg'            => 'No data found',
             ], 
             200);
        }
    }
}
