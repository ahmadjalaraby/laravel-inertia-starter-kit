export default function auth ({ next, store }){
  if (localStorage.activeUser) {
    return next({name: 'dashboard'})
  }
  return next()
}
