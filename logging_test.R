install.packages(c("devtools","mlr3"))

# Test 1: bbotk with lg assigned to bbotk in zzz.R
writeLines(readLines("packages/bbotk_1/R/zzz.R"))

## Test 1.1 Only bbotk
.rs.restartR()
rm(list=ls())
library(lgr)
library(devtools)
load_all("packages/bbotk_1")
source("packages/bbotk_1/tests/testthat/helper.R")

logger_tree()

optimizer = opt("random_search")
inst = MAKE_INST()
optimizer$optimize(inst)

# Test 2: mlr3tuning with lg assigned to mlr3/mlr3tuning in zzz.R
writeLines(readLines("packages/bbotk_1/R/zzz.R"))
writeLines(readLines("packages/mlr3tuning_1/R/zzz.R"))

## Test 2.1: Default
.rs.restartR()
rm(list=ls())
library(lgr)
library(devtools)
load_all("packages/bbotk_1")
load_all("packages/mlr3tuning_1") # @optimizer_to_tuner
source("packages/mlr3tuning_1/tests/testthat/helper.R")

logger_tree()

tuner = tnr("random_search")
inst = TEST_MAKE_INST1()
tuner$optimize(inst)
# => All logging messages are printed


## Test 2.2: Set bbotk logger to warn
.rs.restartR()
rm(list=ls())
library(lgr)
library(devtools)
load_all("packages/bbotk_1")
load_all("packages/mlr3tuning_1") # @optimizer_to_tuner
source("packages/mlr3tuning_1/tests/testthat/helper.R")

get_logger("bbotk")$set_threshold("warn")
logger_tree()

tuner = tnr("random_search")
inst = TEST_MAKE_INST1()
tuner$optimize(inst)
# => Only mlr3 logging messages are printed


## Test 2.3: Set mlr3 logger to warn
.rs.restartR()
rm(list=ls())
library(lgr)
library(devtools)
load_all("packages/bbotk_1")
load_all("packages/mlr3tuning_1") # @optimizer_to_tuner
source("packages/mlr3tuning_1/tests/testthat/helper.R")
get_logger("mlr3")$set_threshold("warn")
logger_tree()

tuner = tnr("random_search")
inst = TEST_MAKE_INST1()
tuner$optimize(inst)
# => Only bbotk logging messages are printed


## Test 2.4: Set mlr3tuning logger to warn
.rs.restartR()
rm(list=ls())
library(lgr)
library(devtools)
load_all("packages/bbotk_1")
load_all("packages/mlr3tuning_1") # @optimizer_to_tuner
source("packages/mlr3tuning_1/tests/testthat/helper.R")
get_logger("mlr3/mlr3tuning")$set_threshold("warn") # Hierarchy must be set, otherwise new logger is initialized!!
logger_tree()

tuner = tnr("random_search")
inst = TEST_MAKE_INST1()
tuner$optimize(inst)
# => All logging messages are printed
# => Logging is not dependend on the environment in which the object is created (OptimizerRandomSearch in mlr3tuning)


# Test 3: mlr3tuning with lg assigned to mlr3/mlr3tuning in Optimizer through TunerFromOptimizer
writeLines(readLines("packages/bbotk_2/R/zzz.R"))
writeLines(readLines("packages/mlr3tuning_2/R/zzz.R"))
writeLines(readLines("packages/mlr3tuning_2/R/TunerFromOptimizer.R"))
writeLines(readLines("packages/bbotk_2/R/Optimizer.R"))

## Test 3.1: Default
.rs.restartR()
rm(list=ls())
library(lgr)
library(devtools)
load_all("packages/bbotk_2")
load_all("packages/mlr3tuning_2") # @optimizer_to_tuner
source("packages/mlr3tuning_1/tests/testthat/helper.R")

logger_tree()

tuner = tnr("random_search")
inst = TEST_MAKE_INST1()
tuner$optimize(inst)
# => All logging messages are printed

## Test 3.2: Set bbotk logger to warn
.rs.restartR()
rm(list=ls())
library(lgr)
library(devtools)
load_all("packages/bbotk_2")
load_all("packages/mlr3tuning_2") # @optimizer_to_tuner
source("packages/mlr3tuning_1/tests/testthat/helper.R")

get_logger("bbotk")$set_threshold("warn")
logger_tree()

tuner = tnr("random_search")
inst = TEST_MAKE_INST1()
tuner$optimize(inst)
# => All mlr3 logging messages are printed and logging messages produced in Optimizer
# => Logging messages defined in OptimInstance are not printed
# => We suscpected that the logging messages will be printed because TuningInstance inherits from
# Optiminstance. However, inheritance seems not to change the logger. The logging level
# still depends on the package where the super class was defined.

## Test 3.3: Set mlr3tuning logger to warn
.rs.restartR()
rm(list=ls())
library(lgr)
library(devtools)
load_all("packages/bbotk_2")
load_all("packages/mlr3tuning_2") # @optimizer_to_tuner
source("packages/mlr3tuning_1/tests/testthat/helper.R")

get_logger("mlr3/mlr3tuning")$set_threshold("warn")
logger_tree()

tuner = tnr("random_search")
inst = TEST_MAKE_INST1()
tuner$optimize(inst)
# => All logging messages are printed



# Test 4: mlr3tuning with lg assigned to mlr3/mlr3tuning in Optimizer through
# TunerFromOptimizer and overwritten logging methods in TuningInstnace
writeLines(readLines("packages/bbotk_2/R/zzz.R"))
writeLines(readLines("packages/mlr3tuning_3/R/zzz.R"))
writeLines(readLines("packages/mlr3tuning_3/R/TunerFromOptimizer.R"))
writeLines(readLines("packages/mlr3tuning_3/R/TuningInstance.R"))
writeLines(readLines("packages/bbotk_2/R/Optimizer.R"))

## Test 4.1: Default
.rs.restartR()
rm(list=ls())
library(lgr)
library(devtools)
load_all("packages/bbotk_2")
load_all("packages/mlr3tuning_3") # @optimizer_to_tuner
source("packages/mlr3tuning_1/tests/testthat/helper.R")

logger_tree()

tuner = tnr("random_search")
inst = TEST_MAKE_INST1()
tuner$optimize(inst)
# => All logging messages are printed


## Test 4.2: Set bbotk logger to warn
.rs.restartR()
rm(list=ls())
library(lgr)
library(devtools)
load_all("packages/bbotk_2")
load_all("packages/mlr3tuning_3") # @optimizer_to_tuner
source("packages/mlr3tuning_1/tests/testthat/helper.R")

get_logger("bbotk")$set_threshold("warn")
logger_tree()

tuner = tnr("random_search")
inst = TEST_MAKE_INST1()
tuner$optimize(inst)
# => All logging messages are printed


## Test 4.3: Set mlr3tuning logger to warn
.rs.restartR()
rm(list=ls())
library(lgr)
library(devtools)
load_all("packages/bbotk_2")
load_all("packages/mlr3tuning_3") # @optimizer_to_tuner
source("packages/mlr3tuning_1/tests/testthat/helper.R")

get_logger("mlr3/mlr3tuning")$set_threshold("warn")
logger_tree()

tuner = tnr("random_search")
inst = TEST_MAKE_INST1()
tuner$optimize(inst)
# => Only mlr3 logging messages are printed
# => This should be the goal we are aiming for
# => Seems rather complicated with our current architecture
