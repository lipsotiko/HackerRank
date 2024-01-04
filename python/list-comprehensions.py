x = int(input())
y = int(input())
z = int(input())
n = int(input())

# for i in range(x):
#     for j in range(y):
#         for k in range(z):
#             if (i + j + k) != n:
#                 print(i, j, k);

print([[i, j, k] for i in range(x + 1) for j in range(y + 1) for k in range(z + 1) if (i + j + k) != n])
