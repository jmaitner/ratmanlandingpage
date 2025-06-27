<template>
  <div class="min-h-screen">
    <!-- FLOATING NAVIGATION -->
    <nav 
      ref="navRef"
      class="fixed top-0 left-0 right-0 z-50 transition-all duration-300"
      :class="isScrolled ? 'bg-white shadow-lg' : 'bg-transparent'"
    >
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-16">
          <!-- Logo -->
          <div class="flex items-center">
            <span 
              class="text-xl font-bold transition-colors duration-300"
              :class="isScrolled ? 'text-[#111827]' : 'text-white'"
            >
              Road Ready
            </span>
          </div>

          <!-- Navigation Links -->
          <div class="hidden md:flex items-center space-x-8">
            <a 
              href="#courses" 
              class="transition-colors duration-300 font-medium"
              :class="isScrolled ? 'text-[#6B7280] hover:text-[#111827]' : 'text-white hover:text-[#00D084]'"
            >
              Courses
            </a>
            <a 
              href="#learn" 
              class="transition-colors duration-300 font-medium"
              :class="isScrolled ? 'text-[#6B7280] hover:text-[#111827]' : 'text-white hover:text-[#00D084]'"
            >
              What You'll Learn
            </a>
            <a 
              href="#faq" 
              class="transition-colors duration-300 font-medium"
              :class="isScrolled ? 'text-[#6B7280] hover:text-[#111827]' : 'text-white hover:text-[#00D084]'"
            >
              FAQ
            </a>
            <a 
              href="/login"
              class="transition-colors duration-300 font-medium"
              :class="isScrolled ? 'text-[#6B7280] hover:text-[#111827]' : 'text-white hover:text-[#00D084]'"
            >
              Login
            </a>
            <UButton 
              color="primary" 
              size="sm"
              class="bg-[#00D084] hover:bg-[#00B86B] text-white font-semibold"
              @click="navigateTo('/signup')"
            >
              Start Course
            </UButton>
          </div>

          <!-- Mobile menu button -->
          <div class="md:hidden">
            <button 
              class="transition-colors duration-300"
              :class="isScrolled ? 'text-[#111827]' : 'text-white'"
              @click="toggleMobileMenu"
            >
              <Icon name="heroicons:bars-3" class="h-6 w-6" />
            </button>
          </div>
        </div>

        <!-- Mobile Menu -->
        <div v-if="showMobileMenu" class="md:hidden bg-white shadow-lg rounded-lg mt-2 py-4">
          <div class="flex flex-col space-y-4 px-4">
            <a 
              href="#courses" 
              class="text-[#111827] hover:text-[#00D084] font-medium transition-colors"
              @click="closeMobileMenu"
            >
              Courses
            </a>
            <a 
              href="#learn" 
              class="text-[#111827] hover:text-[#00D084] font-medium transition-colors"
              @click="closeMobileMenu"
            >
              What You'll Learn
            </a>
            <a 
              href="#faq" 
              class="text-[#111827] hover:text-[#00D084] font-medium transition-colors"
              @click="closeMobileMenu"
            >
              FAQ
            </a>
            <a 
              href="/login"
              class="text-[#111827] hover:text-[#00D084] font-medium transition-colors"
              @click="closeMobileMenu"
            >
              Login
            </a>
            <UButton 
              color="primary" 
              size="sm"
              class="bg-[#00D084] hover:bg-[#00B86B] text-white font-semibold w-full"
              @click="navigateTo('/signup')"
            >
              Start Course
            </UButton>
          </div>
        </div>
      </div>
    </nav>

    <!-- HERO SECTION -->
    <section class="relative h-screen flex items-center justify-center overflow-hidden">
      <!-- Background Image with Overlay -->
      <div class="absolute inset-0 bg-gradient-to-br from-[#1F2937] via-[#374151] to-[#111827]">
        <div class="absolute inset-0 bg-black/50"></div>
        <!-- Abstract geometric pattern overlay -->
        <div class="absolute inset-0 opacity-10">
          <div class="absolute top-20 left-20 w-32 h-32 border border-white/20 rounded-full"></div>
          <div class="absolute top-40 right-32 w-24 h-24 border border-white/20 rounded-full"></div>
          <div class="absolute bottom-32 left-1/3 w-16 h-16 border border-white/20 rounded-full"></div>
        </div>
      </div>

      <!-- Hero Content -->
      <div class="relative z-10 text-center px-4 max-w-4xl mx-auto">
        <h1 class="text-5xl md:text-7xl font-bold text-white mb-6 leading-tight">
          Approved. Online. Easy.
          <br>
          <span class="text-[#00D084]">Florida's #1</span> Defensive Driving Course
        </h1>
        <p class="text-xl md:text-2xl text-white/90 mb-8 max-w-3xl mx-auto">
          Reduce your points, dismiss your ticket, or earn an insurance discount — all from your phone or laptop.
        </p>
        
        <!-- CTA Buttons -->
        <div class="flex flex-col sm:flex-row gap-4 justify-center items-center mb-12">
          <UButton 
            size="lg"
            class="bg-white text-[#111827] hover:bg-gray-100 font-semibold text-lg px-8 py-4 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300"
            @click="navigateTo('/signup')"
          >
            Start Your Course Today
          </UButton>
          <UButton 
            size="lg"
            variant="outline"
            class="border-2 border-white text-white hover:bg-white hover:text-[#111827] font-semibold text-lg px-8 py-4 rounded-xl transition-all duration-300"
          >
            Learn More
          </UButton>
        </div>

        <!-- Trust Indicators -->
        <div class="flex flex-wrap justify-center items-center gap-6 text-white/80 text-sm">
          <div class="flex items-center gap-2">
            <Icon name="heroicons:check-circle" class="h-5 w-5 text-[#00D084]" />
            <span>State Approved</span>
          </div>
          <div class="flex items-center gap-2">
            <Icon name="heroicons:check-circle" class="h-5 w-5 text-[#00D084]" />
            <span>Mobile Friendly</span>
          </div>
          <div class="flex items-center gap-2">
            <Icon name="heroicons:check-circle" class="h-5 w-5 text-[#00D084]" />
            <span>Instant Certificate</span>
          </div>
        </div>
      </div>

      <!-- Scroll Indicator -->
      <div class="absolute bottom-8 left-1/2 transform -translate-x-1/2 animate-bounce">
        <Icon 
          name="heroicons:chevron-down" 
          class="h-8 w-8 text-white/60"
        />
      </div>
    </section>

    <!-- WHAT YOU'LL LEARN SECTION -->
    <section id="learn" class="py-20 px-4 bg-white">
      <div class="max-w-7xl mx-auto">
        <div class="text-center mb-12">
          <h2 class="text-4xl font-bold text-[#111827]">What You'll Learn</h2>
          <p class="mt-4 text-[#6B7280] text-lg">
            Complete 10 comprehensive modules designed to make you a safer, more confident driver
          </p>
        </div>

        <div class="max-w-6xl mx-auto">
          <UAccordion 
            :items="courseModules" 
            :ui="{ 
              wrapper: 'bg-transparent',
              container: 'bg-transparent space-y-4',
              item: { 
                base: 'bg-white border border-[#E5E7EB] rounded-xl shadow-sm hover:shadow-md transition-all duration-300',
                title: 'text-[#111827] font-semibold text-lg py-6 px-6',
                content: 'text-[#6B7280] text-base pb-6 px-6'
              }
            }"
          />
        </div>
      </div>
    </section>

    <!-- JOURNEY TIMELINE -->
    <section class="py-20 px-4 bg-[#F9FAFB]">
      <div class="max-w-7xl mx-auto">
        <div class="text-center mb-12">
          <h2 class="text-4xl font-bold text-[#111827]">Your Certification Journey</h2>
          <p class="mt-4 text-[#6B7280] text-lg">
            From signup to certificate in just a few simple steps
          </p>
        </div>

        <div class="max-w-4xl mx-auto">
          <div class="space-y-8">
            <div v-for="(step, index) in journeySteps" :key="index" class="flex items-start gap-6 group hover:bg-white hover:shadow-md rounded-lg p-4 transition-all duration-300">
              <!-- Step Icon -->
              <div class="flex-shrink-0 w-12 h-12 bg-[#00D084] text-white rounded-full flex items-center justify-center text-xl font-bold shadow-lg">
                {{ index + 1 }}
              </div>
              
              <!-- Step Content -->
              <div class="flex-1">
                <h3 class="text-[#111827] font-semibold text-xl mb-2">{{ step.title }}</h3>
                <p class="text-[#6B7280] text-base leading-relaxed">{{ step.description }}</p>
              </div>
            </div>
          </div>
        </div>

        <!-- Eligibility CTA -->
        <div class="text-center mt-12">
          <UButton 
            size="lg"
            class="bg-[#00D084] hover:bg-[#00B86B] text-white font-semibold text-lg px-8 py-4 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300"
            @click="openEligibilityModal"
          >
            Check Your Eligibility
          </UButton>
          <p class="mt-4 text-[#6B7280] text-sm max-w-2xl mx-auto">
            See if this course is right for you: ticket dismissal, insurance discount, or court requirement.
          </p>
        </div>
      </div>
    </section>

    <!-- REAL RESULTS STATS -->
    <section class="py-20 px-4 bg-white">
      <div class="max-w-7xl mx-auto">
        <div class="text-center mb-12">
          <h2 class="text-4xl font-bold text-[#111827]">Real Results</h2>
          <p class="mt-4 text-[#6B7280] text-lg">
            Join thousands of satisfied drivers who have improved their skills with us
          </p>
        </div>

        <div class="grid grid-cols-2 lg:grid-cols-4 gap-8">
          <div v-for="stat in stats" :key="stat.title" class="text-center">
            <div class="text-3xl mb-2">
              <Icon :name="stat.icon" class="h-12 w-12 mx-auto text-[#00D084]" />
            </div>
            <div class="text-3xl font-bold text-[#00D084] mb-2">{{ stat.title }}</div>
            <div class="text-[#6B7280] font-medium">{{ stat.desc }}</div>
          </div>
        </div>
      </div>
    </section>

    <!-- FAQ SECTION -->
    <section id="faq" class="py-20 px-4 bg-[#F9FAFB]">
      <div class="max-w-4xl mx-auto">
        <div class="text-center mb-12">
          <h2 class="text-4xl font-bold text-[#111827]">Frequently Asked Questions</h2>
          <p class="mt-4 text-[#6B7280] text-lg">
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
              title: 'text-[#111827] font-medium text-lg py-4 px-6',
              content: 'text-[#6B7280] text-base pb-4 px-6'
            }
          }"
        />
      </div>
    </section>

    <!-- TRUST BADGES -->
    <section class="py-16 px-4 bg-white">
      <div class="max-w-4xl mx-auto">
        <div class="flex flex-wrap justify-center gap-4">
          <div v-for="badge in trustBadges" :key="badge" class="bg-[#F9FAFB] border border-[#E5E7EB] rounded-full px-4 py-2 text-[#6B7280] text-sm font-medium shadow-sm">
            {{ badge }}
          </div>
        </div>
      </div>
    </section>

    <!-- COURSE COMPLETION GUARANTEE -->
    <section class="py-16 px-4 bg-[#F5FFF7]">
      <div class="max-w-4xl mx-auto">
        <div class="bg-white border border-[#E5E7EB] rounded-xl shadow-lg p-8 flex flex-col md:flex-row items-center gap-8">
          <div class="flex-1 text-center md:text-left">
            <h3 class="text-2xl font-bold text-[#111827] mb-3">Guaranteed Certificate or Your Money Back</h3>
            <p class="text-[#6B7280] text-lg mb-6">
              We stand behind our course. If you're not satisfied, we'll issue a full refund within 30 days — no questions asked.
            </p>
            <UButton 
              color="primary"
              size="lg"
              class="bg-[#00D084] hover:bg-[#00B86B] text-white font-semibold shadow-lg hover:shadow-xl transition-all duration-300"
              @click="navigateTo('/signup')"
            >
              Start My Course
            </UButton>
          </div>
          <div class="text-6xl">🔒</div>
        </div>
      </div>
    </section>

    <!-- FOOTER -->
    <footer class="bg-[#111827] text-white py-12 px-4">
      <div class="max-w-7xl mx-auto">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
          <div>
            <div class="flex items-center mb-4">
              <img src="/logo.png" alt="Road Ready" class="h-8 w-auto" />
              <span class="ml-2 text-xl font-bold">Road Ready</span>
            </div>
            <p class="text-[#9CA3AF] text-sm">
              State-approved driver improvement courses for Florida drivers.
            </p>
          </div>
          <div>
            <h4 class="font-semibold mb-4">Courses</h4>
            <ul class="space-y-2 text-sm text-[#9CA3AF]">
              <li><a href="#" class="hover:text-white transition-colors">Florida BDI</a></li>
              <li><a href="#" class="hover:text-white transition-colors">Florida ADI</a></li>
              <li><a href="#" class="hover:text-white transition-colors">Florida IDI</a></li>
            </ul>
          </div>
          <div>
            <h4 class="font-semibold mb-4">Support</h4>
            <ul class="space-y-2 text-sm text-[#9CA3AF]">
              <li><a href="#" class="hover:text-white transition-colors">Help Center</a></li>
              <li><a href="#" class="hover:text-white transition-colors">Contact Us</a></li>
              <li><a href="#" class="hover:text-white transition-colors">FAQ</a></li>
            </ul>
          </div>
          <div>
            <h4 class="font-semibold mb-4">Legal</h4>
            <ul class="space-y-2 text-sm text-[#9CA3AF]">
              <li><a href="#" class="hover:text-white transition-colors">Privacy Policy</a></li>
              <li><a href="#" class="hover:text-white transition-colors">Terms of Service</a></li>
              <li><a href="#" class="hover:text-white transition-colors">Refund Policy</a></li>
            </ul>
          </div>
        </div>
        <div class="border-t border-[#374151] mt-8 pt-8 text-center text-sm text-[#9CA3AF]">
          <p>&copy; 2024 Road Ready. All rights reserved. State-approved by Florida DHSMV.</p>
        </div>
      </div>
    </footer>

    <!-- ELIGIBILITY MODAL -->
    <EligibilityModal 
      :is-open="showEligibilityModal"
      @close="closeEligibilityModal"
      @start-course="startCourse"
    />
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'

