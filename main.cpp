#include <iostream>
#include "Graph.hpp"

int main() {
    // יצירת גרף עם 5 קודקודים
    graph::Graph g(5);

    // הוספת צלעות
    g.addEdge(0, 1, 10);
    g.addEdge(0, 2, 20);
    g.addEdge(1, 3, 30);
    g.addEdge(2, 4, 40);
    g.addEdge(3, 4, 50);

    // הדפסת הגרף לאחר הוספת צלעות
    std::cout << "Graph after adding edges:" << std::endl;
    g.printGraph();

    // הסרת צלע
    g.removeEdge(0, 1);

    // הדפסת הגרף לאחר הסרת צלע
    std::cout << "\nGraph after removing edge (0, 1):" << std::endl;
    g.printGraph();

    return 0;
}
