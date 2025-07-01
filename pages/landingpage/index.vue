<template>
  <div class="min-h-screen bg-[#F8FAFC]">
    <!-- Navigation -->
    <nav :class="['w-full z-30 transition-all duration-500', scrolled ? 'bg-white shadow-md border-b border-gray-100 sticky top-0' : 'bg-transparent absolute top-0 left-0']">
      <div class="max-w-7xl mx-auto px-4 py-3 flex items-center justify-between gap-4 flex-wrap">
        <div class="flex items-center gap-2 sm:gap-4 flex-shrink-0">
          <h1 :class="['text-xl font-bold transition-colors duration-300', scrolled ? 'text-[#1E293B]' : 'text-white']">Road Ready</h1>
        </div>
        <div class="flex-1 flex justify-end items-center gap-4 min-w-[48px] mt-2 sm:mt-0">
          <UButton to="/login" variant="ghost" color="primary" :class="['font-semibold', scrolled ? 'text-[#1E293B]' : 'text-white']">
            Login
          </UButton>
          <UButton to="/signup" color="primary" :class="['font-semibold', scrolled ? 'bg-[#3B82F6] hover:bg-[#2563eb] text-white' : 'bg-white text-[#3B82F6] hover:bg-[#3B82F6] hover:text-white border border-white']">
            Get Started
          </UButton>
        </div>
      </div>
    </nav>

    <!-- Hero Section -->
    <section class="relative flex flex-col items-center justify-center min-h-[80vh] py-24 px-4 text-center bg-[#111827]" style="background: linear-gradient(rgba(17,24,39,0.85),rgba(17,24,39,0.85)), url('/road-sunset.jpg') center/cover no-repeat;">
      <h1 class="text-4xl md:text-6xl font-extrabold heading text-white mb-4 leading-tight">
        <span class="text-white">Approved. Online. Easy.</span><br>
        <span class="text-[#3B82F6]">Florida's #1</span> <span class="text-white">Defensive<br class="hidden md:inline" /> Driving Course</span>
      </h1>
      <p class="text-lg md:text-2xl text-[#F3F4F6] mb-8 max-w-2xl mx-auto">
        Reduce your points, dismiss your ticket, or earn an insurance discount — all from your phone or laptop.
      </p>
      <div class="flex flex-col sm:flex-row gap-4 justify-center items-center mb-8">
        <UButton to="/signup" color="primary" size="xl" class="font-bold py-4 px-8 text-lg w-full sm:w-auto bg-[#3B82F6] hover:bg-[#2563eb] text-white border-none">
          Start Your Course Today
        </UButton>
        <UButton variant="outline" size="xl" class="font-semibold py-4 px-8 text-lg border-[#3B82F6] text-[#3B82F6] hover:bg-[#3B82F6] hover:text-white w-full sm:w-auto ring ring-inset ring-[#3B82F6]/50 focus:outline-none focus-visible:ring-2 focus-visible:ring-[#3B82F6]" @click="openEligibilityModal">
          Learn More
        </UButton>
      </div>
      <div class="flex flex-wrap justify-center items-center gap-6 text-[#F3F4F6] text-base font-medium mb-2">
        <div class="flex items-center gap-2"><UIcon name="i-heroicons-check-circle" class="w-5 h-5 text-[#3B82F6]" /> State Approved</div>
        <div class="flex items-center gap-2"><UIcon name="i-heroicons-device-phone-mobile" class="w-5 h-5 text-[#3B82F6]" /> Mobile Friendly</div>
        <div class="flex items-center gap-2"><UIcon name="i-heroicons-document-check" class="w-5 h-5 text-[#3B82F6]" /> Instant Certificate</div>
      </div>
    </section>

    <!-- Trust Badges Section -->
    <section class="py-8 bg-white">
      <div class="max-w-7xl mx-auto px-4">
        <div class="flex flex-wrap justify-center gap-4">
          <span v-for="badge in trustBadges" :key="badge" class="badge">{{ badge }}</span>
        </div>
      </div>
    </section>

    <!-- How It Works Section -->
    <section class="py-16 md:py-24 bg-[#F0F6FF]" id="how-it-works">
      <div class="max-w-3xl mx-auto px-4">
        <div class="text-center mb-12">
          <h2 class="text-3xl md:text-4xl font-extrabold heading text-[#1E293B] mb-2">How It Works</h2>
          <p class="text-lg text-[#6B7280]">Get certified in 4 simple steps</p>
        </div>
        <div class="flex flex-col gap-10">
          <div v-for="(step, i) in howItWorksSteps" :key="step.title" class="flex items-start gap-4">
            <div class="flex-shrink-0 w-12 h-12 rounded-full bg-[#3B82F6] flex items-center justify-center">
              <UIcon :name="step.icon" class="w-7 h-7 text-white" />
            </div>
            <div>
              <h3 class="text-xl font-bold heading text-[#1E293B] mb-1">{{ step.title }}</h3>
              <p class="text-[#6B7280]">{{ step.description }}</p>
            </div>
          </div>
        </div>
        <div class="mt-10 flex justify-center">
          <UButton color="primary" size="lg" class="font-semibold bg-[#3B82F6] hover:bg-[#2563eb] text-white px-8 py-4" @click="openEligibilityModal">
            Check Your Eligibility
          </UButton>
        </div>
      </div>
    </section>

    <!-- This Course Is For Section -->
    <section class="py-6 md:py-10 bg-white">
      <div class="max-w-7xl mx-auto px-4">
        <div class="text-center mb-6">
          <h2 class="text-3xl md:text-4xl font-extrabold text-[#1E293B] heading mb-2 leading-tight">
            This Course Is For
          </h2>
          <p class="text-lg md:text-xl text-[#1E293B] max-w-2xl mx-auto mb-2 leading-relaxed">
            Whether you need to dismiss a ticket, satisfy court requirements, or improve your driving record
          </p>
        </div>
        <div class="flex justify-center">
          <ul class="space-y-2">
            <li class="flex items-center gap-3 text-[#1E293B] text-base md:text-lg" v-for="item in courseForList" :key="item">
              <span class="inline-flex items-center justify-center w-7 h-7 rounded-full bg-[#3B82F6] text-white mr-2 flex-shrink-0">
                <UIcon name="i-heroicons-check" class="w-5 h-5" />
              </span>
              {{ item }}
            </li>
          </ul>
        </div>
      </div>
      <!-- Soft divider for visual flow -->
      <div class="w-full flex justify-center my-6">
        <div class="h-1 w-40 rounded-full bg-gradient-to-r from-[#e0e7ef] via-[#3B82F6]/30 to-[#e0e7ef] opacity-80"></div>
      </div>
    </section>

    <!-- Course Modules Preview Section -->
    <section class="py-6 md:py-10 bg-white">
      <div class="max-w-7xl mx-auto px-4">
        <div class="space-y-10">
          <div class="text-center space-y-2">
            <h2 class="text-3xl md:text-4xl font-extrabold text-[#1E293B] heading">
              What You'll Learn
            </h2>
            <p class="text-lg md:text-xl text-[#6B7280] max-w-2xl mx-auto">
              Comprehensive curriculum designed to improve your driving skills and safety awareness
            </p>
          </div>
          
          <transition-group name="fade" tag="div" class="grid grid-cols-2 lg:grid-cols-4 gap-6">
            <UCard v-for="module in displayedModules" :key="module.id" class="hover:shadow-lg transition-shadow focus:ring-2 focus:ring-[#3B82F6]">
              <div class="space-y-4">
                <div class="flex items-center gap-3">
                  <UIcon :name="module.icon" class="w-8 h-8 text-[#3B82F6]" />
                  <h3 class="text-lg font-bold text-[#1E293B]">{{ module.title }}</h3>
                </div>
                <p class="text-[#6B7280] text-sm">{{ module.description }}</p>
                <div class="flex items-center justify-between">
                  <span class="text-sm text-[#6B7280] font-medium">{{ module.duration }}</span>
                  <UBadge color="primary" variant="soft" class="text-xs bg-[#3B82F6] text-white">
                    {{ module.type }}
                  </UBadge>
                </div>
              </div>
            </UCard>
          </transition-group>
          
          <div class="text-center">
            <UButton v-if="!showAllModules" color="primary" size="lg" class="font-semibold bg-[#3B82F6] hover:bg-[#2563eb] focus:ring-2 focus:ring-[#3B82F6] transition-all duration-300" @click="showAllModules = true">
              View All Modules
            </UButton>
            <UButton v-else color="white" size="lg" class="font-semibold border border-[#3B82F6] text-[#3B82F6] hover:bg-[#3B82F6] hover:text-white mt-4 focus:ring-2 focus:ring-[#3B82F6] transition-all duration-300" @click="showAllModules = false">
              Show Less
            </UButton>
          </div>
        </div>
      </div>
    </section>

    <!-- Why Choose Us Section -->
    <section class="py-16 md:py-24 bg-[#F0F6FF]">
      <div class="max-w-7xl mx-auto px-4">
        <div class="space-y-12">
          <div class="text-center space-y-4">
            <h2 class="text-3xl md:text-4xl font-extrabold text-[#1E293B] heading">
              Why Choose Our Course?
            </h2>
            <p class="text-xl text-[#6B7280] max-w-3xl mx-auto">
              We're committed to providing the best Basic Driver Improvement experience in Florida
            </p>
          </div>
          <div class="space-y-8 max-w-3xl mx-auto">
            <div v-for="benefit in benefits" :key="benefit.title" class="flex items-start gap-6 w-full">
              <div class="w-14 h-14 bg-[#3B82F6] rounded-xl flex items-center justify-center flex-shrink-0 mt-1 shadow-md">
                <UIcon :name="benefit.icon" class="w-7 h-7 text-white" />
              </div>
              <div class="flex-1 min-w-0">
                <h3 class="text-lg font-bold text-[#1E293B] mb-1 leading-tight">{{ benefit.title }}</h3>
                <p class="text-[#6B7280] text-base leading-relaxed">{{ benefit.description }}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Stats Icon Grid Section -->
    <section class="py-8 md:py-12 bg-white">
      <div class="max-w-7xl mx-auto px-4">
        <div class="grid grid-cols-2 lg:grid-cols-4 gap-y-8 gap-x-6">
          <UCard v-for="stat in stats" :key="stat.title" class="flex flex-col items-center text-center">
            <UIcon :name="stat.icon" class="h-10 w-10 mb-2 text-[#3B82F6]" />
            <div class="text-2xl font-bold mb-1 text-[#3B82F6]">{{ stat.title }}</div>
            <div class="font-medium text-sm text-[#6B7280]">{{ stat.desc }}</div>
          </UCard>
        </div>
      </div>
    </section>

    <!-- Legal Backing & State Approval Section -->
    <section class="py-16 md:py-24 bg-white">
      <div class="max-w-7xl mx-auto px-4">
        <div class="text-center">
          <UCard class="max-w-4xl mx-auto border-2 border-[#f3cd74]">
            <h2 class="text-2xl md:text-3xl font-bold heading mb-6 text-[#1E293B]">Legal Backing & State Approval</h2>
            <div class="flex flex-wrap justify-center gap-4">
              <span class="badge-yellow rounded-lg inline-flex items-center justify-center px-5 py-2 min-w-fit">
                <UIcon name="i-heroicons-check" class="w-5 h-5 mr-2" /> 
                State Approved
              </span>
              <span class="badge-yellow rounded-lg inline-flex items-center justify-center px-5 py-2 min-w-fit">
                <UIcon name="i-heroicons-check" class="w-5 h-5 mr-2" /> 
                Florida Statute §318.1451 Compliant
              </span>
              <span class="badge-yellow rounded-lg inline-flex items-center justify-center px-5 py-2 min-w-fit">
                <UIcon name="i-heroicons-check" class="w-5 h-5 mr-2" /> 
                Certificate Accepted by Courts & Insurance Providers
              </span>
            </div>
          </UCard>
        </div>
      </div>
    </section>

    <!-- Testimonials Section -->
    <section class="py-16 md:py-24 bg-[#F0F6FF]">
      <div class="max-w-7xl mx-auto px-4">
        <div class="space-y-12">
          <div class="text-center space-y-4">
            <h2 class="text-3xl md:text-4xl font-extrabold text-[#1E293B] heading">
              What Our Students Say
            </h2>
            <p class="text-xl text-[#6B7280] max-w-3xl mx-auto">
              Real feedback from real Florida drivers
            </p>
          </div>
          
          <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <UCard v-for="testimonial in testimonials" :key="testimonial.name" class="text-center">
              <div class="flex items-center justify-center gap-3 mb-4">
                <div class="w-12 h-12 rounded-full bg-[#3B82F6] text-white flex items-center justify-center font-bold text-lg">
                  {{ testimonial.initials }}
                </div>
                <div class="text-left">
                  <div class="font-semibold heading text-[#1E293B]">{{ testimonial.name }}</div>
                  <div class="text-[#6B7280] text-sm">{{ testimonial.location }}</div>
                </div>
              </div>
              <div class="text-[#1E293B] italic">"{{ testimonial.quote }}"</div>
            </UCard>
          </div>
        </div>
      </div>
    </section>

    <!-- Pricing Section -->
    <section class="py-16 md:py-24 bg-white">
      <div class="max-w-7xl mx-auto px-4">
        <div class="space-y-12">
          <div class="text-center space-y-4">
            <h2 class="text-3xl md:text-4xl font-extrabold text-[#1E293B] heading">
              Simple, Transparent Pricing
            </h2>
            <p class="text-xl text-[#6B7280] max-w-3xl mx-auto">
              One-time payment, no hidden fees, complete access to all course materials
            </p>
          </div>
          
          <div class="max-w-2xl mx-auto px-4">
            <UCard class="text-center space-y-8">
              <div class="space-y-4">
                <h3 class="text-2xl font-bold text-[#1E293B]">Basic Driver Improvement Course</h3>
                <div class="flex items-baseline justify-center gap-2">
                  <span class="text-5xl font-extrabold text-[#3B82F6]">$29</span>
                  <span class="text-xl text-[#6B7280]">one-time</span>
                </div>
                <p class="text-[#6B7280]">Complete course with certificate included</p>
              </div>
              
              <div class="space-y-4">
                <h4 class="text-lg font-bold text-[#1E293B]">What's Included:</h4>
                <ul class="space-y-2 text-left max-w-md mx-auto">
                  <li v-for="feature in pricingFeatures" :key="feature" class="flex items-center gap-3">
                    <UIcon name="i-heroicons-check-circle" class="w-5 h-5 text-[#3B82F6] flex-shrink-0" />
                    <span class="text-[#6B7280]">{{ feature }}</span>
                  </li>
                </ul>
              </div>
              
              <UButton to="/signup" color="primary" size="xl" class="w-full font-bold py-4 text-lg bg-[#3B82F6] hover:bg-[#2563eb] rounded-lg max-w-full block mt-6 mb-2">
                Start Now - $29
              </UButton>
              
              <p class="text-sm text-[#6B7280]">
                * Payment processed securely. 30-day money-back guarantee.
              </p>
            </UCard>
          </div>
        </div>
      </div>
    </section>

    <!-- FAQ Section -->
    <section class="py-16 md:py-24 bg-[#F0F6FF]">
      <div class="max-w-7xl mx-auto px-4">
        <div class="space-y-12">
          <div class="text-center space-y-4">
            <h2 class="text-3xl md:text-4xl font-extrabold text-[#1E293B] heading">
              Frequently Asked Questions
            </h2>
            <p class="text-xl text-[#6B7280] max-w-3xl mx-auto">
              Everything you need to know about our Florida BDI course
            </p>
          </div>
          
          <UAccordion 
            :items="faqItems" 
            :ui="{ 
              wrapper: 'bg-transparent',
              container: 'bg-white rounded-xl shadow-lg',
              item: { 
                base: 'bg-transparent border-b border-[#E5E7EB] last:border-b-0',
                title: 'heading font-medium text-lg py-4 px-6 text-[#1E293B]',
                content: 'text-[#6B7280] text-base pb-4 px-6'
              }
            }"
          />
        </div>
      </div>
    </section>

    <!-- Footer -->
    <footer class="bg-[#1E293B] text-white py-6 md:py-10">
      <div class="max-w-7xl mx-auto px-4">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
          <!-- Company Info -->
          <div class="space-y-4">
            <h3 class="text-xl font-bold heading text-[#f3cd74]">Road Ready</h3>
            <p class="text-[#E5E7EB] text-sm">
              State-approved Basic Driver Improvement course provider. Helping Florida drivers stay safe and compliant.
            </p>
          </div>
          
          <!-- Quick Links -->
          <div class="space-y-4">
            <h4 class="font-bold heading text-[#f3cd74]">Quick Links</h4>
            <ul class="space-y-2 text-base text-[#E5E7EB]">
              <li><a href="#" class="hover:text-[#3B82F6] transition">About Us</a></li>
              <li><a href="#" class="hover:text-[#3B82F6] transition">Course Overview</a></li>
              <li><a href="#" class="hover:text-[#3B82F6] transition">FAQ</a></li>
              <li><a href="#" class="hover:text-[#3B82F6] transition">Support</a></li>
            </ul>
          </div>
          
          <!-- Contact -->
          <div class="space-y-4">
            <h4 class="font-bold heading text-[#f3cd74]">Contact</h4>
            <ul class="space-y-2 text-base text-[#E5E7EB]">
              <li class="flex items-center gap-2">
                <UIcon name="i-heroicons-envelope" class="w-4 h-4" />
                <span>support@roadready.com</span>
              </li>
              <li class="flex items-center gap-2">
                <UIcon name="i-heroicons-phone" class="w-4 h-4" />
                <span>1-800-ROAD-READY</span>
              </li>
            </ul>
          </div>
          
          <!-- Compliance -->
          <div class="space-y-4">
            <h4 class="font-bold heading text-[#f3cd74]">Compliance</h4>
            <div class="space-y-2 text-base text-[#E5E7EB]">
              <p>FLHSMV Approved Provider</p>
              <p>Course #: BDI-2024-001</p>
              <p>Valid in all Florida counties</p>
            </div>
          </div>
        </div>
        
        <div class="mt-8 pt-8 text-center">
          <p class="text-sm text-[#E5E7EB]">
            © 2024 Road Ready. All rights reserved. | 
            <a href="#" class="hover:text-[#3B82F6] transition">Privacy Policy</a> | 
            <a href="#" class="hover:text-[#3B82F6] transition">Terms of Service</a>
          </p>
        </div>
      </div>
    </footer>

    <!-- ELIGIBILITY MODAL -->
    <EligibilityModal 
      :is-open="showEligibilityModal"
      @close="closeEligibilityModal"
      @start-course="startCourse"
    />

    <!-- Scroll to Top Button -->
    <button @click="window.scrollTo({top: 0, behavior: 'smooth'})" class="fixed bottom-6 right-6 z-50 bg-[#3B82F6] text-white p-3 rounded-full shadow-lg hover:bg-[#2563eb] focus:ring-2 focus:ring-[#3B82F6] transition-all duration-300" aria-label="Scroll to top">
      <UIcon name="i-heroicons-arrow-up" class="w-6 h-6" />
    </button>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted, computed } from 'vue'

