#!/bin/bash

# Colors for better visibility
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to display the header
show_header() {
    clear
    echo -e "${BLUE}=== Ollama AI Management System ===${NC}"
    echo -e "${YELLOW}System Status: $(check_system_status)${NC}"
    echo
}

# Function to check system status
check_system_status() {
    if docker compose ps | grep -q "running"; then
        echo -e "${GREEN}Running${NC}"
    else
        echo -e "${RED}Stopped${NC}"
    fi
}

# Function to display the main menu
show_main_menu() {
    show_header
    echo -e "${YELLOW}1.${NC} Start Services"
    echo -e "${YELLOW}2.${NC} Stop Services"
    echo -e "${YELLOW}3.${NC} Manage Models"
    echo -e "${YELLOW}4.${NC} View Logs"
    echo -e "${YELLOW}5.${NC} System Status"
    echo -e "${YELLOW}6.${NC} Exit"
    echo
    read -p "Select an option (1-6): " choice
    handle_main_menu "$choice"
}

# Function to handle model management
show_model_menu() {
    show_header
    echo -e "${BLUE}=== Model Management ===${NC}"
    echo -e "${YELLOW}1.${NC} List Installed Models"
    echo -e "${YELLOW}2.${NC} Pull New Model"
    echo -e "${YELLOW}3.${NC} Remove Model"
    echo -e "${YELLOW}4.${NC} Back to Main Menu"
    echo
    read -p "Select an option (1-4): " choice
    handle_model_menu "$choice"
}

# Function to handle main menu choices
handle_main_menu() {
    case $1 in
        1)
            echo -e "${GREEN}Starting services...${NC}"
            docker compose up -d
            read -p "Press Enter to continue..."
            show_main_menu
            ;;
        2)
            echo -e "${RED}Stopping services...${NC}"
            docker compose down
            read -p "Press Enter to continue..."
            show_main_menu
            ;;
        3)
            show_model_menu
            ;;
        4)
            echo -e "${YELLOW}Displaying logs (Ctrl+C to exit)...${NC}"
            docker compose logs -f
            show_main_menu
            ;;
        5)
            show_system_status_details
            ;;
        6)
            echo -e "${GREEN}Goodbye!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option${NC}"
            read -p "Press Enter to continue..."
            show_main_menu
            ;;
    esac
}

# Function to handle model menu choices
handle_model_menu() {
    case $1 in
        1)
            echo -e "${BLUE}Installed Models:${NC}"
            docker compose exec ollama ollama list
            read -p "Press Enter to continue..."
            show_model_menu
            ;;
        2)
            show_model_pull_menu
            ;;
        3)
            echo -e "${RED}Remove Model:${NC}"
            docker compose exec ollama ollama list
            read -p "Enter model name to remove: " model_name
            docker compose exec ollama ollama rm "$model_name"
            read -p "Press Enter to continue..."
            show_model_menu
            ;;
        4)
            show_main_menu
            ;;
        *)
            echo -e "${RED}Invalid option${NC}"
            read -p "Press Enter to continue..."
            show_model_menu
            ;;
    esac
}

# Function to show system status details
show_system_status_details() {
    show_header
    echo -e "${BLUE}=== System Status Details ===${NC}"
    echo -e "${YELLOW}Container Status:${NC}"
    docker compose ps
    echo -e "\n${YELLOW}Resource Usage:${NC}"
    docker stats --no-stream
    read -p "Press Enter to continue..."
    show_main_menu
}

# Function to show model pull menu
show_model_pull_menu() {
    show_header
    echo -e "${BLUE}=== Pull New Model ===${NC}"
    echo -e "${YELLOW}Available Models:${NC}"
    echo "1. deepseek-r1:1.5b (Lightweight)"
    echo "2. deepseek-r1:7b (Recommended)"
    echo "3. deepseek-r1:70b (Full)"
    echo "4. Custom model"
    echo
    read -p "Select model to pull (1-4): " model_choice

    case $model_choice in
        1) model="deepseek-r1:1.5b" ;;
        2) model="deepseek-r1:7b" ;;
        3) model="deepseek-r1:70b" ;;
        4)
            read -p "Enter model name: " model
            ;;
        *)
            echo -e "${RED}Invalid choice${NC}"
            read -p "Press Enter to continue..."
            show_model_pull_menu
            return
            ;;
    esac

    echo -e "${GREEN}Pulling model: $model${NC}"
    docker compose exec ollama ollama pull "$model"
    read -p "Press Enter to continue..."
    show_model_menu
}

# Make scripts executable
chmod +x models-init.sh

# Start the script
show_main_menu