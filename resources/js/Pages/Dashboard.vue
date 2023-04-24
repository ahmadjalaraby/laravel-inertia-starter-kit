<template>
    <div>
        <Head title="Dashboard"/>
        <div>
            <h3>{{ useI18n().t('dashboard.dashboard') }} : {{ locale }}</h3>
        </div>
    </div>


</template>

<script setup>
import {Head} from '@inertiajs/vue3';
import { wTrans, getActiveLanguage } from 'laravel-vue-i18n';
import {useI18n} from "vue-i18n";

const lang = getActiveLanguage();
const {t, locale} = useI18n()

defineProps({
    message: String,
    canLogin: Boolean,
})
</script>
