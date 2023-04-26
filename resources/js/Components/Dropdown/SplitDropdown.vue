<template>
    <Menu :class="parentClass" as="div" class="relative">
        <div class="split-btngroup flex">
            <button :class="labelClass" class="btn flex-1">{{ label }}</button>
            <MenuButton :class="labelClass" class="flex-0 px-3">
                <Icon :icon="splitIcon"
                />
            </MenuButton>
        </div>
        <Transition
            enter-active-class="transition duration-100 ease-out"
            enter-from-class="transform scale-95 opacity-0"
            enter-to-class="transform scale-100 opacity-100"
            leave-active-class="transition duration-75 ease-in"
            leave-from-class="transform scale-100 opacity-100"
            leave-to-class="transform scale-95 opacity-0"
        >
            <MenuItems
                :class="classMenuItems"
                class="absolute ltr:right-0 rtl:left-0 origin-top-right rounded bg-white dark:bg-slate-800 dark:border dark:border-slate-700 shadow-dropdown z-[9999]"
            >
                <div v-if="!$slots.menus">
                    <MenuItem v-for="(item, i) in items" :key="i" v-slot="{ active }">
                        <Link
                            v-if="item.link"
                            :class="`${
                active
                  ? 'bg-slate-100 text-slate-900 dark:bg-slate-600 dark:text-slate-300 dark:bg-opacity-50'
                  : 'text-slate-600 dark:text-slate-300'
              } block   ${classItem}  ${
                item.hasDivider
                  ? 'border-t border-slate-100 dark:border-slate-700'
                  : ''
              }`"
                            :href="route(item.link)"
                        >
                            <div v-if="item.icon" class="flex items-center">
                <span class="block text-xl ltr:mr-3 rtl:ml-3">
                  <Icon :icon="item.icon"
                  /></span>
                                <span class="block text-sm">{{ item.label }}</span>
                            </div>
                            <span v-else class="block text-sm">{{ item.label }}</span>
                        </Link>
                        <span
                            v-else
                            :class="`${active ? 'bg-slate-100 text-slate-800' : ''}  ${
                item.hasDivider === true
                  ? 'border-t border-gray-500 dark:border-slate-700'
                  : ''
              }  block ${classItem}`"
                        >
              <div v-if="item.icon" class="flex items-center">
                <span class="block text-xl ltr:mr-3 rtl:ml-3">
                  <Icon :icon="item.icon"
                  /></span>
                <span class="block text-sm">{{ item.label }}</span>
              </div>
              <span v-else class="block text-sm">{{ item.label }}</span>
            </span>
                    </MenuItem>
                </div>
                <div v-else class="paglawrapper">
                    <slot name="menus"></slot>
                </div>
            </MenuItems>
        </Transition>
    </Menu>
</template>

<script>
import Icon from "@/Components/Icon/index.vue";
import {Menu, MenuButton, MenuItem, MenuItems} from "@headlessui/vue";
import {Link} from "@inertiajs/vue3";

export default {
    components: {
        Menu,
        MenuButton,
        MenuItems,
        MenuItem,
        Icon,
        Link,
    },
    props: {
        label: {
            type: String,
            default: "DropDown",
        },
        labelClass: {
            type: String,
            default: "btn-primary",
        },
        classMenuItems: {
            type: String,
            default: " mt-2 w-[220px]",
        },
        classItem: {
            type: String,
            default: "px-4 py-2",
        },
        splitIcon: {
            type: String,
            default: "heroicons-outline:chevron-down",
        },
        parentClass: {
            type: String,
            default: "inline-block",
        },
        items: {
            type: Array,

            default: () => [
                {
                    label: "Action",
                    link: "#",
                },
                {
                    label: "Another action",
                    link: "#",
                },
                {
                    label: "Something else here",
                    link: "#",
                },
                {
                    label: "Separated link",
                    link: "#",
                    hasDivider: true,
                },
            ],
        },
    },
};
</script>

<style lang="scss" scoped>
.split-btngroup {
    .btn {
        @apply ltr:rounded-r-none rtl:rounded-l-none hover:ring-0;
    }

    button {
        @apply ltr:last:rounded-r-md rtl:last:rounded-l-md  last:border-l last:border-white last:border-opacity-[0.10];
        &:hover {
            box-shadow: none !important;
        }
    }

    [class*="btn-outline-"] {
        @apply ltr:last:border-l-0 rtl:last:border-r-0  focus:bg-transparent focus:text-inherit;
    }

    .btn-outline-primary {
        @apply focus:text-primary-500 last:border-primary-500;
    }

    .btn-outline-secondary {
        @apply focus:text-secondary-500 last:border-secondary-500;
    }

    .btn-outline-success {
        @apply focus:text-success-500 last:border-success-500;
    }

    .btn-outline-danger {
        @apply focus:text-danger-500 last:border-danger-500;
    }

    .btn-outline-warning {
        @apply focus:text-warning-500 last:border-warning-500;
    }

    .btn-outline-info {
        @apply focus:text-info-500 last:border-info-500;
    }

    .btn-outline-light {
        @apply focus:text-slate-600 last:border-[#E0EAFF];
    }
}
</style>
