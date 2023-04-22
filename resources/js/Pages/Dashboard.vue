<template>
    <div>
        <Head title="Dashboard"/>
        <div>
            <h2>Hi worldd new!!!</h2>
            <h1>adawdwda {{ canLogin }}</h1>
            <p>{{ message }}</p>
            <p>{{ $t('dashboard.dashboard') }} in lang: {{ lang }}</p>
        </div>
    </div>


</template>

<script setup>
import {Head} from '@inertiajs/vue3';
import { loadLanguageAsync, getActiveLanguage } from 'laravel-vue-i18n';

const lang = getActiveLanguage();

defineProps({
    message: String,
    canLogin: Boolean,
})
</script>
