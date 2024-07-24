<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Book>
 */
class BookFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'book_name'        => $this->faker->realText(20, 2),
            //'book_description' => $this->faker->realText(200, 2),
            'author_name'      => fake()->name(),
            'genre'            => 'technical',
            'isbn'             => 'isbn_'.rand(1000, 10000),
            'published_date'   => date('Y-m-d H:i:s'),
        ];
    }
}
