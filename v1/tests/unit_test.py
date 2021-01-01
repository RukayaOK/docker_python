import unittest
from v1 import app


class BasicTests(unittest.TestCase):
    def setUp(self):
        app.testing = True
        self.app = app.test_client()

    def tearDown(self):
        pass

    def test_index(self):
        response = self.app.get('/', follow_redirects=True)
        self.assertEqual(response.status, '200 OK')


if __name__ == '__main__':
    unittest.main()
