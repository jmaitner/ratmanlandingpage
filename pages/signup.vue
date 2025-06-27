<template>
  <div class="min-h-screen bg-[#F9FAFB]">
    <!-- Header -->
    <header class="bg-white shadow-sm border-b border-[#E5E7EB]">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-16">
          <!-- Logo -->
          <div class="flex items-center">
            <span class="text-xl font-bold text-[#111827]">
              Road Ready
            </span>
          </div>

          <!-- Progress Indicator -->
          <div class="hidden md:flex items-center space-x-4">
            <div class="flex items-center space-x-2">
              <div 
                class="w-8 h-8 rounded-full flex items-center justify-center text-sm font-semibold"
                :class="currentStep >= 1 ? 'bg-[#00D084] text-white' : 'bg-[#E5E7EB] text-[#6B7280]'"
              >
                1
              </div>
              <span class="text-sm text-[#6B7280]">Account</span>
            </div>
            <div class="w-8 h-1 bg-[#E5E7EB] rounded"></div>
            <div class="flex items-center space-x-2">
              <div 
                class="w-8 h-8 rounded-full flex items-center justify-center text-sm font-semibold"
                :class="currentStep >= 2 ? 'bg-[#00D084] text-white' : 'bg-[#E5E7EB] text-[#6B7280]'"
              >
                2
              </div>
              <span class="text-sm text-[#6B7280]">Payment</span>
            </div>
            <div class="w-8 h-1 bg-[#E5E7EB] rounded"></div>
            <div class="flex items-center space-x-2">
              <div 
                class="w-8 h-8 rounded-full flex items-center justify-center text-sm font-semibold"
                :class="currentStep >= 3 ? 'bg-[#00D084] text-white' : 'bg-[#E5E7EB] text-[#6B7280]'"
              >
                3
              </div>
              <span class="text-sm text-[#6B7280]">Details</span>
            </div>
            <div class="w-8 h-1 bg-[#E5E7EB] rounded"></div>
            <div class="flex items-center space-x-2">
              <div 
                class="w-8 h-8 rounded-full flex items-center justify-center text-sm font-semibold"
                :class="currentStep >= 4 ? 'bg-[#00D084] text-white' : 'bg-[#E5E7EB] text-[#6B7280]'"
              >
                4
              </div>
              <span class="text-sm text-[#6B7280]">License</span>
            </div>
            <div class="w-8 h-1 bg-[#E5E7EB] rounded"></div>
            <div class="flex items-center space-x-2">
              <div 
                class="w-8 h-8 rounded-full flex items-center justify-center text-sm font-semibold"
                :class="currentStep >= 5 ? 'bg-[#00D084] text-white' : 'bg-[#E5E7EB] text-[#6B7280]'"
              >
                5
              </div>
              <span class="text-sm text-[#6B7280]">Complete</span>
            </div>
          </div>

          <!-- Mobile Progress -->
          <div class="md:hidden text-sm text-[#6B7280]">
            Step {{ currentStep }} of 5
          </div>
        </div>
      </div>
    </header>

    <!-- Main Content -->
    <main class="max-w-2xl mx-auto px-4 py-8">
      <!-- Step 1: Create Account -->
      <div v-if="currentStep === 1" class="animate-fade-in">
        <div class="text-center mb-8">
          <h1 class="text-3xl font-bold text-[#111827] mb-2">Create Your Account</h1>
          <p class="text-[#6B7280]">Get started with your Florida driving course in just a few steps</p>
        </div>

        <div class="bg-white rounded-xl shadow-sm border border-[#E5E7EB] p-8">
          <form @submit.prevent="handleStep1" class="space-y-6">
            <div>
              <label class="block text-sm font-semibold text-[#111827] mb-2">Email Address</label>
              <UInput
                v-model="formData.email"
                type="email"
                placeholder="Enter your email"
                class="w-full"
                :ui="{
                  base: 'block w-full',
                  input: 'bg-white text-[#111827] placeholder-[#9CA3AF] border border-[#D1D5DB] rounded-lg py-2 px-3 focus:ring-2 focus:ring-[#00D084] focus:border-[#00D084] transition',
                  rounded: '',
                  ring: '',
                  padding: '',
                  icon: ''
                }"
              />
            </div>

            <div>
              <label class="block text-sm font-semibold text-[#111827] mb-2">Password</label>
              <UInput
                v-model="formData.password"
                type="password"
                placeholder="Create a password"
                class="w-full"
                :ui="{
                  base: 'block w-full',
                  input: 'bg-white text-[#111827] placeholder-[#9CA3AF] border border-[#D1D5DB] rounded-lg py-2 px-3 focus:ring-2 focus:ring-[#00D084] focus:border-[#00D084] transition',
                  rounded: '',
                  ring: '',
                  padding: '',
                  icon: ''
                }"
              />
            </div>

            <!-- Trust Indicators -->
            <div class="bg-[#F0F9FF] border border-[#BAE6FD] rounded-lg p-4">
              <div class="flex items-center gap-3">
                <Icon name="heroicons:star" class="h-5 w-5 text-[#00D084]" />
                <span class="text-sm text-[#0C4A6E] font-medium">
                  Trusted by 50,000+ Florida drivers
                </span>
              </div>
            </div>

            <UButton
              type="submit"
              class="w-full bg-[#00D084] hover:bg-[#00B86B] text-white font-semibold py-3 rounded-lg transition-all duration-300"
              :loading="loading"
            >
              Continue Securely
            </UButton>
          </form>
        </div>
      </div>

      <!-- Step 2: Payment -->
      <div v-if="currentStep === 2" class="animate-fade-in">
        <div class="text-center mb-8">
          <h1 class="text-3xl font-bold text-[#111827] mb-2">Secure Payment</h1>
          <p class="text-[#6B7280]">Your information is protected with bank-level security</p>
        </div>

        <div class="bg-white rounded-xl shadow-sm border border-[#E5E7EB] p-8">
          <form @submit.prevent="handleStep2" class="space-y-6">
            <!-- Payment Method Selection -->
            <div>
              <label class="block text-sm font-semibold text-[#111827] mb-3">Payment Method</label>
              <div class="space-y-3">
                <div 
                  class="flex items-center p-4 border rounded-lg cursor-pointer transition-all"
                  :class="paymentMethod === 'card' ? 'border-[#00D084] bg-[#F0FDF4]' : 'border-[#E5E7EB] hover:border-[#00D084]'"
                  @click="paymentMethod = 'card'"
                >
                  <input type="radio" v-model="paymentMethod" value="card" class="mr-3" />
                  <div class="flex items-center gap-3">
                    <Icon name="heroicons:credit-card" class="h-6 w-6 text-[#6B7280]" />
                    <span class="font-medium">Credit/Debit Card</span>
                  </div>
                </div>
                <div 
                  class="flex items-center p-4 border rounded-lg cursor-pointer transition-all"
                  :class="paymentMethod === 'wallet' ? 'border-[#00D084] bg-[#F0FDF4]' : 'border-[#E5E7EB] hover:border-[#00D084]'"
                  @click="paymentMethod = 'wallet'"
                >
                  <input type="radio" v-model="paymentMethod" value="wallet" class="mr-3" />
                  <div class="flex items-center gap-3">
                    <Icon name="heroicons:device-phone-mobile" class="h-6 w-6 text-[#6B7280]" />
                    <span class="font-medium">Apple Pay / Google Pay</span>
                  </div>
                </div>
              </div>
            </div>

            <!-- Card Details -->
            <div v-if="paymentMethod === 'card'" class="space-y-4">
              <div>
                <label class="block text-sm font-semibold text-[#111827] mb-2">Card Number</label>
                <UInput
                  v-model="formData.cardNumber"
                  placeholder="1234 5678 9012 3456"
                  class="w-full"
                  :ui="{
                    base: 'block w-full',
                    input: 'bg-white text-[#111827] placeholder-[#9CA3AF] border border-[#D1D5DB] rounded-lg py-2 px-3 focus:ring-2 focus:ring-[#00D084] focus:border-[#00D084] transition',
                    rounded: '',
                    ring: '',
                    padding: '',
                    icon: ''
                  }"
                />
              </div>

              <div class="grid grid-cols-2 gap-4">
                <div>
                  <label class="block text-sm font-semibold text-[#111827] mb-2">Expiration</label>
                  <UInput
                    v-model="formData.expiry"
                    placeholder="MM/YY"
                    class="w-full"
                    :ui="{
                      base: 'block w-full',
                      input: 'bg-white text-[#111827] placeholder-[#9CA3AF] border border-[#D1D5DB] rounded-lg py-2 px-3 focus:ring-2 focus:ring-[#00D084] focus:border-[#00D084] transition',
                      rounded: '',
                      ring: '',
                      padding: '',
                      icon: ''
                    }"
                  />
                </div>
                <div>
                  <label class="block text-sm font-semibold text-[#111827] mb-2">CVV</label>
                  <UInput
                    v-model="formData.cvv"
                    placeholder="123"
                    class="w-full"
                    :ui="{
                      base: 'block w-full',
                      input: 'bg-white text-[#111827] placeholder-[#9CA3AF] border border-[#D1D5DB] rounded-lg py-2 px-3 focus:ring-2 focus:ring-[#00D084] focus:border-[#00D084] transition',
                      rounded: '',
                      ring: '',
                      padding: '',
                      icon: ''
                    }"
                  />
                </div>
              </div>

              <div>
                <label class="block text-sm font-semibold text-[#111827] mb-2">ZIP Code</label>
                <UInput
                  v-model="formData.zipCode"
                  placeholder="Enter ZIP code"
                  class="w-full"
                  :ui="{
                    base: 'block w-full',
                    input: 'bg-white text-[#111827] placeholder-[#9CA3AF] border border-[#D1D5DB] rounded-lg py-2 px-3 focus:ring-2 focus:ring-[#00D084] focus:border-[#00D084] transition',
                    rounded: '',
                    ring: '',
                    padding: '',
                    icon: ''
                  }"
                />
              </div>
            </div>

            <!-- Trust Elements -->
            <div class="space-y-3">
              <div class="flex items-center gap-2 text-sm text-[#6B7280]">
                <Icon name="heroicons:lock-closed" class="h-4 w-4 text-[#00D084]" />
                <span>SSL Secured Payment</span>
              </div>
              <div class="flex items-center gap-2 text-sm text-[#6B7280]">
                <Icon name="heroicons:shield-check" class="h-4 w-4 text-[#00D084]" />
                <span>100% Money-back Guarantee</span>
              </div>
              <div class="flex items-center gap-2 text-sm text-[#6B7280]">
                <Icon name="heroicons:credit-card" class="h-4 w-4 text-[#00D084]" />
                <span>PCI DSS Compliant</span>
              </div>
            </div>

            <UButton
              type="submit"
              class="w-full bg-[#00D084] hover:bg-[#00B86B] text-white font-semibold py-3 rounded-lg transition-all duration-300"
              :loading="loading"
            >
              Enroll & Continue - $29.99
            </UButton>
          </form>
        </div>
      </div>

      <!-- Step 3: Personal Info -->
      <div v-if="currentStep === 3" class="animate-fade-in">
        <div class="text-center mb-8">
          <h1 class="text-3xl font-bold text-[#111827] mb-2">Personal Information</h1>
          <p class="text-[#6B7280]">Help us personalize your course experience</p>
        </div>

        <div class="bg-white rounded-xl shadow-sm border border-[#E5E7EB] p-8">
          <form @submit.prevent="handleStep3" class="space-y-6">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div>
                <label class="block text-sm font-semibold text-[#111827] mb-2">First Name</label>
                <UInput
                  v-model="formData.firstName"
                  placeholder="Enter first name"
                  class="w-full"
                  :ui="{
                    base: 'block w-full',
                    input: 'bg-white text-[#111827] placeholder-[#9CA3AF] border border-[#D1D5DB] rounded-lg py-2 px-3 focus:ring-2 focus:ring-[#00D084] focus:border-[#00D084] transition',
                    rounded: '',
                    ring: '',
                    padding: '',
                    icon: ''
                  }"
                />
              </div>
              <div>
                <label class="block text-sm font-semibold text-[#111827] mb-2">Last Name</label>
                <UInput
                  v-model="formData.lastName"
                  placeholder="Enter last name"
                  class="w-full"
                  :ui="{
                    base: 'block w-full',
                    input: 'bg-white text-[#111827] placeholder-[#9CA3AF] border border-[#D1D5DB] rounded-lg py-2 px-3 focus:ring-2 focus:ring-[#00D084] focus:border-[#00D084] transition',
                    rounded: '',
                    ring: '',
                    padding: '',
                    icon: ''
                  }"
                />
              </div>
            </div>

            <div>
              <label class="block text-sm font-semibold text-[#111827] mb-2">Date of Birth</label>
              <UInput
                v-model="formData.dateOfBirth"
                type="date"
                class="w-full"
                :ui="{
                  base: 'block w-full',
                  input: 'bg-white text-[#111827] placeholder-[#9CA3AF] border border-[#D1D5DB] rounded-lg py-2 px-3 focus:ring-2 focus:ring-[#00D084] focus:border-[#00D084] transition',
                  rounded: '',
                  ring: '',
                  padding: '',
                  icon: ''
                }"
              />
            </div>

            <div>
              <label class="block text-sm font-semibold text-[#111827] mb-2">Address</label>
              <UInput
                v-model="formData.address"
                placeholder="Enter your address"
                class="w-full"
                :ui="{
                  base: 'block w-full',
                  input: 'bg-white text-[#111827] placeholder-[#9CA3AF] border border-[#D1D5DB] rounded-lg py-2 px-3 focus:ring-2 focus:ring-[#00D084] focus:border-[#00D084] transition',
                  rounded: '',
                  ring: '',
                  padding: '',
                  icon: ''
                }"
              />
            </div>

            <div>
              <label class="block text-sm font-semibold text-[#111827] mb-2">Phone Number (Optional)</label>
              <UInput
                v-model="formData.phone"
                type="tel"
                placeholder="Enter phone number"
                class="w-full"
                :ui="{
                  base: 'block w-full',
                  input: 'bg-white text-[#111827] placeholder-[#9CA3AF] border border-[#D1D5DB] rounded-lg py-2 px-3 focus:ring-2 focus:ring-[#00D084] focus:border-[#00D084] transition',
                  rounded: '',
                  ring: '',
                  padding: '',
                  icon: ''
                }"
              />
              <p class="text-xs text-[#6B7280] mt-1">We'll use this to send you course updates and reminders</p>
            </div>

            <UButton
              type="submit"
              class="w-full bg-[#00D084] hover:bg-[#00B86B] text-white font-semibold py-3 rounded-lg transition-all duration-300"
              :loading="loading"
            >
              Next
            </UButton>
          </form>
        </div>
      </div>

      <!-- Step 4: License Info -->
      <div v-if="currentStep === 4" class="animate-fade-in">
        <div class="text-center mb-8">
          <h1 class="text-3xl font-bold text-[#111827] mb-2">Driver's License Information</h1>
          <p class="text-[#6B7280]">Required for Florida DMV submission</p>
        </div>

        <div class="bg-white rounded-xl shadow-sm border border-[#E5E7EB] p-8">
          <form @submit.prevent="handleStep4" class="space-y-6">
            <div>
              <label class="block text-sm font-semibold text-[#111827] mb-2">Driver's License Number</label>
              <UInput
                v-model="formData.licenseNumber"
                placeholder="Enter your license number"
                class="w-full"
                :ui="{
                  base: 'block w-full',
                  input: 'bg-white text-[#111827] placeholder-[#9CA3AF] border border-[#D1D5DB] rounded-lg py-2 px-3 focus:ring-2 focus:ring-[#00D084] focus:border-[#00D084] transition',
                  rounded: '',
                  ring: '',
                  padding: '',
                  icon: ''
                }"
              />
            </div>

            <div>
              <label class="block text-sm font-semibold text-[#111827] mb-2">Issuing State</label>
              <USelect
                v-model="formData.issuingState"
                :options="states"
                placeholder="Select state"
                class="w-full"
                :ui="{
                  base: 'block w-full',
                  input: 'bg-white text-[#111827] placeholder-[#9CA3AF] border border-[#D1D5DB] rounded-lg py-2 px-3 focus:ring-2 focus:ring-[#00D084] focus:border-[#00D084] transition',
                  rounded: '',
                  ring: '',
                  padding: '',
                  icon: ''
                }"
              />
            </div>

            <div class="bg-[#FEF3C7] border border-[#F59E0B] rounded-lg p-4">
              <div class="flex items-start gap-3">
                <Icon name="heroicons:information-circle" class="h-5 w-5 text-[#D97706] mt-0.5" />
                <div>
                  <p class="text-sm text-[#92400E] font-medium">
                    This information will be submitted to the Florida DMV upon course completion.
                  </p>
                </div>
              </div>
            </div>

            <UButton
              type="submit"
              class="w-full bg-[#00D084] hover:bg-[#00B86B] text-white font-semibold py-3 rounded-lg transition-all duration-300"
              :loading="loading"
            >
              Continue
            </UButton>
          </form>
        </div>
      </div>

      <!-- Step 5: Course Details -->
      <div v-if="currentStep === 5" class="animate-fade-in">
        <div class="text-center mb-8">
          <h1 class="text-3xl font-bold text-[#111827] mb-2">Course Information</h1>
          <p class="text-[#6B7280]">Help us understand your course requirements</p>
        </div>

        <div class="bg-white rounded-xl shadow-sm border border-[#E5E7EB] p-8">
          <form @submit.prevent="handleStep5" class="space-y-6">
            <div>
              <label class="block text-sm font-semibold text-[#111827] mb-2">Court Case Number (Optional)</label>
              <UInput
                v-model="formData.courtCase"
                placeholder="Enter court case number if applicable"
                class="w-full"
                :ui="{
                  base: 'block w-full',
                  input: 'bg-white text-[#111827] placeholder-[#9CA3AF] border border-[#D1D5DB] rounded-lg py-2 px-3 focus:ring-2 focus:ring-[#00D084] focus:border-[#00D084] transition',
                  rounded: '',
                  ring: '',
                  padding: '',
                  icon: ''
                }"
              />
            </div>

            <div>
              <label class="block text-sm font-semibold text-[#111827] mb-2">Reason for Course</label>
              <USelect
                v-model="formData.courseReason"
                :options="courseReasons"
                placeholder="Select reason"
                class="w-full"
                :ui="{
                  base: 'block w-full',
                  input: 'bg-white text-[#111827] placeholder-[#9CA3AF] border border-[#D1D5DB] rounded-lg py-2 px-3 focus:ring-2 focus:ring-[#00D084] focus:border-[#00D084] transition',
                  rounded: '',
                  ring: '',
                  padding: '',
                  icon: ''
                }"
              />
            </div>

            <UButton
              type="submit"
              class="w-full bg-[#00D084] hover:bg-[#00B86B] text-white font-semibold py-3 rounded-lg transition-all duration-300"
              :loading="loading"
            >
              Continue to Course Dashboard
            </UButton>
          </form>
        </div>
      </div>

      <!-- Step 6: Confirmation -->
      <div v-if="currentStep === 6" class="animate-fade-in">
        <div class="text-center mb-8">
          <div class="w-20 h-20 bg-[#00D084] rounded-full flex items-center justify-center mx-auto mb-6">
            <Icon name="heroicons:check" class="h-10 w-10 text-white" />
          </div>
          <h1 class="text-3xl font-bold text-[#111827] mb-2">You're All Set!</h1>
          <p class="text-[#6B7280]">Welcome to your Florida driving course</p>
        </div>

        <div class="bg-white rounded-xl shadow-sm border border-[#E5E7EB] p-8">
          <!-- Course Progress -->
          <div class="mb-8">
            <h3 class="text-lg font-semibold text-[#111827] mb-4">Your Course Progress</h3>
            <div class="space-y-3">
              <div class="flex items-center justify-between">
                <span class="text-sm text-[#6B7280]">Course Started</span>
                <Icon name="heroicons:check-circle" class="h-5 w-5 text-[#00D084]" />
              </div>
              <div class="flex items-center justify-between">
                <span class="text-sm text-[#6B7280]">Modules Completed</span>
                <span class="text-sm font-semibold text-[#111827]">0 of 10</span>
              </div>
              <div class="flex items-center justify-between">
                <span class="text-sm text-[#6B7280]">Estimated Time</span>
                <span class="text-sm font-semibold text-[#111827]">4-6 hours</span>
              </div>
            </div>
          </div>

          <!-- SMS Option -->
          <div class="mb-8">
            <label class="block text-sm font-semibold text-[#111827] mb-2">Get SMS Updates (Optional)</label>
            <div class="flex gap-3">
              <UInput
                v-model="formData.smsPhone"
                type="tel"
                placeholder="Enter phone number"
                class="flex-1"
                :ui="{
                  base: 'block w-full',
                  input: 'bg-white text-[#111827] placeholder-[#9CA3AF] border border-[#D1D5DB] rounded-lg py-2 px-3 focus:ring-2 focus:ring-[#00D084] focus:border-[#00D084] transition',
                  rounded: '',
                  ring: '',
                  padding: '',
                  icon: ''
                }"
              />
              <UButton
                @click="saveSMS"
                class="bg-[#00D084] hover:bg-[#00B86B] text-white font-semibold px-4 py-2 rounded-lg transition-all duration-300"
              >
                Save
              </UButton>
            </div>
            <p class="text-xs text-[#6B7280] mt-1">Receive progress updates and course reminders</p>
          </div>

          <UButton
            @click="startCourse"
            class="w-full bg-[#00D084] hover:bg-[#00B86B] text-white font-semibold py-3 rounded-lg transition-all duration-300"
          >
            Start Course Now
          </UButton>
        </div>
      </div>
    </main>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'

