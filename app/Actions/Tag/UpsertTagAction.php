<?php

namespace App\Actions\Tag;


use App\DataTransferObjects\TagData;
use App\Models\Tag;

class UpsertTagAction
{
    public static function execute(TagData $data): Tag
    {
        return Tag::updateOrCreate(
            [
                'id' => $data->id,
            ],
            $data->all(),
        );
    }
}