// Eligibility modal state
const showEligibilityModal = ref(false)

const openEligibilityModal = () => {
  showEligibilityModal.value = true
}

const closeEligibilityModal = () => {
  showEligibilityModal.value = false
}

const startCourse = () => {
  window.location.href = '/signup'
  closeEligibilityModal()
}

// Preview modules for the landing page
const allModules = [
  {
    id: 1,
    title: 'Defensive Driving',
    description: 'Learn advanced techniques to anticipate and avoid dangerous situations.',
    duration: '40 min',
    type: 'Core',
    icon: 'i-heroicons-shield-check'
  },
  {
    id: 2,
    title: 'Night Driving',
    description: 'Master the challenges of driving after dark with proper techniques.',
    duration: '20 min',
    type: 'Safety',
    icon: 'i-heroicons-moon'
  },
  {
    id: 3,
    title: 'Traffic Laws',
    description: 'Refresh your knowledge of Florida traffic laws and regulations.',
    duration: '30 min',
    type: 'Core',
    icon: 'i-heroicons-document-text'
  },
  {
    id: 4,
    title: 'Hazard Recognition',
    description: 'Develop skills to identify and respond to road hazards effectively.',
    duration: '30 min',
    type: 'Safety',
    icon: 'i-heroicons-exclamation-triangle'
  },
  {
    id: 5,
    title: 'Impaired Driving',
    description: 'Understand the dangers and consequences of driving under the influence.',
    duration: '25 min',
    type: 'Core',
    icon: 'i-heroicons-no-symbol'
  },
  {
    id: 6,
    title: 'Distracted Driving',
    description: 'Identify distractions and learn strategies to stay focused on the road.',
    duration: '20 min',
    type: 'Safety',
    icon: 'i-heroicons-eye-slash'
  },
  {
    id: 7,
    title: 'Aggressive Driving',
    description: 'Recognize and avoid aggressive driving behaviors for safer roads.',
    duration: '20 min',
    type: 'Core',
    icon: 'i-heroicons-fire'
  },
  {
    id: 8,
    title: 'Vehicle Maintenance',
    description: 'Basic vehicle maintenance tips to keep your car safe and reliable.',
    duration: '15 min',
    type: 'Safety',
    icon: 'i-heroicons-wrench-screwdriver'
  },
  {
    id: 9,
    title: 'Sharing the Road',
    description: 'Learn how to safely share the road with trucks, bikes, and pedestrians.',
    duration: '20 min',
    type: 'Core',
    icon: 'i-heroicons-users'
  },
  {
    id: 10,
    title: 'Final Assessment',
    description: 'Test your knowledge and receive your completion certificate.',
    duration: '15 min',
    type: 'Core',
    icon: 'i-heroicons-clipboard-document-check'
  }
]

