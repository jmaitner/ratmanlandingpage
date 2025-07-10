#!/bin/bash

# Terminal Landing Page - AWS S3 Deployment Script
# This script automates the deployment of your static landing page to Amazon S3

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
BUCKET_NAME=""
REGION="us-east-1"
PROFILE=""

# Helper functions
print_header() {
    echo -e "${BLUE}"
    echo "╔════════════════════════════════════════════════════════════════╗"
    echo "║                Terminal Landing Page Deployer                  ║"
    echo "║                     AWS S3 Static Website                     ║"
    echo "╚════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

print_step() {
    echo -e "${GREEN}▶ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

# Check if AWS CLI is installed
check_aws_cli() {
    if ! command -v aws &> /dev/null; then
        print_error "AWS CLI is not installed. Please install it first:"
        echo "  - macOS: brew install awscli"
        echo "  - Linux: sudo apt-get install awscli"
        echo "  - Windows: Download from https://aws.amazon.com/cli/"
        exit 1
    fi
    print_success "AWS CLI is installed"
}

# Check if AWS is configured
check_aws_config() {
    if ! aws configure list &> /dev/null; then
        print_error "AWS CLI is not configured. Run 'aws configure' first."
        exit 1
    fi
    print_success "AWS CLI is configured"
}

# Get bucket name from user
get_bucket_name() {
    if [ -z "$BUCKET_NAME" ]; then
        echo -e "${YELLOW}Enter your S3 bucket name (must be globally unique):${NC}"
        read -r BUCKET_NAME
        
        if [ -z "$BUCKET_NAME" ]; then
            print_error "Bucket name cannot be empty"
            exit 1
        fi
    fi
}

# Get AWS region
get_region() {
    echo -e "${YELLOW}Enter AWS region (default: us-east-1):${NC}"
    read -r user_region
    if [ -n "$user_region" ]; then
        REGION="$user_region"
    fi
}

# Get AWS profile (optional)
get_profile() {
    echo -e "${YELLOW}Enter AWS profile (optional, press Enter for default):${NC}"
    read -r user_profile
    if [ -n "$user_profile" ]; then
        PROFILE="--profile $user_profile"
    fi
}

# Check if bucket exists
check_bucket_exists() {
    print_step "Checking if bucket '$BUCKET_NAME' exists..."
    if aws s3api head-bucket --bucket "$BUCKET_NAME" $PROFILE 2>/dev/null; then
        print_warning "Bucket '$BUCKET_NAME' already exists"
        echo -e "${YELLOW}Do you want to use this existing bucket? (y/N):${NC}"
        read -r response
        if [[ ! "$response" =~ ^[Yy]$ ]]; then
            print_error "Deployment cancelled"
            exit 1
        fi
    else
        print_step "Creating bucket '$BUCKET_NAME'..."
        if [ "$REGION" = "us-east-1" ]; then
            aws s3api create-bucket --bucket "$BUCKET_NAME" $PROFILE
        else
            aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$REGION" \
                --create-bucket-configuration LocationConstraint="$REGION" $PROFILE
        fi
        print_success "Bucket created successfully"
    fi
}

# Configure bucket for static website hosting
configure_website() {
    print_step "Configuring bucket for static website hosting..."
    aws s3 website "s3://$BUCKET_NAME" \
        --index-document index.html \
        --error-document index.html $PROFILE
    print_success "Website hosting configured"
}

# Set bucket policy for public access
set_bucket_policy() {
    print_step "Setting bucket policy for public access..."
    
    # Create temporary policy file
    cat > /tmp/bucket-policy.json << EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::$BUCKET_NAME/*"
        }
    ]
}
EOF

    aws s3api put-bucket-policy --bucket "$BUCKET_NAME" \
        --policy file:///tmp/bucket-policy.json $PROFILE
    
    # Clean up
    rm /tmp/bucket-policy.json
    print_success "Bucket policy set for public access"
}

# Upload files to S3
upload_files() {
    print_step "Uploading files to S3..."
    
    # Upload with appropriate content types and cache headers
    aws s3 sync . "s3://$BUCKET_NAME" $PROFILE \
        --exclude "*.md" \
        --exclude "*.sh" \
        --exclude ".git/*" \
        --exclude "rat/*" \
        --exclude "deploy.sh" \
        --exclude "cloudfront-config.json" \
        --exclude ".gitignore" \
        --delete
    
    # Set specific cache headers for different file types
    print_step "Setting cache headers..."
    
    # HTML files - short cache
    aws s3 cp index.html "s3://$BUCKET_NAME/index.html" $PROFILE \
        --cache-control "max-age=300" \
        --content-type "text/html"
    
    # CSS files - medium cache
    aws s3 cp styles.css "s3://$BUCKET_NAME/styles.css" $PROFILE \
        --cache-control "max-age=86400" \
        --content-type "text/css"
    
    # Font files - long cache
    if [ -d "assets" ]; then
        aws s3 cp assets/ "s3://$BUCKET_NAME/assets/" $PROFILE \
            --recursive \
            --cache-control "max-age=31536000" \
            --content-type "font/woff2"
    fi
    
    print_success "Files uploaded successfully"
}

# Get website URL
get_website_url() {
    if [ "$REGION" = "us-east-1" ]; then
        WEBSITE_URL="http://$BUCKET_NAME.s3-website-us-east-1.amazonaws.com"
    else
        WEBSITE_URL="http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com"
    fi
}

# Display deployment summary
show_summary() {
    echo
    echo -e "${GREEN}╔════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║                    DEPLOYMENT SUCCESSFUL!                     ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════════════════════════╝${NC}"
    echo
    echo -e "${BLUE}Website URL:${NC} $WEBSITE_URL"
    echo -e "${BLUE}S3 Bucket:${NC} $BUCKET_NAME"
    echo -e "${BLUE}Region:${NC} $REGION"
    echo
    echo -e "${YELLOW}Next Steps:${NC}"
    echo "1. Visit your website URL to verify deployment"
    echo "2. Consider setting up CloudFront for HTTPS and better performance"
    echo "3. Configure a custom domain name (optional)"
    echo "4. Set up monitoring and analytics"
    echo
    echo -e "${GREEN}Tips:${NC}"
    echo "• To update your site, just run this script again"
    echo "• Check AWS S3 console for detailed bucket settings"
    echo "• Consider CloudFront for production use"
    echo
}

# Option to configure CloudFront
offer_cloudfront() {
    echo -e "${YELLOW}Would you like to set up CloudFront distribution for HTTPS and better performance? (y/N):${NC}"
    read -r response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        print_step "Creating CloudFront distribution..."
        print_warning "This feature requires additional configuration. Please refer to deploy.md for detailed instructions."
        echo "CloudFront setup is beyond the scope of this simple script."
        echo "Please follow the CloudFront section in deploy.md for manual setup."
    fi
}

# Main deployment function
main() {
    print_header
    
    print_step "Starting deployment process..."
    
    # Pre-flight checks
    check_aws_cli
    check_aws_config
    
    # Get configuration
    get_bucket_name
    get_region
    get_profile
    
    # Deploy
    check_bucket_exists
    configure_website
    set_bucket_policy
    upload_files
    
    # Get website URL
    get_website_url
    
    # Show results
    show_summary
    
    # Optional CloudFront setup
    offer_cloudfront
    
    print_success "Deployment completed!"
}

# Check if script is being run directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Handle command line arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            -b|--bucket)
                BUCKET_NAME="$2"
                shift 2
                ;;
            -r|--region)
                REGION="$2"
                shift 2
                ;;
            -p|--profile)
                PROFILE="--profile $2"
                shift 2
                ;;
            -h|--help)
                echo "Usage: $0 [OPTIONS]"
                echo "Options:"
                echo "  -b, --bucket BUCKET_NAME    S3 bucket name"
                echo "  -r, --region REGION         AWS region (default: us-east-1)"
                echo "  -p, --profile PROFILE       AWS profile name"
                echo "  -h, --help                  Show this help message"
                exit 0
                ;;
            *)
                print_error "Unknown option: $1"
                echo "Use -h or --help for usage information"
                exit 1
                ;;
        esac
    done
    
    main
fi