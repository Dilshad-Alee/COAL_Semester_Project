Online Book Store (x86 Assembly)

📌 Project Overview

The Online Book Store is a console-based application written in x86 Assembly (Irvine32.inc). It allows users to browse books across different categories, select a book, specify the quantity, and calculate the total cost. The program ensures valid user input, supports repeated shopping, and exits upon request.

🛠 Features

Book Categories: Fiction, Non-Fiction, and Science Fiction.

Book Selection: Users can choose books from the available categories.

Quantity Input: Allows users to specify the number of copies they want.

Cost Calculation: Automatically computes the total cost.

Input Validation: Ensures valid category and book selection.

Loop for Reuse: Users can continue shopping or exit as desired.

📂 Project Structure

📁 OnlineBookStore
│── 📄 OnlineBookStore.asm   # Main Assembly Code
│── 📄 ReadMe.md             # Project Documentation

🏗 Technologies Used

Assembly Language (x86)

Irvine32 Library

⚙️ How It Works

Displays a welcome message and prompts the user to proceed.

Shows book categories and allows selection.

Displays books with prices based on the chosen category.

Accepts user input for book selection and quantity.

Calculates total cost and displays it.

Prompts the user to continue shopping or exit.

📌 Installation & Execution

Install MASM or any x86 assembler that supports Irvine32.

Copy the OnlineBookStore.asm file into your MASM32 project directory.

Compile and run using:

ml /c /coff OnlineBookStore.asm
link /subsystem:console OnlineBookStore.obj

Execute the generated .exe file.

📝 Notes

Ensure Irvine32.inc is properly configured.

Run in a Windows x86 environment (MASM32 preferred).

Modify book lists and prices directly in the .data section.

🔗 Future Improvements

Enhance the UI with colored text and formatting.

Add more book categories and a larger catalog.

Implement a checkout system with user details.

Improve error handling for invalid inputs.
