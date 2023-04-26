<?php

namespace App\DataTransferObjects;

use Illuminate\Http\Request;
use Illuminate\Validation\Validator;
use Spatie\LaravelData\Data;
use Spatie\LaravelData\Support\Validation\ValidationContext;

class TagData extends Data
{
    public function __construct(
        public readonly ?int   $id,
        public readonly string $name,
        public readonly string $image,
        public readonly bool $active,
    )
    {
    }

    public static function fromRequest(Request $request): self
    {
        return self::from([
            ...$request->all(),
        ]);
    }

    public function toArray(): array
    {
        return self::all();
    }

    public static function withValidator(Validator $validator): void
    {
        $validator->setRules(self::rules());
    }

    public static function rules(): array
    {
        return [
            'name' => 'required',
            'image' => 'required',
        ];
    }


}
