import guest from "@/middleware/guest";
import auth from "@/middleware/guest";

const routes = [
    {
        path: "/",
        name: "Layout",
        redirect: "/dashboard",
        // component: () => import("@/Layouts/AuthenticatedLayout.vue"),
        // beforeEnter: auth,
        children: [
            {
                path: "/dashboard",
                name: "dashboard",
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
];
export default routes;
