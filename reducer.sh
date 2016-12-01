#!/bin/sh
exec /usr/local/share/scala/bin/scala "$0" "$@"
!#

object Reducer {

  def processLine(previousLetter: String = "", letterCount: Integer = 0): Unit = {
    val line = scala.io.StdIn.readLine
    if (line == null || line.isEmpty) {
      println(previousLetter + "\t" + letterCount)
      return
    }
    val data = line.split("\t")

    if (previousLetter == "") {
      processLine(data(0), data(1).toInt)
    } else if (data(0) != previousLetter) {
      println(previousLetter + "\t" + letterCount)
      processLine(data(0), data(1).toInt)
    } else if (data(0) == previousLetter) {
      processLine(data(0), data(1).toInt + letterCount)
    }
  }

  def main(args: Array[String]) {
    processLine()
  }
}
