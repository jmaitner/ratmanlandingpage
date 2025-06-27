<template>
  <div v-if="isOpen" class="fixed inset-0 z-50 overflow-y-auto">
    <!-- Backdrop -->
    <div class="fixed inset-0 bg-black bg-opacity-50 transition-opacity" @click="closeModal"></div>
    
    <!-- Modal -->
    <div class="flex min-h-full items-center justify-center p-4">
      <div class="relative w-full max-w-2xl bg-white rounded-2xl shadow-2xl overflow-hidden">
        <!-- Header -->
        <div class="bg-[#F9FAFB] px-8 py-6 border-b border-[#E5E7EB]">
          <div class="flex items-center justify-between">
            <div>
              <h2 class="text-2xl font-bold text-[#111827]">Let's Find the Right Course for You</h2>
              <p class="mt-2 text-[#6B7280]">Answer a few quick questions to confirm eligibility.</p>
            </div>
            <button 
              @click="closeModal"
              class="text-[#6B7280] hover:text-[#111827] transition-colors p-2"
            >
              <Icon name="heroicons:x-mark" class="h-6 w-6" />
            </button>
          </div>
        </div>

        <!-- Content -->
        <div class="px-8 py-6 max-h-[70vh] overflow-y-auto">
          <form @submit.prevent="checkEligibility" class="space-y-8">
            <!-- State Selection -->
            <div>
              <label class="block text-[#111827] font-semibold text-lg mb-4">State</label>
              <USelect
                v-model="formData.state"
                :options="stateOptions"
                placeholder="Select your state"
                :ui="{ 
                  base: 'w-full',
                  select: 'w-full bg-white border border-[#E5E7EB] rounded-lg px-4 py-3 text-[#111827] focus:border-[#00D084] focus:ring-2 focus:ring-[#00D084]/20 transition-all duration-200',
                  option: 'text-[#111827] hover:bg-[#F9FAFB] px-4 py-2 cursor-pointer',
                  selected: 'text-[#111827]',
                  placeholder: 'text-[#6B7280]',
                  dropdown: 'bg-white border border-[#E5E7EB] rounded-lg shadow-lg mt-1'
                }"
              />
            </div>

            <!-- Course Reason -->
            <div>
              <label class="block text-[#111827] font-semibold text-lg mb-4">Why are you taking the course?</label>
              <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                <button
                  v-for="reason in courseReasons"
                  :key="reason.value"
                  type="button"
                  @click="formData.reason = reason.value"
                  :class="[
                    'p-4 rounded-lg border-2 text-left transition-all duration-200',
                    formData.reason === reason.value
                      ? 'border-[#00D084] bg-[#F0FDF4] text-[#111827]'
                      : 'border-[#E5E7EB] bg-white text-[#6B7280] hover:border-[#00D084]/50 hover:bg-[#F9FAFB]'
                  ]"
                >
                  <div class="font-medium">{{ reason.label }}</div>
                  <div class="text-sm mt-1 opacity-75">{{ reason.description }}</div>
                </button>
              </div>
            </div>

            <!-- License Status -->
            <div>
              <label class="block text-[#111827] font-semibold text-lg mb-4">License Status</label>
              <div class="grid grid-cols-1 md:grid-cols-3 gap-3">
                <button
                  v-for="license in licenseOptions"
                  :key="license.value"
                  type="button"
                  @click="formData.licenseStatus = license.value"
                  :class="[
                    'p-4 rounded-lg border-2 text-center transition-all duration-200',
                    formData.licenseStatus === license.value
                      ? 'border-[#00D084] bg-[#F0FDF4] text-[#111827]'
                      : 'border-[#E5E7EB] bg-white text-[#6B7280] hover:border-[#00D084]/50 hover:bg-[#F9FAFB]'
                  ]"
                >
                  <div class="font-medium">{{ license.label }}</div>
                </button>
              </div>
            </div>

            <!-- Conditional Ticket Details -->
            <div v-if="showTicketDetails" class="space-y-6">
              <div class="border-t border-[#E5E7EB] pt-6">
                <h3 class="text-lg font-semibold text-[#111827] mb-4">Ticket Details</h3>
                
                <!-- Florida Ticket Toggle -->
                <div class="mb-4">
                  <label class="block text-[#111827] font-medium mb-2">Was your ticket in Florida?</label>
                  <div class="flex gap-3">
                    <button
                      type="button"
                      @click="formData.floridaTicket = true"
                      :class="[
                        'px-4 py-2 rounded-lg border-2 transition-all duration-200',
                        formData.floridaTicket === true
                          ? 'border-[#00D084] bg-[#F0FDF4] text-[#111827]'
                          : 'border-[#E5E7EB] bg-white text-[#6B7280] hover:border-[#00D084]/50'
                      ]"
                    >
                      Yes
                    </button>
                    <button
                      type="button"
                      @click="formData.floridaTicket = false"
                      :class="[
                        'px-4 py-2 rounded-lg border-2 transition-all duration-200',
                        formData.floridaTicket === false
                          ? 'border-[#00D084] bg-[#F0FDF4] text-[#111827]'
                          : 'border-[#E5E7EB] bg-white text-[#6B7280] hover:border-[#00D084]/50'
                      ]"
                    >
                      No
                    </button>
                  </div>
                </div>

                <!-- County Selection (if Florida ticket) -->
                <div v-if="formData.floridaTicket" class="mb-4">
                  <label class="block text-[#111827] font-medium mb-2">County where ticket was issued</label>
                  <USelect
                    v-model="formData.county"
                    :options="floridaCounties"
                    placeholder="Select county"
                    :ui="{ 
                      base: 'w-full',
                      select: 'w-full bg-white border border-[#E5E7EB] rounded-lg px-4 py-3 text-[#111827] focus:border-[#00D084] focus:ring-2 focus:ring-[#00D084]/20 transition-all duration-200',
                      option: 'text-[#111827] hover:bg-[#F9FAFB] px-4 py-2 cursor-pointer',
                      selected: 'text-[#111827]',
                      placeholder: 'text-[#6B7280]',
                      dropdown: 'bg-white border border-[#E5E7EB] rounded-lg shadow-lg mt-1'
                    }"
                  />
                </div>

                <!-- Ticket Date -->
                <div>
                  <label class="block text-[#111827] font-medium mb-2">Date of ticket</label>
                  <input
                    v-model="formData.ticketDate"
                    type="date"
                    class="w-full bg-white border border-[#E5E7EB] rounded-lg px-4 py-3 text-[#111827] focus:border-[#00D084] focus:ring-2 focus:ring-[#00D084]/20 transition-all duration-200"
                  />
                </div>
              </div>
            </div>

            <!-- Eligibility Result -->
            <div v-if="eligibilityResult" class="border-t border-[#E5E7EB] pt-6">
              <div :class="[
                'p-4 rounded-lg border-2',
                eligibilityResult.eligible 
                  ? 'border-[#00D084] bg-[#F0FDF4]' 
                  : 'border-[#F59E0B] bg-[#FFFBEB]'
              ]">
                <div class="flex items-start gap-3">
                  <Icon 
                    :name="eligibilityResult.eligible ? 'heroicons:check-circle' : 'heroicons:exclamation-triangle'"
                    :class="[
                      'h-6 w-6 mt-0.5',
                      eligibilityResult.eligible ? 'text-[#00D084]' : 'text-[#F59E0B]'
                    ]"
                  />
                  <div>
                    <h4 class="font-semibold text-[#111827] mb-1">{{ eligibilityResult.title }}</h4>
                    <p class="text-[#6B7280] text-sm">{{ eligibilityResult.message }}</p>
                  </div>
                </div>
              </div>
            </div>
          </form>
        </div>

        <!-- Footer -->
        <div class="bg-[#F9FAFB] px-8 py-6 border-t border-[#E5E7EB]">
          <div class="flex flex-col sm:flex-row gap-3 justify-between items-center">
            <div class="flex gap-3">
              <UButton
                variant="ghost"
                @click="closeModal"
                class="text-[#6B7280] hover:text-[#111827]"
              >
                Cancel
              </UButton>
              <UButton
                variant="ghost"
                @click="contactSupport"
                class="text-[#00D084] hover:text-[#00B86B]"
              >
                Contact Support
              </UButton>
            </div>
            <UButton
              v-if="eligibilityResult?.eligible"
              @click="startCourse"
              class="bg-[#00D084] hover:bg-[#00B86B] text-white font-semibold px-8 py-3 rounded-lg shadow-lg hover:shadow-xl transition-all duration-300"
            >
              Start Course
            </UButton>
            <UButton
              v-else
              @click="checkEligibility"
              :disabled="!isFormValid"
              class="bg-[#00D084] hover:bg-[#00B86B] text-white font-semibold px-8 py-3 rounded-lg shadow-lg hover:shadow-xl transition-all duration-300 disabled:opacity-50 disabled:cursor-not-allowed"
            >
              Check Eligibility
            </UButton>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, watch, onMounted } from 'vue'

