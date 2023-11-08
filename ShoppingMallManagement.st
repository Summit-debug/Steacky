package javaapplication9;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

class ShoppingCategory {//class 1

    String name;
    List<Product> products = new ArrayList<>();

    public ShoppingCategory(String name) {
        this.name = name;
    }

    public void addItem(Product product) {
        products.add(product);
    }

    public void showAvailableItems() {
        System.out.println("Available " + name + " items:");
        for (int i = 0; i < products.size(); i++) {
            System.out.println((i + 1) + ". " + products.get(i).name);
        }
    }

    public void shop(Customer customer) {

    }
}

class OutfitShopping extends ShoppingCategory {//class2

    public OutfitShopping() {
        super("Outfit");
        addItem(new Product("Shirt   250/Rs", 250.0, 1));
        addItem(new Product("Pair of Pants 800/Rs", 800.0, 1));
    }

    @Override
    public void shop(Customer customer) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("༒👕𝓦𝓮𝓵𝓬𝓸𝓶𝓮 𝓽𝓸 𝓞𝓾𝓽𝓯𝓲𝓽 𝓢𝓱𝓸𝓹𝓹𝓲𝓷𝓰!👕꧂");
        showAvailableItems();

        System.out.print("Enter the number of the outfit you want to buy: ");
        int selection = scanner.nextInt();

        if (selection >= 1 && selection <= products.size()) {
            Product selectedProduct = products.get(selection - 1);
            customer.addItemToCart(selectedProduct);
            System.out.println("You have selected a " + selectedProduct.name);
        } else {
            System.out.println("Invalid selection. Please try again.");
        }
    }
}

class GroceryShopping extends ShoppingCategory {//class3

    public GroceryShopping() {
        super("Grocery");
        addItem(new Product("BLACK CHILI   -> 60/packet", 60.0, 1));
        addItem(new Product("EGGS          -> 320/dozen", 320.0, 1));
        addItem(new Product("TOMATO        -> 180/kg", 180.0, 1));
        addItem(new Product("FLOUR         -> 560/kg", 560.0, 1));

    }

    @Override
    public void shop(Customer customer) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("•´¯`•. 𝕎𝕖𝕝𝕔𝕠𝕞𝕖 𝕥𝕠 𝔾𝕣𝕠𝕔𝕖𝕣𝕪 𝕊𝕙𝕠𝕡𝕡𝕚𝕟𝕘! .•´¯`•");
        showAvailableItems();

        System.out.print("Enter the number of the grocery item you want to buy: ");
        int selection = scanner.nextInt();

        if (selection >= 1 && selection <= products.size()) {
            Product selectedProduct = products.get(selection - 1);
            customer.addItemToCart(selectedProduct);
            System.out.println("You have selected " + selectedProduct.name);
        } else {
            System.out.println("Invalid selection. Please try again.");
        }
    }
}

class FruitShopping extends ShoppingCategory {//class 4

    public FruitShopping() {
        super("Fruit");
        addItem(new Product("APPLE (RS/150 Per kg)", 150.0, 1));
        addItem(new Product("BANANA (RS/60 Per dozen)", 60.0, 1));
        addItem(new Product("ORANGE (RS/150 Per kg)", 150.0, 1));
        addItem(new Product("MANGO (RS/360 Per kg)", 60.0, 1));
    }

    @Override
    public void shop(Customer customer) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("🍌.𝓦𝓮𝓵𝓬𝓸𝓶𝓮 𝓽𝓸 𝓕𝓻𝓾𝓲𝓽 𝓢𝓱𝓸𝓹𝓹𝓲𝓷𝓰!🍌.\n");
        showAvailableItems();

        System.out.print("Enter the number of the fruit item you want to Buy: \n");
        int selection = scanner.nextInt();

