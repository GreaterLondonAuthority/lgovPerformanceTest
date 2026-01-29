# Performance Test - Blog Creation Flow

## Test Information
- **Test Name**: Blog Creation with Guest Login
- **Test Type**: Functional/Smoke Test
- **Environment**: https://lgov-perftest.london.gov.uk
- **Priority**: High
- **Author**: Performance Test Team
- **Test ID**: PERF-BLOG-001

---

## Test Prerequisites
- Access to lgov-perftest.london.gov.uk
- Valid Guest Login credentials
- Test account: Dont_Delete_Smoke_Test_Content Administrator
- Site library contains at least one image asset

---

## Test Steps

### 1. Login
| Step | Action | Expected Result |
|------|--------|----------------|
| 1.1 | Navigate to https://lgov-perftest.london.gov.uk/user/login | Login page loads successfully |
| 1.2 | Select "Guest Login" option | Guest login form appears |
| 1.3 | Enter Username: `Dont_Delete_Smoke_Test_Content Administrator` | Username field populated |
| 1.4 | Enter Password: `P3rf0rm@nce_M0n1t0ring!` | Password field populated (masked) |
| 1.5 | Click Login button | Successfully logged in, redirected to dashboard |

### 2. Navigate to Blog Creation
| Step | Action | Expected Result |
|------|--------|----------------|
| 2.1 | Mouseover "Content" menu | Dropdown menu appears |
| 2.2 | Select "Add Content" | Submenu expands |
| 2.3 | Click "Blog" | Blog creation form loads |

### 3. Main Content Information
| Step | Action | Expected Result |
|------|--------|----------------|
| 3.1 | In Title field, enter: `performanceTest` | Title field populated |
### 3.1 Page image section
| 3.1.2 | Click PageImage dropdown | Dropdown expands |
| 3.1.3 | Select "Asset" button | Asset selection modal opens |
| 3.1.4 | Click "Add from site library" | Site library view loads |
| 3.1.5 | Select first checkbox (first image) | Image selected |
| 3.1.6 | Click "Select local image Button" | Image added to PageImage field|
| 3.1.7 | Confirm selection | Image added to PageImage field |

### 3.2 Page section components
### 3.2.1 Heading Section
| Step | Action | Expected Result |
|------|--------|----------------|
| 3.2.1.2 | In Heading section, enter: `PerformanceTestHeading` | Heading field populated |
| 3.2.1.3 | Click "Save" button | Changes saved, confirmation message appears |

### 3.3 Page section components
### 3.2.1 Components Section
| Step | Action | Expected Result |
|------|--------|----------------|
| 3.2.1.1 | Click Components tab , select: Add Gallery | Add Gallery field is displayed |
| 3.2.1.2 | Select the image dropdown and click on select asset button 
| 3.2.1.3 | Click "Add from site library" | Site library view loads |
| 3.2.1.4 | Select first checkbox (first image) | Image selected |
| 3.2.1.5 | Click "Select local image Button" | Image added to PageImage field|
| 3.2.1.6 | Click "Save" button | Changes saved, confirmation message appears |
| 3.2.1.7 | Enter caption performanceCaption | performanceCaption appears |
| 3.2.1.8 | Click "Save" button | click confirmation message appears |

### 4. Authoring Information
| Step | Action | Expected Result |
|------|--------|----------------|
| 4.1 | Navigate to "Authoring Information" section | Section expands |
| 4.2 | In URL field, enter: `www.london.gov.uk` | URL field populated |
| 4.3 | In Link text field, enter: `www.london.gov.uk` | Link text field populated |
| 4.4 | Click "Save" button | Authoring information saved |

### 5. Categorisation
| Step | Action | Expected Result |
|------|--------|----------------|
| 5.1 | Navigate to "Categorisation" section | Section expands |
| 5.2 | Topic: Select "Business & Economy" | Option selected |
| 5.3 | Area of work: Select "City hall" | Option selected |
| 5.4 | Audience: Select "Business" | Option selected |
| 5.5 | Borough: Select "Bexley" | Option selected |
| 5.6 | Committees and boards: Select "Audit panel" | Option selected |
| 5.7 | Content: Select "Blogs" | Option selected |
| 5.8 | Click "Save" button | Categorisation saved |

### 6. Spotlight Section
| Step | Action | Expected Result |
|------|--------|----------------|
| 6.1 | Navigate to "Spotlight" section | Section expands |
| 6.2 | Locate "Teaser" field/section | Teaser section visible with note: "For images added via Bynder, please remember to set alt text and the image focal point, by selecting 'edit' after an image has been added." |
| 6.3 | Click "Select Asset" button in Teaser Image section | Asset selection modal opens |
| 6.4 | Click "Add from site library" | Site library view loads |
| 6.5 | Select first image checkbox | First image selected |
| 6.6 | Confirm image selection | Image is added to Teaser |
| 6.7 | Click on "Select Local image" button | Local image upload interface appears |
| 6.8 | Click "Save" button | Spotlight section saved |

### 7. Hide Page Elements Section
| Step | Action | Expected Result |
|------|--------|----------------|
| 7.1 | Navigate to "Hide page elements" section | Section expands |
| 7.2 | Locate "Display accessibility request block" checkbox | Checkbox visible |
| 7.3 | Select/tick "Display accessibility request block" | Checkbox selected/checked |
| 7.4 | Click "Save" button | Page elements settings saved |

### 8. Final Save & Verification
| Step | Action | Expected Result |
|------|--------|----------------|
| 8.1 | Click final "Save" or "Publish" button | Blog post created successfully |
| 8.2 | Verify success message | "Blog has been created" message appears |
| 8.3 | Verify blog appears in content list | Blog "performanceTest" visible in content list |
| 8.4 | Optional: Preview/View blog on frontend | Blog displays correctly with all configured elements |

