<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UsersController extends Controller
{
    public function create(Request $request) {

        $validator = Validator::make($request->all(), [
            'name'      => 'required|max:25',
            'email'     => 'required|email|unique:users,email',
            'password'  => 'required|min:6|max:15',
            'role'      => [
                'required',
                Rule::in(['Admin', 'Member']),
            ],
        ]);

        if ($validator->fails()) {
            return response()->json([
               'status' => 'fail',
               'msg'    => $validator->errors()
            ], 
            200);
       } else {
            $validated = $validator->validated();
            $validated['password'] = Hash::make($validated['password']);
            $user = User::create($validated);

            return response()->json([
                'status' => 'success',
                'msg'    => 'User created successfully',
                'id'     => $user->id,
             ], 
             200);
        
       }

    }

    public function all_users(Request $request) {
        $results = $users = array();
        $users = User::orderBy('id', 'desc')->get();
        if(!empty($users)) {
            foreach($users as $user) {
                $results[] = array(
                    'id'   => $user->id,
                    'name' => $user->name,
                    'email' => $user->email,
                    'role'  => $user->user_role
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
        $user   = User::where('id', $key)->orWhere('email','like', '%'.$key.'%')->first();
        $result = array();
        if(!empty($user)) {
            $result = array(
                'id'   => $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'role'  => $user->user_role
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
        $user   = User::where('id', $key)->orWhere('email', $key)->first();
        if(empty($user)) {
            return response()->json([
                'status' => 'fail',
                'result' => 'User not found',
             ], 
             200);
        } else {
            $user->delete();
            return response()->json([
                'status' => 'Success',
                'result' => 'User deleted successfully.',
             ], 
             200);
        }
    }

    public function update(Request $request) {
        $inputs = $request->all();
        $rules  = $userInfo = array();
        $rules['id'] = 'required|integer|exists:users,id';
        if(!empty($inputs['name'])) {
            $rules['name'] = 'required|max:25';
        }
        if(!empty($inputs['email'])) {
            $rules['email'] = 'required|email|unique:users,email,'.$inputs['id'];
        }
        if(!empty($inputs['password'])) {
            $rules['password'] = 'required|min:6|max:15';
        }
        if(!empty($inputs['role'])) {
            $rules['role'] = [
                'required',
                Rule::in(['Admin', 'Member']),
            ];
        }
       
        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json([
               'status' => 'fail',
               'msg'    => $validator->errors()
            ], 
            200);
       } else {
            $userInfo = User::find($inputs['id']);
            if(empty($userInfo)) {
                return response()->json([
                    'status' => 'fail',
                    'msg'    => 'User already deleted'
                 ], 
                 200);
            } else {
                $validated = $validator->validated();

                $userInfo->name      = $validated['name'] ?? $userInfo->name;
                $userInfo->email     = $validated['email'] ?? $userInfo->email;
                $userInfo->password  = (!empty($validated['password'])) ? Hash::make($validated['password']) : $userInfo->password;
                $userInfo->role      = (!empty($validated['role'])) ? $validated['role'] : $userInfo->user_role;
                $userInfo->save();

                return response()->json([
                    'status'         => 'Success',
                    'msg'            => 'User updated successfully',
                    'id'             => $userInfo->id,
                ], 
                200);
            }
       }


    }

}
