
<script>
import EmptyLayout from '@/Layouts/EmptyLayout.vue';

export default {
    layout: EmptyLayout,
}
</script>


<script setup>
// Image Import
import logoWhite from "@/assets/images/logo/logo-white.svg"
import logo from "@/assets/images/logo/logo.svg"
import sideImg from "@/assets/images/auth/ils1.svg"

import { Head, Link, useForm } from '@inertiajs/vue3';
import {computed, defineComponent} from "vue";
import {wTrans} from "laravel-vue-i18n";
import {useThemeSettingsStore} from "@/store/themeSettings";

import { useI18n } from "vue-i18n";
import Signin from "@/Pages/Auth/Shared/Signin.vue";


defineComponent({
    layout: (h, page) => h(EmptyLayout, { data: page.props.data }, {
        default: () => page
    }),
});

defineProps({
    canResetPassword: {
        type: Boolean,
    },
    status: {
        type: String,
    },
});

const { t } = useI18n({});

const tr = computed(
    () => wTrans('auth.login')
)


const form = useForm({
    email: '',
    password: '',
    remember: false,
});

const submit = () => {
    form.post(route('login'), {
        onFinish: () => form.reset('password'),
    });
};
</script>

<template>
    <Head :title="useI18n().t('auth.login')"/>

    <div class="loginwrapper">
        <div class="lg-inner-column">
            <div class="left-column relative z-[1]">
                <div class="max-w-[520px] pt-20 ltr:pl-20 rtl:pr-20">
                    <router-link to="/">
                        <img
                            :src="logo"
                            alt=""
                            class="mb-10"
                            v-if="!useThemeSettingsStore().isDark"
                        />
                        <img
                            :src="logoWhite"
                            alt=""
                            class="mb-10"
                            v-else
                        />
                    </router-link>

<!--                    <h4>-->
<!--                        Unlock your Project-->
<!--                        <span class="font-bold text-slate-800 dark:text-slate-400"-->
<!--                        >performance</span-->
<!--                        >-->
<!--                    </h4>-->
                </div>
                <div
                    class="absolute left-0 2xl:bottom-[-160px] bottom-[-130px] h-full w-full z-[-1]"
                >
                    <img
                        :src="sideImg"
                        alt=""
                        class="object-contain w-full h-full"
                    />
                </div>
            </div>
            <div class="relative right-column">
                <div
                    class="flex flex-col h-full bg-white inner-content dark:bg-slate-800"
                >
                    <div class="flex flex-col justify-center h-full auth-box">
                        <div class="block mb-6 text-center mobile-logo lg:hidden">
                            <router-link to="/">
                                <img
                                    :src="logo"
                                    alt=""
                                    class="mx-auto"
                                    v-if="!useThemeSettingsStore().isDark"
                                />
                                <img
                                    :src="logoWhite"
                                    alt=""
                                    class="mx-auto"
                                    v-else
                                />
                            </router-link>
                        </div>
                        <div class="mb-4 text-center 2xl:mb-10">
                            <h4 class="font-medium">{{ useI18n().t('auth.login') }}</h4>
                            <div class="text-base text-slate-500">
                                {{ useI18n().t('auth.login_to_admin_panel') }}
                            </div>
                        </div>
                        <Signin />


                    </div>
                    <div class="text-center auth-footer">
                        {{ useI18n().t('dashboard.copyright', {year: new Date().getFullYear(), name: 'Scribble'}) }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<!--<template>-->
<!--    <div>-->
<!--        <Head :title="t('auth.login')" />-->

<!--        <div v-if="status" class="mb-4 font-medium text-sm text-green-600">-->
<!--            {{ status }}-->
<!--        </div>-->

<!--        <form @submit.prevent="submit">-->
<!--            <div>-->
<!--                <InputLabel for="email" :value="t('auth.email')" />-->

<!--                <TextInput-->
<!--                    id="email"-->
<!--                    type="email"-->
<!--                    class="mt-1 block w-full"-->
<!--                    v-model="form.email"-->
<!--                    required-->
<!--                    autofocus-->
<!--                    autocomplete="username"-->
<!--                />-->

<!--                <InputError class="mt-2" :message="form.errors.email" />-->
<!--            </div>-->

<!--            <div class="mt-4">-->
<!--                <InputLabel for="password" :value="t('auth.password')" />-->

<!--                <TextInput-->
<!--                    id="password"-->
<!--                    type="password"-->
<!--                    class="mt-1 block w-full"-->
<!--                    v-model="form.password"-->
<!--                    required-->
<!--                    autocomplete="current-password"-->
<!--                />-->

<!--                <InputError class="mt-2" :message="form.errors.password" />-->
<!--            </div>-->

<!--            <div class="block mt-4">-->
<!--                <label class="flex items-center">-->
<!--                    <Checkbox name="remember" v-model:checked="form.remember" />-->
<!--                    <span class="ml-2 text-sm text-gray-600">{{ t('auth.remember_me') }}</span>-->
<!--                </label>-->
<!--            </div>-->

<!--            <div class="flex items-center justify-end mt-4">-->

<!--                <PrimaryButton class="ml-4" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">-->
<!--                    {{ t('auth.login') }}-->
<!--                </PrimaryButton>-->
<!--            </div>-->
<!--        </form>-->
<!--    </div>-->
<!--</template>-->
