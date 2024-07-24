<?php

namespace App\Models;

use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class Book extends Model
{
    use HasFactory, SoftDeletes;

    protected $guarded = ['id'];

    public function setGenreAttribute($value)
    {
        $this->attributes['genre'] = ucfirst($value);
    }

    public function setAuthorNameAttribute($value)
    {
        $this->attributes['author_name'] = ucwords($value);
    }

    public function setPublishedDateAttribute($value)
    {
        $this->attributes['published_date'] = date('Y-m-d H:i:s', strtotime($value));
    }

    public function getPublishedAttribute()
    {
        return (!empty($this->published_date)) ? date('d-m-Y', strtotime($this->published_date)) : '-';
    }

    public function getAvailableAttribute()
    {
        return (!empty($this->is_available)) ? 'Available' : 'Borrowed';
    }

    /*public function user() {
        return $this->belongsTo(User::class);
    }*/
}
