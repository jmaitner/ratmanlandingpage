# Static Landing Page Deployment Guide

This guide provides instructions for deploying your terminal-aesthetic static landing page to Amazon S3 and WordPress.

## 📁 Project Structure

```
├── index.html          # Main HTML file
├── styles.css          # CSS styles with terminal aesthetic
├── assets/
│   ├── i1ml.woff2     # Intel One Mono font (light)
│   └── i1mb.woff2     # Intel One Mono font (bold)
├── deploy.md          # This deployment guide
└── README.md          # Project documentation
```

## 🚀 Amazon S3 Static Website Deployment

### Prerequisites
- AWS Account
- AWS CLI installed and configured
- S3 bucket created

### Step 1: Create S3 Bucket
```bash
# Create a new S3 bucket (replace 'your-unique-bucket-name' with your desired name)
aws s3 mb s3://your-unique-bucket-name --region us-east-1
```

### Step 2: Configure Bucket for Static Website Hosting
```bash
# Enable static website hosting
aws s3 website s3://your-unique-bucket-name --index-document index.html --error-document error.html
```

### Step 3: Upload Files
```bash
# Upload all files to S3
aws s3 sync . s3://your-unique-bucket-name --exclude "*.md" --exclude ".git/*" --exclude "rat/*"

# Set public read permissions
aws s3api put-bucket-policy --bucket your-unique-bucket-name --policy '{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::your-unique-bucket-name/*"
    }
  ]
}'
```

### Step 4: Configure CloudFront (Optional but Recommended)
```bash
# Create CloudFront distribution for better performance and HTTPS
aws cloudfront create-distribution --distribution-config file://cloudfront-config.json
```

Create `cloudfront-config.json`:
```json
{
  "CallerReference": "my-landing-page-$(date +%s)",
  "Comment": "Terminal Landing Page Distribution",
  "DefaultCacheBehavior": {
    "TargetOriginId": "S3-your-unique-bucket-name",
    "ViewerProtocolPolicy": "redirect-to-https",
    "TrustedSigners": {
      "Enabled": false,
      "Quantity": 0
    },
    "ForwardedValues": {
      "QueryString": false,
      "Cookies": {
        "Forward": "none"
      }
    },
    "MinTTL": 0
  },
  "Origins": {
    "Quantity": 1,
    "Items": [
      {
        "Id": "S3-your-unique-bucket-name",
        "DomainName": "your-unique-bucket-name.s3.amazonaws.com",
        "S3OriginConfig": {
          "OriginAccessIdentity": ""
        }
      }
    ]
  },
  "Enabled": true,
  "DefaultRootObject": "index.html"
}
```

### Step 5: Custom Domain (Optional)
1. Register domain in Route 53 or external registrar
2. Create Route 53 hosted zone
3. Add CNAME record pointing to CloudFront distribution
4. Request SSL certificate via AWS Certificate Manager

## 📝 WordPress Deployment

### Method 1: Direct Upload (Simple)
1. Access WordPress admin dashboard
2. Go to **Appearance > Theme Editor**
3. Create a new page template or edit an existing one
4. Copy the HTML content from `index.html`
5. Copy CSS from `styles.css` to **Appearance > Customize > Additional CSS**
6. Upload font files to **Media Library**
7. Update font URLs in CSS to point to uploaded files

### Method 2: Custom Plugin (Recommended)
Create a custom plugin file `terminal-landing-page.php`:

```php
<?php
/*
Plugin Name: Terminal Landing Page
Description: Modern terminal-aesthetic landing page
Version: 1.0
*/

function terminal_landing_page_enqueue_styles() {
    wp_enqueue_style('terminal-landing-page', plugins_url('styles.css', __FILE__));
}
add_action('wp_enqueue_scripts', 'terminal_landing_page_enqueue_styles');

function terminal_landing_page_shortcode() {
    ob_start();
    include plugin_dir_path(__FILE__) . 'landing-page-template.php';
    return ob_get_clean();
}
add_shortcode('terminal_landing_page', 'terminal_landing_page_shortcode');

// Add custom endpoint for full-page display
function terminal_landing_page_init() {
    add_rewrite_rule('^terminal-landing/?$', 'index.php?terminal_landing_page=1', 'top');
}
add_action('init', 'terminal_landing_page_init');

function terminal_landing_page_query_vars($query_vars) {
    $query_vars[] = 'terminal_landing_page';
    return $query_vars;
}
add_filter('query_vars', 'terminal_landing_page_query_vars');

function terminal_landing_page_template($template) {
    if (get_query_var('terminal_landing_page')) {
        return plugin_dir_path(__FILE__) . 'landing-page-full.php';
    }
    return $template;
}
add_filter('template_include', 'terminal_landing_page_template');
?>
```

