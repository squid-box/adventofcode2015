namespace AdventOfCode2015.Problems;

using System.Collections.Generic;
using System.Linq;
using AdventOfCode2015.Utils.Extensions;

/// <summary>
/// Solution for <a href="https://adventofcode.com/2015/day/1">Day 1</a>.
/// </summary>
public class Problem1(InputDownloader inputDownloader) : ProblemBase(1, inputDownloader)
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
        var currentFloor = 0;

        foreach (var instruction in input.ToList().WithNoEmptyLines()[0])
        {
            if (instruction.Equals('('))
            {
                currentFloor++;
            }
            else
            {
                currentFloor--;
            }
        }

        return currentFloor;
    }

    public static object PartTwo(IEnumerable<string> input)
    {
        var currentFloor = 0;
        var instructions = input.ToList().WithNoEmptyLines()[0];

        for (var i = 0; i < instructions.Length; i++)
        {
            if (instructions[i].Equals('('))
            {
                currentFloor++;
            }
            else
            {
                currentFloor--;
            }

            if (currentFloor < 0)
            {
                return i + 1;
            }
        }

        return -1;
    }
}