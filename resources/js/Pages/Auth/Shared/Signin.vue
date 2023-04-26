<template>
    <form class="space-y-4" @submit.prevent="onSubmit">
        <Textinput
            v-model="form.email"
            :error="form.errors.email"
            :label="useI18nN.t('auth.email')"
            :placeholder="useI18nN.t('validation.type_your', {attribute: useI18nN.t('auth.email')})"
            classInput="h-[48px]"
            name="emil"
            type="email"
        />
        <Textinput
            v-model="form.password"
            :error="form.errors.password"
            :label="useI18nN.t('auth.password')"
            :placeholder="useI18nN.t('validation.type_your', {attribute: useI18nN.t('auth.password')})"
            classInput="h-[48px]"
            hasicon
            name="password"
            type="password"
            autocomplete="current-password"
        />

        <div class="flex justify-between">
            <label class="cursor-pointer flex items-start">
                <input
                    class="hidden"
                    type="checkbox"
                    @change="() => (form.remember_me= !form.remember_me)"
                />
                <span
                    :class="
            form.remember_me
              ? 'ring-2 ring-black-500 dark:ring-offset-slate-600 dark:ring-slate-900  dark:bg-slate-900 ring-offset-2 bg-slate-900'
              : 'bg-slate-100 dark:bg-slate-600 border-slate-100 dark:border-slate-600 '
          "
                    class="h-4 w-4 border rounded flex-none inline-flex mr-3 relative top-1 transition-all duration-150"
                >
          <img
              v-if="form.remember_me"
              alt=""
              class="h-[10px] w-[10px] block m-auto"
              src="@/assets/images/icon/ck-white.svg"
          />
        </span>
                <span class="text-slate-500 dark:text-slate-400 text-sm leading-6"
                >{{ useI18nN.t('auth.remember_me') }}</span
                >
            </label>

        </div>

        <button class="btn btn-dark block w-full text-center" type="submit" :disabled="form.processing">
            {{ useI18nN.t('auth.login') }}
        </button>
    </form>
</template>
<script setup>
import Textinput from "@/Components/Textinput/index.vue";
import {useForm} from "@inertiajs/vue3";
import * as yup from "yup";

import {useToast} from "vue-toastification";
import {useI18n} from "vue-i18n";

const useI18nN = useI18n()
const toast = useToast();

const form = useForm({
    email: null,
    password: null,
    remember_me: false,
})

// eslint-disable-next-line no-undef
const login = () => {
    form.post(route('login'), {
        onError: () => toast.error(useI18nN.t('error.something_happened'), {
            timeout: 2000,
        }),
        onSuccess: () => {
            //     TODO: Add login
            toast.success(useI18nN.t('auth.login_successfully'), {
                timeout: 2000,
            })
            // router.push("/");
        }
    })
}


// Define a validation schema
const schema = yup.object({
    email: yup.string().required(useI18nN.t('validation.required', {
        attribute: useI18nN.t('auth.email'),
    })).email(useI18nN.t('validation.email', {
        attribute: useI18nN.t('auth.email'),
    })),
    password: yup.string().required(useI18nN.t('validation.required', {
        attribute: useI18nN.t('auth.password'),
    })).min(8, useI18nN.t('validation.gte.string', {
        attribute: useI18nN.t('auth.password'),
        value: 8,
    })),
})

const onSubmit = async () => {
    try {
        form.clearErrors()
        await schema.validate(form.data(), { abortEarly: false });
        login();
    } catch (error) {
        if (error.inner) {
            const errors = {};
            error.inner.forEach((e) => {
                errors[e.path] = e.message;
            });
            form.setError(errors)
        }
    }
}


</script>
<style lang="scss">
</style>
