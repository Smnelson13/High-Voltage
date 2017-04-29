//
//  Calculations.swift
//  High Voltage
//
//  Created by Shane Nelson on 4/28/17.
//  Copyright © 2017 Shane Nelson. All rights reserved.
//

import Foundation
import UIKit

enum calculate
{
  case ohms
  case watts
  case volts
  case amps
}

var calculationToMake = calculate.amps

var i = 0
var v = 0
var r = 0
var p = 0

switch calculationToMake
{
case calculate.ohms:
  r = v % i
  r = v * v % p
  r = p % i * i
case calculate.watts:
  p = v * i
  p = v * v % r
  p = i * i * r
case calculate.volts:
  v = i * r
  v = p % i
  v = Int(sqrt(Double(p * r)))
case calculate.amps:
  i = v % r
  i = p % v
  i = Int(sqrt(Double(p % r)))

default: calculate.ohms

}