const props = defineProps({
  isOpen: {
    type: Boolean,
    default: false
  }
})

const emit = defineEmits(['close', 'start-course'])

// Form data
const formData = ref({
  state: 'Florida',
  reason: '',
  licenseStatus: '',
  floridaTicket: null,
  county: '',
  ticketDate: ''
})

// Initialize form when modal opens
onMounted(() => {
  console.log('Modal mounted, form data:', formData.value)
})

// Options
const stateOptions = [
  { label: 'Florida', value: 'Florida' }
]

const courseReasons = [
  { value: 'traffic-ticket', label: 'Traffic Ticket', description: 'Speeding, red light, etc.' },
  { value: 'insurance-discount', label: 'Insurance Discount', description: 'Lower your premiums' },
  { value: 'court-ordered', label: 'Court/DMV Ordered', description: 'Required by court or DMV' },
  { value: 'recommended', label: 'Was Told to Take Course', description: 'BDI/ADI/IDI recommended' },
  { value: 'not-sure', label: 'Not Sure', description: 'Need help determining' }
]

const licenseOptions = [
  { value: 'florida', label: 'Florida License' },
  { value: 'out-of-state', label: 'Out-of-State License' },
  { value: 'no-license', label: 'No License' }
]

const floridaCounties = [
  'Alachua', 'Baker', 'Bay', 'Bradford', 'Brevard', 'Broward', 'Calhoun', 'Charlotte', 'Citrus', 'Clay', 'Collier', 'Columbia', 'DeSoto', 'Dixie', 'Duval', 'Escambia', 'Flagler', 'Franklin', 'Gadsden', 'Gilchrist', 'Glades', 'Gulf', 'Hamilton', 'Hardee', 'Hendry', 'Hernando', 'Highlands', 'Hillsborough', 'Holmes', 'Indian River', 'Jackson', 'Jefferson', 'Lafayette', 'Lake', 'Lee', 'Leon', 'Levy', 'Liberty', 'Madison', 'Manatee', 'Marion', 'Martin', 'Miami-Dade', 'Monroe', 'Nassau', 'Okaloosa', 'Okeechobee', 'Orange', 'Osceola', 'Palm Beach', 'Pasco', 'Pinellas', 'Polk', 'Putnam', 'Santa Rosa', 'Sarasota', 'Seminole', 'St. Johns', 'St. Lucie', 'Sumter', 'Suwannee', 'Taylor', 'Union', 'Volusia', 'Wakulla', 'Walton', 'Washington'
].map(county => ({ label: county, value: county }))