const currentStep = ref(1)
const loading = ref(false)
const paymentMethod = ref('card')

const formData = ref({
  email: '',
  password: '',
  cardNumber: '',
  expiry: '',
  cvv: '',
  zipCode: '',
  firstName: '',
  lastName: '',
  dateOfBirth: '',
  address: '',
  phone: '',
  licenseNumber: '',
  issuingState: 'FL',
  courtCase: '',
  courseReason: '',
  smsPhone: ''
})

const states = [
  { label: 'Florida', value: 'FL' },
  { label: 'Alabama', value: 'AL' },
  { label: 'Georgia', value: 'GA' },
  { label: 'South Carolina', value: 'SC' },
  { label: 'North Carolina', value: 'NC' },
  { label: 'Tennessee', value: 'TN' },
  { label: 'Mississippi', value: 'MS' },
  { label: 'Louisiana', value: 'LA' },
  { label: 'Texas', value: 'TX' },
  { label: 'Other', value: 'OTHER' }
]

const courseReasons = [
  { label: 'Ticket Dismissal', value: 'ticket_dismissal' },
  { label: 'Insurance Discount', value: 'insurance_discount' },
  { label: 'Court Mandate', value: 'court_mandate' },
  { label: 'Employer Required', value: 'employer_required' },
  { label: 'Personal Improvement', value: 'personal_improvement' }
]

