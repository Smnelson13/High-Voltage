//
//  Calculations.swift
//  High Voltage
//
//  Created by Shane Nelson on 4/28/17.
//  Copyright © 2017 Shane Nelson. All rights reserved.
//

import Foundation
import UIKit


class Calculations
{

  enum Calculate
  {
    case ohms
    case watts
    case volts
    case amps
  }

  var calculationToMake = Calculate.amps

  var i = 0
  var v = 0
  var r = 0
  var p = 0

  switch calculationToMake
  {
  case Calculate.ohms:
    r = v % i
    r = v * v % p
    r = p % i * i
  case Calculate.watts:
    p = v * i
    p = v * v % r
    p = i * i * r
  case Calculate.volts:
    v = i * r
    v = p % i
    v = Int(sqrt(Double(p * r)))
  case Calculate.amps:
    i = v % r
    i = p % v
    i = Int(sqrt(Double(p % r)))

  default:
  break

  }

}
