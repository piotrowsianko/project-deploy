from fastapi.testclient import TestClient
from main import shop

client = TestClient(shop)


def test_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"Welcome to the shop": "!"}


"""def test_product_list():
    response = client.get("/products_list")
    assert response.status_code == 200
    assert type(response.json()['List of products ']) == list


def test_wrong_url():
    response = client.get("/mocked_url")
    assert response.status_code == 404


def test_buying_wrong_product():
    response = client.get("/products_list/Juice/buy_count/5")
    assert response.status_code == 200
    assert response.json() == ["There's no item like that in warehouse!"]


def test_buying_good_product():
    response = client.get("/products_list/Apples/buy_count/5")
    assert response.status_code == 200
    assert type(response.json()['List of products ']) == list


def test_buying_wrong_count():
    response = client.get("/products_list/Apples/buy_count/0")
    response_2 = client.get("/products_list/Apples/buy_count/9999999")
    assert response.status_code == 200
    assert response.json() == ["Can't buy 0 items!"]
    assert response_2.status_code == 200
    assert type(response_2.json()["Not enough items in warehouse! "])"""
