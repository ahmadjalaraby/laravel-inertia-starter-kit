<?php

namespace App\Actions\Tag;

use App\Models\Tag;

class DeleteTagAction
{

    public static function execute(Tag $tag): void
    {
        $tag->delete();
    }
}
