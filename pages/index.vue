<template>
  <div class="min-h-screen bg-[#f9fafb]">
    <!-- Navigation -->
    <nav class="w-full bg-white shadow-md border-b border-gray-100 sticky top-0 z-30">
      <UContainer class="max-w-7xl mx-auto px-4 py-3 flex items-center justify-between gap-4 flex-wrap">
        <div class="flex items-center gap-2 sm:gap-4 flex-shrink-0">
          <h1 class="text-xl font-bold text-[#1E1E1E]">Florida BDI Course</h1>
        </div>
        <div class="flex-1 flex justify-end items-center gap-4 min-w-[48px] mt-2 sm:mt-0">
          <UButton to="/login" variant="ghost" color="primary" class="font-semibold text-[#1E1E1E]">
            Login
          </UButton>
          <UButton to="/login" color="primary" class="font-semibold">
            Get Started
          </UButton>
        </div>
      </UContainer>
    </nav>

    <!-- Hero Section -->
    <section class="py-16 md:py-24 bg-gradient-to-br from-blue-50 to-indigo-100">
      <UContainer class="max-w-7xl mx-auto px-4">
        <div class="flex flex-col lg:flex-row-reverse items-center gap-12 lg:gap-16">
          <!-- Hero Image -->
          <div class="flex-1 flex justify-center lg:justify-end">
            <div class="relative w-full max-w-md lg:max-w-lg">
              <div class="bg-white rounded-2xl shadow-xl p-8 transform rotate-3 hover:rotate-0 transition-transform duration-300">
                <div class="aspect-square bg-gradient-to-br from-blue-100 to-indigo-200 rounded-xl flex items-center justify-center">
                  <UIcon name="i-heroicons-truck" class="w-24 h-24 text-blue-600" />
                </div>
                <div class="mt-4 text-center">
                  <p class="text-sm text-gray-600 font-medium">Florida Basic Driver Improvement</p>
                  <p class="text-xs text-gray-500">State Approved Course</p>
                </div>
              </div>
            </div>
          </div>
          
          <!-- Hero Content -->
          <div class="flex-1 text-center lg:text-left space-y-8">
            <div class="space-y-4">
              <h1 class="text-4xl md:text-5xl lg:text-6xl font-extrabold text-gray-900 leading-tight tracking-tight">
                Master Defensive Driving
                <span class="text-[#A90F1D]">in Florida</span>
              </h1>
              <h2 class="text-xl md:text-2xl text-gray-600 font-medium max-w-2xl mx-auto lg:mx-0">
                Complete your Basic Driver Improvement course online. State-approved, self-paced, and designed to keep you safe on the road.
              </h2>
            </div>
            
            <div class="flex flex-col sm:flex-row gap-4 justify-center lg:justify-start">
              <UButton 
                to="/login" 
                color="primary" 
                size="xl" 
                class="font-bold py-4 px-8 text-lg shadow-lg hover:shadow-xl transition-shadow"
              >
                Start Your Course Today
              </UButton>
              <UButton 
                variant="outline" 
                size="xl" 
                class="font-semibold py-4 px-8 text-lg"
              >
                Learn More
              </UButton>
            </div>
            
            <div class="flex items-center justify-center lg:justify-start gap-8 text-sm text-gray-600">
              <div class="flex items-center gap-2">
                <UIcon name="i-heroicons-check-circle" class="w-5 h-5 text-green-500" />
                <span>State Approved</span>
              </div>
              <div class="flex items-center gap-2">
                <UIcon name="i-heroicons-clock" class="w-5 h-5 text-blue-500" />
                <span>Self-Paced</span>
              </div>
              <div class="flex items-center gap-2">
                <UIcon name="i-heroicons-shield-check" class="w-5 h-5 text-purple-500" />
                <span>100% Online</span>
              </div>
            </div>
          </div>
        </div>
      </UContainer>
    </section>

    <!-- How It Works Section -->
    <section class="py-16 md:py-24 bg-white">
      <UContainer class="max-w-7xl mx-auto px-4">
        <div class="text-center space-y-12">
          <div class="space-y-4">
            <h2 class="text-3xl md:text-4xl font-extrabold text-gray-900">
              How It Works
            </h2>
            <p class="text-xl text-gray-600 max-w-3xl mx-auto">
              Complete your Basic Driver Improvement course in three simple steps
            </p>
          </div>
          
          <UCard class="max-w-4xl mx-auto">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8 md:gap-12">
              <!-- Step 1 -->
              <div class="text-center space-y-4">
                <div class="relative">
                  <div class="w-16 h-16 bg-[#A90F1D] rounded-full flex items-center justify-center mx-auto">
                    <UIcon name="i-heroicons-user-plus" class="w-8 h-8 text-white" />
                  </div>
                  <div class="absolute -top-2 -right-2 w-8 h-8 bg-blue-500 rounded-full flex items-center justify-center text-white font-bold text-sm">
                    1
                  </div>
                </div>
                <h3 class="text-xl font-bold text-gray-900">Register</h3>
                <p class="text-gray-600">Create your account and verify your eligibility for the Basic Driver Improvement course.</p>
              </div>
              
              <!-- Step 2 -->
              <div class="text-center space-y-4">
                <div class="relative">
                  <div class="w-16 h-16 bg-[#A90F1D] rounded-full flex items-center justify-center mx-auto">
                    <UIcon name="i-heroicons-academic-cap" class="w-8 h-8 text-white" />
                  </div>
                  <div class="absolute -top-2 -right-2 w-8 h-8 bg-blue-500 rounded-full flex items-center justify-center text-white font-bold text-sm">
                    2
                  </div>
                </div>
                <h3 class="text-xl font-bold text-gray-900">Learn</h3>
                <p class="text-gray-600">Complete interactive modules covering defensive driving, traffic laws, and safety techniques.</p>
              </div>
              
              <!-- Step 3 -->
              <div class="text-center space-y-4">
                <div class="relative">
                  <div class="w-16 h-16 bg-[#A90F1D] rounded-full flex items-center justify-center mx-auto">
                    <UIcon name="i-heroicons-document-check" class="w-8 h-8 text-white" />
                  </div>
                  <div class="absolute -top-2 -right-2 w-8 h-8 bg-blue-500 rounded-full flex items-center justify-center text-white font-bold text-sm">
                    3
                  </div>
                </div>
                <h3 class="text-xl font-bold text-gray-900">Certificate</h3>
                <p class="text-gray-600">Receive your completion certificate and submit to the FLHSMV to satisfy your requirements.</p>
              </div>
            </div>
          </UCard>
        </div>
      </UContainer>
    </section>

    <!-- Modules Preview Section -->
    <section class="py-16 md:py-24 bg-gray-50">
      <UContainer class="max-w-7xl mx-auto px-4">
        <div class="space-y-12">
          <div class="text-center space-y-4">
            <h2 class="text-3xl md:text-4xl font-extrabold text-gray-900">
              Course Modules
            </h2>
            <p class="text-xl text-gray-600 max-w-3xl mx-auto">
              Comprehensive curriculum designed to improve your driving skills and safety awareness
            </p>
          </div>
          
          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
            <UCard v-for="module in previewModules" :key="module.id" class="hover:shadow-lg transition-shadow">
              <div class="space-y-4">
                <div class="flex items-center gap-3">
                  <UIcon :name="module.icon" class="w-8 h-8 text-[#A90F1D]" />
                  <h3 class="text-lg font-bold text-gray-900">{{ module.title }}</h3>
                </div>
                <p class="text-gray-600 text-sm">{{ module.description }}</p>
                <div class="flex items-center justify-between">
                  <span class="text-sm text-gray-500 font-medium">{{ module.duration }}</span>
                  <UBadge color="primary" variant="soft" class="text-xs">
                    {{ module.type }}
                  </UBadge>
                </div>
              </div>
            </UCard>
          </div>
          
          <div class="text-center">
            <UButton to="/login" color="primary" size="lg" class="font-semibold">
              View All Modules
            </UButton>
          </div>
        </div>
      </UContainer>
    </section>

    <!-- Why Choose Us Section -->
    <section class="py-16 md:py-24 bg-white">
      <UContainer class="max-w-7xl mx-auto px-4">
        <div class="space-y-12">
          <div class="text-center space-y-4">
            <h2 class="text-3xl md:text-4xl font-extrabold text-gray-900">
              Why Choose Our Course?
            </h2>
            <p class="text-xl text-gray-600 max-w-3xl mx-auto">
              We're committed to providing the best Basic Driver Improvement experience in Florida
            </p>
          </div>
          
          <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            <!-- Benefits List -->
            <div class="space-y-6">
              <div v-for="benefit in benefits" :key="benefit.title" class="flex items-start gap-4">
                <div class="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center flex-shrink-0">
                  <UIcon :name="benefit.icon" class="w-6 h-6 text-green-600" />
                </div>
                <div>
                  <h3 class="text-lg font-bold text-gray-900 mb-2">{{ benefit.title }}</h3>
                  <p class="text-gray-600">{{ benefit.description }}</p>
                </div>
              </div>
            </div>
            
            <!-- Comparison Table -->
            <UCard>
              <div class="overflow-x-auto">
                <table class="w-full">
                  <thead>
                    <tr class="border-b border-gray-200">
                      <th class="text-left py-3 px-4 font-semibold text-gray-900">Feature</th>
                      <th class="text-center py-3 px-4 font-semibold text-gray-900">Our Course</th>
                      <th class="text-center py-3 px-4 font-semibold text-gray-900">Other Providers</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr v-for="row in comparisonData" :key="row.feature" class="border-b border-gray-100">
                      <td class="py-3 px-4 font-medium text-gray-900">{{ row.feature }}</td>
                      <td class="py-3 px-4 text-center">
                        <div class="flex items-center justify-center gap-2">
                          <UIcon name="i-heroicons-check-circle" class="w-5 h-5 text-green-500" />
                          <span class="text-green-700 font-medium">{{ row.us }}</span>
                        </div>
                      </td>
                      <td class="py-3 px-4 text-center">
                        <div class="flex items-center justify-center gap-2">
                          <UIcon name="i-heroicons-x-circle" class="w-5 h-5 text-red-500" />
                          <span class="text-red-700">{{ row.others }}</span>
                        </div>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </UCard>
          </div>
        </div>
      </UContainer>
    </section>

    <!-- Testimonials Section -->
    <section class="py-16 md:py-24 bg-gray-50">
      <UContainer class="max-w-7xl mx-auto px-4">
        <div class="space-y-12">
          <div class="text-center space-y-4">
            <h2 class="text-3xl md:text-4xl font-extrabold text-gray-900">
              What Our Students Say
            </h2>
            <p class="text-xl text-gray-600 max-w-3xl mx-auto">
              Join thousands of satisfied drivers who have completed our course
            </p>
          </div>
          
          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <UCard v-for="testimonial in testimonials" :key="testimonial.id" class="space-y-4">
              <div class="flex items-center gap-3">
                <UAvatar :name="testimonial.name" :src="testimonial.avatar" size="md" />
                <div>
                  <h4 class="font-bold text-gray-900">{{ testimonial.name }}</h4>
                  <p class="text-sm text-gray-600">{{ testimonial.location }}</p>
                </div>
              </div>
              <div class="flex items-center gap-1">
                <UIcon v-for="i in 5" :key="i" name="i-heroicons-star" class="w-5 h-5 text-yellow-400" />
              </div>
              <p class="text-gray-600 italic">"{{ testimonial.quote }}"</p>
            </UCard>
          </div>
        </div>
      </UContainer>
    </section>

    <!-- Pricing Section -->
    <section class="py-16 md:py-24 bg-white">
      <UContainer class="max-w-7xl mx-auto px-4">
        <div class="space-y-12">
          <div class="text-center space-y-4">
            <h2 class="text-3xl md:text-4xl font-extrabold text-gray-900">
              Simple, Transparent Pricing
            </h2>
            <p class="text-xl text-gray-600 max-w-3xl mx-auto">
              One-time payment, no hidden fees, complete access to all course materials
            </p>
          </div>
          
          <div class="max-w-2xl mx-auto">
            <UCard class="text-center space-y-8">
              <div class="space-y-4">
                <h3 class="text-2xl font-bold text-gray-900">Basic Driver Improvement Course</h3>
                <div class="flex items-baseline justify-center gap-2">
                  <span class="text-5xl font-extrabold text-[#A90F1D]">$29</span>
                  <span class="text-xl text-gray-600">one-time</span>
                </div>
                <p class="text-gray-600">Complete course with certificate included</p>
              </div>
              
              <div class="space-y-4">
                <h4 class="text-lg font-bold text-gray-900">What's Included:</h4>
                <ul class="space-y-2 text-left max-w-md mx-auto">
                  <li v-for="feature in pricingFeatures" :key="feature" class="flex items-center gap-3">
                    <UIcon name="i-heroicons-check-circle" class="w-5 h-5 text-green-500 flex-shrink-0" />
                    <span class="text-gray-700">{{ feature }}</span>
                  </li>
                </ul>
              </div>
              
              <UButton to="/login" color="primary" size="xl" class="w-full font-bold py-4 text-lg">
                Start Now - $29
              </UButton>
              
              <p class="text-sm text-gray-500">
                * Payment processed securely. 30-day money-back guarantee.
              </p>
            </UCard>
          </div>
        </div>
      </UContainer>
    </section>

    <!-- Footer -->
    <footer class="bg-gray-900 text-white py-12">
      <UContainer class="max-w-7xl mx-auto px-4">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
          <!-- Company Info -->
          <div class="space-y-4">
            <h3 class="text-xl font-bold">Florida BDI Course</h3>
            <p class="text-gray-400 text-sm">
              State-approved Basic Driver Improvement course provider. Helping Florida drivers stay safe and compliant.
            </p>
          </div>
          
          <!-- Quick Links -->
          <div class="space-y-4">
            <h4 class="font-bold">Quick Links</h4>
            <ul class="space-y-2 text-sm text-gray-400">
              <li><a href="#" class="hover:text-white transition">About Us</a></li>
              <li><a href="#" class="hover:text-white transition">Course Overview</a></li>
              <li><a href="#" class="hover:text-white transition">FAQ</a></li>
              <li><a href="#" class="hover:text-white transition">Support</a></li>
            </ul>
          </div>
          
          <!-- Contact -->
          <div class="space-y-4">
            <h4 class="font-bold">Contact</h4>
            <ul class="space-y-2 text-sm text-gray-400">
              <li class="flex items-center gap-2">
                <UIcon name="i-heroicons-envelope" class="w-4 h-4" />
                <span>support@floridabdi.com</span>
              </li>
              <li class="flex items-center gap-2">
                <UIcon name="i-heroicons-phone" class="w-4 h-4" />
                <span>1-800-BDI-COURSE</span>
              </li>
            </ul>
          </div>
          
          <!-- Compliance -->
          <div class="space-y-4">
            <h4 class="font-bold">Compliance</h4>
            <div class="space-y-2 text-sm text-gray-400">
              <p>FLHSMV Approved Provider</p>
              <p>Course #: BDI-2024-001</p>
              <p>Valid in all Florida counties</p>
            </div>
          </div>
        </div>
        
        <div class="border-t border-gray-800 mt-8 pt-8 text-center">
          <p class="text-sm text-gray-400">
            © 2024 Florida BDI Course. All rights reserved. | 
            <a href="#" class="hover:text-white transition">Privacy Policy</a> | 
            <a href="#" class="hover:text-white transition">Terms of Service</a>
          </p>
        </div>
      </UContainer>
    </footer>
  </div>
