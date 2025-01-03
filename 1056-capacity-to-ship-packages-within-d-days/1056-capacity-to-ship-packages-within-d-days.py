class Solution:
    def findDays(self, weights: List, capacity: int):
        day = 1
        load = 0 
        n = len(weights)

        for i in range(n):
            if load + weights[i] > capacity:
                day += 1 
                load = weights[i]
            else:
                load += weights[i] 
        return day

    def shipWithinDays(self, weights: List[int], days: int) -> int:
        low = max(weights)
        high = sum(weights)

        while low <= high:
            mid = (low + high) // 2
            numberofDays = self.findDays(weights, mid)
            if numberofDays <= days:
                high = mid - 1
            else:
                low = mid + 1
        
        return low
        