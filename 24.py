#level intermediate
import pytest

print("hello")

def gadget_cost(num_gadgets: int, label: str) -> float:
    """
    computes cost, $0.50 per gadget, with $0.05 per letter
    """
    return num_gadgets * (0.50 + 0.05 * len(label))

def test_gadget_cost_small1():
    assert gadget_cost(1, "hi") == pytest.approx(0.60)

def test_gadget_cost_small2():
    assert gadget_cost(2, "a") == pytest.approx(1.1)

def test_float():
    assert 0.1 + 0.2 == pytest.approx(0.3)

def if_test():
    if 10 < 20:
        return 20
    elif 30 > 40:
        return 30
    # optional
    else:
        return 40 