# Following along through this tutorial: https://www.youtube.com/watch?v=IdhnP00Y1Ks

using VegaLite, DataFrames, Query, VegaDatasets

cars = dataset("cars")

cars |> @select(:Acceleration, :Name) |> collect

function foo(data, origin)
    df = data |> @filter(_.Origin == origin) |> DataFrame

    return df |> @vlplot(:point, :Acceleration, :Miles_per_Gallon)
end

p = foo(cars, "USA")

p |> save("foo.png")