---

## Test Data

```yaml
credentials:
  username: "Dont_Delete_Smoke_Test_Content Administrator"
  password: "P3rf0rm@nce_M0n1t0ring!"

blog_content:
  title: "performanceTest"
  heading: "PerformanceTestHeading"
  
authoring:
  url: "www.london.gov.uk"
  link_text: "www.london.gov.uk"

categorisation:
  topic: "Business & Economy"
  area_of_work: "City hall"
  audience: "Business"
  borough: "Business"
  committees_boards: "Audit panel"
  content_type: "Blogs"

spotlight:
  teaser_image: "First image from site library"
  local_image: "To be uploaded"

page_elements:
  display_accessibility_block: true
```

---

## Expected Results Summary
1. ✅ User can login with Guest credentials
2. ✅ Blog creation form is accessible via Content > Add Content > Blog
3. ✅ All form sections can be populated with test data
4. ✅ Images can be selected from site library
5. ✅ Categorisation options are available and selectable
6. ✅ Accessibility block can be enabled
7. ✅ Blog post is successfully created and saved
8. ✅ Blog post appears in content management list

---

## Post-Test Cleanup Steps
1. [ ] Navigate to Content management
2. [ ] Search for blog titled "performanceTest"
3. [ ] Delete the test blog post
4. [ ] Confirm deletion
5. [ ] Logout from guest account
6. [ ] Clear browser cache/cookies if needed

---

## Test Automation Notes

### JMeter Implementation - COMPLETE ✅

**Location**: `Performancestests/LGOV/BlogCreation/Baseline-1VU/`

**Files Created**:
- `LGOV-PerfTest-BlogCreation-Baseline-1VU.jmx` - Main test plan
- `test.yml` - Configuration file with parameters
- `RESULTS/` - Directory for test results

### Transaction Controllers (Performance Measured):
```
1. Guest Login Transaction
   - 1.1 GET /user/login (extract form tokens)
   - 1.2 POST /user/login (submit credentials)
   - ✅ Measures: Login response time

2. Navigate to Blog Creation Transaction
   - 2.1 GET /node/add/blog (extract blog form tokens)
   - ✅ Measures: Blog form load time

3. Save Main Content Section Transaction
   - 3.1 POST /node/add/blog (title, heading, images)
   - Extracts: node_id for subsequent updates
   - ✅ Measures: Main content save time

4. Save Authoring Information Transaction
   - 4.1 POST /node/{node_id}/edit (author URL, link text)
   - ✅ Measures: Authoring info save time

5. Save Categorisation Transaction
   - 5.1 POST /node/{node_id}/edit (all taxonomy fields)
   - ✅ Measures: Categorisation save time

6. Save Hide Page Elements Transaction
   - 6.1 POST /node/{node_id}/edit (accessibility block)
   - ✅ Measures: Page elements save time
```

### Key Elements Captured:
- **Form Tokens**: `form_build_id`, `form_token` (extracted via RegEx)
- **Session Management**: HTTP Cookie Manager maintains session
- **Node ID**: Extracted from redirect after initial save
- **CSRF Protection**: All tokens properly passed in POST requests
- **Authentication**: HTTP Authorization Manager with Basic Auth

### Performance Metrics Collected:
1. **Login Time** - Time to authenticate guest user
2. **Blog Form Load Time** - Time to load blog creation form
3. **Main Content Save Time** - Time to save title, heading, images
4. **Authoring Info Save Time** - Time to save author URL and link
5. **Categorisation Save Time** - Time to save all taxonomy selections
6. **Hide Elements Save Time** - Time to save page element settings

### Configuration Parameters (test.yml):
```yaml
authorization:
  enabled: true
  url: https://lgov-perftest.london.gov.uk
  domain: lgov-perftest.london.gov.uk
  embedded_url_re: "https://lgov-perftest\\.london\\.gov\\.uk/.*"

thread-config:
  start-threads: 1
  hold-load: 600  # 10 minutes

blog-config:
  title: "performanceTest_${__time(YMD-HMS)}"
  heading: "PerformanceTestHeading"
  caption: "performanceCaption"
```

### Running the Test:
```bash
# From BlogCreation/Baseline-1VU directory
jmeter -n -t LGOV-PerfTest-BlogCreation-Baseline-1VU.jmx \
  -l RESULTS/results.jtl \
  -j RESULTS/jmeter.log \
  -e -o RESULTS/html-report \
  -JDOMAIN=lgov-perftest.london.gov.uk \
  -JEMBEDDED_URL_RE="https://lgov-perftest\.london\.gov\.uk/.*" \
  -JAUTHORIZATION_URL=https://lgov-perftest.london.gov.uk \
  -JAUTH_USERNAME="perftest" \
  -JAUTH_PASSWORD="P3r4manc3!"
```

### Expected Output:
- Transaction timings for each save operation
- HTML report with graphs and statistics
- CSV results file for analysis
- Detailed JMeter log
- Node ID (for cleanup)

---

## Notes & Important Reminders
- ⚠️ This test creates actual content on lgov-perftest environment
- ⚠️ Always perform cleanup steps to avoid test data accumulation
- ⚠️ For Bynder images: Remember to set alt text and image focal point via 'edit' after adding
- ⚠️ Ensure guest account has sufficient permissions for blog creation
- ⚠️ Verify site library has available images before test execution

---

## Test Execution History
| Date | Tester | Result | Notes |
|------|--------|--------|-------|
|      |        |        |       |

---

## Related Test Cases
- PERF-LOGIN-001: Guest Login Functionality
- PERF-CONTENT-001: Content Creation Permissions
- PERF-MEDIA-001: Asset Library Access

---

**Last Updated**: January 26, 2026
**Review Date**: [To be scheduled]
