import './bootstrap';
import '../css/app.scss';

import {createApp, h} from 'vue';
import {createInertiaApp} from '@inertiajs/vue3';
import {ZiggyVue} from '../../vendor/tightenco/ziggy/dist/vue.m';
import {createPinia} from 'pinia'
import router from './router/index'
import AuthenticatedLayout from './Layouts/AuthenticatedLayout.vue'
import {i18nVue, loadLanguageAsync} from 'laravel-vue-i18n'
import {useThemeSettingsStore} from "@/store/themeSettings";

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
        createApp({render: () => h(App, props)})
            .use(i18nVue, {
                resolve: lang => {
                    const langs = import.meta.globEager('../../lang/*.json');
                    return langs[`../../lang/${lang}.json`].default;
                },
            },)
            .use(plugin)
            .use(pinia)
            .use(router)
            .use(ZiggyVue, Ziggy)
            .mount(el);
        const themeSettingsStore = useThemeSettingsStore()


        console.log(localStorage.getItem("theme"))
        console.log(localStorage.getItem("isDark"))
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
        color: '#4B5563',
    },
});
