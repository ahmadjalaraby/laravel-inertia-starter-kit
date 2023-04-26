<template>
  <Link :href="route('dashboard')">
    <img
      src="@/assets/images/logo/logo.svg"
      alt=""
      v-if="!useThemeSettingsStore().isDark"
    />

    <img
      src="@/assets/images/logo/logo-white.svg"
      alt=""
      v-if="useThemeSettingsStore().isDark"
    />
  </Link>
</template>
<script setup>
import {Link} from '@inertiajs/vue3'
import {useThemeSettingsStore} from "@/store/themeSettings";
</script>
