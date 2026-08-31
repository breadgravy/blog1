(() => {
  const BLINK_DURATION_MS = 180;

  const shouldHandleLink = (event, link) => {
    if (!link || !link.href) {
      return false;
    }

    if (event.defaultPrevented || event.button !== 0) {
      return false;
    }

    if (event.metaKey || event.ctrlKey || event.shiftKey || event.altKey) {
      return false;
    }

    const target = (link.getAttribute('target') || '').toLowerCase();
    if (target && target !== '_self') {
      return false;
    }

    return true;
  };

  document.addEventListener('click', (event) => {
    const link = event.target.closest('a[href]');
    if (!shouldHandleLink(event, link)) {
      return;
    }

    const href = link.getAttribute('href');
    if (!href || href.startsWith('javascript:')) {
      return;
    }

    event.preventDefault();
    link.classList.add('link-click-blink');

    window.setTimeout(() => {
      window.location.assign(link.href);
    }, BLINK_DURATION_MS);
  });
})();
