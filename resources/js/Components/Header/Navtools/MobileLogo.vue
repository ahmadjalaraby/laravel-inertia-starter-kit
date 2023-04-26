<template>
  <Link :href="route('dashboard')">
    <img
      src="@/assets/images/logo/logo-c.svg"
      alt=""
      v-if="!useThemeSettingsStore().isDark"
    />

    <img
      src="@/assets/images/logo/logo-c-white.svg"
      alt=""
      v-if="useThemeSettingsStore().isDark"
    />
  </Link>
</template>
<script setup>
import {useThemeSettingsStore} from "@/store/themeSettings";
import {Link} from "@inertiajs/vue3";
</script>
