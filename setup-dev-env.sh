#!/bin/bash
# =============================================
# DevOps Lab 2 — Automation Setup Script (Linux/macOS/Git Bash)
# =============================================

echo -e "\033[1;36m=========================================\033[0m"
echo -e "\033[1;36m  🚀 DevOps Lab 2 — Auto Environment Setup\033[0m"
echo -e "\033[1;36m=========================================\033[0m"
echo ""

echo -e "\033[1;33m[1/4] Checking prerequisites...\033[0m"
if command -v git &> /dev/null; then
    echo -e "  \033[1;32m✅ Git: $(git --version)\033[0m"
else
    echo -e "  \033[1;31m❌ Git not found — install from https://git-scm.com/\033[0m"
fi

if command -v node &> /dev/null; then
    echo -e "  \033[1;32m✅ Node.js: $(node --version)\033[0m"
else
    echo -e "  \033[1;33m⚠️  Node.js not found (optional)\033[0m"
fi

if command -v docker &> /dev/null; then
    echo -e "  \033[1;32m✅ Docker: $(docker --version)\033[0m"
else
    echo -e "  \033[1;33m⚠️  Docker not found (optional)\033[0m"
fi

echo -e "\033[1;33m[2/4] Creating project structure...\033[0m"
mkdir -p src tests docs
echo -e "  \033[1;32m✅ Created: src/ tests/ docs/\033[0m"

echo -e "\033[1;33m[3/4] Initializing Git...\033[0m"
if [ ! -d ".git" ]; then
    git init
    echo -e "  \033[1;32m✅ Git initialized\033[0m"
else
    echo -e "  \033[1;33m⚠️  Git already initialized\033[0m"
fi

echo -e "\033[1;33m[4/4] Generating config files...\033[0m"
cat << 'EOF' > .gitignore
node_modules/
.env
*.log
.DS_Store
dist/
.vscode/
EOF
echo -e "  \033[1;32m✅ .gitignore created\033[0m"

echo ""
echo -e "\033[1;32m✅ SETUP COMPLETE!\033[0m"
echo "Project is ready at: $(pwd)"
