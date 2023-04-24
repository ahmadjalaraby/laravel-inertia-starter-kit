<template>
  <footer :class="footerClass()">
    <div
      class="site-footer px-6 bg-white dark:bg-slate-800 text-slate-500 dark:text-slate-300 py-4"
    >
      <div class="grid md:grid-cols-2 grid-cols-1 md:gap-5">
        <div class="text-center ltr:md:text-start rtl:md:text-right text-sm">
            {{ useI18n().t('dashboard.copyright', {year: new Date().getFullYear(), name: 'Scribble'}) }}
        </div>
        <div class="ltr:md:text-right rtl:md:text-end text-center text-sm">
            {{ useI18n().t('dashboard.handcrafted') }}
          <a
            href="https://github.com/ahmadjalaraby"
            target="_blank"
            class="text-primary-500 font-semibold"
          >
            Ahmad Jehad
          </a>
        </div>
      </div>
    </div>
  </footer>
</template>
<script>
import {useThemeSettingsStore} from "@/store/themeSettings";
import {useI18n} from "vue-i18n";

export default {
    setup() {
        return useI18n()
    },
  methods: {
      useI18n,
      useThemeSettingsStore,
    footerClass() {
      switch (useThemeSettingsStore().footerType) {
        case "sticky":
          return "sticky bottom-0 z-[999]";
        case "static":
          return "static";
        case "hidden":
          return "hidden";
      }
    },
  },
};
</script>
<style lang=""></style>