### Method 3: Child Theme Implementation
1. Create a child theme
2. Add custom page template
3. Upload assets to child theme directory
4. Create custom post type for landing page content

## 🎨 Customization Options

### Colors
Edit CSS variables in `styles.css`:
```css
:root {
    --bg-primary: #191919;        /* Main background */
    --bg-secondary: #2a2a2a;      /* Secondary background */
    --text-primary: #ffffff;       /* Primary text */
    --accent-primary: #00ff00;     /* Green accent */
    --accent-secondary: #ff6b6b;   /* Red accent */
}
```

### Typography
- Replace font files in `assets/` directory
- Update font-face declarations in CSS
- Modify font-family variables

### Content
- Edit HTML content in `index.html`
- Update meta tags for SEO
- Modify contact information
- Customize service offerings

### Animations
- Adjust animation durations in CSS
- Modify keyframe animations
- Add or remove animated elements

## 🔧 Performance Optimization

### Image Optimization
- Convert images to WebP format
- Use responsive images with srcset
- Implement lazy loading

### Code Optimization
```bash
# Minify CSS
npm install -g clean-css-cli
cleancss -o styles.min.css styles.css

# Minify HTML
npm install -g html-minifier
html-minifier --collapse-whitespace --remove-comments --minify-css --minify-js index.html -o index.min.html
```

### Caching Headers
Add to S3 bucket policy or CloudFront behaviors:
```json
{
  "CacheControl": "max-age=31536000", // 1 year for fonts
  "CacheControl": "max-age=86400"     // 1 day for HTML/CSS
}
```

## 🔍 SEO Optimization

### Meta Tags
```html
<meta name="description" content="Modern terminal-aesthetic landing page">
<meta name="keywords" content="terminal, landing page, modern, minimalist">
<meta property="og:title" content="Terminal Landing Page">
<meta property="og:description" content="A modern approach to digital experiences">
<meta property="og:image" content="https://your-domain.com/og-image.jpg">
<meta name="twitter:card" content="summary_large_image">
```

### Structured Data
```json
{
  "@context": "https://schema.org",
  "@type": "WebPage",
  "name": "Terminal Landing Page",
  "description": "Modern terminal-aesthetic landing page",
  "url": "https://your-domain.com"
}
```

## 📊 Analytics Setup

### Google Analytics 4
```html
<!-- Add to <head> section -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

### AWS CloudWatch (for S3 hosting)
- Enable S3 access logging
- Set up CloudWatch dashboards
- Configure alarms for monitoring

## 🔐 Security Considerations

### Content Security Policy
```html
<meta http-equiv="Content-Security-Policy" content="default-src 'self'; style-src 'self' 'unsafe-inline'; font-src 'self';">
```

### HTTPS Enforcement
- Use CloudFront for SSL termination
- Configure HSTS headers
- Implement security headers

## 🚨 Troubleshooting

### Common Issues
1. **Font loading errors**: Check file paths and CORS settings
2. **CSS not loading**: Verify file permissions and paths
3. **Mobile responsiveness**: Test on various devices
4. **Performance issues**: Optimize images and minify code

### Debug Tools
- Chrome DevTools
- GTmetrix for performance testing
- Google PageSpeed Insights
- W3C Markup Validator

## 📞 Support

For technical support or customization requests:
- Check the GitHub repository for updates
- Review the troubleshooting section
- Contact: [your-email@example.com]

---

**Note**: Remember to replace placeholder values (bucket names, domains, etc.) with your actual values before deployment.