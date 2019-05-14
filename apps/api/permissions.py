from rest_framework import permissions


class IS_STAFF(permissions.BasePermission):
    """
    """

    def has_object_permission(self, request, view, obj):
        if request.user and request.user.is_staff:
            return True
        return False

    def has_permission(self, request, view):
        if request.user and request.user.is_staff:
            return True
        return False