// Scroll detection for floating navigation
const isScrolled = ref(false)
const navRef = ref(null)

// Mobile menu state
const showMobileMenu = ref(false)

const handleScroll = () => {
  isScrolled.value = window.scrollY > 50
}

const toggleMobileMenu = () => {
  showMobileMenu.value = !showMobileMenu.value
}

const closeMobileMenu = () => {
  showMobileMenu.value = false
}

onMounted(() => {
  window.addEventListener('scroll', handleScroll)
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})

const pricingTabs = [
  {
    key: 'bdi',
    label: 'Florida BDI',
    title: 'Basic Driver Improvement Course',
    subtitle: 'For speeding tickets or point reduction',
    price: '$29.99',
    purpose: 'Prevent points from being added to your driving record and satisfy court requirements.',
    duration: '4-6 hours (self-paced)',
    audience: 'Drivers with speeding tickets or minor traffic violations',
    access: '30 days of full access',
    features: [
      'State-approved by Florida DHSMV',
      '10 comprehensive learning modules',
      'Self-paced, mobile-friendly interface',
      'Final exam and certificate included',
      '24/7 access for 30 days',
      'Instant certificate download',
      'Points prevention on driving record',
      'No hidden fees or additional charges'
    ]
  },
  {
    key: 'adi',
    label: 'Florida ADI',
    title: 'Advanced Driver Improvement Course',
    subtitle: 'Court-ordered or DHSMV-mandated course',
    price: '$69.99',
    purpose: 'Meet court requirements for license reinstatement and demonstrate improved driving behavior.',
    duration: '12-20 hours (self-paced)',
    audience: 'Drivers with serious violations or court orders',
    access: '60 days of full access',
    features: [
      'Longer course length (12-20 hours)',
      'All BDI features included',
      'Enhanced defensive driving techniques',
      'Behavior-change strategies',
      'Required for license reinstatement',
      'Insurance discount eligibility',
      'Priority customer support',
      'Certificate valid for 3 years'
    ]
  },
  {
    key: 'idi',
    label: 'Florida IDI',
    title: 'Intermediate Driver Improvement Course',
    subtitle: 'For habitual offenders or specific court orders',
    price: '$49.99',
    purpose: 'Address habitual driving violations and demonstrate commitment to safer driving practices.',
    duration: '8-12 hours (self-paced)',
    audience: 'Habitual offenders or drivers with multiple violations',
    access: '60 days of full access',
    features: [
      '8-12 hour comprehensive course',
      'Focus on behavioral change and accountability',
      'All ADI features included',
      'Advanced safety strategies',
      'Real-world scenarios included',
      'Extended course access (60 days)',
      'Phone support included',
      'Mobile-friendly access + certificate download'
    ]
  }
]

