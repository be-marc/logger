context("OptimizerRandomSearch")


test_that("OptimizerRandomSearch", {
  optimizer = OptimizerRandomSearch$new()
  expect_class(optimizer, "Optimizer")
  expect_class(optimizer, "OptimizerRandomSearch")
  expect_output(print(optimizer), "OptimizerRandomSearch")
  inst = MAKE_INST()
  optimizer$optimize(inst)
  expect_data_table(inst$result)
  expect_number(inst$result_y)
  expect_equal(names(inst$result_y), inst$objective$codomain$ids())
  expect_list(inst$result_x_domain)
  expect_equal(names(inst$result_x_domain), setdiff(inst$objective$domain$ids(), "foo"))
  expect_equal(inst$result_y, unlist(inst$objective$eval(inst$result_x_domain)["y"]))
})
