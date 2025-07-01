<template>
  <div class="min-h-screen bg-gray-50">
    <!-- Navigation -->
    <nav
      :class="[
        'w-full shadow-md border-b sticky top-0 z-30 transition-colors',
        scrolled ? 'bg-white border-gray-100' : 'bg-transparent absolute top-0 left-0 border-transparent'
      ]"
    >
      <div class="max-w-7xl mx-auto px-4 py-3 flex items-center justify-between gap-4 flex-wrap">
        <div class="flex items-center gap-2 sm:gap-4 flex-shrink-0">
          <a href="/" :class="['text-xl font-bold heading transition-colors', scrolled ? 'text-[#1E293B]' : 'text-white']">Road Ready</a>
        </div>
        <div class="flex-1 flex justify-end items-center gap-4 min-w-[48px] mt-2 sm:mt-0">
          <UButton to="/login" variant="ghost" :class="['text-[#1E293B] hover:bg-gray-100']">
            Login
          </UButton>
          <UButton to="/shop" variant="ghost" :class="['text-[#1E293B] hover:bg-gray-100']">
            Shop
          </UButton>
          <UButton to="/landingpage" color="primary" class="font-semibold px-6 py-2 rounded-lg">
            Get Started
          </UButton>
        </div>
      </div>
    </nav>

    <!-- Page Header -->
    <section class="py-16 bg-white">
      <div class="max-w-7xl mx-auto px-4 text-center">
        <h1 class="text-4xl md:text-5xl font-extrabold text-gray-900 heading mb-6">
          Everything We Recommend to Drive Smarter
        </h1>
        <p class="text-lg text-gray-600 max-w-4xl mx-auto leading-relaxed">
          These aren't required — just helpful tools to protect yourself, stay alert, and keep your record clean. If you buy through these links, we may earn a small commission at no extra cost to you.
        </p>
      </div>
    </section>

    <!-- Product Categories -->
    <section class="py-8">
      <div class="max-w-7xl mx-auto px-4 space-y-16">
        <div v-for="category in categories" :key="category.name">
          <h2 class="text-2xl md:text-3xl font-bold text-[#1E293B] mb-8 text-center">{{ category.name }}</h2>
          <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-8">
            <div v-for="product in category.products" :key="product.name" class="bg-white rounded-xl shadow-sm border border-gray-100 flex flex-col h-full">
              <img :src="product.img" :alt="product.name" class="w-full h-48 object-contain rounded-t-xl bg-gray-100" loading="lazy" />
              <div class="flex-1 flex flex-col p-6">
                <h3 class="text-lg font-semibold text-[#1E293B] mb-2">{{ product.name }}</h3>
                <p class="text-gray-600 text-sm mb-4">{{ product.description }}</p>
                <UButton :to="product.url" target="_blank" color="primary" class="mt-auto w-full flex items-center justify-center gap-2">
                  <UIcon name="i-simple-icons-amazon" class="w-5 h-5" />
                  View on Amazon
                </UButton>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import { useHead } from '#imports'
import { useRoute, useRouter, NuxtLink } from '#app'

// Nav scroll state
const scrolled = ref(false)
onMounted(() => {
  const onScroll = () => {
    scrolled.value = window.scrollY > 40
  }
  window.addEventListener('scroll', onScroll)
  onScroll()
  onUnmounted(() => {
    window.removeEventListener('scroll', onScroll)
  })
})

// Helper to extract ASIN from Amazon URL
function getAmazonASIN(url) {
  const match = url.match(/\/dp\/([A-Z0-9]{10})/i)
  return match ? match[1] : ''
}

// Product data
const products = [
  {
    id: 1,
    name: "Nexar Beam GPS Dash Cam",
    description: "Capture every drive. Protect your side of the story with this smart, app-connected dash cam.",
    amazonUrl: "https://www.amazon.com/dp/B08LLGN5RG"
  },
  {
    id: 2,
    name: "iOttie Easy One Touch 5 Phone Mount",
    description: "Secure your phone without distraction. This vent mount locks in one-handed for safer driving.",
    amazonUrl: "https://www.amazon.com/dp/B08GG9FDZP"
  },
  {
    id: 3,
    name: "NOCO Boost Plus GB40 Jump Starter",
    description: "Dead battery? Jump your car without waiting for help — or a stranger.",
    amazonUrl: "https://www.amazon.com/dp/B015TKUPIC"
  },
  {
    id: 4,
    name: "Lifeline AAA Premium Roadside Kit",
    description: "Everything you need if your car breaks down — from jumper cables to an emergency blanket.",
    amazonUrl: "https://www.amazon.com/dp/B00GJ4WH5E"
  },
  {
    id: 5,
    name: "Resqme Emergency Tool (2-Pack)",
    description: "Break glass and cut seatbelts in an emergency. It stays on your keychain — just in case.",
    amazonUrl: "https://www.amazon.com/dp/B00LAU5CW0"
  },
  {
    id: 6,
    name: "Chemical Guys Total Interior Cleaner & Protectant",
    description: "Wipe down your dash, seats, and screens in one go. Clean car, clean mindset.",
    amazonUrl: "https://www.amazon.com/dp/B00F4EDE98"
  },
  {
    id: 7,
    name: "EPAuto Digital Tire Inflator",
    description: "Low tire? Plug into your car, inflate in minutes, and drive with peace of mind.",
    amazonUrl: "https://www.amazon.com/dp/B01L9WSTEG"
  },
  {
    id: 8,
    name: "Lusso Gear Car Trash Can with Lid",
    description: "Keep your car clean and ticket-free with this leakproof, compact trash bin.",
    amazonUrl: "https://www.amazon.com/dp/B01KZIDNT0"
  },
  {
    id: 9,
    name: "AUKEY HD Dash Cam DR02",
    description: "A budget-friendly dash cam with 1080p and night vision — simple but effective.",
    amazonUrl: "https://www.amazon.com/dp/B077Y6PHKQ"
  },
  {
    id: 10,
    name: "Kenu Airframe+ Vent Mount",
    description: "Minimalist and sturdy — perfect for those who want their phone visible but out of the way.",
    amazonUrl: "https://www.amazon.com/dp/B00LU5LWQK"
  }
].map(product => ({
  ...product,
  amazonImage: product.amazonUrl && getAmazonASIN(product.amazonUrl)
    ? `https://ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=${getAmazonASIN(product.amazonUrl)}&Format=_SL500_&ID=AsinImage&MarketPlace=US&ServiceVersion=20070822&WS=1&tag=roadready-20`
    : '/images/products/placeholder.jpg'
}))