        switch (selection) {
            case 1:
                System.out.print("Enter the number of kilograms of apples you want to buy: ");
                int appleKilograms = (int) scanner.nextDouble();
                customer.addItemToCart(new Product("Apple: ", 150, appleKilograms));
                System.out.println("You have selected " + appleKilograms + " kilograms of apples.");
                break;
            case 2:
                System.out.print("Enter the number of dozens of bananas you want to buy: ");
                int bananaDozens = scanner.nextInt();
                customer.addItemToCart(new Product("Banana:", 60.0, bananaDozens));
                System.out.println("You have selected " + bananaDozens + " dozen(s) of bananas.");
                break;
            case 3:
                System.out.print("Enter the number of KG of Orange you want to buy: ");
                int orangeKilograms = scanner.nextInt();
                customer.addItemToCart(new Product("Orange:", 150.0, orangeKilograms));
                System.out.println("You have selected " + orangeKilograms + " KG(s) of Orange.");
                break;
            case 4:
                System.out.print("Enter the number of kg of Mango you want to buy: ");
                int mangoKilograms = scanner.nextInt();
                customer.addItemToCart(new Product("Mango:", 360.0, mangoKilograms));
                System.out.println("You have selected " + mangoKilograms + " KG(s) of Mango.");
                break;
            default:
                System.out.println("Invalid selection. Please try again.\n");
                break;
        }
    }
}

class Customer { //class 5

    String name;
    ShoppingCart cart;

    public Customer(String name) {
        this.name = name;
        this.cart = new ShoppingCart(name);
    }

    public void addItemToCart(Product product) {
        cart.addItem(product);
    }

    public void displayCart() {
        cart.displayCart();
    }
}

class Product { //class 6

    String name;
    double price;
    int quantity;

    public Product(String name, double price, int quantity) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }
}

class ShoppingCart { //class 7

    String customerName;
    List<Product> cartItems = new ArrayList<>();
    double totalCost = 0.0;

    public ShoppingCart(String customerName) {
        this.customerName = customerName;
    }

    public void addItem(Product product) {
        cartItems.add(product);
        totalCost += product.price * product.quantity;
    }

    public void displayCart() {
        System.out.println("\n★彡[" + customerName + "'s Shopping Cart]彡★");

        System.out.println("\n彡Items in the cart:");
        for (Product item : cartItems) {
            System.out.println(item.name + " - Quantity: " + item.quantity);
        }

        System.out.println("彡Total Cost: Rs. " + totalCost);
        System.out.println("\n\n(′︿‵｡) T♥h♥a♥n♥k♥ ♥y♥o♥u♥ ♥f♥o♥r♥ ♥s♥h♥o♥p♥p♥i♥n♥g♥ ♥a♥t♥ ♥t♥h♥e♥ ♥S♥h♥o♥p♥p♥i♥n♥g♥ ♥M♥a♥l♥l (|||❛︵❛.), " + customerName + "!");
    }
}

public class ShoppingMall { //class 8

    public static void main(String[] args) {
        try (Scanner scanner = new Scanner(System.in)) {
            System.out.println("\t\t\t ıllıllı⭐🌟 W͙͙E͙͙L͙͙O͙͙C͙͙M͙͙E͙͙ T͙͙O͙͙ S͙͙H͙͙O͙͙P͙͙P͙͙I͙͙N͙͙G͙͙ M͙͙A͙͙L͙͙L͙͙ 🌟⭐ıllıllı\n\n");

            System.out.print("Enter the number of customers in the shopping mall: ");
            int numCustomers = scanner.nextInt();

            List<Customer> customers = new ArrayList<>();

            OutfitShopping outfitShopping = new OutfitShopping();
            GroceryShopping groceryShopping = new GroceryShopping();
            FruitShopping fruitShopping = new FruitShopping();

            for (int i = 0; i < numCustomers; i++) {
                System.out.print("Enter the name of Customer " + (i + 1) + ": ");
                String customerName = scanner.next();
                Customer customer = new Customer(customerName);
                customers.add(customer);

                System.out.println("\n" + customerName + ", please select your items:\n");

                OUTER:
                while (true) {
                    System.out.println("Select a shopping category: ");
                    System.out.println("1. Outfit Shopping ");
                    System.out.println("2. Grocery Shopping ");
                    System.out.println("3. Fruit Shopping ");
                    System.out.println("4. Finish shopping \n");
                    System.out.print("Enter your choice:\n");
                    int choice = scanner.nextInt();
                    switch (choice) {
                        case 1:
                            outfitShopping.shop(customer);
                            break;
                        case 2:
                            groceryShopping.shop(customer);
                            break;
                        case 3:
                            fruitShopping.shop(customer);
                            break;
                        case 4:
                            break OUTER;
                        default:
                            System.out.println("Invalid choice. Please try again.");
                            break;
                    }
                }
            }

            // Display each customer's Items:shopping cart
            for (Customer customer : customers) {
                customer.displayCart();
            }
        }
    }
}