const comparisonFeatures = [
  { name: 'State Approved', roadReady: true, traditional: true },
  { name: '24/7 Access', roadReady: true, traditional: false },
  { name: 'Self-Paced Learning', roadReady: true, traditional: false },
  { name: 'Instant Certificate', roadReady: true, traditional: false },
  { name: 'No Travel Required', roadReady: true, traditional: false },
  { name: 'Affordable Pricing', roadReady: true, traditional: false },
  { name: 'Mobile Friendly', roadReady: true, traditional: false }
]

const journeySteps = [
  {
    title: 'Create an Account',
    description: 'Start by signing up and verifying your eligibility.',
    icon: '📝'
  },
  {
    title: 'Take the Course',
    description: 'Complete each interactive module at your own pace — mobile or desktop.',
    icon: '📚'
  },
  {
    title: 'Pass the Final Quiz',
    description: 'Finish with a short quiz to confirm your understanding.',
    icon: '✅'
  },
  {
    title: 'Get Your Certificate',
    description: 'Download your certificate instantly and submit it to the Florida DMV.',
    icon: '🎓'
  }
]

const courseModules = [
  {
    label: 'Defensive Driving Basics',
    content: 'Learn fundamental techniques to anticipate and avoid dangerous situations on the road. Understand the principles of defensive driving and how to maintain safe following distances.'
  },
  {
    label: 'Hazard Recognition',
    content: 'Develop skills to identify and respond to potential road hazards effectively. Learn to scan the environment and recognize warning signs before they become dangerous.'
  },
  {
    label: 'Distracted Driving',
    content: 'Understand the dangers and prevention of distracted driving. Learn about the impact of phones, passengers, and other distractions on driving performance.'
  },
  {
    label: 'Adverse Weather',
    content: 'Master techniques for driving safely through rain, fog, and poor weather conditions. Learn how weather affects vehicle handling and visibility.'
  },
  {
    label: 'Traffic Laws',
    content: 'Review Florida traffic laws and legal requirements. Understand speed limits, right-of-way rules, and other essential traffic regulations.'
  },
  {
    label: 'Highway Safety',
    content: 'Learn highway driving techniques and safety protocols. Master merging, lane changes, and maintaining safe speeds on high-speed roads.'
  },
  {
    label: 'Night Driving',
    content: 'Navigate the challenges of driving in the dark. Learn proper use of headlights, recognizing hazards in low-light conditions, and night driving strategies.'
  },
  {
    label: 'Crash Avoidance',
    content: 'Apply techniques to prevent common crash types. Learn emergency braking, evasive maneuvers, and how to react in dangerous situations.'
  },
  {
    label: 'Impairment Awareness',
    content: 'Understand how alcohol and drugs impair driving performance. Learn about the effects of fatigue, medications, and other factors that affect driving ability.'
  },
  {
    label: 'Final Exam & Wrap-Up',
    content: 'Take your final assessment to demonstrate your knowledge and receive your certificate. Review key concepts and prepare for safe driving ahead.'
  }
]

