---
description: "Summarize text files or transcripts with customizable structure and output"
---

Create structured summaries of text files or transcripts (from podcasts, YouTube videos, lectures, etc.) with customizable length and format.

**Usage**: `/summarize --type [transcript|article] --file [path] [--output path] [--length short|medium|long] [--custom-prompt "text"] [--structure "headings"]`

**Arguments**: $ARGUMENTS

## Argument Processing:

1. **--type** (REQUIRED): `transcript` or `article`
   - `transcript`: For Whisper-generated transcripts from audio/video content
   - `article`: For general text files, articles, documents

2. **--file** (REQUIRED): Path to source file to summarize

3. **--output** (OPTIONAL): Output file path
   - If omitted: Display summary to stdout
   - If provided: Write summary to specified file

4. **--length** (OPTIONAL): Summary length
   - `short`: Brief key points (1-2 paragraphs)
   - `medium`: Balanced overview (3-5 paragraphs) [DEFAULT]
   - `long`: Comprehensive summary (6+ paragraphs with details)

5. **--custom-prompt** (OPTIONAL): Additional instructions
   - Example: "Focus on technical implementation details"
   - Example: "Emphasize business implications and ROI"

6. **--structure** (OPTIONAL): Custom heading structure
   - Example: "Key Points, Summary, Detailed Analysis, References"
   - If omitted: Use default structure based on content type

## Default Structures:

### For Transcripts (--type transcript):
```markdown
# [Title/Topic]

## Key Takeaways
- Main points and insights
- Important quotes or statements
- Actionable items

## Executive Summary
High-level overview of the content

## Detailed Summary
Comprehensive breakdown by topic/theme

## Speakers/Participants
Key people mentioned and their roles

## Resources Mentioned
- Links, books, tools referenced
- Further reading suggestions

## Timestamps (if available)
Key moments with time markers
```

### For Articles (--type article):
```markdown
# [Title]

## Executive Summary
Core thesis and main arguments

## Key Points
- Primary arguments
- Supporting evidence
- Important conclusions

## Detailed Analysis
Section-by-section breakdown

## Methodology (if applicable)
Research methods, data sources

## Conclusions
Final thoughts and implications

## References
Citations and further reading
```

## Processing Logic:

1. **Parse Arguments**: Extract and validate all parameters from $ARGUMENTS
2. **Read Source File**: Load and validate the target file exists and is readable
3. **Content Analysis**: 
   - Determine content type and structure
   - Identify key themes, speakers, topics
   - Extract important quotes, data points, references
4. **Apply Custom Instructions**: Integrate custom prompt requirements
5. **Generate Summary**: 
   - Use appropriate default structure or custom structure
   - Apply length requirements
   - Ensure coherent flow and readability
6. **Output Handling**:
   - If --output specified: Write to file with proper formatting
   - If no --output: Display formatted summary to stdout
7. **Validation**: Ensure summary meets length and structural requirements

## Examples:

**Summarize podcast transcript:**
```bash
/summarize --type transcript --file audio/podcast-ep1.txt --length medium --output summaries/podcast-ep1-summary.md
```

**Summarize research article with custom focus:**
```bash
/summarize --type article --file papers/ml-research.txt --custom-prompt "Focus on practical applications and limitations" --structure "Applications, Limitations, Technical Details, Future Work"
```

**Quick summary to stdout:**
```bash
/summarize --type article --file article.txt --length short
```

## Content Enhancement Features:

- **Smart Quote Extraction**: Identify and highlight important statements
- **Link Preservation**: Maintain URLs and references from original text
- **Technical Term Handling**: Preserve and explain domain-specific terminology
- **Context Awareness**: Maintain logical flow and relationships between concepts
- **Formatting**: Clean markdown output with proper headers, lists, and emphasis
- **Metadata**: Include word count, reading time estimates, source file info