// Computed properties
const showTicketDetails = computed(() => {
  return formData.value.reason === 'traffic-ticket' || formData.value.reason === 'court-ordered'
})

const isFormValid = computed(() => {
  return formData.value.state && formData.value.reason && formData.value.licenseStatus
})

const eligibilityResult = ref(null)

// Watch for form data changes
watch(formData, (newVal) => {
  console.log('Form data changed:', newVal)
}, { deep: true })

// Watch for modal open/close
watch(() => props.isOpen, (isOpen) => {
  if (isOpen) {
    console.log('Modal opened, resetting form')
    formData.value = {
      state: 'Florida',
      reason: '',
      licenseStatus: '',
      floridaTicket: null,
      county: '',
      ticketDate: ''
    }
    eligibilityResult.value = null
  }
})

// Methods
const closeModal = () => {
  emit('close')
  // Reset form
  formData.value = {
    state: 'Florida',
    reason: '',
    licenseStatus: '',
    floridaTicket: null,
    county: '',
    ticketDate: ''
  }
  eligibilityResult.value = null
}

const checkEligibility = () => {
  if (!isFormValid.value) return

  // Eligibility logic
  const { state, reason, licenseStatus, floridaTicket } = formData.value

  if (state === 'Florida' && licenseStatus === 'florida') {
    if (reason === 'traffic-ticket' || reason === 'court-ordered') {
      if (floridaTicket === true) {
        eligibilityResult.value = {
          eligible: true,
          title: "You're Good to Go!",
          message: "You're eligible for our Florida BDI course. Click 'Start Course' to begin your journey."
        }
      } else if (floridaTicket === false) {
        eligibilityResult.value = {
          eligible: false,
          title: "Out-of-State Ticket",
          message: "We currently only handle Florida tickets. Please contact support for assistance with out-of-state violations."
        }
      } else {
        eligibilityResult.value = {
          eligible: false,
          title: "Need More Information",
          message: "Please specify if your ticket was issued in Florida to determine eligibility."
        }
      }
    } else if (reason === 'insurance-discount') {
      eligibilityResult.value = {
        eligible: true,
        title: "Eligible for Insurance Discount",
        message: "You can take our course to qualify for insurance discounts. Click 'Start Course' to begin."
      }
    } else if (reason === 'recommended') {
      eligibilityResult.value = {
        eligible: true,
        title: "Course Recommended",
        message: "Based on your situation, our course should help. Click 'Start Course' to begin."
      }
    } else {
      eligibilityResult.value = {
        eligible: false,
        title: "Need More Information",
        message: "Please contact our support team to help determine the right course for your situation."
      }
    }
  } else if (licenseStatus === 'out-of-state') {
    eligibilityResult.value = {
      eligible: false,
      title: "Out-of-State License",
      message: "We currently only serve Florida license holders. Please contact support for assistance."
    }
  } else if (licenseStatus === 'no-license') {
    eligibilityResult.value = {
      eligible: false,
      title: "No License",
      message: "You need a valid driver's license to take our courses. Please contact support for guidance."
    }
  } else {
    eligibilityResult.value = {
      eligible: false,
      title: "Need More Information",
      message: "Please complete all required fields to check your eligibility."
    }
  }
}

const startCourse = () => {
  emit('start-course')
  closeModal()
}

const contactSupport = () => {
  // In a real app, this would open a contact form or redirect to support
  window.open('mailto:support@roadready.com?subject=Eligibility%20Question', '_blank')
}
</script> 