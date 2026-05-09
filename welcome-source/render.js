// Render welcome.html to a 2-page A4 PDF using Playwright Chromium.
// Usage: node render.js <html-path> <out-pdf-path>
// NODE_PATH should include a directory containing the `playwright` module
// (set by build.sh, or run `NODE_PATH=$(npm root -g) node render.js ...`).

const path = require('path');

function loadPlaywright() {
  try {
    return require('playwright');
  } catch (_) {
    const { execSync } = require('child_process');
    const root = execSync('npm root -g', { encoding: 'utf8' }).trim();
    return require(path.join(root, 'playwright'));
  }
}

(async () => {
  const htmlPath = process.argv[2];
  const outPath  = process.argv[3];
  if (!htmlPath || !outPath) {
    console.error('usage: node render.js <html> <out-pdf>');
    process.exit(1);
  }

  const { chromium } = loadPlaywright();
  const browser = await chromium.launch();
  const ctx = await browser.newContext();
  const page = await ctx.newPage();

  const url = 'file://' + path.resolve(htmlPath);
  await page.goto(url, { waitUntil: 'networkidle' });

  // Wait for webfonts to settle even after networkidle.
  await page.evaluate(() => document.fonts && document.fonts.ready);
  await page.waitForTimeout(800);

  await page.pdf({
    path: outPath,
    format: 'A4',
    printBackground: true,
    margin: { top: '0', right: '0', bottom: '0', left: '0' },
    preferCSSPageSize: true,
  });

  await browser.close();
  console.log('[render] wrote', outPath);
})().catch(err => {
  console.error(err);
  process.exit(1);
});
