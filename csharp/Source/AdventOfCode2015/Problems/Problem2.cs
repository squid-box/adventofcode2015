namespace AdventOfCode2015.Problems;

using System.Collections.Generic;
using System.Linq;
using AdventOfCode2015.Utils.Extensions;

/// <summary>
/// Solution for <a href="https://adventofcode.com/2015/day/2">Day 2</a>.
/// </summary>
public class Problem2(InputDownloader inputDownloader) : ProblemBase(2, inputDownloader)
{
    /// <inheritdoc />
    protected override object SolvePartOne()
    {
        return PartOne(Input);
    }

    /// <inheritdoc />
    protected override object SolvePartTwo()
    {
        return PartTwo(Input);
    }

    public static object PartOne(IEnumerable<string> input)
    {
        var totalSquareFeetRequired = 0L;

        foreach (var line in input)
        {
            var parts = line
                .Split('x')
                .AsInt();

            var sides = new[]
            {
                parts[0] * parts[1],
                parts[1] * parts[2],
                parts[2] * parts[0]
            };

            totalSquareFeetRequired += sides[0] * 2 + sides[1] * 2 + sides[2] * 2 + sides.Min();
        }

        return totalSquareFeetRequired;
    }

    public static object PartTwo(IEnumerable<string> input)
    {
        var totalFeetRequired = 0L;

        foreach (var line in input)
        {
            var parts = line
                .Split('x')
                .AsInt()
                .Order()
                .ToList();

            totalFeetRequired += parts.Product() + parts[0] * 2 + parts[1] * 2;
        }

        return totalFeetRequired;
    }
}