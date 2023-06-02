String getTitleByTabId(int tabId) {
  if (tabId == 0) {
    return 'Thông tin';
  } else if (tabId == 1) {
    return 'Bên trên tầng lầu';
  } else {
    return 'Lời bài hát';
  }
}