const stats = [
  {
    title: '50,000+',
    desc: 'Florida drivers educated',
    icon: 'heroicons:chart-bar'
  },
  {
    title: '4.9/5',
    desc: 'Average student rating',
    icon: 'heroicons:star'
  },
  {
    title: '24 Hours',
    desc: 'Average time to completion',
    icon: 'heroicons:clock'
  },
  {
    title: '100%',
    desc: 'Certificate acceptance rate',
    icon: 'heroicons:shield-check'
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

// Eligibility check function
const checkEligibility = () => {
  // This would typically open a modal or navigate to an eligibility form
  // For now, we'll just scroll to the FAQ section
  const faqSection = document.getElementById('faq')
  if (faqSection) {
    faqSection.scrollIntoView({ behavior: 'smooth' })
  }
}

// Eligibility modal state
const showEligibilityModal = ref(false)

const openEligibilityModal = () => {
  showEligibilityModal.value = true
}

const closeEligibilityModal = () => {
  showEligibilityModal.value = false
}

const startCourse = () => {
  // Navigate to the course page or dashboard
  window.location.href = '/dashboard'
  closeEligibilityModal()
}

const goToLogin = () => {
  // Navigate to the login page
  window.location.href = '/login'
}

const navigateTo = (path) => {
  // Navigate to the specified path
  window.location.href = path
}
</script> 

<style scoped>
.font-sans {
  font-family: 'Public Sans', 'ui-sans-serif', 'system-ui', sans-serif;
}

@keyframes fade-in-up {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.animate-fade-in-up {
  animation: fade-in-up 0.6s ease-out;
}
</style> 