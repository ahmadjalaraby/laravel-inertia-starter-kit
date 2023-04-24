import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import vue from '@vitejs/plugin-vue';
import path from 'path'
import i18n from 'laravel-vue-i18n/vite';
import {watch} from "vite-plugin-watch";


export default defineConfig({
    plugins: [
        laravel({
            input: 'resources/js/app.js',
            ssr: 'resources/js/ssr.js',
            refresh: true,
        }),
        vue({
            template: {
                transformAssetUrls: {
                    base: null,
                    includeAbsolute: false,
                },
            },
        }),
        i18n(),
        watch({
            pattern: 'lang/**/*.php',
            command: 'php artisan vue-i18n:generate',
        }),
    ],
    resolve: {
        alias: {
            ziggy: path.resolve('vendor/tightenco/ziggy/dist/vue.es.js'),
        },
    },
});
