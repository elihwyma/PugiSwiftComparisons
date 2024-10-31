import Fuzi
import Foundation

/*
 
 Format of data is as follows:
 <records>
    <record>
         <name>String</name>
         <phone>String</phone>
         <email>String</email>
         <address>String</address>
         <region>String</region>
         <postalZip>String</postalZip>
         <country>String</country>
         <list>Int</list>
         <text>String</text>
         <numberrange>Int</numberrange>
         <currency>String</currency>
    </record>
 </records>
 
 */

let data = try! Data(contentsOf: URL(fileURLWithPath: "./large_demo_data.xml"))

var totalParsed: UInt64 = 0
var pugiCount = 0

var start = CFAbsoluteTimeGetCurrent()
var end = start + 1.0

while CFAbsoluteTimeGetCurrent() < end {
    totalParsed += UInt64(pugiParse(data))
    pugiCount += 1
}

print("Pugi Parsed \(pugiCount) times")

var xmlCoderCount = 0

start = CFAbsoluteTimeGetCurrent()
end = start + 1.0

while CFAbsoluteTimeGetCurrent() < end {
    totalParsed += UInt64(xmlCoderParse(data))
    xmlCoderCount += 1
}

print("XMLCoder Parsed \(xmlCoderCount) times")

var fuziCount = 0

start = CFAbsoluteTimeGetCurrent()
end = start + 1.0

while CFAbsoluteTimeGetCurrent() < end {
    totalParsed += UInt64(fuziParse(data))
    fuziCount += 1
}

print("Fuzi Parsed \(fuziCount) times")

print("(needed) \(totalParsed)")
