def make_readable(seconds):
    h = seconds // 3600
    m = (seconds // 60) % 60
    s = seconds % 60
    if h < 10:
        h = "0" + str(h)
    else:
        h = str(h)
    if m < 10:
        m = "0" + str(m)
    else:
        m = str(m)
    if s < 10:
        s = "0" + str(s)
    else:
        s = str(s)
    return h + ":" + m + ":" + s
print(make_readable(36000))