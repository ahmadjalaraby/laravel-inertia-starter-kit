import { computed } from 'vue'


// export function useTranslation() {
//     const __ = (key, replace = {}) => {
//         const language = computed(() => {
//             return this.$page.props.language
//         })
//
//         let translation = language.value[key] ? language.value[key] : key
//
//         Object.keys(replace).forEach(function (key) {
//             translation = translation.replace(':' + key, replace[key])
//         })
//
//         return translation
//     }
//
//     return { __ }
// }


// export default {
//     methods: {
//         __(key, replace = {}) {
//             const language = computed(() => {
//                 return this.$page.props.language
//             })
//
//             let translation = language.value[key] ? language.value[key] : key
//
//             Object.keys(replace).forEach(function (key) {
//                 translation = translation.replace(':' + key, replace[key])
//             })
//
//             return translation
//         },
//
//         // trans(key, replace = {}) {
//         //     return this.__(key, replace = {});
//         // }
//     }
// }
