---
provenance: subagent:ada
lesson: 5
title: เอา /brief ขึ้นเว็บ + ภาพรวม ClaudyOS ที่คุณเพิ่งสร้าง
---

# Lesson 5: เอา /brief ขึ้นเว็บ + ภาพรวม ClaudyOS ที่คุณเพิ่งสร้าง

**Time: ~15-20 min**

**You'll finish with:** หน้าเว็บ public 1 หน้าที่ list ทุก brief ใน `briefs/` ของคุณ (พร้อม link คลิกอ่านได้), deploy ขึ้น Vercel ได้ URL `*.vercel.app` ที่ส่งให้ใครก็ได้ทาง LINE/Twitter, แล้วก็ภาพรวม "ClaudyOS" ที่คุณเพิ่งสร้างจาก Lesson 1-4 มองเป็น layered system ว่าแต่ละบทเพิ่มชั้นไหน, ปิดด้วย 3 ตัวอย่างการเอา pattern เดียวกันไปใช้กับงานอื่น

Window 1 (folder `ltd-ai-101`) ยังเป็นผม Window 2 (folder `my-first-project`) ยังเปิดต่อจาก Lesson 4 **Lesson นี้แตกต่างจาก L1-L4 ตรงที่ครึ่งแรกคุณจะออกจาก Claude Code ไปที่ browser** เพื่อ signup Vercel + drag folder ผมจะบอกตลอดว่าตอนนี้ทำใน Claude Code หรือใน browser

ถ้าอยากพักกลางคัน พิมพ์ `PAUSE` ผมเซฟไว้ให้แล้วกลับมาต่อได้

---

## What you're building today

หลัง Lesson 4 คุณมี:

- `/brief TICKER` ที่แตกเป็น 3 sub-agent (fundamentals/10-K, earnings/transcript, sentiment/websearch) ทำงานขนาน
- Skill `company-brief` คุม SOP 6 section
- ไฟล์ใน `.claude/agents/` 3 ตัว (fundamentals/earnings/sentiment หรือชื่อที่คุณตั้งเอง) แต่ละตัวเป็น source-of-truth ของ agent นั้น skill เรียก by name
- `CLAUDE.md` ที่มีเสียงนักลงทุนของคุณ
- earnings transcript + 10-K excerpt ใน `sources/<TICKER>/` ป้อน data จริง
- ไฟล์ `briefs/<TICKER>.md` หลายตัวสะสมจาก L1-L4

ปัญหาคือ ของพวกนี้อยู่ในเครื่องคุณคนเดียว ส่งให้เพื่อน หรือ post ใน social, ยาก Lesson 5 แก้ตรงนั้น

แผน 2 ครึ่ง:

1. **ครึ่งแรก (~10 min)**: สร้างหน้า showcase HTML ที่ list ทุก brief พร้อม link, แล้ว deploy ขึ้น Vercel ได้ public URL.
2. **ครึ่งหลัง (~5-10 min)**: ภาพรวม ClaudyOS, สิ่งที่คุณเพิ่งสร้างเป็น layered system แล้ว 3 ตัวอย่างการเอา /brief pattern ไปใช้ที่อื่น

---

ACTION: Greet the student briefly in Thai. Confirm starting Lesson 5 (~15-20 นาที, longest of the course). Tell them this is the capstone, ครึ่งหนึ่งจะออกจาก Claude Code ไป browser. Then ask:

"ก่อนเริ่ม ขอ verify ของจาก Lesson 4 ก่อนนะครับ ในหน้าต่าง 2 (folder `my-first-project`) ลอง paste:

```
ตรวจ 3 อย่างของ project นี้:
1. list ไฟล์ใน .claude/agents/ ทั้งหมด สำหรับแต่ละไฟล์ open แล้วบอก value ของ field `name:` ใน frontmatter
2. open .claude/skills/company-brief/SKILL.md show Steps section ของ body แล้วบอกว่ามีการเรียก sub-agent by name (อ้างชื่อจาก .claude/agents/ ตัวไหนบ้าง) หรือ inline brief ก้อนใหญ่
3. list ไฟล์ใน briefs/ ทั้งหมด นับจำนวนด้วย
```

แล้วบอกผมว่า: (a) sub-agent files มีกี่ตัว และ `name:` ของแต่ละตัวคืออะไร, (b) SKILL.md Steps เรียก agent by name หรือ inline brief, (c) `briefs/` มีกี่ไฟล์ และมี ticker อะไรบ้าง"

---

STOP: Wait for the student to report:
1. จำนวนและชื่อของ sub-agent files ใน `.claude/agents/` (ควรมี 3 ตัว ชื่ออะไรก็ได้ ขอให้แต่ละไฟล์มี `name:` field ใน frontmatter)
2. SKILL.md Steps section เรียก agent by name (ตรงกับชื่อใน `.claude/agents/`) หรือ inline brief ก้อนใหญ่ (= L4 ยังไม่ปิด)
3. จำนวนและรายชื่อ ticker ใน `briefs/` folder
4. ยืนยันว่า window 2 ยังเปิดอยู่ที่ folder `my-first-project`

---

USER: [Waits for student to report L4 artifacts + brief inventory]

---

ACTION: When the student responds:

