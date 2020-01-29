from collections import OrderedDict

class LimitedSizeDict(OrderedDict):
    def __init__(self, *args, **kwds):
        self.max_entries = kwds.pop('max_entries', 50)
        OrderedDict.__init__(self, *args, **kwds)
        self._check_size_limit()

    def __setitem__(self, key, value):
        OrderedDict.__setitem__(self, key, value)
        self._check_size_limit()

    def _check_size_limit(self):
        while len(self) > self.max_entries:
            self.popitem(last=False)



