<template>
    <div class="md:mb-6 mb-4 flex space-x-3 rtl:space-x-reverse">
        <h4
            v-if="this.$page.props.name && !this.$page.props.meta?.groupParent"
            :class="
        this.$page.props.meta?.groupParent
          ? 'lg:border-r lg:border-secondary-500'
          : ''
      "
            class="font-medium lg:text-2xl text-xl capitalize text-slate-900 inline-block ltr:pr-4 rtl:pl-4"
        >
            {{ useI18n().t('dashboard.'+this.$page.props.name.replace("-", "")) }}
        </h4>
        <ul class="breadcrumbs" v-if="this.$page.props.meta?.groupParent">
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
                    {{ this.$page.props.meta?.groupParent }}
                </button>
                <span class="breadcrumbs-icon rtl:transform rtl:rotate-180">
          <Icon icon="heroicons:chevron-right" />
        </span>
            </li>
            <li class="capitalize text-slate-500 dark:text-slate-400">
                {{ this.$page.props.name.replace("-", " ") }}
            </li>
        </ul>
    </div>
</template>
<script>
import Icon from "@/Components/Icon/index.vue";
import {useI18n} from "vue-i18n";
import {Link} from "@inertiajs/vue3";

export default {
    methods: {useI18n},
    components: {
        Icon,
        Link,
    },
};
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
