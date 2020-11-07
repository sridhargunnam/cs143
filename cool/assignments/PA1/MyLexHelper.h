/* Begin of User functions */
enum TokenType {OBJECTID, TYPEID};

void fillLineKeywords(int line_no,
                     std::string identifier
                     ) {
    std::string result;
    result = "#" +
            std::to_string(line_no) +
            " " +
            identifier +
            "\n";
    std::cout <<  result;
}
/* End of User functions */
