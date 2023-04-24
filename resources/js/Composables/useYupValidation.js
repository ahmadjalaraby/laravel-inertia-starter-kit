// import {watch} from "vue";
//
// export const useYupValidation = async (form, schema) => {
//     let touchedFields = new Set();
//     let needsValidation = false;
//
//     watch(() => form.data(), (newData, oldData) => {
//         let changedFields = Object.keys(newData).filter(field => newData[field] !== oldData[field]);
//
//         touchedFields = new Set([...changedFields, ...touchedFields]);
//
//         needsValidation = true;
//     });
//
//     function validate() {
//         try {
//             schema.validate(form.data(), {abortEarly: false});
//         } catch (error) {
//             if (error.inner) {
//                 const errors = {};
//
//                 error.inner.forEach((e) => {
//                     errors[e.path] = e.message;
//                 });
//                 console.log(errors)
//                 form.clearErrors().setError(errors)
//             }
//         }
//     }
//
//     return {validate}
// }
