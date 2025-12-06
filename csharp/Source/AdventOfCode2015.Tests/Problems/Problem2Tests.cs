namespace AdventOfCode2015.Tests.Problems;

using AdventOfCode2015.Problems;
using NUnit.Framework;

[TestFixture]
public class Problem2Tests
{
    private static readonly string[] TestInput =
    [
        "2x3x4",
        "1x1x10"
    ];

    [Test]
    public void TestPartOne()
    {
        Assert.That(Problem2.PartOne(TestInput), Is.EqualTo(101));
    }

    [Test]
    public void TestPartTwo()
    {
        Assert.That(Problem2.PartTwo(TestInput), Is.EqualTo(48));
    }
}