const showAllModules = ref(false)
const displayedModules = computed(() => showAllModules.value ? allModules : allModules.slice(0, 4))

// Benefits list
const benefits = [
  {
    title: 'State Approved',
    description: 'Our course is officially certified by the Florida Highway Safety and Motor Vehicles (FLHSMV).',
    icon: 'i-heroicons-shield-check'
  },
  {
    title: 'Self-Paced Learning',
    description: 'Complete the course at your own speed, with 24/7 access for 30 days.',
    icon: 'i-heroicons-clock'
  },
  {
    title: 'Mobile Friendly',
    description: 'Take the course on any device - smartphone, tablet, or computer.',
    icon: 'i-heroicons-device-phone-mobile'
  },
  {
    title: 'Instant Certificate',
    description: 'Download your completion certificate immediately upon finishing the course.',
    icon: 'i-heroicons-document-check'
  },
  {
    title: 'No Hidden Fees',
    description: 'One-time payment of $29 covers everything - no additional charges.',
    icon: 'i-heroicons-currency-dollar'
  },
  {
    title: 'Money-Back Guarantee',
    description: '30-day guarantee - if you\'re not satisfied, we\'ll refund your payment.',
    icon: 'i-heroicons-heart'
  }
]

const stats = [
  {
    title: '50,000+',
    desc: 'Florida drivers educated',
    icon: 'i-heroicons-chart-bar'
  },
  {
    title: '4.9/5',
    desc: 'Average student rating',
    icon: 'i-heroicons-star'
  },
  {
    title: '24 Hours',
    desc: 'Average time to completion',
    icon: 'i-heroicons-clock'
  },
  {
    title: '100%',
    desc: 'Certificate acceptance rate',
    icon: 'i-heroicons-shield-check'
  }
]

