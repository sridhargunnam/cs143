/* Begin of User functions */
enum TokenType {OBJECTID, TYPEID};
std::unordered_map<TokenType, std::string> tokenMap {
        {OBJECTID, "OBJECTID"} ,
        {TYPEID, "TYPEID"}
};

void fillLine(int line_no,
                     std::string type_,
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
