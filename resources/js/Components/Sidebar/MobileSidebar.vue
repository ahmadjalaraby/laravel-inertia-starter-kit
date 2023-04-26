<template>
    <div
        :class="`mobile-sidebar bg-white dark:bg-slate-800  ${
      useThemeSettingsStore().theme === 'bordered'
        ? 'border border-gray-5002'
        : 'shadow-base'
    }   `"
    >
        <div class="logo-segment flex justify-between items-center px-4 py-6">
            <Link :href="route('dashboard')">
                <img
                    v-if="useThemeSettingsStore().isDark"
                    alt=""
                    src="@/assets/images/logo/logo.svg"
                />

                <img
                    v-if="useThemeSettingsStore().isDark"
                    alt=""
                    src="@/assets/images/logo/logo-white.svg"
                />
            </Link>
            <span
                class="cursor-pointer text-slate-900 dark:text-white text-2xl"
                @click="toggleMsidebar"
            ><Icon icon="heroicons:x-mark"
            /></span>
        </div>

        <div class="sidebar-menu px-4 h-[calc(100%-100px)]" data-simplebar>
            <Navmenu :items="menuItems"/>
            <div
                v-if="useThemeSettingsStore().sidebarCollasp"
                class="bg-slate-900 mb-[100px] mt-14 p-4 relative text-center rounded-2xl text-white"
            >
                <img
                    alt=""
                    class="mx-auto relative -mt-[73px]"
                    src="@/assets/images/svg/rabit.svg"
                />
                <div class="max-w-[160px] mx-auto mt-6">
                    <div class="widget-title">Unlimited Access</div>
                    <div class="text-xs font-light">
                        Upgrade your system to business plan
                    </div>
                </div>
                <div class="mt-6">
                    <button
                        class="btn bg-white hover:bg-opacity-80 text-slate-900 btn-sm w-full block"
                    >
                        Upgrade
                    </button>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import {Icon} from "@iconify/vue";
import {defineComponent} from "vue";
import Navmenu from "./Navmenu.vue";
import {useThemeSettingsStore} from "@/store/themeSettings";
import {useI18n} from "vue-i18n";
import {Link} from "@inertiajs/vue3";

export default defineComponent({
    components: {
        Icon,
        Navmenu,
        Link,
    },
    data() {
        return {
            menuItems: [
                {
                    isHeadr: true,
                    title: useI18n().t('dashboard.menu'),
                },
                {
                    title: useI18n().t('dashboard.dashboard'),
                    icon: "heroicons-outline:home",
                    link: "dashboard",
                },
            ],
            openClass: "w-[248px]",
            closeClass: "w-[72px] close_sidebar",
        };
    },
    methods: {
        useThemeSettingsStore,
        toggleMsidebar() {
            useThemeSettingsStore().toggleMsidebar()
        },
    },
});
</script>
<style lang="scss" scoped>
.mobile-sidebar {
    @apply fixed ltr:left-0 rtl:right-0 top-0   h-full   z-[9999]  w-[280px];
}
</style>
