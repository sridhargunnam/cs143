/* Begin of User functions */
enum TokenType {OBJECTID, TYPEID};

void fillLine(int line_no,
                     std::string type_
                     ) {
    std::string result;
    result = "#" +
            std::to_string(line_no) +
            " " +
            type_ +
            "\n";
    std::cout <<  result;
}
/* End of User functions */
