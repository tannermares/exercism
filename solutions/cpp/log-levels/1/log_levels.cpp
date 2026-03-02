#include <string>

namespace log_line {
    std::string message(std::string line) {
        int colon_index = line.find(":");
        return line.substr(colon_index + 2);
    }

    std::string log_level(std::string line) {
        int log_level_end = line.find("]");
        return line.substr(1, log_level_end - 1);
    }

    std::string reformat(std::string line) {
        std::string message = log_line::message(line);
        std::string log_level = log_line::log_level(line);

        return message + " (" + log_level + ")";
    }
}
