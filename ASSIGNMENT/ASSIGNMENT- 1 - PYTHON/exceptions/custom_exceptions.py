class InvalidDataException(Exception):
    """Exception raised for invalid input data."""
    def __init__(self, message="Invalid data provided"):
        super().__init__(message)


class InsufficientStockException(Exception):
    """Exception raised when stock is insufficient for an order."""
    def __init__(self, message="Insufficient stock available"):
        super().__init__(message)


class IncompleteOrderException(Exception):
    """Exception raised when an order is missing required details."""
    def __init__(self, message="Order is incomplete. Please check the details."):
        super().__init__(message)


class PaymentFailedException(Exception):
    """Exception raised when a payment fails."""
    def __init__(self, message="Payment failed. Please try again."):
        super().__init__(message)


class IOException(Exception):
    """Exception raised for I/O operation failures."""
    def __init__(self, message="Error occurred during file I/O operation"):
        super().__init__(message)


class DatabaseException(Exception):
    """Exception raised when a database error occurs."""
    def __init__(self, message="Database connection failed"):
        super().__init__(message)


class ConcurrencyException(Exception):
    """Exception raised when a concurrency issue occurs."""
    def __init__(self, message="Concurrency conflict. Please retry."):
        super().__init__(message)


class AuthenticationException(Exception):
    """Exception raised for authentication failures."""
    def __init__(self, message="Authentication failed. Access denied."):
        super().__init__(message)


class AuthorizationException(Exception):
    """Exception raised for unauthorized access attempts."""
    def __init__(self, message="You do not have permission to access this resource."):
        super().__init__(message)
