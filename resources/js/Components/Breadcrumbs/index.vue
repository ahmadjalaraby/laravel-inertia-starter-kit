<template>
    <div class="md:mb-6 mb-4 flex space-x-3 rtl:space-x-reverse">
        <h4
            v-if="routeVar.name && !routeVar.meta?.groupParent"
            :class="
        routeVar.meta?.groupParent
          ? 'lg:border-r lg:border-secondary-500'
          : ''
      "
            class="font-medium lg:text-2xl text-xl capitalize text-slate-900 inline-block ltr:pr-4 rtl:pl-4"
        >
            {{ useI18n().t('dashboard.'+routeVar.name.replace("-", "")) }}
        </h4>
        <ul class="breadcrumbs" v-if="routeVar.meta?.groupParent">
            <li class="text-primary-500">
                <Link :href="route('dashboard')" class="text-lg">
                    <Icon icon="heroicons-outline:home" />
                </Link>
                <span class="breadcrumbs-icon rtl:transform rtl:rotate-180">
          <Icon icon="heroicons:chevron-right" />
        </span>
            </li>
            <li class="text-primary-500">
                <button type="button" class="capitalize">
                    {{ useI18n().t('dashboard.'+routeVar.meta?.groupParent) }}
                </button>
                <span class="breadcrumbs-icon rtl:transform rtl:rotate-180">
          <Icon icon="heroicons:chevron-right" />
        </span>
            </li>
            <li class="capitalize text-slate-500 dark:text-slate-400">
                {{ useI18n().t('dashboard.'+routeVar.name.replace(".", "_")) }}
            </li>
        </ul>
    </div>
</template>
<script setup>
import Icon from "@/Components/Icon/index.vue";
import {useI18n} from "vue-i18n";
import {Link, usePage} from "@inertiajs/vue3";
import useRoute from "@/Composables/useRoute";
import {watch} from "vue";

const routeVar = useRoute()



</script>
<style lang="scss">
.breadcrumbs {
    @apply flex text-sm space-x-2 items-center;
    li {
        @apply relative flex items-center space-x-2 capitalize font-normal rtl:space-x-reverse;
        .breadcrumbs-icon {
            @apply text-lg text-secondary-500 dark:text-slate-500;
        }
    }
}
</style>