1. ถ้า sub-agents ครบ 3 (มี frontmatter `name`) + SKILL.md Steps เรียก agent by name ตรงกับชื่อใน `.claude/agents/` + briefs ≥3 ไฟล์ + window 2 เปิด, say "ดี ของพร้อม showcase สมเหตุสมผล ไปต่อ Step 1" Move to Step 1.
2. ถ้า `briefs/` มีแค่ 1-2 ไฟล์, **อย่าเพิ่งไปต่อ Step 1** ตอบ: "Showcase จะดูแน่นกว่าถ้ามีอย่างน้อย 3 brief ในหน้าต่าง 2 ลองรัน `/brief <TICKER>` กับหุ้นที่คุณสนใจอีก 1-2 ตัว (เช่น NVDA, GOOGL, MSFT, ตัวที่ยังไม่เคย brief) กลับมาบอกผมตอน briefs/ มี ≥3 ไฟล์" Wait ห้ามไปต่อจน briefs ครบ
3. ถ้า `.claude/agents/` ว่างหรือไม่มี **AND student บอกว่าข้าม L4 ไปก่อน** (เช่น "ข้าม L4", "L4 ไม่ผ่าน", "skip L4", "พึ่ง /brief v2 ของ L3"), accept ตามนั้น ตอบ: "L4 ไม่ผ่าน OK ก็ได้ showcase ยังทำงานได้กับ /brief v2 จาก L3 ไปต่อ Step 1 ได้เลย กลับมาทำ L4 หลังคอร์สจบก็ได้" Move to Step 1.
4. ถ้า `.claude/agents/` มีไฟล์ครบ 3 ตัวจริง **แต่ SKILL.md Steps section ยัง inline brief อยู่ ไม่ได้เรียก agent by name** (= L4 Step 3 ทำไม่ครบ agent definitions เป็นไฟล์ตกแต่ง skill ไม่ได้ใช้จริง), ตอบก่อน: "L4 ยังไม่ปิด agent files มีแล้ว แต่ skill ยังไม่ได้เรียก by name งั้น sub-agent dispatch ยังไม่เกิดจริง กลับไป L4 Step 3 ตามที่ผมเขียน paste ใน หน้าต่าง 2: 'เปิด .claude/skills/company-brief/SKILL.md แก้ Steps section ให้เรียก sub-agent by name (ใช้ชื่อที่ผมตั้งไว้ใน .claude/agents/ value ของ field `name:` ใน frontmatter ของแต่ละไฟล์) แทน inline brief ส่วนอื่น Output format + Voice rules + frontmatter ห้ามแตะ' แล้วกลับมาบอกผม" Wait for fix before proceeding.
5. ถ้า sub-agent files ขาด `name:` ใน frontmatter (เช่น มีแค่ body หรือ frontmatter ไม่มี `---` block), ตอบ: "agent definitions ยังไม่สมบูรณ์ ต้องมี frontmatter `name:` + `description:` ด้านบน body ใน L4 Step 3 ผมเขียนไว้ครบ กลับไปทำให้ครบก่อน" Wait for fix.
6. ถ้า sub-agent files ขาด (มีแค่ 1-2 หรือไม่มี) **และ student ไม่ได้บอกว่าข้าม L4**, ถามก่อน: "L4 ของคุณผ่านไหม sub-agent files หาย หรือคุณข้าม L4 ไปก่อน ถ้าผ่าน ลองตรวจ `.claude/agents/` อีกที ถ้าข้าม ของจาก L3 ก็พอ ไปต่อได้เลยบอกผมว่าจะข้าม" Wait for clarification before proceeding.
7. ถ้า window 2 ปิดไปแล้ว, ขอให้เปิด Claude Code ที่ folder `my-first-project` ใหม่ก่อนต่อ
8. ถ้า student ใช้ folder ชื่ออื่น (ไม่ใช่ `my-first-project`), ใช้ชื่อนั้นทุกที่ที่ lesson นี้อ้าง `my-first-project`

---

## Step 1: สร้างหน้า showcase HTML

ก่อน deploy ต้องมีของจะ deploy. เราจะให้ Claude หน้าต่าง 2 generate หน้าเว็บ static หน้าเดียว (`showcase/index.html`) ที่อ่าน `briefs/*.md` แล้ว render เป็น gallery, แต่ละ card คลิกได้ลึกเข้าไปอ่าน brief.

**Static** (หน้าเว็บ static) แปลว่า ไม่มี server, ไม่มี database, เป็นแค่ HTML + CSS ไฟล์เดียว browser โหลดแล้วโชว์เลย ไม่ต้อง build อะไรซับซ้อน นี่คือ format ที่ Vercel deploy ได้ง่ายที่สุด

**ทางเลือกออกแบบ** ที่ผมตัดสินใจให้คุณก่อน เพราะ Lesson นี้ไม่ได้สอน web design:

- หน้าเดียว (`index.html`) เป็น index ของ briefs
- แต่ละ brief render เป็นหน้าย่อยของตัวเอง (ใช้ marked หรือคล้ายๆ convert markdown → HTML inline ในไฟล์เดียว, simple ที่สุด)
- ถ้า Claude เลือก approach อื่น (เช่น hardcode brief content ทั้งหมดใน index.html ก็ OK เพราะไม่มี build step)

ACTION: Hand the student this prompt to paste in **window 2** (folder `my-first-project`) Tell them: "ก็อปบล็อคนี้ paste ใน chat ของหน้าต่าง 2 ก่อนรัน ถ้าหน้าต่าง 2 อยู่ใน Plan mode จะดี Claude จะบอกแผนก่อน อ่านดูแผนแล้ว approve ตามขั้น ถ้าอยู่ Auto mode จะรันเลย"

````text
สร้าง folder showcase/ ที่ root ของ project ถ้ายังไม่มี แล้วสร้างไฟล์ showcase/index.html ที่:

