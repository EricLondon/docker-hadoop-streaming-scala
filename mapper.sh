#!/bin/sh
exec /usr/local/share/scala/bin/scala "$0" "$@"
!#

// exec scala "$0" "$@"
// exec /usr/local/share/scala/bin/scala "$0" "$@"

object Mapper {

  def processLine: Unit = {
    val line = scala.io.StdIn.readLine
    if (line == null || line.isEmpty) return
    for (c <- line) println(c.toLower + "\t1")
    processLine
  }

  def main(args: Array[String]) {
    processLine
  }
}
