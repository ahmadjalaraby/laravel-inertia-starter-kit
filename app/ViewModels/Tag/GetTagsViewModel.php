<?php

namespace App\ViewModels\Tag;


use App\Models\Tag;
use App\ViewModels\ViewModel;
use Illuminate\Support\Collection;

class GetTagsViewModel extends ViewModel {
    private const PER_PAGE = 10;

    public function __construct()
    {
    }

    public function tags(): Collection
    {
        return Tag::all();
    }

    public function total(): int
    {
        return Tag::count();
    }
}