</template>

<script setup>
// Preview modules for the landing page
const previewModules = [
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
  }
]

// Benefits list
const benefits = [
  {
    title: 'State Approved',
    description: 'Our course is officially approved by the Florida Highway Safety and Motor Vehicles (FLHSMV).',
    icon: 'i-heroicons-shield-check'
  },
  {
    title: 'Self-Paced Learning',
    description: 'Complete the course at your own speed with 24/7 access to all materials.',
    icon: 'i-heroicons-clock'
  },
  {
    title: 'Mobile Friendly',
    description: 'Access your course from any device - computer, tablet, or smartphone.',
    icon: 'i-heroicons-device-phone-mobile'
  },
  {
    title: 'Instant Certificate',
    description: 'Receive your completion certificate immediately upon finishing the course.',
    icon: 'i-heroicons-document-check'
  },
  {
    title: 'Expert Support',
    description: 'Get help when you need it with our dedicated customer support team.',
    icon: 'i-heroicons-chat-bubble-left-right'
  },
  {
    title: 'Money-Back Guarantee',
    description: '30-day satisfaction guarantee - if you\'re not happy, we\'ll refund your payment.',
    icon: 'i-heroicons-heart'
  }
]

// Comparison table data
const comparisonData = [
  { feature: 'State Approval', us: 'Yes', others: 'Varies' },
  { feature: '24/7 Access', us: 'Yes', others: 'Limited' },
  { feature: 'Mobile Friendly', us: 'Yes', others: 'No' },
  { feature: 'Instant Certificate', us: 'Yes', others: 'No' },
  { feature: 'Customer Support', us: '24/7', others: 'Business Hours' },
  { feature: 'Money-Back Guarantee', us: '30 Days', others: 'None' }
]

// Testimonials
const testimonials = [
  {
    id: 1,
    name: 'Sarah Johnson',
    location: 'Miami, FL',
    avatar: '/avatar-placeholder.png',
    quote: 'The course was easy to follow and I learned so much about defensive driving. Highly recommend!'
  },
  {
    id: 2,
    name: 'Michael Chen',
    location: 'Orlando, FL',
    avatar: '/avatar-placeholder.png',
    quote: 'Completed the course in one weekend. The mobile-friendly design made it so convenient.'
  },
  {
    id: 3,
    name: 'Emily Rodriguez',
    location: 'Tampa, FL',
    avatar: '/avatar-placeholder.png',
    quote: 'Great value for the price. The certificate was available immediately after completion.'
  }
]

// Pricing features
const pricingFeatures = [
  'Complete 10-module course',
  'Interactive learning materials',
  'Progress tracking',
  'Final exam included',
  'Instant certificate',
  '30-day access period',
  'Mobile-friendly design',
  '24/7 customer support'
]
</script> 