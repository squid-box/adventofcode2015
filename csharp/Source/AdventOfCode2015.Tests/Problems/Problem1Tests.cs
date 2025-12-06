namespace AdventOfCode2015.Tests.Problems;

using AdventOfCode2015.Problems;
using NUnit.Framework;

[TestFixture]
public class Problem1Tests
{
    private static readonly string[] TestInput1 =
    [
        "(())"
    ];

    private static readonly string[] TestInput2 =
    [
        "))((((("
    ];

    private static readonly string[] TestInput3 =
    [
        ")())())"
    ];

    [Test]
    public void TestPartOne()
    {
        Assert.That(Problem1.PartOne(TestInput1), Is.EqualTo(0));
        Assert.That(Problem1.PartOne(TestInput2), Is.EqualTo(3));
        Assert.That(Problem1.PartOne(TestInput3), Is.EqualTo(-3));
    }

    [Test]
    public void TestPartTwo()
    {
        Assert.That(Problem1.PartTwo(TestInput1), Is.EqualTo(-1));
        Assert.That(Problem1.PartTwo(TestInput2), Is.EqualTo(0));
        Assert.That(Problem1.PartTwo(TestInput3), Is.EqualTo(0));
    }
}