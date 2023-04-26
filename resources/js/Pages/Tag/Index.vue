<template>
    <Head title="Tags" />
    <h2>{{ model }}</h2>
    <Link :href="route('dashboard')">Dashboard</Link>

</template>


<script setup>
import {Head, Link} from "@inertiajs/vue3";

const $props = defineProps({
    model: {
        type: Object,
        required: true,
    }
})

</script>
