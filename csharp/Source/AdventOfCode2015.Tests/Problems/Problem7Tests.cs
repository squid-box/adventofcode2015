namespace AdventOfCode2015.Tests.Problems;

using AdventOfCode2015.Problems;
using NUnit.Framework;

[TestFixture]
public class Problem7Tests
{
    private static readonly string[] TestInput =
    [
        
    ];

    [Test]
    public void TestPartOne()
    {
        Assert.That(Problem7.PartOne(TestInput), Is.EqualTo(4711));
    }

    [Test]
    public void TestPartTwo()
    {
        Assert.That(Problem7.PartTwo(TestInput), Is.EqualTo(4711));
    }
}