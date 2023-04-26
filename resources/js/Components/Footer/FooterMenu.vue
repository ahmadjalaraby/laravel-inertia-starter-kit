<template>
    <div
        class="bg-white bg-no-repeat custom-dropshadow footer-bg dark:bg-slate-700 flex justify-around items-center backdrop-filter backdrop-blur-[40px] fixed left-0 w-full z-[9999] bottom-0 py-[12px] px-4"
    >
        <Link :href="route('dashboard')">
      <span
          :class="[
          route().current() === 'dashboard' ? 'text-primary-500' : 'dark:text-white text-slate-900',
        ]"
          class="relative cursor-pointer rounded-full text-[20px] flex flex-col items-center justify-center"
      ><Icon icon="heroicons-outline:mail"/>
        <span
            class="absolute right-[5px] lg:top-0 -top-2 h-4 w-4 bg-red-500 text-[8px] font-semibold flex flex-col items-center justify-center rounded-full text-white z-[99]"
        >10</span
        >
      </span>
            <span
                :class="[
          route().current() === 'dashboard' ? 'text-primary-500' : 'text-slate-600 dark:text-slate-300',
        ]"
                class="block text-[11px]"
            >Messages</span
            >
        </Link>
        <Link
            :href="route('dashboard')"
            class="relative bg-white bg-no-repeat backdrop-filter backdrop-blur-[40px] rounded-full footer-bg dark:bg-slate-700 h-[65px] w-[65px] z-[-1] -mt-[40px] flex justify-center items-center"
        >
            <div
                class="h-[50px] w-[50px] rounded-full relative left-[0px] top-[0px] custom-dropshadow"
            >
                <img
                    :class="[
            route().current() === 'dashboard'
              ? 'border-2 border-primary-500'
              : 'border-2 border-slate-100',
          ]"
                    alt=""
                    class="w-full h-full rounded-full"
                    src="@/assets/images/users/user-1.jpg"
                />
            </div>
        </Link>
        <Link :href="route('notifications')">
      <span
          :class="[
          route().current() === 'notifications' ? 'text-primary-500' : 'dark:text-white text-slate-900',
        ]"
          class="relative cursor-pointer rounded-full text-[20px] flex flex-col items-center justify-center"
      ><Icon icon="heroicons-outline:bell"/>
        <span
            class="absolute right-[17px] lg:top-0 -top-2 h-4 w-4 bg-red-500 text-[8px] font-semibold flex flex-col items-center justify-center rounded-full text-white z-[99]"
        >2</span
        >
      </span>
            <span
                :class="[
          route().current() === 'notifications' ? 'text-primary-500' : 'text-slate-600 dark:text-slate-300',
        ]"
                class="block text-[11px]"
            >Notifications</span
            >
        </Link>
    </div>
</template>
<script>
import Icon from "@/Components/Icon/index.vue";
import {Link} from "@inertiajs/vue3";

export default {
    components: {
        Icon,
        Link,
    },
};
</script>
<style lang="scss"></style>
