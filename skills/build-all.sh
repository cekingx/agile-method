#!/bin/bash

# Automated build script for Claude Code skills
# Usage:
#   ./build-all.sh           - Build all skills
#   ./build-all.sh <skill>   - Build specific skill
#   ./build-all.sh --clean   - Clean and rebuild all

# Navigate to skills directory
cd "$(dirname "$0")"

# Create compiled-skills directory if it doesn't exist
mkdir -p ../compiled-skills

# Handle --clean option
if [ "$1" == "--clean" ]; then
    echo "Cleaning compiled-skills directory..."
    rm -f ../compiled-skills/*.skill
    echo "✓ Cleaned"
    echo ""
fi

# Counter for tracking
built_count=0
failed_count=0

# Check if specific skill requested
if [ -n "$1" ] && [ "$1" != "--clean" ]; then
    # Build specific skill
    skill_name="$1"

    if [ ! -d "$skill_name" ]; then
        echo "Error: Skill directory '$skill_name' not found"
        exit 1
    fi

    echo "Building: $skill_name"
    echo "===================="

    if zip -r "${skill_name}.skill" "$skill_name/" > /dev/null 2>&1; then
        if mv "${skill_name}.skill" ../compiled-skills/; then
            echo "✓ Successfully built and moved ${skill_name}.skill"
            exit 0
        else
            echo "✗ Failed to move ${skill_name}.skill"
            exit 1
        fi
    else
        echo "✗ Failed to build ${skill_name}.skill"
        exit 1
    fi
fi

# Build all skills
echo "Building all skills..."
echo "===================="

# Loop through all directories (excluding hidden and current/parent)
for skill_dir in */; do
    # Remove trailing slash
    skill_name="${skill_dir%/}"

    # Skip if not a directory or if it's a hidden directory
    if [ ! -d "$skill_name" ]; then
        continue
    fi

    echo "Building: $skill_name"

    # Create the .skill file
    if zip -r "${skill_name}.skill" "$skill_name/" > /dev/null 2>&1; then
        # Move to compiled-skills
        if mv "${skill_name}.skill" ../compiled-skills/; then
            echo "  ✓ Successfully built and moved ${skill_name}.skill"
            ((built_count++))
        else
            echo "  ✗ Failed to move ${skill_name}.skill"
            ((failed_count++))
        fi
    else
        echo "  ✗ Failed to build ${skill_name}.skill"
        ((failed_count++))
    fi
done

echo "===================="
echo "Build complete: $built_count successful, $failed_count failed"