// Set page title
useHead({
  title: 'Shop - Road Ready',
  meta: [
    { name: 'description', content: 'Everything we recommend to drive smarter. Helpful tools to protect yourself, stay alert, and keep your record clean.' }
  ]
})

const categories = [
  {
    name: 'Dash Cams',
    products: [
      {
        name: 'Nexar Beam GPS Dash Cam',
        img: 'https://m.media-amazon.com/images/I/71Q8gm97H8L._AC_SL1500_.jpg',
        description: 'Capture every drive. Protect your side of the story with this smart, app-connected dash cam.',
        url: 'https://www.amazon.com/dp/B08LLGN5RG',
      },
      {
        name: 'AUKEY HD Dash Cam DR02',
        img: 'https://m.media-amazon.com/images/I/61vQ1Z1QnGL._AC_SL1500_.jpg',
        description: 'A budget-friendly dash cam with 1080p and night vision — simple but effective.',
        url: 'https://www.amazon.com/dp/B077Y6PHKQ',
      },
    ],
  },
  {
    name: 'Phone Mounts',
    products: [
      {
        name: 'iOttie Easy One Touch 5 Phone Mount',
        img: 'https://m.media-amazon.com/images/I/71Q8gm97H8L._AC_SL1500_.jpg',
        description: 'Secure your phone without distraction. This vent mount locks in one-handed for safer driving.',
        url: 'https://www.amazon.com/dp/B08GG9FDZP',
      },
      {
        name: 'Kenu Airframe+ Vent Mount',
        img: 'https://m.media-amazon.com/images/I/61Qe0euJJZL._AC_SL1500_.jpg',
        description: 'Minimalist and sturdy — perfect for those who want their phone visible but out of the way.',
        url: 'https://www.amazon.com/dp/B00LU5LWQK',
      },
    ],
  },
  {
    name: 'Emergency & Roadside Safety',
    products: [
      {
        name: 'NOCO Boost Plus GB40 Jump Starter',
        img: 'https://m.media-amazon.com/images/I/81FQ4l6lGUL._AC_SL1500_.jpg',
        description: 'Dead battery? Jump your car without waiting for help — or a stranger.',
        url: 'https://www.amazon.com/dp/B015TKUPIC',
      },
      {
        name: 'Lifeline AAA Premium Roadside Kit',
        img: 'https://m.media-amazon.com/images/I/81QwQ4Q4QwL._AC_SL1500_.jpg',
        description: 'Everything you need if your car breaks down — from jumper cables to an emergency blanket.',
        url: 'https://www.amazon.com/dp/B00GJ4WH5E',
      },
      {
        name: 'Resqme Emergency Tool (2-Pack)',
        img: 'https://m.media-amazon.com/images/I/71Q8gm97H8L._AC_SL1500_.jpg',
        description: 'Break glass and cut seatbelts in an emergency. It stays on your keychain — just in case.',
        url: 'https://www.amazon.com/dp/B00LAU5CW0',
      },
      {
        name: 'EPAuto Digital Tire Inflator',
        img: 'https://m.media-amazon.com/images/I/81QwQ4Q4QwL._AC_SL1500_.jpg',
        description: 'Low tire? Plug into your car, inflate in minutes, and drive with peace of mind.',
        url: 'https://www.amazon.com/dp/B01L9WSTEG',
      },
    ],
  },
  {
    name: 'Car Cleanliness & Interior',
    products: [
      {
        name: 'Chemical Guys Total Interior Cleaner & Protectant',
        img: 'https://m.media-amazon.com/images/I/81QwQ4Q4QwL._AC_SL1500_.jpg',
        description: 'Wipe down your dash, seats, and screens in one go. Clean car, clean mindset.',
        url: 'https://www.amazon.com/dp/B00F4EDE98',
      },
      {
        name: 'Lusso Gear Car Trash Can with Lid',
        img: 'https://m.media-amazon.com/images/I/81QwQ4Q4QwL._AC_SL1500_.jpg',
        description: 'Keep your car clean and ticket-free with this leakproof, compact trash bin.',
        url: 'https://www.amazon.com/dp/B01KZIDNT0',
      },
    ],
  },
]
</script>

<style scoped>
.line-clamp-2 {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
</style> 