1. อ่านไฟล์ทุกตัวใน briefs/*.md ของ project นี้
2. Render เป็นหน้าเว็บ HTML หน้าเดียว plain HTML + minimal CSS (no build step, no React, no framework)
3. หน้าแรกแสดง gallery ของ briefs: card 1 ใบต่อ 1 ticker มี ticker เป็น title วันที่ create ของไฟล์ (จาก mtime หรือ date ที่อยู่ในไฟล์ถ้ามี) 1-2 ประโยคแรกของ Company snapshot section เป็น preview
4. คลิก card แล้ว expand หรือเลื่อนไปดู brief เต็ม render จาก markdown (ใช้ embed approach ง่ายๆ ก็ได้ hardcode HTML ของแต่ละ brief ไว้ในไฟล์เดียวกัน อย่าใช้ external script ที่ต้อง fetch)
5. CSS เน้น clean readable ไม่ต้องสวย: white background, max-width 800px, sans-serif font, padding พอประมาณ
6. ห้ามใช้ build tool ไม่มี npm install ไฟล์ HTML เดียว open browser แล้วทำงาน

ก่อนสร้าง list ให้ดูก่อนว่าจะ embed brief ทั้งหมดไว้ใน index.html หรือ split เป็นไฟล์ย่อย (เลือก embed ใน 1 ไฟล์เพื่อให้ Vercel deploy ง่ายที่สุด) แล้วถามขอ approve ก่อนสร้างถ้าอยู่ใน Plan mode

ทำเลย
````

---

STOP: บอกผม:

1. Claude ในหน้าต่าง 2 ตอบยังไง? (โชว์แผนก่อนหรือสร้างเลย)
2. ถ้าสร้างแล้ว, ขอให้ Claude หน้าต่าง 2 list ไฟล์: "show ไฟล์ใน showcase/ ของ project นี้" ควรมี `showcase/index.html` อย่างน้อย 1 ไฟล์
3. ขอให้ Claude หน้าต่าง 2 บอก path เต็ม: "show full path ของ showcase/index.html". จดไว้ ผมจะใช้ตอน drag

---

USER: [Waits for student to confirm showcase/index.html created and report full path]

---

ACTION: When the student responds:

1. ถ้าไฟล์ถูกสร้างที่ `showcase/index.html` (relative to project root) + ทำงานได้, say "ดี ก่อน deploy ลอง preview ด้วยตาก่อน" Move to Step 2.
2. **Plan-mode branch:** ถ้า Claude ขอ approve ก่อน, บอก student approve plan ถ้า plan ดูแปลก (เช่น Claude จะ install npm หรือสร้าง folder อื่น), reject แล้ว paste reminder: "ห้ามใช้ build tool, ห้าม npm, ไฟล์ HTML เดียวที่ open ใน browser ทำงานได้" Wait for clean plan + creation.
3. ถ้า Claude สร้างหลายไฟล์ (เช่น แยก brief เป็นไฟล์ย่อย + index.html), OK ก็ได้ แต่บอก student: "OK เก็บได้ทั้ง folder ตอน drag ใส่ Vercel เราจะ drag ทั้ง `showcase/` folder เข้าไป Vercel deploy ทั้ง folder."
4. ถ้า Claude ไม่อ่าน briefs/ จริงและ generate placeholder, paste ในหน้าต่าง 2: "เพิ่ง generate showcase/index.html, อ่าน briefs/*.md ของ project จริงไหม หรือใส่ placeholder? ถ้า placeholder, regenerate และอ่านจริง" รอจน content จริงโผล่
5. ถ้า path ผิด (เช่น สร้างนอก project), ขอ Claude หน้าต่าง 2 ย้ายมาที่ `showcase/` ใน project root.

---

## Step 2: Preview ในเครื่องก่อน deploy

ก่อนปล่อยขึ้นเว็บ public ดูก่อนว่าหน้าตา OK ในเครื่องคุณ Vercel deploy เร็ว แต่ถ้า HTML เพี้ยนตั้งแต่ในเครื่อง deploy ไปก็เพี้ยน

ACTION: Tell the student to do this in **the file browser** (Finder/Explorer, ไม่ใช่ใน Claude Code):

1. เปิด Finder (Mac) หรือ File Explorer (Windows)
2. ไปที่ folder `my-first-project/showcase/`
3. Double-click ที่ `index.html`
4. browser default ของคุณจะเปิดและโชว์หน้า showcase

ถ้าไม่อยากออกไป Finder, ทางเลือกใน window 2: paste "show full filesystem path ของ showcase/index.html ที่เพิ่งสร้าง". เอา path ที่ Claude ตอบมา paste ใน browser address bar (ขึ้นต้นด้วย `file:///`).

---

STOP: บอกผม:

1. หน้า showcase เปิดขึ้นใน browser ไหม?
2. คุณเห็น card ของแต่ละ brief ที่คุณเคยทำ (AAPL หรืออื่น) ไหม? ครบจำนวน ticker ที่คุณมีใน `briefs/` ไหม?
3. คลิกแล้ว expand หรือเลื่อนดู brief เต็มได้ไหม?

---

USER: [Waits for student to confirm preview looks reasonable]

---

ACTION: When the student responds:

1. ถ้า preview OK + cards ครบ + คลิกได้, say "OK ของพร้อม deploy ต่อไปออกจาก Claude Code ไป browser ก่อน" Move to Step 3.
2. ถ้า preview blank หรือ error, paste ในหน้าต่าง 2: "showcase/index.html เปิดใน browser แล้ว blank/error, ตรวจหน่อยว่า HTML valid ไหม + อ่าน briefs/ จริงไหม + แก้ให้ render ออกจริง" Re-preview.
3. ถ้า cards ขาด (เช่น มี 4 brief ใน folder แต่ showcase โชว์ 2), paste: "showcase/index.html missing บาง brief, list ทุกไฟล์ใน briefs/ แล้ว regenerate ให้ครบทุกตัว" Re-preview.
4. ถ้า preview OK แต่ ugly มาก (text ติดกัน, no padding), อย่าเพิ่งแก้ Vercel deploy ก่อน ให้ student เห็น flow จบ cosmetic แก้ทีหลังได้
5. ถ้า student เปิด file path ใน browser ไม่ได้ (Windows path handling), ทางเลือก: ขอ Claude หน้าต่าง 2 รัน `python -m http.server 8000` ใน folder `showcase/` แล้วเปิด `http://localhost:8000` ใน browser ลอง paste ใน window 2: `python --version` หรือ `python3 --version` ถ้า version โผล่ = ใช้ได้ ถ้า error ข้ามไป deploy เลยได้

---

## Step 3: Signup Vercel + เตรียม deploy

**Vercel** คือบริการ deploy หน้าเว็บ static (และ dynamic) ฟรี (free tier ไม่ต้องบัตรเครดิต) ทำไมไม่ใช้ GitHub Pages? GitHub Pages ต้องมี git repo + push code, beginner-friendly น้อยกว่า Vercel ให้ drag folder ผ่านเว็บได้เลย

**ผมขอ honest ตรงนี้:** Vercel UI อาจจะเปลี่ยนไประหว่างผมอัด vs วันที่คุณเรียน ถ้าปุ่มไม่ตรงกับที่ผมบอก ลอง screenshot ส่งให้ Claude หน้าต่าง 2 ถาม "ปุ่มไหนคือ deploy/import?" หรือ Google "Vercel deploy folder" รูปจริงปัจจุบันมาเทียบ ขั้นตอนใหญ่ๆ น่าจะใกล้เคียง: signup → new project → import folder/drag → deploy

ACTION: Tell the student to do this **in browser** (ไม่ใช่ใน Claude Code):

1. เปิด browser tab ใหม่ ไปที่ `https://vercel.com`
2. กด Sign Up (มุมขวาบน)
3. เลือก signup ด้วย email (หรือ GitHub ก็ได้ ถ้ามี). Email ง่ายสุดสำหรับ beginner.
4. ถ้า Vercel ส่ง verification email, เปิด email verify link
5. หลัง verify เลือก plan = Hobby (free), ห้ามเผลอเลือก Pro ที่มีค่าใช้จ่าย
6. กลับมา dashboard ของ Vercel แล้ว stop ไว้ตรงนั้น

(ถ้า UI ถามเรื่อง team name หรือ project name, ตั้งอะไรก็ได้ที่จำได้, เช่น `paint-first-deploy`)

---

STOP: บอกผม:

1. Signup สำเร็จ + อยู่ใน Vercel dashboard แล้วใช่ไหม?
2. Dashboard มีปุ่มอะไรเด่นๆ บ้าง? (ปุ่ม "Add New", "Import Project", "Deploy", หรือคำใกล้เคียง) บอกชื่อปุ่มที่คุณเห็น

---

USER: [Waits for student to confirm Vercel signup + report visible buttons]

---

ACTION: When the student responds:

1. ถ้า signup สำเร็จ + เห็นปุ่ม deploy/import/add, say "ดี ขั้นต่อไป drag folder ขึ้น" Move to Step 4.
2. **Verification email ไม่มา**: บอก student check spam, รอ 2-3 นาที, ถ้ายังไม่มาให้ Sign Up ใหม่ด้วย email อื่น (Gmail ปกติได้). ถ้าใช้ company email อาจโดน filter.
3. **เผลอเลือก Pro plan**: บอก student ไป Settings → Billing → Downgrade to Hobby ก่อน ห้ามทิ้งไว้ เดี๋ยวโดนเก็บเงินรอบหน้า
4. **UI ดูไม่เหมือนที่ผมบอก** (ปุ่มชื่อเปลี่ยน, layout ใหม่): บอก student "Vercel UI อัปเดตบ่อย ลอง screenshot dashboard ส่งให้ Claude หน้าต่าง 2 ถาม 'ปุ่มไหนคือ import folder หรือ deploy folder' Claude อ่าน screenshot ได้" แล้วทำตามที่ Claude บอก
5. ถ้า student อยากเลิก Vercel ใช้ Netlify/อื่น, OK ก็ได้ flow คล้ายกัน แต่ผมไม่ได้ test step-by-step ใน Netlify/อื่น ของ Lesson นี้ student ต้อง self-navigate

---

## Step 4: Drag folder ขึ้น Vercel

ตรงนี้คือขั้น deploy จริง **Vercel UI label อาจ vary ตาม version**, ชื่อปุ่มที่ผมจะบอกอาจเป็น "Add New" หรือ "Import Project" หรือ "Deploy" ขึ้นกับ version ลอง pattern matching จากรูปคำใกล้เคียง

ACTION: Tell the student to do this **in Vercel browser tab**:

1. กดปุ่มที่ดูเหมือน "Add New" หรือ "Import Project" หรือ "Deploy" (ที่อยู่บน dashboard) ปุ่มอาจเป็นสีดำหรือมี + ข้างใน
2. ถ้า Vercel ถามให้เลือก source: เลือกที่ระบุว่า "Deploy from folder" หรือ "Upload" หรือ "Import without Git" หรือคล้ายๆ **ห้ามเลือก "Import from GitHub"** เราไม่ใช้ git ใน lesson นี้
3. หน้าจอจะมี drop zone ให้ drag folder. กลับไปที่ Finder/Explorer
4. Drag folder `showcase/` (ทั้ง folder, ไม่ใช่ไฟล์ index.html ตัวเดียว) จาก `my-first-project/` ใส่ลงใน drop zone ของ Vercel
5. รอ Vercel upload + auto-detect ว่าเป็น static site
6. ถ้า Vercel ถามว่าจะตั้ง project name อะไร, ตั้ง name ที่จำได้ (เช่น `my-briefs` หรือ ชื่อคุณ + briefs)
7. กดปุ่ม "Deploy" (หรือคำใกล้เคียง)
8. รอ 30-60 วิ Vercel build + deploy

**ถ้าไม่เจอ drop zone**: บางครั้ง Vercel ให้ "Browse" ไปเลือก folder ทำได้เหมือนกัน, ผลลัพธ์ตัวเดียวกัน

**ถ้า drag folder แล้วเขาไม่รับ**: ลอง zip folder `showcase/` เป็น `.zip` ก่อน แล้ว drag .zip ใส่ (Mac: คลิกขวาที่ folder → Compress Windows: คลิกขวา → Send to → Compressed folder)

---

STOP: บอกผม:

1. Drag/upload สำเร็จไหม?
2. Vercel แสดงหน้า build/deploy progress ไหม?
3. ตอนนี้ Vercel ให้ URL `*.vercel.app` มาหรือยัง? URL หน้าตาเป็นยังไง?

---

USER: [Waits for student to confirm deploy completed + report URL]

---

ACTION: When the student responds:

1. ถ้า deploy สำเร็จ + ได้ URL `*.vercel.app`, say "ของขึ้นเว็บแล้ว public แล้ว test กับ phone ก่อนปิด" Move to Step 5.
2. **Build failed**: ดู error message ที่ Vercel โชว์ ถ้าบอก "no index.html found", student อาจ drag ไฟล์เดียวแทน folder, หรือ folder ที่ drag ไม่มี index.html ที่ root ขอ student check แล้ว drag `showcase/` folder ใหม่ (ทั้ง folder, ไม่ใช่ parent `my-first-project/`)
3. **404 หลัง deploy**: บางครั้ง Vercel ใช้เวลา 30-60 วิ propagate (propagate = ใช้เวลา deploy ครอบคลุมไป edge servers ทั่วโลก ปกติ <1 นาที) รอ 1 นาที refresh URL อีกที ถ้ายัง 404 หลัง 2 นาที ดู Deployment status ใน Vercel dashboard, อาจ build ยังไม่จบ
4. **URL ขึ้น แต่หน้าเปล่า**: HTML render ไม่ออก paste URL ส่งให้ Claude หน้าต่าง 2 ถาม: "เปิด URL นี้แล้ว page เปล่า, ดูว่าน่าจะเพราะอะไร" Claude อ่าน URL ไม่ได้ตรงๆ แต่จะแนะนำ debug step (open DevTools (DevTools = browser developer tools เปิดด้วย F12 หรือ Cmd+Option+I บน Mac, Ctrl+Shift+I บน Windows ใช้ดู error ของ web), ดู console error (console = แท็บใน DevTools ที่โชว์ error message ของ web)) ทำตาม
5. **Drag ไม่ได้ ใช้ zip ก็ไม่ได้**: บอก student ลองวิธีสุดท้าย, เปิด Vercel docs ของวันนี้ search "deploy static site folder" Vercel จะมีคู่มือ official ของ version ปัจจุบัน ผม lesson นี้ test deploy ผ่าน drag, methods อื่นไม่ได้ verify
6. **ถ้า error 'no index.html found'**: student น่าจะ drag parent folder `my-first-project/` ทั้งก้อนมา ให้ drag แค่ `showcase/` sub-folder แทน

---

## Step 5: Test public URL บน phone

ตรงนี้คือ moment ที่รู้ว่าของ public จริง: เปิด URL ในมือถือคุณเอง ที่ไม่ได้ login Vercel ใน mobile browser ถ้าหน้าโผล่ = สำเร็จ, ใครก็ได้บนเน็ตเปิดได้

ACTION: Tell the student to do this **on their phone** (ไม่ใช่ในเครื่อง dev):

1. หยิบมือถือ Disable Wi-Fi ของบ้านชั่วคราว ใช้ 4G/5G ก็ได้ (เพื่อยืนยันว่าไม่ใช่แค่ใน LAN เห็น) หรือถ้า lazy ใช้ Wi-Fi ก็ได้ Vercel เป็น public CDN (CDN = Content Delivery Network เครือข่าย server ที่กระจายไฟล์ static ใกล้ผู้ดู Vercel ใช้ CDN ของตัวเอง ทำให้ URL คุณโหลดเร็วทั่วโลก) จริงอยู่แล้ว
2. เปิด browser มือถือ (Safari หรือ Chrome)
3. พิมพ์ URL `*.vercel.app` ที่ Vercel ให้
4. หน้า showcase ควรขึ้นเหมือนใน desktop

---

STOP: บอกผม:

1. หน้าโผล่บน phone ไหม?
2. Cards ที่เห็น ครบเหมือน desktop ไหม?
3. คลิก/tap แล้วเลื่อนดู brief เต็มได้ไหม?

---

USER: [Waits for student to confirm public mobile access works]

---

ACTION: When the student responds:

1. ถ้าทำงานบน phone, say "OK deploy ครบ ส่ง URL ให้เพื่อนทาง LINE ได้เลย ครึ่งแรกของ Lesson 5 จบ ครึ่งหลังคือภาพรวมที่คุณเพิ่งสร้าง" Move to Step 6 (ClaudyOS overview).
2. ถ้าหน้าเพี้ยนบน phone (mobile layout broken), อย่าเพิ่งแก้ตอนนี้ บอก: "ตอนนี้ structure ของ deploy ใช้ได้, mobile responsive มา iterate ทีหลังได้ กลับไป showcase/index.html ใน window 2 ขอ Claude เพิ่ม `<meta name='viewport' content='width=device-width, initial-scale=1'>` กับ basic mobile CSS แต่ตอนนี้ไปต่อก่อน" Move to Step 6.
3. ถ้า phone โหลดไม่ออก (timeout/SSL error), check ว่า phone connect internet ปกติ ถ้า OK ให้ลอง URL บน desktop ใน browser ที่ logout Vercel (incognito tab) ถ้า incognito ก็ไม่ขึ้น = deploy ยังไม่ propagate, รออีก 1-2 นาที ถ้า incognito ขึ้น = phone connectivity issue, ไม่เกี่ยว Vercel

---

## Step 6: ภาพรวม ClaudyOS ที่คุณเพิ่งสร้าง

(step นี้ทำในหน้าต่าง 1 ไม่ต้อง paste ในหน้าต่าง 2)

5 บทที่ผ่านมา คุณ build ของหลายชิ้นแยกกัน ตรงนี้ผมจะ map ให้ดูว่าจริงๆ มันคือ **ระบบเดียวที่มี layer ซ้อนกัน** ผมเรียกของผมว่า **ClaudyOS** เพราะมันทำงานเหมือน operating system ที่ Claude เป็น kernel แล้วของอื่นซ้อนลงไปเป็น layer

ภาพ mental model ของ ClaudyOS:

```
┌─────────────────────────────────────────────────┐
│  Public layer  →  Vercel deploy (Lesson 5)      │  ← URL public ที่ใครก็เห็น
├─────────────────────────────────────────────────┤
│  External memory  →  Earnings transcript + 10-K │  ← เอกสารตรงจากบริษัท ที่
│                       (Lessons 3-4)             │     Claude อ่านก่อนตอบ
├─────────────────────────────────────────────────┤
│  Services  →  Sub-agents (Lesson 4)             │  ← พนักงาน specialized ทำงานขนาน
├─────────────────────────────────────────────────┤
│  OS layer  →  CLAUDE.md + skill +               │  ← context + SOP + ปุ่มลัด
│              slash command (Lessons 1-2)        │
├─────────────────────────────────────────────────┤
│  Kernel  →  Claude Code                         │  ← ตัวที่รันทุกอย่าง
└─────────────────────────────────────────────────┘
```

อ่านจากล่างขึ้นบน:

- **Kernel = Claude Code** อันนี้ Anthropic เขาทำมาให้, คุณไม่ต้องสร้าง คุณแค่เปิดใช้
- **OS layer = CLAUDE.md + skill + slash command** สิ่งที่คุณสร้างเองใน Lesson 1-2. Project context (CLAUDE.md), SOP (skill), ปุ่มลัด (slash command). 3 ชิ้นนี้คือ "OS" ของ project คุณเอง Claude อ่านทุกครั้งที่เปิด folder
- **Services = Sub-agents** Lesson 4 คุณแยก /brief เป็น 3 specialist (ตามชื่อที่คุณตั้งใน L4) ทำงานขนาน แต่ละตัวเป็นไฟล์ใน `.claude/agents/<name>.md` skill เรียก by name นี่คือ "พนักงาน" ที่ OS layer เรียกใช้
- **External memory = Earnings transcript + 10-K** (เอกสารตรงจากบริษัทใน `sources/<TICKER>/` ที่ Lesson 3-4 paste ไว้) Claude memory เอง limit, ภายนอกคือที่เก็บ data จริงที่ Claude ไม่ได้เห็นตอน train แต่อ่านได้ตอนทำงาน
- **Public layer = Vercel deploy** Lesson 5 ของในเครื่อง คนเดียวเห็น deploy = ทุกคนเห็น

แต่ละบทคุณเพิ่ม layer ขึ้น 1 ชั้น ไม่มีบทไหนที่สร้างของใหม่ทั้งระบบ มันคือ accretion layer-by-layer

**ทำไม map นี้สำคัญ:** อะไรที่คุณจะ build ต่อหลังจากนี้ จริงๆ ก็แค่ เพิ่ม/แก้ 1 layer ไม่ต้องเริ่มใหม่

- อยากให้ /brief ฉลาดขึ้น = แก้ skill SOP (OS layer)
- อยากให้ data fresh ขึ้น = ปรับ external memory (Lesson 3 layer)
- อยากให้เร็วขึ้น = เพิ่ม sub-agent หรือเปลี่ยน parallelization (Lesson 4 layer)
- อยากให้คนอื่นใช้ได้ = แก้ public layer (Lesson 5)

นี่คือเหตุผลที่ผมไม่กลัวเริ่มของใหม่ ถ้าจะ build tool ใหม่ ผม map กับ layer พวกนี้ก่อน แล้วเดินทีละชั้น เหมือนที่คุณเพิ่งทำ 5 บท

---

STOP: ดู map ข้างบน นึกถึง 5 บทที่ผ่านมา layer ไหนยังไม่ค่อย solid ในของคุณ? (ไม่ต้องแก้ตอนนี้ เพิ่งสังเกตให้ตัวเองเฉยๆ) บอกผมว่า layer ไหนคุณคิดว่ายัง weak ที่สุด

---

USER: [Waits for student to reflect on which layer feels weakest]

---

ACTION: When the student responds:

1. ตอบสั้นๆ acknowledge layer ที่เขาบอก ห้ามให้คำแนะนำเฉพาะหรือ deep dive (ไม่ใช่ goal ของ step นี้) บอก: "ดี การที่มองเห็นว่า layer ไหน weak คือ skill หลังจบคอร์ส สิ่งที่ผมทำหลังเรียนคอร์สเดียวกันเมื่อ 2 เดือนก่อนคือเลือก 1 layer ที่ weak แล้ว iterate จนพอใจ ก่อนไป layer อื่น"
2. ไม่ต้อง pull ไป recommend skill list หรือ tool list การ reflect คือ output Move to Step 7.
3. ถ้า student ตอบว่า "ทุก layer ดูเดียวกันหมด งงๆ", OK ก็ได้ ตอบ: "ปกติครับ หลังจาก deploy เสร็จเปิด URL ดูเล่นวันสองวัน feeling ว่า layer ไหนน่าแก้จะมาเอง ไม่ต้องรีบ" Move to Step 7.

---

## Step 7: 3 ตัวอย่าง /brief pattern ใช้ที่อื่น

`/brief` ของคุณคือ tool ที่ build จาก: skill (SOP) + project context (CLAUDE.md voice) + sub-agent (parallelization) + external source (earnings transcript + 10-K) + deploy (Vercel) **Pattern เดียวกันใช้กับงานอื่นได้** เปลี่ยนแค่ skill body กับ source

3 ตัวอย่างที่ผมใช้จริง (หรือเคยลอง) ที่อยู่ใน reach ของคุณ:

### 1. Watchlist Scout

แทนที่จะ /brief 1 ticker ครั้งละ 1 รอบ, สร้าง `/scout` ที่:
- รับ list of ticker (เช่น 10 ตัวที่คุณ watch อยู่)
- 3 sub-agents เดียวกัน (ตามชื่อที่คุณตั้งใน L4) สแกนทั้ง list
- Output = digest 1 หน้า, ตัวไหนมี movement ใหญ่ขึ้น flag

ใช้ของเดิมหมด แค่ skill body เปลี่ยนจาก "1 ticker → 6-section brief" เป็น "list of tickers → daily mover digest".

### 2. Earnings recap

แทนที่จะ research จาก scratch รับ transcript จาก earnings call ที่ paste มา:
- Skill = "ตัด transcript เป็น 4 ก้อน: guidance, Q&A surprise, capex commentary, color of management"
- Sub-agents = อ่านแต่ละก้อนขนาน
- Output = 1-page diary-style recap ตามเสียงคุณ

ผมใช้ pattern แบบนี้กับ Reese agent ของผม

### 3. Vendor / partnership / hiring brief

ออกจาก investing เลย ถ้าคุณรับ candidate มาสัมภาษณ์ หรือ vendor มา pitch:
- Skill = "บริษัท/คน X, ดู 4 ข้อ: track record, fit กับ need, pricing/comp, 3 questions ก่อนตัดสินใจ"
- Source = LinkedIn, website, references
- Output = brief 1 หน้าใน folder `briefs-people/` หรือ `briefs-vendors/`

ของเดียวกันหมด แค่ skill SOP เปลี่ยน + source เปลี่ยน + folder เปลี่ยน

**ผมไม่ได้บอกให้คุณทำทั้ง 3 ตอนนี้** เลือก 1 ตัวที่ใกล้ work ของคุณจริง ลองสร้างเองหลังจบคอร์ส การที่จะ work pattern นี้ในมือคุณคือ goal ของคอร์สนี้

---

STOP: ใน 3 ตัวอย่างนี้ ตัวไหนใกล้งานคุณที่สุด? (ตอบสั้นๆ ไม่ต้องเริ่มทำตอนนี้)

---

USER: [Waits for student to pick 1 adaptation that resonates]

---

ACTION: When the student responds:

1. Acknowledge ตัวที่เขาเลือก สั้นๆ ไม่ pitch ของอื่น บอก: "OK เก็บไว้ในใจ หลัง Lesson 5 จบ คุณมีของพอที่จะลองทำเองแล้ว ผมไม่ต้องสอนเพิ่ม Lesson นี้ก็ได้" Move to closing.
2. ถ้าเลือกอันที่ 4 ที่ผมไม่ได้ list (use case ของเขาเอง), great บอก: "ดี mapping ไปงานตัวเองได้ ไปต่อ" Move to closing.
3. ถ้าตอบว่า "ยังไม่รู้ ใกล้หมดเลย", ก็ได้ บอก: "ปกติครับ ตัวเลือกอยู่ที่ใจคุณ pick ตอนพร้อม ไม่ต้องรีบ" Move to closing.

---

## Step 8: Final checklist + closing

(step นี้ทำในหน้าต่าง 1 ไม่ต้อง paste ในหน้าต่าง 2)

ก่อนปิดคอร์สเช็ค:

1. มี URL `*.vercel.app` ของ showcase ใช้งานได้บน phone
2. หน้าต่าง 2 (folder `my-first-project`) มี `showcase/index.html`
3. คุณเข้าใจ ClaudyOS layer map (kernel → OS → services → external memory → public)
4. คุณเลือก 1 ใน 3 adaptation idea (หรือของตัวเอง) ที่อยากลองหลังคอร์ส
5. URL Vercel ของคุณ save ไว้ที่ไหนสักที่ (Notes app, message ส่งหาตัวเอง) จะได้ไม่ลืม

---

STOP: ทั้ง 5 ข้อ ผ่านครบไหม? ตอบในหน้าต่าง 1 (หน้าต่างนี้)

---

USER: [Waits for student final checklist confirmation]

---

ACTION: When the student responds:

1. ถ้าผ่าน 5/5, say "ครบ Lesson 5 ผ่าน คอร์สจบแล้ว" Move to "What just happened" + Common Stumbles + closing.
2. ถ้า URL หาย (ลืม save), บอก student กลับไป Vercel dashboard ดู project ที่ deploy → URL อยู่ตรงนั้น save ไว้แล้วกลับมา
3. ถ้าข้อ 3-4 ยังไม่ clear, ไม่ block บอก: "เก็บไว้ในใจไปเรื่อยๆ ก็ได้ การ reflect บน layer/adaptation ใช้เวลา ผ่าน Lesson 5 ได้" Move to closing.

---

## What just happened (สรุป Lesson 5)

ใน 15-20 นาทีที่ผ่านมา คุณ:

1. สร้างหน้า `showcase/index.html` ที่ list ทุก brief ที่คุณเคยทำใน L1-L4
2. Signup Vercel free tier และ drag folder ขึ้น deploy
3. ได้ URL `*.vercel.app` ที่ส่งให้ใครก็ได้ test บน phone จริง
4. มอง ClaudyOS เป็น layered system, kernel → OS → services → external memory → public
5. เห็น 3 pattern ที่เอา /brief ไปใช้กับงานอื่น (watchlist scout, earnings recap, vendor brief)

---

## What just happened (สรุปทั้งคอร์ส)

ย้อนกลับไปดู 5 บท:

1. **Lesson 1**: เปิด project ตัวแรก, สร้าง CLAUDE.md + slash command `/brief` v0
2. **Lesson 2**: ยกระดับ slash command เป็น skill (`company-brief` SOP), ใส่เสียงนักลงทุนใน CLAUDE.md
3. **Lesson 3**: feed earnings call transcript จริงเข้ามาเป็น source แทน training memory + `/context` ดู cost
4. **Lesson 4**: แตก /brief เป็น 3 sub-agent ที่นิยามเป็นไฟล์ใน `.claude/agents/` (ตามชื่อที่คุณตั้งตอน L4) skill เรียก by name agents ทำงานขนาน
5. **Lesson 5**: Deploy showcase ขึ้น Vercel + ภาพรวม ClaudyOS

ในมือคุณตอนนี้: **OS เล็กๆ ของตัวเอง** ที่ทำงานกับงาน 1 type (stock brief) Pattern เดียวกันใช้กับ type อื่นได้เมื่อพร้อม

showcase บน Vercel เป็นสำเนา public, source-of-truth ยังเป็น folder ในเครื่อง อยากปลอดภัยขึ้นวาง folder `my-first-project/` ไว้บน iCloud Drive หรือ Google Drive ก็ได้ Vercel re-deploy ได้ตลอด แต่ folder ในเครื่องคือของจริงที่ skill กับ source อยู่

---

ขอพูดตรงๆ ก่อนปิดคอร์ส

คุณเพิ่งติดตั้ง tool เขียนเสียงนักลงทุนของคุณเองเป็น instructions เอา source จริงมาใส่ แตกทีม 3 sub-agent แล้ว deploy site ขึ้นเน็ต นั่นไม่ใช่งานของคนไม่เทคนิค หยุดบอกตัวเองได้แล้วว่าทำไม่ได้

---

## Common stumbles (Lesson 5)

- **Vercel signup wall (verification email ไม่มา)** check spam, รอ 2-3 นาที, ใช้ email อื่น (Gmail ปกติได้). อย่าใช้ company email ที่ filter เข้ม
- **Drag folder ไม่รับ** zip folder `showcase/` เป็น .zip แล้ว drag .zip ใส่ Vercel แทน
- **Build failed "no index.html found"** drag `showcase/` folder ทั้ง folder, ไม่ใช่ parent project folder, ไม่ใช่ไฟล์เดียว
- **404 หลัง deploy ทันที** รอ 30-60 วิ propagate. ถ้ายัง 404 หลัง 2 นาที ดู Deployment status ใน Vercel dashboard
- **showcase/index.html generate placeholder ไม่อ่าน briefs จริง** paste ในหน้าต่าง 2: "regenerate, อ่าน briefs/*.md จริงแล้ว embed content จริง ไม่ใช่ placeholder"
- **Mobile หน้าเพี้ยน** กลับ window 2 ขอ Claude เพิ่ม viewport meta tag + basic mobile CSS, redeploy ด้วยการ drag `showcase/` ใหม่ใน Vercel UI ของ project เดิม (Vercel จะ overwrite deployment)
- **Vercel UI ปุ่มชื่อต่างจากที่ผมบอก** screenshot ส่งให้ Claude หน้าต่าง 2 ถาม "ปุ่มไหนคือ deploy/import folder", Claude อ่าน screenshot ได้
- **เผลอเลือก Pro plan** ไป Settings → Billing → Downgrade to Hobby ทันที ห้ามทิ้งไว้
- **paste prompt ผิดหน้าต่าง** prompt ทุก code block ที่ผมบอกให้ paste ต้องไปหน้าต่าง 2 (folder `my-first-project`). step ที่ออก browser (Vercel UI) ทำใน browser tab ใหม่ ไม่เกี่ยวกับ Claude Code

ถ้าหาทางออกไม่ได้จริงๆ comment มาในคลิปคอร์ส ผมก็เพิ่งหัดเหมือนกัน

---

## พร้อมแล้ว ไปต่อยังไง

คอร์สจบที่ตรงนี้ คุณมี ClaudyOS ของตัวเอง (เล็กๆ แต่ครบ layer) บวก URL public ที่ส่งให้คนอื่นได้

3 step ที่ผมแนะนำหลังคอร์ส (เลือก 1 ไม่ต้องทำหมด):

1. **เลือก 1 layer ที่ weak ที่สุดของคุณ** (จาก Step 6) แล้ว iterate จนพอใจ เช่น ถ้า skill SOP ยัง generic refine ตามงานจริงของคุณ
2. **เลือก 1 adaptation** จาก Step 7 (watchlist/earnings/vendor) แล้วลองสร้างเอง Pattern เดียวกันที่คุณใช้กับ /brief
3. **อ่าน source ของ AI 101** ที่ผม link ใน README ของคอร์ส ผมมีแผน post short-form cards เรื่อง slash command / skill / sub-agent แยกต่างหาก ถ้ามีผมจะ link ใน README

หลังจากนี้ผมอาจมี advanced lesson ในรูป member-only ทีหลัง แต่จริงๆ พื้นที่คุณมีตอนนี้คือพอที่จะเริ่ม build ของคุณเองได้แล้ว ไม่ต้องรอผม

ของถัดไปที่คุณจะ build จะใช้เวลาน้อยกว่า /brief ครึ่งหนึ่ง เพราะ pattern อยู่ในมือแล้ว

หรือไม่รู้จะทำอะไรต่อ ลองไปดูช่องเขียวๆ นี้ก็ได้นะ https://www.youtube.com/@ลงทุนDiary

---

STOP: ถามอะไรค้างจากคอร์สก็ได้ตอนนี้ หรือพิมพ์ "จบคอร์ส" ถ้าพร้อมปิด

---

USER: [Waits for student final question or course-end signal]

---

ACTION: When the student responds:

1. ถ้าพิมพ์ "จบคอร์ส" หรือคำใกล้เคียง, say สั้นๆ: "OK ขอบคุณที่เรียนจบ ส่ง URL Vercel ของคุณให้คนใกล้ตัวดูได้เลยถ้าอยาก ของในมือคุณตอนนี้ใช้งานจริง" จบ ห้ามต่อ pitch หรือ upsell
2. ถ้าถามคำถามที่เกี่ยวกับ lesson 5 (Vercel issue, layer map, adaptation idea), ตอบสั้นๆ ตามจริง ถ้า scope เกิน Lesson 5 บอก: "อันนั้นเลย scope ของคอร์สนี้ผม เก็บไว้ลองเองหลังจบ comment ในคลิปได้ถ้าอยากแชร์ผลลัพธ์"
3. ถ้าถามเรื่อง pipeline/automation level อื่น (hook, MCP, Codex, etc.) ที่ไม่ได้สอนในคอร์ส, ตอบ honest: "ของพวกนี้ผมยังหัดอยู่เหมือนกันครับ คอร์สนี้ครอบ basics เป็นหลัก ถ้ามี advanced lesson ผมจะ post ทีหลัง" ไม่ pitch advanced ที่ยังไม่มี
