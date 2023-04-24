import { defineStore } from 'pinia';
import {loadLanguageAsync, trans, reset, isLoaded} from 'laravel-vue-i18n';

export const useThemeSettingsStore = defineStore('themeSettings',{
    state: () => ({
        sidebarCollaspe: false,
        sidebarHidden: false,
        mobielSidebar: false,
        semidark: false,
        monochrome: false,
        semiDarkTheme: "semi-light",
        isDark: false,
        skin: "default",
        theme: "light",
        isOpenSettings: false,
        cWidth: "full",
        menuLayout: "vertical",
        navbarType: "sticky",
        isMouseHovered: false,
        footerType: "static",
        direction: false,
        language: 'en',
        chartColors: {
            title: "red",
        },
    }),
    actions: {
        setSidebarCollasp() {
            this.sidebarCollasp = !this.sidebarCollasp;
        },

        toogleDark() {
            this.isDark = !this.isDark;
            document.body.classList.remove(this.theme);
            this.theme = this.theme === "dark" ? "light" : "dark";
            document.body.classList.add(this.theme);
            localStorage.setItem("theme", this.theme);
            localStorage.setItem("isDark", this.theme === 'dark');
        },

        toogleRtl(isArabic) {
            this.direction = isArabic;
            if(isArabic) {
                document.documentElement.setAttribute("dir", "rtl");
            } else {
                document.documentElement.setAttribute("dir", "ltr");
            }
            // document.body.classList.remove(this.direction);
            // document.body.classList.add(this.direction);
            localStorage.setItem("direction", this.direction);
        },

        changeLanguage(lang) {
            this.language = lang;

            loadLanguageAsync(lang).then(r => {
                // $i18n.locale = lang
                return r
            });

            if(lang === 'ar') {
                this.toogleRtl(true);
                // document.body.classList.remove("font-sans")
                // document.body.classList.add("font-Tajawal")
            } else {
                this.toogleRtl(false);
                // document.body.classList.remove("font-Tajawal")
                // document.body.classList.add("font-sans")
            }
            localStorage.setItem('language', this.language);

        },

        toggleMonochrome() {
            const isMonochrome = (localStorage.getItem('monochrome') !== null);
            // this.monochrome = !this.monochrome;
            if(isMonochrome) {
                localStorage.removeItem("monochrome");
                document.getElementsByTagName( 'html' )[0].classList.remove('grayscale');
                return;
            }
            localStorage.setItem("monochrome", true);
            document.getElementsByTagName( 'html' )[0].classList.add('grayscale');
            return;
        },

        toggleSettings() {
            this.isOpenSettings = !this.isOpenSettings;
        },
        toggleMsidebar() {
            this.mobielSidebar = !this.mobielSidebar;
        },
        toggleSemiDark() {
            this.semidark = !this.semidark;
            this.semiDarkTheme = this.semidark ? "semi-dark" : "semi-light";
            document.body.classList.toggle(this.semiDarkTheme);
            localStorage.setItem("semiDark", this.semidark);
        },
    },
})
