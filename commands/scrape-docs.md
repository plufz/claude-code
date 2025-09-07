---
description: "Scrape documentation from the web and create organized local markdown files"
---

Scrape documentation from web sources and create well-organized markdown files in the local docs/ directory.

**Usage Examples:**
- `/scrape-docs bentoml` - Search and scrape BentoML documentation
- `/scrape-docs https://docs.bentoml.com` - Scrape from base URL
- `/scrape-docs https://docs.bentoml.com/path1,https://docs.bentoml.com/path2` - Multiple specific URLs
- `/scrape-docs --output docs/custom bentoml` - Custom output directory
- `/scrape-docs --split-mode single bentoml` - All content in one file
- `/scrape-docs --split-mode per-url https://docs.example.com/url1,https://docs.example.com/url2` - One file per URL

**Arguments**: $ARGUMENTS

## Processing Logic:

### 1. Parse Arguments
- Extract technology name, base URL, or comma-separated URL list
- Identify options: `--output [path]` (default: `docs/`), `--split-mode [auto|single|per-url]` (default: `auto`)
- Clean and validate URLs

### 2. URL Discovery
- **Technology Name**: Search for official documentation (e.g., "bentoml" → find docs.bentoml.com)
- **Base URL**: Discover documentation structure by crawling sitemap, navigation, or common doc paths
- **Specific URLs**: Use provided URLs directly

### 3. Content Scraping
For each URL:
- Fetch content using WebFetch tool
- Extract main documentation content (remove navigation, ads, footers)
- Convert HTML to clean markdown format
- Preserve code blocks, links, images, and formatting
- Extract page title and hierarchy information

### 4. Content Organization
**Auto Split Mode (default)**:
- Analyze content structure and logical sections
- Create separate files for major topics/chapters
- Organize into subdirectories based on content hierarchy
- Generate index files for navigation

**Single File Mode**:
- Combine all content into one comprehensive markdown file
- Maintain clear section headers and table of contents
- Preserve original source URLs as references

**Per-URL Mode**:
- Create one markdown file per scraped URL
- Use URL path structure to determine file organization
- Maintain source URL mapping

### 5. File Structure Creation
- Create subdirectories as needed: `docs/[technology]/[sections]/`
- Generate clean filenames from page titles (lowercase, hyphens, no special chars)
- Add metadata headers with source URLs and scrape timestamps
- Create README.md index files for directory navigation

### 6. Content Enhancement
- Fix broken internal links to point to local files
- Download and reference images locally when possible  
- Add table of contents for large files
- Include source attribution and last updated timestamps
- Validate markdown syntax and formatting

## Output Structure Example:
```
docs/
├── bentoml/
│   ├── README.md                    # Main index
│   ├── getting-started/
│   │   ├── installation.md
│   │   ├── quickstart.md
│   │   └── README.md               # Section index
│   ├── guides/
│   │   ├── services.md
│   │   ├── deployment.md
│   │   └── README.md
│   └── api/
│       ├── client.md
│       ├── server.md
│       └── README.md
```

## Metadata Headers:
```markdown
---
title: "Page Title"
source_url: "https://original-url.com"
scraped_at: "2024-01-01T12:00:00Z"
technology: "bentoml"
section: "getting-started"
---
```

## Error Handling:
- Skip inaccessible URLs with warnings
- Handle rate limiting with delays
- Validate markdown output
- Report failed scrapes and successful completions
- Create partial documentation even if some URLs fail

## Special Features:
- Detect and handle single-page applications (SPAs)
- Process documentation with dynamic content loading
- Handle authentication-required documentation (with user guidance)
- Respect robots.txt and rate limiting
- Clean up temporary files and resources