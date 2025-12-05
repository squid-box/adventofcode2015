namespace AdventOfCode2015.Tests.Problems;

using AdventOfCode2015.Problems;
using NUnit.Framework;

[TestFixture]
public class Problem17Tests
{
    private static readonly string[] TestInput =
    [
        
    ];

    [Test]
    public void TestPartOne()
    {
        Assert.That(Problem17.PartOne(TestInput), Is.EqualTo(4711));
    }

    [Test]
    public void TestPartTwo()
    {
        Assert.That(Problem17.PartTwo(TestInput), Is.EqualTo(4711));
    }
}