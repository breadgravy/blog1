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

/* Article window furniture: the scrollbar thumb follows the page's own scroll,
   and the zoom box grows the window to fill the desktop. */
(() => {
  const win = document.querySelector('.mac-window');
  if (!win) {
    return;
  }

  const scrollbar = win.querySelector('.mac-scrollbar');
  const track = win.querySelector('.mac-track');
  const thumb = win.querySelector('.mac-thumb');
  const zoom = win.querySelector('.mac-zoom');
  const MIN_THUMB_PX = 20;

  const drawThumb = () => {
    if (!scrollbar || !track || !thumb) {
      return;
    }

    const doc = document.documentElement;
    const overflow = doc.scrollHeight - window.innerHeight;
    if (overflow <= 0) {
      scrollbar.classList.add('is-inactive');
      return;
    }

    scrollbar.classList.remove('is-inactive');
    const trackHeight = track.clientHeight;
    const visible = window.innerHeight / doc.scrollHeight;
    const height = Math.max(MIN_THUMB_PX, Math.round(trackHeight * visible));
    const progress = Math.min(1, Math.max(0, window.scrollY / overflow));

    thumb.style.height = `${height}px`;
    thumb.style.top = `${Math.round((trackHeight - height) * progress)}px`;
  };

  if (zoom) {
    zoom.addEventListener('click', () => {
      const zoomed = document.body.classList.toggle('is-zoomed');
      zoom.setAttribute('aria-pressed', String(zoomed));
      drawThumb();
    });
  }

  window.addEventListener('scroll', drawThumb, { passive: true });
  window.addEventListener('resize', drawThumb);
  window.addEventListener('load', drawThumb);
  drawThumb();
})();