const faqItems = [
  {
    label: 'Is this course approved by the Florida DMV?',
    content: 'Yes, Road Ready is officially certified by the Florida Highway Safety and Motor Vehicles (FLHSMV).',
    icon: 'i-heroicons-plus'
  },
  {
    label: 'Will this remove points from my license?',
    content: 'Yes — once completed, it can prevent points from being added to your driving record.',
    icon: 'i-heroicons-plus'
  },
  {
    label: 'How long do I have to complete it?',
    content: 'You\'ll have 30 days of full access. Most students finish in just 24 hours.',
    icon: 'i-heroicons-plus'
  },
  {
    label: 'Is this course 100% online?',
    content: 'Yes — no classrooms, no paperwork. You can take it from your phone or laptop anytime.',
    icon: 'i-heroicons-plus'
  },
  {
    label: 'What if I don\'t pass the final quiz?',
    content: 'You can retake the quiz until you pass, no extra fees.',
    icon: 'i-heroicons-plus'
  }
]

const trustBadges = [
  'State Approved',
  'SSL Secure Checkout',
  'DMV Compliant',
  'Mobile Friendly',
  'No Hidden Fees'
]

const testimonials = [
  {
    initials: 'JS',
    name: 'Jennifer Smith',
    location: 'Miami, FL',
    quote: 'Completed the course in just a few hours. The certificate was available immediately. Highly recommend!'
  },
  {
    initials: 'MR',
    name: 'Mike Rodriguez',
    location: 'Orlando, FL',
    quote: 'Great course content and easy to follow. Saved me time and money compared to in-person classes.'
  },
  {
    initials: 'AL',
    name: 'Amanda Lee',
    location: 'Tampa, FL',
    quote: 'Professional, comprehensive, and convenient. The defensive driving tips were really helpful.'
  }
]

