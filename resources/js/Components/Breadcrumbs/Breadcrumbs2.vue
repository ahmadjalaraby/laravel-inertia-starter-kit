<template>
    <div class="flex items-center space-x-3 rtl:space-x-reverse">
        <h4
            v-if="this.$page.props.name && !this.$page.props.meta?.groupParent"
            :class="
        this.$page.props.meta?.groupParent
          ? 'lg:border-r lg:border-secondary-500'
          : ''
      "
            class="font-medium lg:text-2xl text-xl capitalize text-slate-900 inline-block pr-4"
        >
            {{ this.$page.props.meta?.groupParent }}
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
                    {{ this.$page.props.name }}
                </button>
                <span class="breadcrumbs-icon rtl:transform rtl:rotate-180">
          <Icon icon="heroicons:chevron-right" />
        </span>
            </li>
            <li class="capitalize text-slate-500 dark:text-slate-400">
                {{ this.$page.props.meta?.groupParent }}
            </li>
        </ul>
    </div>
</template>
<script setup>
import Icon from "@/Components/Icon/index.vue"
import {Link} from '@inertiajs/vue3'

</script>
<style lang=""></style>
