<template>
    <div :class="useThemeSettingsStore().semidark ? 'dark' : ''">
        <div
            :class="`sidebar-wrapper bg-white dark:bg-slate-800    ${
        useThemeSettingsStore().skin === 'bordered'
          ? 'border-r border-gray-5002 dark:border-slate-700'
          : 'shadow-base'
      }   ${useThemeSettingsStore().sidebarCollasp ? this.closeClass : this.openClass}
      ${useThemeSettingsStore().isMouseHovered ? 'sidebar-hovered' : ''}

      `"
            @mouseenter="useThemeSettingsStore().isMouseHovered = true"
            @mouseleave="useThemeSettingsStore().isMouseHovered = false"
        >
            <div
                :class="`logo-segment flex justify-between items-center bg-white dark:bg-slate-800 z-[9] py-6  sticky top-0   px-4  ${
          useThemeSettingsStore().sidebarCollasp ? this.closeClass : this.openClass
        } ${
          useThemeSettingsStore().skin === 'bordered'
            ? ' border-b border-r border-gray-5002 dark:border-slate-700'
            : ' border-none'
        }
        ${useThemeSettingsStore().isMouseHovered ? 'logo-hovered' : ''}

        `"
            >
                <Link
                    v-if="
            !useThemeSettingsStore().sidebarCollasp ||
            useThemeSettingsStore().isMouseHovered
          "
                    :href="route('dashboard')"
                >
                    <img
                        v-if="!useThemeSettingsStore().isDark && !useThemeSettingsStore().semidark"
                        alt=""
                        src="@/assets/images/logo/logo.svg"
                    />

                    <img
                        v-if="useThemeSettingsStore().isDark || useThemeSettingsStore().semidark"
                        alt=""
                        src="@/assets/images/logo/logo-white.svg"
                    />
                </Link>
                <Link
                    v-if="
            useThemeSettingsStore().sidebarCollasp &&
            useThemeSettingsStore().sidebarCollasp &&
            !useThemeSettingsStore().isMouseHovered
          "
                    :href="route('dashboard')"
                >
                    <img
                        v-if="!useThemeSettingsStore().isDark && !useThemeSettingsStore().semidark"
                        alt=""
                        src="@/assets/images/logo/logo-c.svg"
                    />
                    <img
                        v-if="useThemeSettingsStore().isDark || useThemeSettingsStore().semidark"
                        alt=""
                        src="@/assets/images/logo/logo-c-white.svg"
                    />
                </Link>
                <span
                    v-if="
            !useThemeSettingsStore().sidebarCollasp ||
            useThemeSettingsStore().isMouseHovered
          "
                    class="cursor-pointer text-slate-900 dark:text-white text-2xl"
                    @click="
            useThemeSettingsStore().sidebarCollasp = !useThemeSettingsStore().sidebarCollasp
          "
                >
          <!-- <Icon icon="heroicons-outline:menu-alt-3"
        /> -->
          <div
              :class="
              useThemeSettingsStore().sidebarCollasp
                ? ''
                : 'ring-2 ring-inset ring-offset-4 ring-black-900 dark:ring-slate-400 bg-slate-900 dark:bg-slate-400 dark:ring-offset-slate-700'
            "
              class="h-4 w-4 border-[1.5px] border-slate-900 dark:border-slate-700 rounded-full transition-all duration-150"
          ></div>
        </span>
            </div>
            <div
                :class="[shadowbase ? ' opacity-100' : ' opacity-0']"
                class="h-[60px] absolute top-[80px] nav-shadow z-[1] w-full transition-all duration-200 pointer-events-none"
            ></div>

            <SimpleBar
                class="sidebar-menu px-4 h-[calc(100%-80px)]"
                @created="
          (instance) => {
            simplebarInstance = instance;
          }
        "
            >
                <Navmenu :items="menuItems"/>
            </SimpleBar>
        </div>
    </div>
</template>
<script>
// import { Icon } from "@iconify/vue";
import {defineComponent, onMounted, ref} from "vue";
import Navmenu from "./Navmenu.vue";
import {gsap} from "gsap";
import {SimpleBar} from "simplebar-vue3";
import {useThemeSettingsStore} from "@/store/themeSettings";
import {useI18n} from "vue-i18n";
import {Link} from '@inertiajs/vue3'

export default defineComponent({
    components: {
        // Icon,
        Navmenu,
        SimpleBar,
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
                {
                    isHeadr: true,
                    title: useI18n().t('dashboard.pages'),
                },
                {
                    title: useI18n().t('dashboard.tags'),
                    icon: "heroicons:tag-20-solid",
                    link: "#",
                    child: [
                        {
                            childtitle: useI18n().t('dashboard.tags_create'),
                            childlink: 'tags.index',
                        },
                        {
                            childtitle: useI18n().t('dashboard.tags_index'),
                            childlink: 'tags.index',
                        },
                    ],
                },

            ],
            openClass: "w-[248px]",
            closeClass: "w-[72px] close_sidebar",
        };
    },
    methods: {useThemeSettingsStore},

    setup() {
        const shadowbase = ref(false);
        const simplebarInstance = ref(null);
        onMounted(() => {
            simplebarInstance.value
                .getScrollElement()
                .addEventListener("scroll", () => {
                    if (simplebarInstance.value.getScrollElement().scrollTop > 50) {
                        simplebarInstance.value.getScrollElement().classList.add("scroll");
                        shadowbase.value = true;
                    } else {
                        simplebarInstance.value
                            .getScrollElement()
                            .classList.remove("scroll");
                        shadowbase.value = false;
                    }
                });
        });

        const enterWidget = (el) => {
            gsap.fromTo(
                el,
                {x: 0, opacity: 0, scale: 0.5},
                {x: 0, opacity: 1, duration: 0.3, scale: 1}
            );
        };
        const leaveWidget = (el) => {
            gsap.fromTo(
                el,
                {x: 0, opacity: 1, scale: 1},
                {x: 0, opacity: 0, duration: 0.3, scale: 0.5}
            );
        };

        return {
            enterWidget,
            leaveWidget,
            simplebarInstance,
            shadowbase,
        };
    },
});
</script>
<style lang="scss">
.sidebar-wrapper {
    @apply fixed ltr:left-0 rtl:right-0 top-0   h-screen   z-[999];
    transition: width 0.2s cubic-bezier(0.39, 0.575, 0.565, 1);
    will-change: width;
}

.nav-shadow {
    background: linear-gradient(
            rgb(255, 255, 255) 5%,
            rgba(255, 255, 255, 75%) 45%,
            rgba(255, 255, 255, 20%) 80%,
            transparent
    );
}

.dark {
    .nav-shadow {
        background: linear-gradient(
                rgba(#1e293b, 100%) 5%,
                rgba(#1e293b, 75%) 45%,
                rgba(#1e293b, 20%) 80%,
                transparent
        );
    }
}

.sidebar-wrapper.sidebar-hovered {
    width: 248px !important;
}

.logo-segment.logo-hovered {
    width: 248px !important;
}
</style>
