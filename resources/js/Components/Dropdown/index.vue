<template>
    <Menu :class="parentClass" as="div" class="relative">
        <MenuButton v-if="$slots.default" class="block w-full">
            <slot></slot>
        </MenuButton>
        <MenuButton v-else :class="labelClass" class="block w-full">{{
                label
            }}
        </MenuButton>
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
                <template v-else>
                    <slot name="menus"></slot>
                </template>
            </MenuItems>
        </Transition>
    </Menu>
</template>

<script>
import Icon from "@/Components/Icon/index.vue";
import {Menu, MenuButton, MenuItem, MenuItems} from "@headlessui/vue";
import {Link} from '@inertiajs/vue3';

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
        },
        classMenuItems: {
            type: String,
            default: "mt-2 w-[220px]",
        },
        classItem: {
            type: String,
            default: "px-4 py-2",
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
