'use strict';
const viewNames = new Set(['home', 'examples', 'start', 'research', 'team']);
const viewSections = [...document.querySelectorAll('main [data-view]')];
const navigationLinks = [...document.querySelectorAll('[data-nav-view]')];
const viewTitles = { home: 'Home', examples: 'Examples', start: 'Get started', research: 'Research', team: 'Team' };
let lastTrackedPath = null;

function viewFromHash() {
  const name = window.location.hash.slice(1);
  return viewNames.has(name) ? name : 'home';
}

function trackGoatCounterView() {
  if (!window.goatcounter || typeof window.goatcounter.count !== 'function') return;
  const view = viewFromHash();
  const path = `${window.location.pathname}${window.location.search}#${view}`;
  if (path === lastTrackedPath) return;
  window.goatcounter.count({ path, title: `ROLMIP — ${viewTitles[view]}` });
  lastTrackedPath = path;
}

function showView(name, focusHeading = false) {
  const view = viewNames.has(name) ? name : 'home';
  document.documentElement.classList.add('view-mode');
  viewSections.forEach(section => { section.hidden = section.dataset.view !== view; });
  navigationLinks.forEach(link => {
    if (link.dataset.navView === view) link.setAttribute('aria-current', 'location');
    else link.removeAttribute('aria-current');
  });
  window.scrollTo(0, 0);
  trackGoatCounterView();
  if (focusHeading) {
    const heading = document.getElementById(view === 'home' ? 'hero-title' : `${view}-title`);
    heading.tabIndex = -1;
    heading.focus({ preventScroll: true });
  }
}

document.addEventListener('click', event => {
  if (event.defaultPrevented || event.button !== 0 || event.metaKey || event.ctrlKey || event.shiftKey || event.altKey) return;
  const link = event.target.closest('a[href^="#"]');
  if (!link || link.target || link.hasAttribute('download')) return;
  const view = link.getAttribute('href').slice(1);
  if (!viewNames.has(view)) return;
  event.preventDefault();
  if (window.location.hash !== `#${view}`) history.pushState(null, '', `#${view}`);
  showView(view, true);
});
window.addEventListener('popstate', () => showView(viewFromHash(), true));
window.addEventListener('hashchange', () => showView(viewFromHash(), true));
showView(viewFromHash());