const handleStep1 = async () => {
  if (!formData.value.email || !formData.value.password) {
    return
  }
  
  loading.value = true
  await new Promise(resolve => setTimeout(resolve, 1000))
  currentStep.value = 2
  loading.value = false
}

const handleStep2 = async () => {
  if (paymentMethod.value === 'card' && (!formData.value.cardNumber || !formData.value.expiry || !formData.value.cvv || !formData.value.zipCode)) {
    return
  }
  
  loading.value = true
  await new Promise(resolve => setTimeout(resolve, 2000))
  currentStep.value = 3
  loading.value = false
}

const handleStep3 = async () => {
  if (!formData.value.firstName || !formData.value.lastName || !formData.value.dateOfBirth) {
    return
  }
  
  loading.value = true
  await new Promise(resolve => setTimeout(resolve, 1000))
  currentStep.value = 4
  loading.value = false
}

const handleStep4 = async () => {
  if (!formData.value.licenseNumber || !formData.value.issuingState) {
    return
  }
  
  loading.value = true
  await new Promise(resolve => setTimeout(resolve, 1000))
  currentStep.value = 5
  loading.value = false
}

const handleStep5 = async () => {
  if (!formData.value.courseReason) {
    return
  }
  
  loading.value = true
  await new Promise(resolve => setTimeout(resolve, 1000))
  currentStep.value = 6
  loading.value = false
}

const saveSMS = () => {
  // Handle SMS save
  console.log('SMS saved:', formData.value.smsPhone)
}

const startCourse = () => {
  // Navigate to course dashboard
  navigateTo('/dashboard')
}

// Add CSS animations on client side
onMounted(() => {
  const style = document.createElement('style')
  style.textContent = `
    @keyframes fade-in {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
    
    .animate-fade-in {
      animation: fade-in 0.5s ease-out;
    }
  `
  document.head.appendChild(style)
})
</script>

<style scoped>
@keyframes fade-in {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}

.animate-fade-in {
  animation: fade-in 0.5s ease-out;
}
</style> 