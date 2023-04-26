warning: CRLF will be replaced by LF in resources/js/vue-i18n-locales.js.
The file will have its original line endings in your working directory
[1mdiff --git a/lang/ar/dashboard.php b/lang/ar/dashboard.php[m
[1mindex c489c7b..abf9658 100644[m
[1m--- a/lang/ar/dashboard.php[m
[1m+++ b/lang/ar/dashboard.php[m
[36m@@ -10,8 +10,8 @@[m
     'copyright' => 'جميع الحقوق :year، محفوظة لعلامة :name',[m
     'handcrafted' => '❤️',[m
     'tags' => 'التصنيفات',[m
[31m-    'create_tag' => 'إنشاء تصنيف',[m
[31m-    'list_tag' => 'قائمة التصنيفات',[m
[32m+[m[32m    'tags_create' => 'إنشاء تصنيف',[m
[32m+[m[32m    'tags_index' => 'قائمة التصنيفات',[m
     'new' => 'جديد ',[m
     'edit' => 'تعديل ',[m
     'delete' => 'حذف ',[m
[1mdiff --git a/lang/en/dashboard.php b/lang/en/dashboard.php[m
[1mindex ef38949..415d1cf 100644[m
[1m--- a/lang/en/dashboard.php[m
[1m+++ b/lang/en/dashboard.php[m
[36m@@ -11,8 +11,8 @@[m
     'copyright' => 'Copyright :year, :name all rights reserved.',[m
     'handcrafted' => '❤️',[m
     'tags' => 'Tags',[m
[31m-    'create_tag' => 'Create Tag',[m
[31m-    'list_tag' => 'Tags List',[m
[32m+[m[32m    'tags.create' => 'Create Tag',[m
[32m+[m[32m    'tags.index' => 'Tags List',[m
     'new' => 'New',[m
     'edit' => 'Edit',[m
     'delete' => 'Delete',[m
[1mdiff --git a/phpunit.xml b/phpunit.xml[m
[1mdeleted file mode 100644[m
[1mindex e9f533d..0000000[m
[1m--- a/phpunit.xml[m
[1m+++ /dev/null[m
[36m@@ -1,31 +0,0 @@[m
[31m-<?xml version="1.0" encoding="UTF-8"?>[m
[31m-<phpunit xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"[m
[31m-         xsi:noNamespaceSchemaLocation="./vendor/phpunit/phpunit/phpunit.xsd"[m
[31m-         bootstrap="vendor/autoload.php"[m
[31m-         colors="true"[m
[31m->[m
[31m-    <testsuites>[m
[31m-        <testsuite name="Unit">[m
[31m-            <directory suffix="Test.php">./tests/Unit</directory>[m
[31m-        </testsuite>[m
[31m-        <testsuite name="Feature">[m
[31m-            <directory suffix="Test.php">./tests/Feature</directory>[m
[31m-        </testsuite>[m
[31m-    </testsuites>[m
[31m-    <source>[m
[31m-        <include>[m
[31m-            <directory suffix=".php">./app</directory>[m
[31m-        </include>[m
[31m-    </source>[m
[31m-    <php>[m
[31m-        <env name="APP_ENV" value="testing"/>[m
[31m-        <env name="BCRYPT_ROUNDS" value="4"/>[m
[31m-        <env name="CACHE_DRIVER" value="array"/>[m
[31m-        <!-- <env name="DB_CONNECTION" value="sqlite"/> -->[m
[31m-        <!-- <env name="DB_DATABASE" value=":memory:"/> -->[m
[31m-        <env name="MAIL_MAILER" value="array"/>[m
[31m-        <env name="QUEUE_CONNECTION" value="sync"/>[m
[31m-        <env name="SESSION_DRIVER" value="array"/>[m
[31m-        <env name="TELESCOPE_ENABLED" value="false"/>[m
[31m-    </php>[m
[31m-</phpunit>[m
[1mdiff --git a/resources/js/Components/Breadcrumbs/Breadcrumbs2.vue b/resources/js/Components/Breadcrumbs/Breadcrumbs2.vue[m
[1mindex 14004f9..28e1d89 100644[m
[1m--- a/resources/js/Components/Breadcrumbs/Breadcrumbs2.vue[m
[1m+++ b/resources/js/Components/Breadcrumbs/Breadcrumbs2.vue[m
[36m@@ -1,17 +1,17 @@[m
 <template>[m
     <div class="flex items-center space-x-3 rtl:space-x-reverse">[m
         <h4[m
[31m-            v-if="this.$page.props.name && !this.$page.props.meta?.groupParent"[m
[32m+[m[32m            v-if="routeVar.name && !routeVar.meta?.groupParent"[m
             :class="[m
[31m-        this.$page.props.meta?.groupParent[m
[32m+[m[32m        routeVar.meta?.groupParent[m
           ? 'lg:border-r lg:border-secondary-500'[m
           : ''[m
       "[m
             class="font-medium lg:text-2xl text-xl capitalize text-slate-900 inline-block pr-4"[m
         >[m
[31m-            {{ this.$page.props.meta?.groupParent }}[m
[32m+[m[32m            {{ routeVar.meta?.groupParent }}[m
         </h4>[m
[31m-        <ul class="breadcrumbs" v-if="this.$page.props.meta?.groupParent">[m
[32m+[m[32m        <ul class="breadcrumbs" v-if="routeVar.meta?.groupParent">[m
             <li class="text-primary-500">[m
                 <Link :href="route('dashboard')" class="text-lg">[m
                     <Icon icon="heroicons-outline:home" />[m
[36m@@ -22,14 +22,14 @@[m
             </li>[m
             <li class="text-primary-500">[m
                 <button type="button" class="capitalize">[m
[31m-                    {{ this.$page.props.name }}[m
[32m+[m[32m                    {{ routeVar.name }}[m
                 </button>[m
                 <span class="breadcrumbs-icon rtl:transform rtl:rotate-180">[m
           <Icon icon="heroicons:chevron-right" />[m
         </span>[m
             </li>[m
             <li class="capitalize text-slate-500 dark:text-slate-400">[m
[31m-                {{ this.$page.props.meta?.groupParent }}[m
[32m+[m[32m                {{ routeVar.meta?.groupParent }}[m
             </li>[m
         </ul>[m
     </div>[m
[36m@@ -37,6 +37,20 @@[m
 <script setup>[m
 import Icon from "@/Components/Icon/index.vue"[m
 import {Link} from '@inertiajs/vue3'[m
[32m+[m[32mimport {computed} from "vue";[m
[32m+[m[32mimport routes from "@/router/route";[m
[32m+[m
[32m+[m[32mconst routeVar = computed([m
[32m+[m[32m    () => routes.find((routeItem) => {[m
[32m+[m[32m        if(routeItem.name === route().current()) {[m
[32m+[m[32m            return routeItem[m
[32m+[m[32m        }[m
[32m+[m[32m        if(routeItem.children.length > 0) {[m
[32m+[m[32m            return routeItem.children.find((child) => child.name = route().current())[m
[32m+[m[32m        }[m
[32m+[m[32m        return null[m
[32m+[m[32m    })[m
[32m+[m[32m)[m
 [m
 </script>[m
 <style lang=""></style>[m
[1mdiff --git a/resources/js/Components/Breadcrumbs/index.vue b/resources/js/Components/Breadcrumbs/index.vue[m
[1mindex 42eebb9..7d1bd9c 100644[m
[1m--- a/resources/js/Components/Breadcrumbs/index.vue[m
[1m+++ b/resources/js/Components/Breadcrumbs/index.vue[m
[36m@@ -1,17 +1,17 @@[m
 <template>[m
     <div class="md:mb-6 mb-4 flex space-x-3 rtl:space-x-reverse">[m
         <h4[m
[31m-            v-if="this.$page.props.name && !this.$page.props.meta?.groupParent"[m
[32m+[m[32m            v-if="routeVar.name && !routeVar.meta?.groupParent"[m
             :class="[m
[31m-        this.$page.props.meta?.groupParent[m
[32m+[m[32m        routeVar.meta?.groupParent[m
           ? 'lg:border-r lg:border-secondary-500'[m
           : ''[m
       "[m
             class="font-medium lg:text-2xl text-xl capitalize text-slate-900 inline-block ltr:pr-4 rtl:pl-4"[m
         >[m
[31m-            {{ useI18n().t('dashboard.'+this.$page.props.name.replace("-", "")) }}[m
[32m+[m[32m            {{ useI18n().t('dashboard.'+routeVar.name.replace("-", "")) }}[m
         </h4>[m
[31m-        <ul class="breadcrumbs" v-if="this.$page.props.meta?.groupParent">[m
[32m+[m[32m        <ul class="breadcrumbs" v-if="routeVar.meta?.groupParent">[m
             <li class="text-primary-500">[m
                 <Link :href="route('dashboard')" class="text-lg">[m
                     <Icon icon="heroicons-outline:home" />[m
[36m@@ -22,30 +22,29 @@[m
             </li>[m
             <li class="text-primary-500">[m
                 <button type="button" class="capitalize">[m
[31m-                    {{ this.$page.props.meta?.groupParent }}[m
[32m+[m[32m                    {{ useI18n().t('dashboard.'+routeVar.meta?.groupParent) }}[m
                 </button>[m
                 <span class="breadcrumbs-icon rtl:transform rtl:rotate-180">[m
           <Icon icon="heroicons:chevron-right" />[m
         </span>[m
             </li>[m
             <li class="capitalize text-slate-500 dark:text-slate-400">[m
[31m-                {{ this.$page.props.name.replace("-", " ") }}[m
[32m+[m[32m                {{ useI18n().t('dashboard.'+routeVar.name.replace(".", "_")) }}[m
             </li>[m
         </ul>[m
     </div>[m
 </template>[m
[31m-<script>[m
[32m+[m[32m<script setup>[m
 import Icon from "@/Components/Icon/index.vue";[m
 import {useI18n} from "vue-i18n";[m
[31m-import {Link} from "@inertiajs/vue3";[m
[32m+[m[32mimport {Link, usePage} from "@inertiajs/vue3";[m
[32m+[m[32mimport useRoute from "@/Composables/useRoute";[m
[32m+[m[32mimport {watch} from "vue";[m
[32m+[m
[32m+[m[32mconst routeVar = useRoute()[m
[32m+[m
[32m+[m
 [m
[31m-export default {[m
[31m-    methods: {useI18n},[m
[31m-    components: {[m
[31m-        Icon,[m
[31m-        Link,[m
[31m-    },[m
[31m-};[m
 </script>[m
 <style lang="scss">[m
 .breadcrumbs {[m
[1mdiff --git a/resources/js/Components/Sidebar/index.vue b/resources/js/Components/Sidebar/index.vue[m
[1mindex 2c88d0a..402bdc1 100644[m
[1m--- a/resources/js/Components/Sidebar/index.vue[m
[1m+++ b/resources/js/Components/Sidebar/index.vue[m
[36m@@ -141,11 +141,11 @@[m [mexport default defineComponent({[m
                     link: "#",[m
                     child: [[m
                         {[m
[31m-                            childtitle: useI18n().t('dashboard.create_tag'),[m
[32m+[m[32m                            childtitle: useI18n().t('dashboard.tags_create'),[m
                             childlink: 'tags.index',[m
                         },[m
                         {[m
[31m-                            childtitle: useI18n().t('dashboard.list_tag'),[m
[32m+[m[32m                            childtitle: useI18n().t('dashboard.tags_index'),[m
                             childlink: 'tags.index',[m
                         },[m
                     ],[m
[1mdiff --git a/resources/js/Layouts/AuthenticatedLayout.vue b/resources/js/Layouts/AuthenticatedLayout.vue[m
[1mindex 240f363..6cb6551 100644[m
[1m--- a/resources/js/Layouts/AuthenticatedLayout.vue[m
[1m+++ b/resources/js/Layouts/AuthenticatedLayout.vue[m
[36m@@ -31,7 +31,7 @@[m
             class="content-wrapper transition-all duration-150"[m
         >[m
             <div[m
[31m-                :class="this.$page.props.meta?.appheight ? 'h-full' : 'page-min-height'"[m
[32m+[m[32m                :class="routeVar.meta?.appheight ? 'h-full' : 'page-min-height'"[m
                 class="page-content"[m
             >[m
                 <div[m
[36m@@ -41,7 +41,7 @@[m
               : 'container-fluid'[m
           }`"[m
                 >[m
[31m-                    <Breadcrumbs v-if="!this.$page.props.meta?.hide"/>[m
[32m+[m[32m                    <Breadcrumbs v-if="!routeVar.meta?.hide"/>[m
                     <!--                    <router-view v-slot="{ Component }">-->[m
                     <!--                        <transition name="router-animation" mode="out-in" appear>-->[m
                     <!--                            <component :is="Component" v-bind="$page.props"></component>-->[m
[36m@@ -49,7 +49,7 @@[m
                     <!--                    </router-view>-->[m
 [m
                     <!--                    <transition appear mode="out-in" name="router-animation">-->[m
[31m-                    <slot v-bind="$page.props"/>[m
[32m+[m[32m                    <slot />[m
                     <!--                    </transition>-->[m
                 </div>[m
             </div>[m
[36m@@ -71,8 +71,10 @@[m [mimport Sidebar from "../components/Sidebar/index.vue";[m
 import MobileSidebar from "@/components/Sidebar/MobileSidebar.vue";[m
 import FooterMenu from "@/components/Footer/FooterMenu.vue";[m
 import useWindowSize from "@/Composables/useWindow";[m
[32m+[m[32mimport useRoute from "@/Composables/useRoute";[m
 [m
 [m
[32m+[m[32mconst routeVar = useRoute()[m
 const window = useWindowSize()[m
 [m
 const switchHeaderClass = () => {[m
[1mdiff --git a/resources/js/app.js b/resources/js/app.js[m
[1mindex c9d5961..f39db4b 100644[m
[1m--- a/resources/js/app.js[m
[1m+++ b/resources/js/app.js[m
[36m@@ -15,6 +15,7 @@[m [mimport "vue-toastification/dist/index.css";[m
 import "./assets/scss/auth.scss";[m
 import "./assets/scss/tailwind.scss";[m
 import "./assets/scss/toast.scss";[m
[32m+[m[32mimport routes from "@/router/route";[m
 [m
 const pinia = createPinia()[m
 [m
[36m@@ -38,8 +39,8 @@[m [mconst appName = window.document.getElementsByTagName('title')[0]?.innerText || '[m
 //         },[m
 //     }[m
 // }[m
[31m-[m
[31m-[m
[32m+[m[32m//[m
[32m+[m[32m//[m
 [m
 createInertiaApp({[m
     title: (title) => `${title} - ${appName}`,[m
[1mdiff --git a/resources/js/router/route.js b/resources/js/router/route.js[m
[1mindex 300acd7..77ca78c 100644[m
[1m--- a/resources/js/router/route.js[m
[1m+++ b/resources/js/router/route.js[m
[36m@@ -1,51 +1,51 @@[m
[31m-//[m
[31m-// const routes = [[m
[31m-//     {[m
[31m-//         path: "/",[m
[31m-//         name: "Layout",[m
[31m-//         redirect: "/dashboard",[m
[31m-//         // component: () => import("@/Layouts/AuthenticatedLayout.vue"),[m
[31m-//         // beforeEnter: auth,[m
[31m-//         children: [[m
[31m-//             {[m
[31m-//                 path: "/",[m
[31m-//                 name: 'dashboard',[m
[31m-//                 component: () => import("@/Pages/Dashboard.vue"),[m
[31m-//             },[m
[31m-//             {[m
[31m-//                 path: "/dashboard",[m
[31m-//                 name: 'dashboard',[m
[31m-//                 component: () => import("@/Pages/Dashboard.vue"),[m
[31m-//             },[m
[31m-//             {[m
[31m-//                 path: "/tags",[m
[31m-//                 name: "tags.index",[m
[31m-//                 component: () => import("@/Pages/Tag/Index.vue"),[m
[31m-//                 meta: {[m
[31m-//                     groupParent: "tags",[m
[31m-//                 },[m
[31m-//             },[m
[31m-//             {[m
[31m-//                 path: "notifications",[m
[31m-//                 name: "notifications",[m
[31m-//                 component: () => import("@/Pages/Dashboard.vue"),[m
[31m-//                 meta: {[m
[31m-//                     hide: true,[m
[31m-//                 },[m
[31m-//             },[m
[31m-//         ],[m
[31m-//     },[m
[31m-//     {[m
[31m-//         path: "/login",[m
[31m-//         name: "Login",[m
[31m-//         // beforeEnter: guest,[m
[31m-//         component: () => import("@/Pages/Auth/Login.vue"),[m
[31m-//     },[m
[31m-//     {[m
[31m-//         path: "/:catchAll(.*)",[m
[31m-//         name: "404",[m
[31m-//         component: () => import("@/Pages/Error/404.vue"),[m
[31m-//     },[m
[31m-//[m
[31m-// ];[m
[31m-// export default routes;[m
[32m+[m
[32m+[m[32mconst routes = [[m
[32m+[m[32m    {[m
[32m+[m[32m        path: "/",[m
[32m+[m[32m        name: "Layout",[m
[32m+[m[32m        redirect: "/dashboard",[m
[32m+[m[32m        // component: () => import("@/Layouts/AuthenticatedLayout.vue"),[m
[32m+[m[32m        // beforeEnter: auth,[m
[32m+[m[32m        children: [[m
[32m+[m[32m            {[m
[32m+[m[32m                path: "/",[m
[32m+[m[32m                name: 'dashboard',[m
[32m+[m[32m                component: () => import("@/Pages/Dashboard.vue"),[m
[32m+[m[32m            },[m
[32m+[m[32m            {[m
[32m+[m[32m                path: "/dashboard",[m
[32m+[m[32m                name: 'dashboard',[m
[32m+[m[32m                component: () => import("@/Pages/Dashboard.vue"),[m
[32m+[m[32m            },[m
[32m+[m[32m            {[m
[32m+[m[32m                path: "/tags",[m
[32m+[m[32m                name: "tags.index",[m
[32m+[m[32m                component: () => import("@/Pages/Tag/Index.vue"),[m
[32m+[m[32m                meta: {[m
[32m+[m[32m                    groupParent: "tags",[m
[32m+[m[32m                },[m
[32m+[m[32m            },[m
[32m+[m[32m            {[m
[32m+[m[32m                path: "notifications",[m
[32m+[m[32m                name: "notifications",[m
[32m+[m[32m                component: () => import("@/Pages/Das