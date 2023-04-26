//
// const routes = [
//     {
//         path: "/",
//         name: "Layout",
//         redirect: "/dashboard",
//         // component: () => import("@/Layouts/AuthenticatedLayout.vue"),
//         // beforeEnter: auth,
//         children: [
//             {
//                 path: "/",
//                 name: 'dashboard',
//                 component: () => import("@/Pages/Dashboard.vue"),
//             },
//             {
//                 path: "/dashboard",
//                 name: 'dashboard',
//                 component: () => import("@/Pages/Dashboard.vue"),
//             },
//             {
//                 path: "/tags",
//                 name: "tags.index",
//                 component: () => import("@/Pages/Tag/Index.vue"),
//                 meta: {
//                     groupParent: "tags",
//                 },
//             },
//             {
//                 path: "notifications",
//                 name: "notifications",
//                 component: () => import("@/Pages/Dashboard.vue"),
//                 meta: {
//                     hide: true,
//                 },
//             },
//         ],
//     },
//     {
//         path: "/login",
//         name: "Login",
//         // beforeEnter: guest,
//         component: () => import("@/Pages/Auth/Login.vue"),
//     },
//     {
//         path: "/:catchAll(.*)",
//         name: "404",
//         component: () => import("@/Pages/Error/404.vue"),
//     },
//
// ];
// export default routes;
