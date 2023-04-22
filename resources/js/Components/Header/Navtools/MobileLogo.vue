<template>
  <router-link :to="{ name: 'dashboard' }">
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
  </router-link>
</template>
<script setup>
import {useThemeSettingsStore} from "@/store/themeSettings";

</script>
