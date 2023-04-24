import guest from "@/middleware/guest";
import auth from "@/middleware/auth";

import {createI18n} from "vue-i18n";

const { global : {t, locale}} = createI18n()


const routes = [
    {
        path: "/",
        name: "Layout",
        redirect: "/dashboard",
        // component: () => import("@/Layouts/AuthenticatedLayout.vue"),
        // beforeEnter: auth,
        children: [
            {
                path: "/",
                name: 'dashboard',
                component: () => import("@/Pages/Dashboard.vue"),
            },
            {
                path: "/dashboard",
                name: 'dashboard',
                component: () => import("@/Pages/Dashboard.vue"),
            },
            {
                path: "notifications",
                name: "notifications",
                component: () => import("@/Pages/Dashboard.vue"),
                meta: {
                    hide: true,
                },
            },
        ],
    },
    {
        path: "/login",
        name: "Login",
        // beforeEnter: guest,
        component: () => import("@/Pages/Auth/Login.vue"),
    },
    {
        path: "/:catchAll(.*)",
        name: "404",
        component: () => import("@/Pages/Error/404.vue"),
    },

];
export default routes;
