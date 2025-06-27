// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2025-05-15',
  devtools: { enabled: true },
  
  modules: [
    '@nuxt/ui'
  ],
  
  css: [
    '~/assets/css/main.css'
  ],
  
  app: {
    head: {
      title: 'Florida BDI Course - Basic Driver Improvement',
      meta: [
        { charset: 'utf-8' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1' },
        { name: 'description', content: 'Complete your Florida Basic Driver Improvement course online. State-approved, self-paced, and designed to keep you safe on the road.' }
      ]
    }
  }
})