const examples = JSON.parse(document.getElementById('example-data').textContent);
const descriptions = [
  'A degree-one polynomial with three 2 × 2 matrix coefficients. Retrieve the coefficient of α₂ using its exponent vector.',
  'Add two degree-one polynomials and multiply their matrix coefficients in order. The product has degree two.',
  'Find a constant symmetric P for a two-vertex continuous-time model. Feasibility gives a sufficient certificate of robust stability; it is not a necessary test.',
  'For ẋ = A(α)x + Bw and z = Cx, minimize a common bounded-real LMI certificate over a two-vertex polytope. The returned square root of eta is an upper bound on H∞ for every fixed α; a common P may be conservative.',
  'Use the same continuous-time system with D = 0. A common observability-Gramian bound X gives H₂ ≤ sqrt(trace(BᵀXB)) for every fixed α. The result bounds the norm, not its square, and may be conservative.',
  'Design a constant state-feedback gain K = ZW⁻¹ for a two-vertex continuous-time system with uncertain A and Bu. A common W gives a robust H∞ upper bound for every fixed α.'
];
const expected = ['[2 1; 1 3]', '[2 2; 3 -1]', 'Feasible; a 2 × 2 matrix P', 'H∞ bound ≈ 1.150002', 'H₂ bound ≈ 0.825611', 'H∞ bound: 0.961973\nK = [-806043.8469 -7270023.3120]'];
let selected = 0;
const tabs = [...document.querySelectorAll('[data-example]')];
const panel = document.getElementById('example-panel');
const code = document.getElementById('example-code');
// Highlight comment lines without interpreting MATLAB code as HTML.
function highlight(source) {
  code.replaceChildren();
  source.split('\n').forEach((line, index, lines) => {
    const at = line.trimStart().startsWith('%') ? line.indexOf('%') : -1;
    if (at >= 0) {
      code.append(document.createTextNode(line.slice(0, at)));
      const comment = document.createElement('span');
      comment.className = 'code-comment'; comment.textContent = line.slice(at); code.append(comment);
    } else { code.append(document.createTextNode(line)); }
    if (index < lines.length - 1) code.append(document.createTextNode('\n'));
  });
}
function selectExample(index) {
  selected = index;
  tabs.forEach((tab, i) => {
    tab.classList.toggle('active', i === index);
    tab.setAttribute('aria-selected', String(i === index)); tab.tabIndex = i === index ? 0 : -1;
  });
  panel.setAttribute('aria-labelledby', `tab-${index}`);
  highlight(examples[index].code);
  document.getElementById('code-filename').textContent = examples[index].file;
  document.getElementById('download-example').href = 'examples/' + examples[index].file;
  document.getElementById('example-description').textContent = descriptions[index];
  document.getElementById('expected-result').textContent = expected[index];
  document.querySelector('.expected').classList.toggle('expected-multiline', index === 5);
  document.getElementById('norm-reference').hidden = index < 3;
  document.getElementById('dependencies').textContent = index >= 2 ? 'Requires MATLAB, ROLMIP, YALMIP and SeDuMi. A different SDP solver can be selected in sdpsettings.' : 'Requires MATLAB, ROLMIP and YALMIP. No solver is needed for this example.';
  document.getElementById('copy-code').textContent = 'Copy code ⧉';
}
tabs.forEach((tab, index) => {
  tab.addEventListener('click', () => selectExample(index));
  tab.addEventListener('keydown', event => {
    let next;
    if (event.key === 'ArrowDown' || event.key === 'ArrowRight') next = (index + 1) % tabs.length;
    if (event.key === 'ArrowUp' || event.key === 'ArrowLeft') next = (index + tabs.length - 1) % tabs.length;
    if (event.key === 'Home') next = 0;
    if (event.key === 'End') next = tabs.length - 1;
    if (next !== undefined) { event.preventDefault(); selectExample(next); tabs[next].focus(); }
  });
});
async function copyText(value, button, original) {
  try {
    if (navigator.clipboard && window.isSecureContext) await navigator.clipboard.writeText(value);
    else {
      const input = document.createElement('textarea'); input.value = value;
      input.style.position = 'fixed'; input.style.left = '-9999px';
      document.body.append(input); input.select();
      const success = document.execCommand('copy'); input.remove(); button.focus();
      if (!success) throw new Error('Clipboard unavailable');
    }
    button.textContent = 'Copied ✓'; document.getElementById('copy-status').textContent = 'Copied to clipboard.';
  } catch {
    button.textContent = 'Select and copy';
    const source = button.id === 'copy-code' ? code : document.getElementById('citation-fallback');
    if (source) { if (source.closest('details')) source.closest('details').open = true; const range = document.createRange(); range.selectNodeContents(source); const selection = window.getSelection(); selection.removeAllRanges(); selection.addRange(range); }
    document.getElementById('copy-status').textContent = 'Clipboard unavailable. Select the text and copy it manually.';
  }
  setTimeout(() => { button.textContent = original; }, 2200);
}
document.getElementById('copy-code').addEventListener('click', function () { copyText(examples[selected].code, this, 'Copy code ⧉'); });
const citation = `@article{AFOP:19,
  author = {C. M. Agulhari and A. Felipe and R. C. L. F. Oliveira and P. L. D. Peres},
  title = {Algorithm 998: The Robust LMI Parser --- A Toolbox to Construct LMI Conditions for Uncertain Systems},
  journal = {ACM Transactions on Mathematical Software},
  volume = {45}, number = {3}, pages = {36:1--36:25},
  year = {2019}, doi = {10.1145/3323925}
}`;
document.getElementById('copy-citation').addEventListener('click', function () { copyText(citation, this, 'Copy BibTeX ⧉'); });
selectExample(0);

const goatCounterScript = document.getElementById('goatcounter-script');
if (window.goatcounter && typeof window.goatcounter.count === 'function') trackGoatCounterView();
else goatCounterScript.addEventListener('load', trackGoatCounterView, { once: true });

fetch('https://rolmip.goatcounter.com/counter/TOTAL.json')
  .then(response => {
    if (!response.ok) throw new Error('Visitor count unavailable');
    return response.json();
  })
  .then(data => {
    if (typeof data.count === 'string') document.getElementById('visit-count').textContent = data.count;
  })
  .catch(() => {});
