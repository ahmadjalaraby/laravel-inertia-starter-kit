<script>
import EmptyLayout from '@/Layouts/EmptyLayout.vue';

export default {
    layout: EmptyLayout,
}
</script>

<script setup>
import {defineComponent} from "vue";
import {useI18n} from "vue-i18n";
import {Head, Link} from "@inertiajs/vue3";

defineComponent({
    layout: (h, page) => h(EmptyLayout, { data: page.props.data }, {
        default: () => page
    }),
});

</script>

<template>
    <Head title="404"/>
    <div
        class="min-h-screen flex flex-col justify-center items-center text-center py-20"
    >
        <img src="@/assets/images/all-img/404.svg" alt="" />
        <div class="max-w-[546px] mx-auto w-full mt-12">
            <h4 class="text-slate-900 mb-4">{{ useI18n().t('error.page_not_found') }}</h4>
            <div
                class="text-slate-600 dark:text-slate-300 text-base font-normal mb-10"
            >
                {{ useI18n().t('error.page_not_found_description') }}
            </div>
        </div>
        <div class="max-w-[300px] mx-auto w-full">
            <Link
                :href="route('dashboard')"
                class="btn btn-dark dark:bg-slate-800 block text-center"
            >
                {{ useI18n().t('error.go_to_homepage') }}
            </Link>
        </div>
    </div>
</template>

<style lang="scss">

</style>
