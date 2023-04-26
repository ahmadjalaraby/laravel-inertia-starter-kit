import {computed, ref, watch} from "vue";
import routes from "@/router/route";
import {usePage} from "@inertiajs/vue3";

export default function useRoute() {
    const currentRouteName = ref(route().current());
    const matchedRoute = computed(() => {
        for (const routeItem of routes) {
            if (routeItem.name === currentRouteName.value) {
                return routeItem;
            } else if (routeItem.children && routeItem.children.length > 0) {
                const matchedChild = routeItem.children.find(
                    (child) => child.name === currentRouteName.value
                );
                if (matchedChild) {
                    return matchedChild;
                }
            }
        }
        return null;
    });

    watch(() => usePage().url, (newValue) => {
        currentRouteName.value = route().current();
    });

    return matchedRoute;
}
