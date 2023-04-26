<template>
    <div id="loading-bg">
        <div class="loading-logo text-center">
            <img :src="logo" alt="Logo"/>
        </div>
        <div class="loading">
            <div class="effect-1 effects"></div>
            <div class="effect-2 effects"></div>
            <div class="effect-3 effects"></div>
        </div>
    </div>
</template>

<script setup>
import logo from "@/assets/images/logo/logo.svg";

</script>
