#include <chrono>
#include <iostream>
#include <thread>

#include <elbb/version.h>

int main(int argc, char *argv[]) {
  while (true) {
    std::cout << "Hello world! Waiting to be terminated." << std::endl;
    std::cout << "FullSemVer: " << elbb::version::FullSemVer << std::endl;
    std::cout << "InformationalVersion: " << elbb::version::InformationalVersion
              << std::endl;
    std::this_thread::sleep_for(std::chrono::seconds(5));
  }
  return 0;
}