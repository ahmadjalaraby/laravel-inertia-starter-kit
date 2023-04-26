import { reactive, onMounted, onBeforeUnmount } from 'vue';

export default function useWindowSize() {
    const windowSize = reactive({
        width: window.innerWidth,
        height: window.innerHeight,
    });

    const handleResize = () => {
        windowSize.width = window.innerWidth;
        windowSize.height = window.innerHeight;
    };

    onMounted(() => {
        window.addEventListener('resize', handleResize);
    });

    onBeforeUnmount(() => {
        window.removeEventListener('resize', handleResize);
    });

    return windowSize;
}