const courseForList = [
  'Dismiss a traffic ticket',
  'Satisfy a court requirement',
  'Reduce points on your license',
  'Qualify for an insurance discount'
]

const pricingFeatures = [
  'State-approved by Florida DHSMV',
  '10 comprehensive learning modules',
  'Self-paced, mobile-friendly interface',
  'Final exam and certificate included',
  '24/7 access for 30 days',
  'Instant certificate download',
  'Points prevention on driving record',
  'No hidden fees or additional charges'
]

const howItWorksSteps = [
  { title: 'Sign Up', icon: 'i-heroicons-user-plus', description: 'Create your account and verify your eligibility in minutes.' },
  { title: 'Learn', icon: 'i-heroicons-academic-cap', description: 'Complete interactive modules covering defensive driving, traffic laws, and safety techniques.' },
  { title: 'Certificate', icon: 'i-heroicons-document-check', description: 'Receive your completion certificate and submit to the FLHSMV to satisfy your requirements.' },
  { title: 'Complete', icon: 'i-heroicons-trophy', description: 'Download your certificate instantly and submit to satisfy your requirements.' },
]

const scrolled = ref(false)
const handleScroll = () => {
  scrolled.value = window.scrollY > 40
}
onMounted(() => {
  handleScroll() // Ensure correct color on initial load
  window.addEventListener('scroll', handleScroll)
})
onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})
</script>

<style scoped>
.font-sans {
  font-family: 'Inter', 'ui-sans-serif', 'system-ui', sans-serif;
}

.heading {
  font-family: 'DM Sans', sans-serif;
}
</style> 