<template>
    <button
        v-if="!link && !div"
        :class="`
    ${isLoading ? ' pointer-events-none' : ''}
    ${isDisabled ? ' opacity-40 cursor-not-allowed' : ''}
    ${btnClass}
    `"
        :disabled="isDisabled"
        class="btn inline-flex justify-center"
        v-bind="$attrs"
    >
        <template v-if="!isLoading && !$slots.default">
      <span class="flex items-center">
        <span
            v-if="icon"
            :class="`
          ${iconPosition === 'right' ? 'order-1 ltr:ml-2 rtl:mr-2' : ' '}
          ${text && iconPosition === 'left' ? 'ltr:mr-2 rtl:ml-2' : ''}

          ${iconClass}

          `"
        ><Icon :icon="icon"
        /></span>
        <span v-if="text">{{ text }}</span>
      </span>
        </template>
        <template v-if="isLoading">
            <svg
                :class="loadingClass"
                class="animate-spin ltr:-ml-1 ltr:mr-3 rtl:-mr-1 rtl:ml-3 h-5 w-5"
                fill="none"
                viewBox="0 0 24 24"
                xmlns="http://www.w3.org/2000/svg"
            >
                <circle
                    class="opacity-25"
                    cx="12"
                    cy="12"
                    r="10"
                    stroke="currentColor"
                    stroke-width="4"
                ></circle>
                <path
                    class="opacity-75"
                    d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
                    fill="currentColor"
                ></path>
            </svg>
            Loading ...
        </template>
        <div v-if="$slots.default && !isLoading">
            <slot></slot>
        </div>
    </button>

    <Link
        v-if="link && !div"
        :class="`
    ${isLoading ? ' pointer-events-none' : ''}
    ${isDisabled ? ' opacity-40 cursor-not-allowed' : ''}
    ${btnClass}
    `"
        :to="link"
        class="btn inline-flex justify-center"
    >
        <template v-if="!isLoading && !$slots.default">
      <span class="flex items-center">
        <span
            v-if="icon"
            :class="`
          ${iconPosition === 'right' ? 'order-1 ltr:ml-2 rtl:mr-2' : ' '}
          ${text && iconPosition === 'left' ? 'ltr:mr-2 rtl:ml-2' : ''}

          ${iconClass}

          `"
        ><Icon :icon="icon"
        /></span>
        <span v-if="text">{{ text }}</span>
      </span>
        </template>
        <template v-if="isLoading">
            <svg
                :class="loadingClass"
                class="animate-spin -ml-1 mr-3 h-5 w-5"
                fill="none"
                viewBox="0 0 24 24"
                xmlns="http://www.w3.org/2000/svg"
            >
                <circle
                    class="opacity-25"
                    cx="12"
                    cy="12"
                    r="10"
                    stroke="currentColor"
                    stroke-width="4"
                ></circle>
                <path
                    class="opacity-75"
                    d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
                    fill="currentColor"
                ></path>
            </svg>
            Loading ...
        </template>
        <div v-if="$slots.default && !isLoading">
            <slot></slot>
        </div>
    </Link>
    <div
        v-if="div && !link"
        :class="`
    ${isLoading ? ' pointer-events-none' : ''}
    ${isDisabled ? ' opacity-40 cursor-not-allowed' : ''}
    ${btnClass}
    `"
        class="btn inline-flex justify-center"
    >
        <template v-if="!isLoading && !$slots.default">
      <span class="flex items-center">
        <span
            v-if="icon"
            :class="`
          ${iconPosition === 'right' ? 'order-1 ltr:ml-2 rtl:mr-2' : ' '}
          ${text && iconPosition === 'left' ? 'ltr:mr-2 rtl:ml-2' : ''}

          ${iconClass}

          `"
        ><Icon :icon="icon"
        /></span>
        <span v-if="text">{{ text }}</span>
      </span>
        </template>
        <template v-if="isLoading">
            <svg
                :class="loadingClass"
                class="animate-spin -ml-1 mr-3 h-5 w-5"
                fill="none"
                viewBox="0 0 24 24"
                xmlns="http://www.w3.org/2000/svg"
            >
                <circle
                    class="opacity-25"
                    cx="12"
                    cy="12"
                    r="10"
                    stroke="currentColor"
                    stroke-width="4"
                ></circle>
                <path
                    class="opacity-75"
                    d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
                    fill="currentColor"
                ></path>
            </svg>
            Loading ...
        </template>
        <div v-if="$slots.default && !isLoading">
            <slot></slot>
        </div>
    </div>
</template>
<script>
import Icon from "@/Components/Icon/index.vue";
import {Link} from '@inertiajs/vue3'

export default {
    components: {
        Icon,
        Link,
    },
    name: "Button",
    props: {
        text: {
            type: String,
            default: "",
        },
        isDisabled: {
            type: Boolean,
            default: false,
        },
        isLoading: {
            type: Boolean,
            default: false,
        },
        btnClass: {
            type: String,
            default: "bg-primary-500 text-white",
        },
        icon: {
            type: String,
            default: "",
        },
        iconPosition: {
            type: String,
            default: "left",
        },
        iconClass: {
            type: String,
            default: "text-[20px]",
        },
        loadingClass: {
            type: String,
            default: "",
        },
        link: {
            type: String,
            default: "",
        },
        div: {
            type: Boolean,
            default: false,
        },
    },
};
</script>
<style lang="scss"></style>
