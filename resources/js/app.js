import './bootstrap';
import '../css/app.scss';

import {createApp, h} from 'vue';
import {createInertiaApp} from '@inertiajs/vue3';
import {ZiggyVue} from '../../vendor/tightenco/ziggy/dist/vue.m';
import {createPinia} from 'pinia'
import router from './router/index'
import AuthenticatedLayout from './Layouts/AuthenticatedLayout.vue'
import {i18nVue} from 'laravel-vue-i18n'
import {useThemeSettingsStore} from "@/store/themeSettings";
import {createI18n} from "vue-i18n";
import Locale from './vue-i18n-locales.js';
import Toast, { POSITION } from "vue-toastification";
import "vue-toastification/dist/index.css";
import "./assets/scss/auth.scss";
import "./assets/scss/tailwind.scss";
import "./assets/scss/toast.scss";


const pinia = createPinia()

const appName = window.document.getElementsByTagName('title')[0]?.innerText || 'Laravel';



createInertiaApp({
    title: (title) => `${title} - ${appName}`,
    // resolve: (name) => resolvePageComponent(`./Pages/${name}.vue`, import.meta.glob('./Pages/**/*.vue')),
    // resolve: name => {
    //     const page = import.meta.glob('./Pages/**/*.vue')
    //     page.layout = page.layout || AuthenticatedLayout
    //     return page
    // },
    resolve: async (name) => {
        const pages = import.meta.glob('./Pages/**/*.vue')
        const page = await pages[`./Pages/${name}.vue`]()
        page.default.layout = page.default.layout || AuthenticatedLayout
        return page
    },
    setup({el, App, props, plugin}) {
        const locale =  props.initialPage.props.locale ?? localStorage.language
        const i18n = createI18n({
            locale: locale,
            globalInjection: true,
            fallbackLocale: 'en',
            messages: Locale,
            legacy: false,
            missingWarn: false,
            fallbackWarn: false,
        })


        createApp({render: () => h(App, props)})
            .use(plugin)
            .use(i18n)
            .use(i18nVue, {
                resolve: async (lang) => {
                    const langs = import.meta.glob('../../lang/*.json');
                    return await langs[`../../lang/php_${lang}.json`]();
                }
            })
            .use(pinia)
            .use(Toast, {
                toastClassName: `dashcode-toast ${locale === 'ar' ? 'dashcode-toast-rtl' : '' }`,
                bodyClassName: `dashcode-toast-body`,
                position: locale === 'ar' ? POSITION.TOP_LEFT : POSITION.TOP_RIGHT,
                shareAppContext: true,
                // rtl: locale === 'ar',
            })
            .use(router)
            .use(ZiggyVue, Ziggy)
            .mount(el);
        const themeSettingsStore = useThemeSettingsStore()


// check localStorage theme for dark light bordered
        if (localStorage.theme === "dark" || localStorage.getItem("isDark") === 'true' ) {
            document.body.classList.add("dark");
            themeSettingsStore.theme = "dark";
            themeSettingsStore.isDark = true;
        } else {
            document.body.classList.add("light");
            themeSettingsStore.theme = "light";
            themeSettingsStore.isDark = false;
        }
        if (localStorage.semiDark === "true") {
            document.body.classList.add("semi-dark");
            themeSettingsStore.semidark = true;
            themeSettingsStore.semiDarkTheme = "semi-dark";
        } else {
            document.body.classList.add("semi-light");
            themeSettingsStore.semidark = false;
            themeSettingsStore.semiDarkTheme = "semi-light";
        }
// check loacl storege for menuLayout
        if (localStorage.menuLayout === "horizontal") {
            themeSettingsStore.menuLayout = "horizontal";
        } else {
            themeSettingsStore.menuLayout = "vertical";
        }

// check skin  for localstorage
        if (localStorage.skin === "bordered") {
            themeSettingsStore.skin = "bordered";
            document.body.classList.add("skin--bordered");
        } else {
            themeSettingsStore.skin = "default";
            document.body.classList.add("skin--default");
        }

        if(localStorage.language === 'ar') {
            useThemeSettingsStore().changeLanguage('ar')
        } else {
            useThemeSettingsStore().changeLanguage('en')
        }

// check direction for localstorage
        if (localStorage.direction === "true") {
            themeSettingsStore.direction = true;
            document.documentElement.setAttribute("dir", "rtl");
        } else {
            themeSettingsStore.direction = false;
            document.documentElement.setAttribute("dir", "ltr");
        }

// Check if the monochrome mode is set or not
        if (localStorage.getItem('monochrome') !== null) {
            themeSettingsStore.monochrome = true;
            document.getElementsByTagName('html')[0].classList.add('grayscale');
        }
    },
    progress: {
        color: '#003e99',
    },
});
