sudo apt update -y
updates=$(apt list --upgradable 2>/dev/null | sed 1d | wc -l)

if ["$updates" -eq 0]; then
    echo "No Updates available"
else
    echo "Updates Available: $updates"
    echo "Run sudo apt upgrade to install"


