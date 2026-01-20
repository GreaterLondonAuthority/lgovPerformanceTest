# Authentication Setup Guide

## Overview
All JMeter test files have been parameterized to retrieve authentication credentials from GitHub Secrets. This ensures secure credential management and allows tests to run both locally (with default values) and in GitHub Actions (with secret values).

## How It Works

### 1. JMX File Parameterization
All 4 JMX files now include:
- **User Defined Variables**:
  - `USERNAME`: Default value `p*******`
  - `PASSWORD`: Default value `P*******`

- **HTTP Authorization Manager**:
  - `Authorization.username`: `${__P(AUTH_USERNAME,${USERNAME})}`
  - `Authorization.password`: `${__P(AUTH_PASSWORD,${PASSWORD})}`

This dual parameterization pattern means:
- If run locally without `-J` flags, JMeter uses the default values from user-defined variables
- If run with `-JAUTH_USERNAME` and `-JAUTH_PASSWORD` flags, JMeter uses those values instead

### 2. GitHub Actions Workflow
All 4 jobs in the workflow have been configured to:
- Reference GitHub secrets via environment variables
- Pass credentials to JMeter using `-J` flags

## Required GitHub Secrets Setup

### Step-by-Step Instructions:

1. **Navigate to your GitHub repository**
   - Go to: `https://github.com/YOUR_ORG/YOUR_REPO/settings/secrets/actions`

2. **Create JMETER_AUTH_USERNAME secret**
   - Click "New repository secret"
   - Name: `JMETER_AUTH_USERNAME`
   - Value: `p*******`
   - Click "Add secret"

3. **Create JMETER_AUTH_PASSWORD secret**
   - Click "New repository secret"
   - Name: `JMETER_AUTH_PASSWORD`
   - Value: `P*******`
   - Click "Add secret"

## Testing the Setup

### Local Testing (Without Secrets)
Run JMeter locally - it will use the default credentials:
```bash
jmeter -n -t LGOV-PerfTest-BrowseNormal-Baseline-1VU.jmx -l results.jtl
```

### Local Testing (With Custom Credentials)
Pass custom credentials via command line:
```bash
jmeter -n -t LGOV-PerfTest-BrowseNormal-Baseline-1VU.jmx \
  -l results.jtl \
  -JAUTH_USERNAME=testuser \
  -JAUTH_PASSWORD=testpass
```

### GitHub Actions Testing
Once secrets are configured:
1. Go to "Actions" tab in your GitHub repository
2. Select "JMeter Performance Tests" workflow
3. Click "Run workflow"
4. Select the test you want to run from the dropdown
5. Click "Run workflow"

The workflow will automatically:
- Retrieve credentials from GitHub secrets
- Pass them to JMeter via environment variables and `-J` flags
- Execute the test with HTTP Basic Authentication

## Security Benefits

✅ Credentials are stored securely in GitHub Secrets (encrypted at rest)
✅ Credentials are not visible in workflow logs
✅ Credentials are not committed to the repository
✅ Easy to rotate credentials by updating the secrets
✅ Local testing still works with default values

## Affected Files

### JMX Files (All Parameterized):
1. `Performancestests/LGOV/BrowseNormal/Baseline-1VU/LGOV-PerfTest-BrowseNormal-Baseline-1VU.jmx`
2. `Performancestests/LGOV/BrowseNormal/VURamp1/LGOV-PerfTest-BrowseNormal-VURamp1.jmx`
3. `Performancestests/LGOV/SimpleSearch/Baseline-1VU/LGOV-PerfTest-SimpleSearch-Baseline-1VU.jmx`
4. `Performancestests/LGOV/SimpleSearch/VURamp1/LGOV-PerfTest-SimpleSearch-VURamp1.jmx`

### Workflow File:
- `.github/workflows/jmeter-performance-test.yml`
  - All 4 jobs configured with auth environment variables
  - All 4 jobs pass credentials to JMeter via `-J` flags

## Target System
- **URL**: `lgov-perftest.london.gov.uk`
- **Authentication Type**: HTTP Basic Authentication
- **Default Username**: `per****`
- **Default Password**: `P3*****`

## Troubleshooting

### If tests fail with authentication errors:
1. Verify GitHub secrets are created with correct names (case-sensitive)
2. Check that secret values match the expected credentials
3. Ensure the target system (`lgov-perftest.london.gov.uk`) is accessible
4. Review workflow logs to confirm credentials are being passed correctly

### To verify parameterization in JMX files:
Search for these patterns in JMX files:
- `${__P(AUTH_USERNAME,${USERNAME})}`
- `${__P(AUTH_PASSWORD,${PASSWORD})}`

### To verify workflow configuration:
Check that each job has:
- Environment variables: `AUTH_USERNAME` and `AUTH_PASSWORD` referencing secrets
- JMeter command includes: `-JAUTH_USERNAME=${{ env.AUTH_USERNAME }}` and `-JAUTH_PASSWORD=${{ env.AUTH_PASSWORD }}`

## Next Steps

1. ✅ Set up GitHub secrets (JMETER_AUTH_USERNAME and JMETER_AUTH_PASSWORD)
2. ✅ Run a test workflow to verify authentication works
3. ✅ Monitor test results to ensure HTTP 401/403 errors are resolved
4. ✅ If credentials change, update GitHub secrets (no code changes needed)
