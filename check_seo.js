const puppeteer = require('puppeteer');
(async () => {
    try {
        const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
        const page = await browser.newPage();
        await page.goto('https://orleonrastreamento.com.br', { waitUntil: 'domcontentloaded' });
        
        const data = await page.evaluate(() => {
            const metas = Array.from(document.querySelectorAll('meta'))
                .map(m => {
                    const name = m.getAttribute('name') || m.getAttribute('property') || '';
                    const content = m.getAttribute('content') || '';
                    return { name, content };
                }).filter(m => m.name !== '');
            
            const h1 = Array.from(document.querySelectorAll('h1')).map(el => el.innerText);
            const h2 = Array.from(document.querySelectorAll('h2')).map(el => el.innerText);
            const h3 = Array.from(document.querySelectorAll('h3')).map(el => el.innerText);
            const title = document.title;
            
            return { title, metas, h1, h2, h3 };
        });
        console.log("<<<JSON_START>>>");
        console.log(JSON.stringify(data, null, 2));
        console.log("<<<JSON_END>>>");
        await browser.close();
    } catch (e) {
        console.error("Error:", e.message);
    }
})();
