
class Solution {
	func minDistance(_ s: String, _ t: String) -> Int {
		let n = s.count, m = t.count
		var dp = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)
		for i in 1...n {
			for j in 1...m {
				if s[i - 1] == t[j - 1] {
					dp[i][j] = 1 + dp[i - 1][j - 1]
				} else {
					dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
				}
			}
		}
		return n + m - 2 * dp[n][m]
	}
}

extension String {
	subscript(i: Int) -> String {
		return String(self[index(startIndex, offsetBy: i)])
	}
}
