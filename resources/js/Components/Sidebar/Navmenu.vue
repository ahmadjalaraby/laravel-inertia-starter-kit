<template>
    <ul>
        <li
            v-for="(item, i) in items"
            :key="i"
            :class="`
      ${item.child ? 'item-has-children' : ''}
      ${activeSubmenu === i ? 'open' : ''}
      ${currentRouteName === item.link ? 'menu-item-active' : ''}

      `"
            class="single-sidebar-menu"
        >
            <!-- ?? single menu with no childred !!  -->

            <Link
                v-if="!item.child && !item.isHeadr"
                :href="route(item.link)"
                class="menu-link"
            >
        <span v-if="item.icon" class="menu-icon">
          <Icon :icon="item.icon"
          /></span>
                <div v-if="item.title" class="text-box">{{ item.title }}</div>
            </Link>

            <!-- ?? only for menulabel ??  -->
            <div v-else-if="item.isHeadr && !item.child" class="menulabel">
                {{ item.title }}
            </div>
            <!-- !!sub menu parent li !! -->
            <div
                v-else
                :class="
          activeSubmenu === i ? 'parent_active not-collapsed' : 'collapsed'
        "
                class="menu-link"
                @click="toggleSubmenu(i)"
            >
                <div class="flex-1 flex items-start">
          <span v-show="item.icon" class="menu-icon">
            <Icon :icon="item.icon"
            /></span>
                    <div v-if="item.title" class="text-box">{{ item.title }}</div>
                </div>
                <div class="flex-0">
                    <div
                        :class="
              activeSubmenu === i
                ? ' ltr:rotate-90 rtl:rotate-90'
                : 'rtl:rotate-180'
            "
                        class="menu-arrow transform transition-all duration-300"
                    >
                        <Icon icon="heroicons-outline:chevron-right"/>
                    </div>
                </div>
            </div>
            <Transition
                enter-active-class="submenu_enter-active"
                leave-active-class="submenu_leave-active"
                @enter="enter"
                @leave="leave"
                @before-enter="beforeEnter"
                @after-enter="afterEnter"
                @before-leave="beforeLeave"
                @after-leave="afterLeave"
            >
                <!-- !! SubMenu !! -->
                <ul v-if="i === activeSubmenu" class="sub-menu ">
                    <li
                        v-for="(ci, index) in item.child"
                        :key="index"
                        class="block ltr:pl-4 rtl:pr-4 ltr:pr-1 rtl:-l-1 mb-4 first:mt-4"
                    >
                        <Link :href="route(ci.childlink)">
              <span
                  :class="
                  currentRouteName === ci.childlink
                    ? ' text-slate-900 dark:text-white font-medium'
                    : 'text-slate-600 dark:text-slate-300'
                "
                  class="text-sm flex space-x-3 rtl:space-x-reverse items-center transition-all duration-150"
              >
                <span
                    :class="
                    currentRouteName === ci.childlink
                      ? ' bg-slate-900 dark:bg-slate-300 ring-4 ring-opacity-[15%] ring-black-500 dark:ring-slate-300 dark:ring-opacity-20'
                      : ''
                  "
                    class="h-2 w-2 rounded-full border border-slate-600 dark:border-slate-300 inline-block flex-none"
                ></span>
                <span class="flex-1">
                  {{ ci.childtitle }}
                </span>
              </span>
                        </Link>
                    </li>
                </ul>
            </Transition>
        </li>
    </ul>
</template>


<script>
import Icon from "@/Components/Icon/index.vue";
import {Link} from "@inertiajs/vue3";
import {useThemeSettingsStore} from "@/store/themeSettings";

export default {
    components: {
        Icon,
        Link,
    },

    data() {
        return {
            activeSubmenu: null,
            currentRouteName: route().current(),
        };
    },

    props: {
        title: {
            type: String,
            default: "",
        },
        icon: {
            type: String,
            default: "",
        },
        link: {
            type: String,
            default: "",
        },
        items: { type: Array, required: true },
        childrenLinks: { type: Array, default: null },
    },

    methods: {
        beforeEnter(element) {
            requestAnimationFrame(() => {
                if (!element.style.height) {
                    element.style.height = "0px";
                }

                element.style.display = null;
            });
        },
        enter(element) {
            requestAnimationFrame(() => {
                requestAnimationFrame(() => {
                    element.style.height = `${element.scrollHeight}px`;
                });
            });
        },
        afterEnter(element) {
            element.style.height = null;
        },
        beforeLeave(element) {
            requestAnimationFrame(() => {
                if (!element.style.height) {
                    element.style.height = `${element.offsetHeight}px`;
                }
            });
        },
        leave(element) {
            requestAnimationFrame(() => {
                requestAnimationFrame(() => {
                    element.style.height = "0px";
                });
            });
        },
        afterLeave(element) {
            element.style.height = null;
        },
        toggleSubmenu(index) {
            if (this.activeSubmenu === index) {
                this.activeSubmenu = null;
            } else {
                this.activeSubmenu = index;
            }
        },
    },

    watch: {
        $page() {
            this.currentRouteName = route().current()
            if (useThemeSettingsStore().mobielSidebar) {
                useThemeSettingsStore().mobielSidebar = false;
            }

            this.items.map((item, i) => {
                if (item.link === this.currentRouteName) {
                    this.activeSubmenu = null;
                }
                item.child?.map((ci) => {
                    if (ci.childlink === this.currentRouteName) {
                        this.activeSubmenu = i;
                    }
                });
            });
        },
    },

    created() {
        this.items.map((item, i) => {
            item.child?.map((ci) => {
                if (ci.childlink === this.currentRouteName) {
                    this.activeSubmenu = i;
                }
            });
        });
    },
    // update if route chnage then activesubmenu null

    updated() {},
};
</script>

<style lang="scss">
.submenu_enter-active,
.submenu_leave-active {
    overflow: hidden;
    transition: all 0.34s linear;
}

.not-collapsed .has-icon {
    transition: all 0.34s linear;
}

.not-collapsed .has-icon {
    @apply transform rotate-180;
}

// single sidebar menu css
.single-sidebar-menu {
    @apply relative;
    .menulabel {
        @apply text-slate-800 dark:text-slate-300 text-xs font-semibold uppercase mb-4 mt-4;
    }

    > .menu-link {
        @apply flex text-slate-600 font-medium dark:text-slate-300 text-sm capitalize px-[10px] py-3 rounded-[4px] cursor-pointer;
    }

    .menu-icon {
        @apply icon-box inline-flex items-center text-slate-600 dark:text-slate-300 text-lg ltr:mr-3 rtl:ml-3;
    }
}

// menu item has chilren
.item-has-children {
    .menu-arrow {
        @apply h-5 w-5 text-base text-slate-300 bg-slate-100 dark:bg-[#334155] dark:text-slate-300 rounded-full flex justify-center items-center;
    }
}

// close sidebar css
.close_sidebar .menulabel {
    @apply hidden;
}

.close_sidebar:not(.sidebar-hovered) {
    .menu-arrow {
        @apply hidden;
    }

    .single-sidebar-menu {
        .text-box {
            @apply absolute  left-full ml-5 w-[180px] top-0 px-4 py-3 bg-white shadow-dropdown rounded-[4px] dark:bg-slate-800 z-[999] invisible opacity-0 transition-all duration-150;
        }

        &:hover {
            .text-box {
                @apply visible opacity-100;
            }
        }
    }

    .item-has-children {
        .text-box {
            @apply hidden;
        }

        > ul {
            @apply ml-4 absolute left-full top-0 w-[230px] bg-white shadow-dropdown rounded-[4px] dark:bg-slate-800 z-[999] px-4 pt-3 transition-all duration-150 invisible opacity-0;
            display: block !important;
        }

        &:hover {
            > ul {
                @apply visible opacity-100;
            }
        }
    }
}

// active menu
.item-has-children {
    .parent_active {
        @apply bg-secondary-500 bg-opacity-20;
        .icon-box,
        .menu-icon,
        .text-box {
            @apply text-slate-700 dark:text-slate-200;
        }

        .menu-arrow {
            @apply bg-secondary-500 text-slate-600 text-opacity-70 bg-opacity-30 dark:text-white;
        }
    }
}

.menu-item-active {
    .menu-link {
        @apply bg-slate-800 dark:bg-slate-700;
        .icon-box,
        .menu-icon,
        .text-box {
            @apply text-white dark:text-slate-300;
        }
    }
}
</style>
