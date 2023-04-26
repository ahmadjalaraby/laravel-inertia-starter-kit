<template>
    <div class="flex items-center space-x-3 rtl:space-x-reverse">
        <h4
            v-if="routeVar.name && !routeVar.meta?.groupParent"
            :class="
        routeVar.meta?.groupParent
          ? 'lg:border-r lg:border-secondary-500'
          : ''
      "
            class="font-medium lg:text-2xl text-xl capitalize text-slate-900 inline-block pr-4"
        >
            {{ routeVar.meta?.groupParent }}
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
                    {{ routeVar.name }}
                </button>
                <span class="breadcrumbs-icon rtl:transform rtl:rotate-180">
          <Icon icon="heroicons:chevron-right" />
        </span>
            </li>
            <li class="capitalize text-slate-500 dark:text-slate-400">
                {{ routeVar.meta?.groupParent }}
            </li>
        </ul>
    </div>
</template>
<script setup>
import Icon from "@/Components/Icon/index.vue"
import {Link} from '@inertiajs/vue3'
import {computed} from "vue";
import routes from "@/router/route";

const routeVar = computed(
    () => routes.find((routeItem) => {
        if(routeItem.name === route().current()) {
            return routeItem
        }
        if(routeItem.children.length > 0) {
            return routeItem.children.find((child) => child.name = route().current())
        }
        return null
    })
)

</script>
<style lang=""></style>
