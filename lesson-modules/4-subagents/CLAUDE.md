---
provenance: subagent:ada
lesson: 4
title: Sub-agent. ทีม AI 3 คน ขนาน ทำให้ /brief เร็วและสะอาดขึ้น
---

# Lesson 4: Sub-agent. ทีม AI 3 คน ขนาน ทำให้ /brief เร็วและสะอาดขึ้น

**Time: ~30-40 min** (longest lesson, ครึ่งหนึ่งคือหา 10-K excerpt จาก SEC EDGAR ถ้าไม่เคยใช้)

**You'll finish with:** `/brief TICKER` v3 ที่แตกงาน research ออกเป็น 3 sub-agent ทำงานขนาน, fundamentals คนเดียว, news คนเดียว, sentiment คนเดียว แต่ละคนถือ context ของตัวเองสะอาด ไม่ปนกัน แล้ว main Claude เอาผลของทั้ง 3 มาประกอบเป็น brief ตาม SOP เดิม ผลลัพธ์: เร็วขึ้น (ขนานแทน sequential) + สะอาดขึ้น (แต่ละ dimension มี attention เต็มไม่ดิ้นรนแย่ง context กัน)

Window 1 (folder `ltd-ai-101`) ยังเป็นผม Window 2 (folder `my-first-project`) ยังเปิดต่อจาก Lesson 3 ห้ามเพิ่งปิด

ถ้าอยากพักกลางคัน พิมพ์ `PAUSE` ผมเซฟไว้ให้แล้วกลับมาต่อได้

---

## ก่อนเริ่ม Lesson 4, อ่านก่อน 30 วินาที

L4 ขึ้นกับว่าอยาก go deeper หรือไม่ ถ้า /brief v2 จาก L3 ครอบคลุมที่อยากใช้แล้ว ข้ามไป L5 ก็ได้ ไม่เสียหาย ของในมือคุณตอนนี้ทำงานจริงแล้วเป็นเครื่องมือ production ใช้ได้ Lesson นี้คือ optimization layer (เร็วขึ้น + clean context) ไม่ได้จำเป็นสำหรับทุกคน  เพราะ sub-agent + concept analyst-team แตกงานขนาน คือก้าวที่ทำให้ /brief เริ่มรู้สึกเหมือนมีทีม junior 3 คนช่วยคุณ research ไม่ใช่คนเดียวเหนื่อยๆ ผ่าน 12 หัวข้อ ถ้าอยากเห็นว่า model นั้นเป็นยังไง ลองต่อ แต่ถ้าลองแล้วคิดว่าไม่ได้ใช้  ข้าม L5 ก่อนได้

---

## What you're building today

Lesson 3 จบที่ `/brief AAPL` v2: skill body เป็น SOP ก้อนใหญ่ก้อนเดียว Claude ตัวเดียวเดินตามทีละขั้น, อ่าน external research source, เขียน 6 sections, ใส่เสียงของคุณ Output ดีขึ้นจริง, แต่ก็เริ่มมีอาการ:

- Claude ตัวเดียว ต้อง juggle 6 หัวข้อ + voice + cite source + format ในรอบเดียว, attention เริ่มไม่พอ
- Section หลังๆ บางทีลืม
- Sequential, ทำเสร็จ section 1 แล้วค่อย 2 แล้วค่อย 3, รวมแล้วช้า
- Context เริ่มปน อ่าน 10-K แล้วไหลไป transcript แล้วเสียงเริ่มเปลี่ยน

Paint เรียกอันนี้ว่า "งูกินหางตัวเอง" (snake eats own tail), Claude ตัวเดียวพยายามทำหลายงานเกินไปในรอบ context เดียว, สุดท้าย context ไม่พอลืมสิ่งที่ทำไปตอนต้น

วิธีแก้ที่ Lesson 4 ใช้: **sub-agent** แทนที่จะให้ Claude ตัวเดียวทำทุกอย่าง dispatch ทีมเล็ก 3 คน ทำงานขนาน **แต่ละคนมี source เฉพาะของตัวเอง**:

1. **Fundamentals agent** = อ่าน 10-K → company snapshot + revenue/margin/balance sheet (จาก Item 1 + Item 7 MD&A)
2. **Earnings agent** = อ่าน earnings call transcript จาก L3 → ตัวเลขไตรมาสล่าสุด + guidance + management commentary
3. **News-sentiment agent** = ใช้ WebSearch → news 7 วันล่าสุด + analyst upgrades/downgrades + catalysts (ตามกฎ "ห้ามทำนายตลาด" ของ Paint)

3 คนนี้ทำพร้อมกัน main Claude เป็น "orchestrator" (orchestrator คือ Claude หลักที่ส่งงานออกแล้วรอรวบผล คล้าย senior analyst ที่แจกงานให้ junior 3 คนแล้วรับผลกลับ) รับผลของทั้ง 3 มาร้อยเรียงเป็น brief ตาม SOP เดิม + ใส่เสียงของคุณ

ปลาย Lesson 4 รัน `/brief AAPL` ในหน้าต่าง 2 อีกที, dispatch 3 sub-agent ขนาน, output แน่นกว่า v2 (แต่ละ section มี attention เต็ม) + เร็วกว่า (ขนาน).

---

ACTION: Greet the student briefly in Thai. Confirm starting Lesson 4 (~30-40 นาที, longest lesson, ครึ่งหนึ่งคือหา 10-K จาก SEC ถ้าไม่เคยใช้). Then ask:

"ก่อนเริ่ม Lesson 4 ขอ verify ของจาก Lesson 3 ก่อนนะครับ ในหน้าต่าง 2 (folder `my-first-project`) ลองอ่านไฟล์ .claude/skills/company-brief/SKILL.md

แล้วบอกผม 3 อย่าง:

1. SKILL.md ยังอยู่ไหม
2. ใน body มี step ที่บอกให้อ่าน earnings transcript ใน sources/<TICKER>/ ก่อนเขียน Latest earnings section ใช่ไหม
3. รัน /brief <TICKER> ครั้งล่าสุด output มี 6 sections ครบไหม + Latest earnings section อิงจาก earnings transcript ที่ paste ไว้ใน sources/ (ไม่ใช่ Claude แต่งจาก memory) ใช่ไหม"

---

STOP: Wait for the student to confirm L3 deliverables exist:
1. `.claude/skills/company-brief/SKILL.md` ยังมี
2. SKILL.md body มี step "อ่าน sources/<TICKER>/" ก่อนเขียน Latest earnings
3. /brief output ครบ 6 sections + Latest earnings section อิง earnings transcript จริงจาก sources/ (ไม่ใช่ training memory)

และยืนยันว่า window 2 ยังเปิดอยู่ที่ folder `my-first-project`

---

USER: [Waits for student to confirm L3 artifacts + window 2 still open]

---

ACTION: When the student responds:

1. ถ้าทั้ง 3 ข้อผ่าน + window 2 ยังเปิด, say "ดีครับ ของจาก Lesson 3 พร้อม ก่อนไปต่อ ขอย้ำ escape hatch ที่อยู่ด้านบน L4 = upgrade ไม่ใช่ gate ถ้าระหว่างทาง sub-agent ไม่ fire หรือ debug ยาว ข้าม L5 ได้ ไม่เสียของ ตอนนี้ไปดูปัญหาที่ skill ตัวเดียวเริ่มเจอ แล้วค่อยแตกเป็น sub-agent" Move to Step 1.

2. ถ้า SKILL.md หาย, do NOT proceed. ตอบ: "SKILL.md ของ Lesson 2-3 หายครับ Lesson 4 build ต่อจากตัวนี้โดยตรง กลับไปเก็บที่ Lesson 2 Step 2 ก่อน พิมพ์ `Start Lesson 2` ในหน้าต่างนี้" Wait.

3. ถ้า body ยังไม่มี step อ่าน sources/ (เหมือน Lesson 2 ตรงๆ ไม่มี Lesson 3 update), ตอบ: "Lesson 3 ยังไม่ปิดครับ /brief v3 ใน Lesson 4 พึ่งพา earnings transcript ที่ต่อใน Lesson 3 กลับไปเก็บที่ Lesson 3 ก่อน พิมพ์ `Start Lesson 3` ในหน้าต่างนี้" Wait.

4. ถ้า output ครบ 6 sections แต่ Latest earnings ยังออกแบบ Lesson 2 (Claude แต่งจาก memory ไม่อิง transcript), ถาม student: "Lesson 3 ต่อ transcript แล้วแต่ skill ไม่ได้ใช้ใช่ไหม ลอง paste ใน หน้าต่าง 2: 'รัน /brief <TICKER> อีกที Latest earnings section ต้องอิงจาก transcript ใน sources/<TICKER>/ ห้ามแต่งจาก training memory' ถ้ายังไม่ work บอกผม จะส่งกลับ Lesson 3 ให้ tighten ก่อน" Wait.

5. ถ้า window 2 ปิดไปแล้ว, ขอให้เปิด Claude Code ที่ folder `my-first-project` ใหม่ก่อนต่อ

---

## Step 1: ทำไม skill ตัวเดียวเริ่มไม่พอ

ก่อน paste อะไรเข้าไป, เราต้องเห็นปัญหาด้วยตาก่อน ไม่งั้นก็ "ใช้ sub-agent เพราะใครๆ ก็ใช้" แบบสุ่ม

ลองนึกถึง skill `company-brief` ของคุณตอนนี้ มันบอก Claude ตัวเดียวให้ทำ:

1. อ่าน CLAUDE.md voice section
2. อ่าน external research source
3. เขียน Company snapshot
4. เขียน Fundamentals signal
5. เขียน Latest earnings (อิง earnings transcript)
6. เขียน Bull/Bear case
7. เขียน Kill conditions
8. เขียน What to ask
9. ใส่ voice ทุกที่
10. Cite source ทุกที่
11. Format markdown 6 sections
12. Save ไฟล์ + show in chat

12 อย่างในรอบ context เดียว Claude ฉลาด แต่ attention มี budget. งานหลังๆ มัน compete กับงานก่อนหน้าเพื่อ slot ในหัว

Paint เรียกอาการนี้ว่า "งูกินหางตัวเอง" Context เริ่มเต็ม Claude ต้องเลือกทิ้งบางอย่าง: บางทีมันลด detail ของ Kill conditions, บางทีมันลืม voice ของคุณกลับเป็น analyst-generic, บางทีมัน skip cite source ในบาง bullet

วิธีแก้ที่ใช้ในงานจริงของ Paint: แตกออกเป็น **sub-agent**. ตัวเล็ก 3 ตัว ทำงานขนาน, แต่ละตัวมี context สะอาด focus งานเดียว

Analogy: ถ้าคุณเปิดร้านอาหาร, สั่งโต๊ะหนึ่งโต๊ะ เมนู 12 จาน คนเดียวทำคนเดียว 12 จาน, อาหารจานหลังๆ จะ rush. แต่ถ้าครัวมี 3 คน, คนหนึ่งทำเรียกน้ำย่อย (3 จาน), คนสองทำจานหลัก (6 จาน), คนสามทำของหวาน (3 จาน) ทำพร้อมกัน, แต่ละคน attention เต็มกับ section ตัวเอง เร็วกว่า + จานสะอาดกว่า

Sub-agent ใน Claude Code คือพ่อครัวเสริม

สิ่งสำคัญที่ต้องรู้ก่อน: 3 sub-agent ไม่คุยกัน แต่ละคน start ด้วย context ใหม่สะอาด ไม่รู้ว่าอีก 2 คนเจออะไร fundamentals agent ไม่เห็น transcript ที่ earnings agent อ่าน earnings agent ไม่เห็น 10-K main Claude รับผลทั้งหมดตอนสุดท้ายแล้วเอามา integrate เอง นี่คือ feature ไม่ใช่ bug: isolation = แต่ละคน focus เต็มที่ไม่ถูก distract

**3 sub-agent ที่ Lesson 4 จะ dispatch (แต่ละคนมี source เฉพาะของตัวเอง):**

| Agent | Source ที่อ่าน | งาน | Output |
|---|---|---|---|
| **fundamentals** | `sources/<TICKER>/10-k-*.md` (annual report) | business segments, revenue mix, margin structure, capital allocation | section 1+2 ของ brief |
| **earnings** | `sources/<TICKER>/q*-call.md` (earnings transcript จาก L3) | latest quarter numbers, guidance, management commentary | section 3 ของ brief (Latest earnings) |
| **news-sentiment** | WebSearch tool ของ Claude Code | last 7d news, analyst upgrades/downgrades, catalysts, headline impact | input ให้ Bull/Bear |

main Claude ยังเป็น orchestrator: รับผลทั้ง 3 มาร้อยเรียง ใส่เสียง เขียน Bull/Bear + Kill conditions + What to ask save ไฟล์

(ใน Step 2.5 เราจะให้คุณ download 10-K สำหรับ fundamentals agent ก่อนเพราะ L3 ได้แค่ earnings transcript)

---

STOP: เข้าใจไหมครับ ถ้ายังงงตรงไหนถามได้เลยนะ

---

USER: [Waits for student to confirm understanding or ask clarifying questions]

---

ACTION: When the student responds:

1. ถ้าเขาตอบ "ok" หรืออะไรในเชิงเข้าใจ, say "ดี ไปดูเครื่องมือสำหรับ dispatch sub-agent ก่อน paste ของ" Move to Step 2.

2. ถ้าถาม "แล้วทำไมไม่ใช้ Claude opus แทนแก้ context ใหญ่เลย?", ตอบ: "เพราะ context isolation สำคัญกว่า model size. ตัวเดียวต่อให้ใหญ่แค่ไหน ก็ยังต้อง juggle หลายงานในรอบเดียว, dimension ปนกัน 3 sub-agent คนละ context, fundamentals ไม่เห็น news, news ไม่เห็น sentiment, แต่ละคน focus ของตัวเอง ขนาด model ไม่ช่วยถ้า problem คือ context contamination."

3. ถ้าถาม "3 sub-agent คุยกันไหม?", ตอบ honest: "ไม่ นี่คือจุดสำคัญที่จะรู้สึกได้ใน Step 5 แต่ละ sub-agent ทำงานในของตัวเอง ส่งผลกลับ orchestrator ตอนจบ ถ้า fundamentals agent เจอ red flag (เช่น margin ตกใน 10-K) earnings agent ไม่รู้ sentiment agent ก็ไม่รู้ จนกว่า main Claude จะเอามาเทียบ นี่คือ feature ไม่ใช่ bug, isolation = clean attention แต่ก็แปลว่า main Claude ต้อง integrate"

4. ถ้าถาม "แล้ว cost จะเพิ่มไหม รัน 3 ตัวขนาน?", ตอบ: "เพิ่มแน่นอน แต่ละ sub-agent ใช้ token ของตัวเอง ใน Lesson 3 เรา intro `/context` แล้ว ถ้าใครจำได้, ใช้เช็คได้หลังรัน /brief v3 ดู usage. trade-off คือ output แน่นกว่า + เร็วกว่า แลก cost token เพิ่ม งานที่ output สำคัญมาก (research brief ก่อนกดซื้อหุ้น) คุ้มใช้ งานเร็วๆ ทั่วไป อาจไม่จำเป็น"

---

## Step 2: เครื่องมือ dispatch sub-agent (Agent / Task tool)

ก่อน paste ของ, **ผมขอ honest ตรงนี้แรงๆ:**

Claude Code มีเครื่องมือสำหรับ dispatch sub-agent ผมเห็นในเอกสารและในของของผมเองว่าเรียกว่า **Agent tool** หรือ **Task tool** (บาง version เรียก 1 ชื่อ บาง version เรียกอีกชื่อ บาง version มีทั้งคู่) เราจะบอก claude ไปเลยตรงๆ ว่าให้มี sub-agent ตัวที่ 1 ทำ X, ตัวที่ 2 ทำ Y, ตัวที่ 3 ทำ Z, แล้วรอผลทั้งหมด มารวมกันอีกที

**สิ่งที่ผมไม่กล้ายืนยัน:**

- ชื่อ tool ที่แน่นอนใน version ของคุณ (Agent หรือ Task)
- Syntax เป๊ะๆ ตอน skill body เรียก tool นั้น
- 3 ตัวรันขนานจริงไหม หรือ Claude Code อาจรันทีละตัว (depend ใน version)
- Plan mode ขอ approve กี่รอบ (อาจ 1 รอบรวม, อาจ 3 รอบแยก, อาจมากกว่า)

**วิธีที่ Lesson นี้จะเดิน:**

1. เรา paste skill body ที่บอก Claude เป็นภาษาคนปกติว่า "dispatch 3 sub-agent ขนาน, ใช้เครื่องมือที่ Claude Code มี (Agent หรือ Task), ถ้าไม่มีใน version ก็ fallback เป็น sequential". ปล่อยให้ Claude หน้าต่าง 2 เลือก mechanism ที่ถูกต้องของ version ตัวเอง

2. รัน demo. ถ้า Claude หน้าต่าง 2 spawn 3 ตัวจริง, เห็นได้จาก: (a) มี 3 plan-mode approvals ขอตามลำดับ หรือ approve ครั้งเดียวที่บอกว่ามี 3 task, (b) chat โชว์ "delegating to fundamentals agent..." หรือคำคล้ายๆ, (c) timing เร็วกว่า v2 visibly. ถ้า fallback sequential ก็ยัง work, แค่ไม่ได้ benefit เร็ว

3. ถ้า mechanism ของ version คุณไม่ตรงกับที่ผม draft, **ถาม Claude ในหน้าต่าง 2 ตรงๆ** ว่า "Claude Code version นี้ dispatch sub-agent ยังไง ใช้ tool ชื่ออะไร syntax เป็นยังไง" Claude จะตอบให้ตาม version ปัจจุบัน, แล้วเราแก้ skill body ตามนั้น

นี่คือ honest scope flag, ผมไม่ assert tool name. เรา test by demo.

---

STOP: รับ honest scope flag นี้ไหม? ถ้า ok พิมพ์ "ok" ไปต่อ ถ้ารู้สึกอยากชัวร์ก่อน ผมแนะนำให้ถาม Claude หน้าต่าง 2 ก่อน paste:

```
Claude Code version นี้ dispatch sub-agent ยังไง? ใช้ tool ชื่ออะไร (Agent / Task / อื่นๆ) syntax เป็นยังไง?
```

ผลที่ Claude หน้าต่าง 2 ตอบกลับมา จะช่วยให้เราปรับ skill body ตาม version จริง

---

USER: [Waits for student to confirm understanding of the scope flag, optionally with version-check info]

---

ACTION: When the student responds:

1. ถ้าตอบ "ok" เฉยๆ, say "ดี ไป update SKILL.md กัน, ของจะเดินถูกหรือผิดเรารู้ตอน Step 5" Move to Step 3.

2. ถ้าเขาถาม Claude หน้าต่าง 2 ก่อนแล้วเอาคำตอบมาบอก, ดูคำตอบ:
   - ถ้า Claude หน้าต่าง 2 ระบุ tool name ชัด (Agent / Task / อื่น), จำชื่อนั้นไว้ ใน Step 3 เราจะใส่ชื่อนั้นใน skill body แทน "Agent หรือ Task" generic.
   - ถ้า Claude หน้าต่าง 2 ตอบไม่ชัดหรือ "ไม่แน่ใจ", OK, ใช้ skill body แบบ generic ที่ผมเตรียมไว้ ปล่อย Claude เลือกเอง

3. ถ้าถาม "ทำไม Lesson 1 ไม่บอกเลยว่า Agent tool คืออะไร?", ตอบ: "เพราะ Lesson 1-3 ใช้ Claude ตัวเดียวก็พอ sub-agent เป็น tool ที่ specific ต้อง intro ตอนปัญหามันเรียก ตอนนี้คือตอนนั้น"

4. ถ้าถาม "ถ้า version ไม่มี sub-agent เลยล่ะ?", ตอบ: "เกิดยาก แต่ถ้าจริง skill body ที่เราจะ paste มี fallback บอก Claude ว่าถ้าไม่มี sub-agent ให้รันเป็น sequential แต่ section ละ chunk แยก ยังคุม context isolation บางส่วน ไม่ได้ benefit เร็ว แต่ได้ structural improvement อื่น และนี่คือเหตุผลที่ Lesson นี้ test by demo, demo บอกความจริง"

---

## Step 2.5: ดาวน์โหลด 10-K สำหรับ fundamentals agent

L3 ให้ earnings call transcript เรามาแล้ว แต่ fundamentals agent ของ L4 ต้องการ source ที่ลึกกว่า ครอบคลุมทั้งปี นั่นคือ **10-K** (annual report ที่บริษัท US-listed ทุกตัวต้อง file กับ SEC ปีละครั้ง)

10-K มี: business segments breakdown, revenue mix, ลูกค้าหลัก, risk factors, capital structure, MD&A (management's discussion and analysis) ของพวกนี้ไม่อยู่ใน earnings call transcript เพราะ transcript เน้นไตรมาสเดียว 10-K เน้นทั้งปี + structural

### 2.5.1 สร้างไฟล์ 10-K เปล่าก่อน (เหมือน L3 pattern)

ACTION: Hand the student this prompt to paste in **window 2**:

````text
สร้างไฟล์ sources/AAPL/10-k-fy2025.md (ใช้ FY ที่ตรงกับ 10-K ที่คุณกำลังจะหา เช่น 10-k-fy2024.md ถ้าหาเจอแค่นั้น) ด้วยเนื้อหาตามนี้:

---
ticker: AAPL
source_type: 10k_excerpt
fiscal_year: <ใส่ FY ที่กำลังจะหา เช่น FY2025>
source_url: <ใส่ทีหลังเมื่อหาได้>
---

# Apple 10-K FY<year> (excerpt)

(เนื้อหา 10-K จะใส่ใน step ถัดไป)

ทำเลย
````

---

STOP: บอกผม Claude สร้างไฟล์เปล่าให้แล้วใช่ไหม

---

USER: [Waits for student to confirm empty 10-K file created]

---

### 2.5.2 หา 10-K จริง

มี 2 ทาง student เลือก 1 ทางก็ได้:

**ทาง A: Apple IR page (UI friendly)**

1. เปิด browser ไปที่ `investor.apple.com`
2. คลิก "Investor Relations" → "SEC Filings" หรือ "Annual Reports"
3. หา 10-K ของปีล่าสุดที่ออกแล้ว (ปกติออก ~Q4 calendar) คลิก download PDF

**ทาง B: SEC EDGAR (universal, ใช้ได้กับหุ้นทุกตัว ไม่ใช่แค่ Apple)**

1. เปิด browser ไปที่ `https://www.sec.gov/edgar/search/`
2. ใน search box พิมพ์ `AAPL` (หรือ ticker คุณ) เลือก company
3. ในหน้า filings list filter "10-K" คลิก filing ล่าสุด
4. คลิก link "10-K" ใน documents list, เปิด HTML เต็ม

**ขอ honest:** 10-K เต็มมัน 100-200 หน้า ใหญ่มาก ใส่ทั้งก้อนใน Claude จะกิน token เกิน 100K tokens เปลือง คุณไม่ต้องใส่ทั้งก้อน เลือก section สำคัญ:

- **Item 1: Business** (ประมาณ 5-15 หน้า) บริษัททำอะไร, segment, customers, competition
- **Item 1A: Risk Factors** (ประมาณ 10-30 หน้า) risk ที่ disclosed
- **Item 7: MD&A** (ประมาณ 15-30 หน้า) segment results, revenue trend, margin commentary

Copy 2-3 section นี้รวมๆ ประมาณ 3000-5000 คำพอ (ตัด table ใหญ่ๆ ออกได้ถ้ายาว)

### 2.5.3 paste 10-K excerpt ลงไฟล์

ACTION: Hand the student this prompt to paste in **window 2**:

````text
เปิดไฟล์ sources/AAPL/10-k-fy2025.md ที่เพิ่งสร้าง

1. แทนที่ source_url ใน frontmatter ด้วย URL ที่ผมจะวางข้างล่าง
2. แทนที่บรรทัด "(เนื้อหา 10-K จะใส่ใน step ถัดไป)" ด้วย excerpt ที่ผมจะวาง

source_url: <วาง URL Apple IR หรือ SEC EDGAR ตรงนี้>

10-K excerpt (Item 1 + Item 1A + Item 7 MD&A):
<วาง excerpt text ตรงนี้>

ทำเลย แล้ว show first 2 lines of body content
````

---

STOP: บอกผม:
1. ไฟล์ `sources/AAPL/10-k-*.md` มี content จริงไหม
2. content ครอบคลุม section ไหนบ้าง (Item 1 / 1A / 7?)

---

USER: [Waits for student to confirm 10-K excerpt loaded]

---

ACTION: When confirmed (real or fallback), say "ดี source 2 ตัวพร้อม fundamentals จะอ่าน 10-K, earnings จะอ่าน transcript จาก L3 ส่วน news+sentiment ใช้ websearch ไม่ต้อง paste source" Move to Step 3.

If student stuck (PDF locked, EDGAR slow, etc.), allow placeholder fallback: paste in window 2 a prompt that fills the file with placeholder text + note "ของจริงยังไม่ใส่ ต้องกลับมา replace" Same pattern as L3 fallback.

---

## Step 3: นิยาม sub-agent 3 ตัวเป็นไฟล์ของตัวเอง แล้ว update SKILL.md ให้เรียก by name

ตอนนี้เราจะทำ 2 อย่างในรอบเดียว:

1. สร้างไฟล์ใน `.claude/agents/` 3 ตัว แต่ละไฟล์เป็น **นิยามของ sub-agent ตัวนั้น** (frontmatter `name` + `description` + body ที่บอกว่า agent ตัวนี้รับงานอะไร อ่าน source ไหน output หน้าตาแบบไหน) ของพวกนี้คือ "พนักงาน" ที่อยู่ใน folder รอ orchestrator เรียกใช้
2. update body ของ `.claude/skills/company-brief/SKILL.md` (ของเดิมไม่ลบ) แต่ปรับ Steps section ให้ **เรียก sub-agent by name** แทนที่จะ inline brief ทั้งก้อนใน skill เหมือนเดิม

ทำไมแยก: ถ้าเรา inline brief ใน skill หมดเลย ตัว `.claude/agents/*.md` กลายเป็นไฟล์ตกแต่ง skill ไม่ได้อ่านอยู่ดี แต่ถ้าเรานิยาม agent เป็นไฟล์เอง skill เรียก by name agent definition ก็คือ source-of-truth ของแต่ละพนักงาน ครั้งหน้าจะแก้ brief ของ agent ตัวไหน คุณแก้ที่ไฟล์ของมันเอง ไม่ต้องไปหาใน skill body อีก

อีกอย่างก่อน paste คุณจะเห็นคำว่า **frontmatter** ตอนคุย flow รอบนี้ frontmatter (เหมือน metadata block หรือ header rows ที่อยู่บนสุดของไฟล์ Excel ฟลูเอนต์ก็จะคุ้น) คือก้อน key-value ที่อยู่บนสุดของไฟล์ markdown บอก Claude ว่าไฟล์นี้คืออะไร เส้น `---` 3 ขีดด้านบนกับด้านล่างคือขอบของก้อนนี้ บอก Claude ว่า metadata จบตรงไหน body เริ่มตรงไหน ไม่ต้องท่องอะไร แค่รู้ว่าก้อนระหว่าง `---` 2 อันคือ frontmatter ก็พอ

**ก่อน paste บล็อคข้างล่าง อ่านบรรทัดนี้นะครับ:** ครั้งนี้คุณจะ paste prompt สั้นๆ ก้อนเดียว แล้ว Claude หน้าต่าง 2 จะ **เริ่มสัมภาษณ์คุณ** ผ่าน chat ทีละ agent (รวม 3 รอบ) แต่ละรอบจะบอกว่า agent ตัวนี้ทำอะไร อ่าน source อะไร แล้ว **ถามคุณว่าอยากตั้งชื่อ agent ตัวนี้ว่าอะไร** ชื่อตั้งได้ตามใจ จะใช้ `fundamentals` / `earnings` / `sentiment` (descriptive ตรงๆ) หรือชื่อคนอย่าง ไฟ/น้ำ/ลม ก็ได้ ของผมเองที่ ClaudyOS ทีม agent เป็นชื่อคน (Minnie ไอเดีย Reese research Rae เขียน Chris critic Vera ตัวเลข Newy email Nick paper portfolio) เพราะตอน routing งานพิมพ์ "ส่งให้ Reese" มัน natural กว่า "spawn research subagent"

ส่วน folder path **ห้ามเปลี่ยน** Claude Code จะหา named subagent ใน `.claude/agents/` เท่านั้น (ของผมที่เก็บใน `Team/` คือไฟล์ profile ที่อ่านเป็น context ของผม ไม่ใช่ runtime dispatch คนละ slot กัน) Lesson นี้ทุกไฟล์ agent ต้องอยู่ใน `.claude/agents/` ของ project ชื่อตั้งตามใจ path ห้ามแตะ

ACTION: Hand the student this short prompt to paste in **window 2** (folder `my-first-project`) Tell them: "ก็อปบล็อคข้างล่าง paste ใน chat ของหน้าต่าง 2 ถ้าหน้าต่าง 2 อยู่ใน Plan mode Claude จะ propose แผนก่อน approve ไปเรื่อยๆ ตามที่มันถาม ถ้า Auto mode Claude จะเริ่มสัมภาษณ์เลย"

````text
ผมอยากให้คุณช่วยสร้างทีม sub-agent 3 ตัวใน folder .claude/agents/ ของ project นี้ แต่ละ agent มี role เฉพาะที่ผมจะ fix ให้ ส่วนชื่อ + คำอธิบาย job ขอให้สัมภาษณ์ผมทีละตัว ลำดับ flow:

agent 1 = อ่าน 10-K excerpt ที่ sources/<TICKER>/10-k-*.md อย่างเดียว return Company snapshot + Fundamentals signal
agent 2 = อ่าน earnings call transcript ที่ sources/<TICKER>/q*-call.md อย่างเดียว (transcript จาก Lesson 3) return ตัวเลขไตรมาสล่าสุด + guidance + management commentary
agent 3 = ใช้ WebSearch tool อย่างเดียว return news 7 วันล่าสุด + analyst moves + catalysts ห้ามทำนายตลาด

flow ที่อยากให้เดิน:
1. ทีละ agent (รอบที่ 1, 2, 3 ตามลำดับด้านบน) บอกผมว่า agent ตัวนี้ role ตรงๆ คืออะไร อ่าน source ไหน return อะไรกลับ
2. ถามผมว่า "อยากตั้งชื่อ agent ตัวนี้ว่าอะไร" รอผมตอบ
3. repeat job description ตามชื่อที่ผมตั้ง ถามผม confirm หรืออยาก tweak description นิดหน่อย
4. รอผมยืนยันก่อนไป agent ถัดไป ห้าม batch ทั้ง 3 รอบเป็น question เดียว

หลังสัมภาษณ์ครบ 3 รอบ:
(A) สร้างไฟล์ใน .claude/agents/ ตามชื่อที่ผมตั้ง 3 ไฟล์ แต่ละไฟล์ frontmatter ต้องมี name (= ชื่อที่ผมตั้ง) + description (1 ประโยคบอก role) body มี Source ที่อ่าน + Output ที่ return + กฎเด็ดขาด

กฎเด็ดขาด agent ทุกตัว: ห้ามแต่งจาก training memory, ถ้า source หายให้ say so honest, ห้ามใส่ verbatim quote ใน blockquote
กฎเพิ่มเติม agent 3 (news-sentiment) เท่านั้น: ห้ามทำนายตลาด ห้าม "ตลาดยังไม่ price in" รายงานเฉพาะ observable signals (headline, analyst move, catalyst date)

agent return output ผ่าน dispatch tool result ตรงให้ orchestrator ไม่ต้อง save ไฟล์ scratch ก่อน folder sources/ เก็บเฉพาะ source input (10-K excerpt, transcript) ห้ามเขียน agent output ลงไป
(B) เปิด .claude/skills/company-brief/SKILL.md แก้เฉพาะ Steps section ส่วนอื่น (frontmatter, Output format, Voice rules, When unsure) ห้ามแตะ Steps section ใหม่ต้องเรียก agent 3 ตัว by name (ใช้ชื่อที่ผมตั้ง) ใช้ syntax ที่ Claude Code version นี้รองรับสำหรับเรียก named subagent ถ้าไม่รองรับ parallel ให้ sequential แต่ context isolated main Claude integrate output ทั้ง 3 เป็น brief 6 sections ตาม Output format เดิม

ปิดด้วยรายงานสั้นๆ: 3 ชื่อที่ผมตั้ง + 1 บรรทัด role ของแต่ละตัว ผมจะเอาไปบอก Claude หน้าต่าง 1

เริ่มที่ agent 1 ก่อนเลย
````

---

STOP: ตอบกลับมาในหน้าต่าง 1 ว่า:

1. **3 ชื่อ agent ที่คุณตั้ง** ตอนสัมภาษณ์ (ไม่ต้องเป็น fundamentals/earnings/sentiment ชื่ออะไรก็ได้ตามที่คุณตอบ Claude หน้าต่าง 2)
2. **ไฟล์ใน `.claude/agents/` ครบ 3 ตัว** ตามชื่อด้านบนใช่ไหม แต่ละไฟล์มี frontmatter `name:` + `description:` + body (Source ที่อ่าน + Output ที่ return + กฎเด็ดขาด) ครบไหม
3. **SKILL.md update แล้ว** Steps section ใหม่เรียก agent ทั้ง 3 by name (ตามชื่อที่คุณตั้ง) ไม่ใช่ inline brief ก้อนใหญ่ใช่ไหม
4. **ส่วนอื่นของ SKILL.md** (frontmatter, "Output format", "Voice rules", "When unsure") ยังอยู่ครบ ไม่หายใช่ไหม

---

USER: [Waits for student to report the 3 chosen names + confirm agent files created + confirm SKILL.md updated without losing other sections]

---

ACTION: When the student responds:

1. **Full pass:** ถ้าได้ 3 ชื่อ + agent files ครบ + SKILL.md Steps เรียก by name ตามชื่อที่ตั้ง + ส่วนอื่นของ SKILL.md ครบ, say "ดี ทีม [ชื่อ 1] + [ชื่อ 2] + [ชื่อ 3] พร้อมแล้ว ลอง dispatch ของจริงกัน" (ใช้ชื่อที่ student ตั้ง echo กลับ ให้รู้สึกว่าเป็นทีมของเขา) Move to Step 4.

2. **Plan-mode interrupt mid-interview:** ถ้า Plan mode แทรกระหว่างสัมภาษณ์ (เช่น Claude propose plan ตั้งแต่ตอบชื่อ agent 1 ยังไม่ทันถึง agent 2 หรือ propose plan รวมก่อนเริ่มถาม) บอก student: "หน้าต่าง 2 อยู่ Plan mode approve ไปทีละขั้นที่ Claude propose ทั้งสัมภาษณ์ + สร้างไฟล์ + edit SKILL.md อาจขอ approve แยกเป็นรอบๆ กดไปเรื่อยๆ ถ้า plan ดูตรงกับ prompt ที่ paste ถ้าไหนแปลก (เช่น Claude propose จะ overwrite SKILL.md ทั้งไฟล์) reject แล้ว paste reminder: 'แก้แค่ Steps section ของ SKILL.md ห้ามแตะ frontmatter / Output format / Voice rules / When unsure'" Wait for interview + file creation to finish.

3. **Claude proposed roles แต่ skip การถามชื่อ:** ถ้า student บอก "Claude อธิบาย role 3 ตัวแล้วสร้างไฟล์เลย ไม่ได้ถามชื่อ" หรือ "ตั้งชื่อให้เองว่า fundamentals/earnings/sentiment" paste กลับใน หน้าต่าง 2: "เพิ่งสร้างไฟล์ใน .claude/agents/ แต่ใน prompt ผมขอให้สัมภาษณ์ทีละ agent ถามชื่อก่อนสร้าง รบกวน rollback ไฟล์ที่เพิ่งสร้าง แล้วเริ่มสัมภาษณ์ใหม่ตามลำดับ agent 1, 2, 3 ถามชื่อ + confirm description ทีละตัวก่อนสร้างไฟล์" Wait for re-interview.

3b. **Claude batched ทั้ง 3 รอบเป็น question เดียว (แต่ยังไม่ได้สร้างไฟล์):** ถ้า student บอกว่า "Claude อธิบาย role ของ agent 1, 2, 3 จบในรอบเดียว แล้วถามชื่อ 3 ตัวพร้อมกัน ยังไม่สร้างไฟล์" ตอบ student: "ถ้า Claude ถามชื่อทั้ง 3 ตัวพร้อมกัน (อธิบาย role 3 ตัวจบ + ถามชื่อ 3 ตัวในคำถามเดียว) แต่ยังไม่ได้สร้างไฟล์ ตอบ 3 ชื่อพร้อมกันได้เลย Claude จะสร้างไฟล์ตามนั้น ผลลัพธ์ตัวเดียวกัน แค่ไม่ได้ interactive step-by-step ตอบไปเลยครับ" Wait for the student to send the 3 names back to Window 2 + agent files + SKILL.md update to complete.

4. **Claude สร้าง agent files แต่ skip SKILL.md update:** ถ้า student บอก "agent files ใน .claude/agents/ มีครบ 3 ตัวแล้ว แต่ SKILL.md ยังเหมือนเดิม Steps section ยังไม่ได้เรียก agent ใหม่" paste ในหน้าต่าง 2: "เพิ่งสร้าง agent files ใน .claude/agents/ ครบแล้ว ขอต่อให้จบ flow เปิด .claude/skills/company-brief/SKILL.md แก้แค่ Steps section ให้เรียก 3 agent by name (ชื่อตามที่ตั้งใน .claude/agents/ ตอนสัมภาษณ์) ใช้ syntax สำหรับ named subagent ที่ Claude Code version นี้รองรับ ส่วน frontmatter / Output format / Voice rules / When unsure ของ SKILL.md ห้ามแตะ" Wait for SKILL.md update.

5. **Claude diverged จาก pre-fixed role** (เช่น proposed ให้ agent 1 อ่านทั้ง 10-K AND earnings transcript หรือ agent 3 ออก buy/sell recommendation): paste ใน หน้าต่าง 2: "agent role ที่ propose ไม่ตรงกับ prompt ขอ stick ตาม source mapping ที่ผม fix ไว้: agent 1 อ่าน 10-K excerpt เท่านั้น agent 2 อ่าน earnings transcript เท่านั้น agent 3 ใช้ WebSearch เท่านั้น + ห้ามทำนายตลาด/recommend buy-sell แต่ละ agent ทำหน้าที่เดียวเพื่อ context isolation ถ้าผมยังไม่ได้ตั้งชื่อตัวไหน เริ่มสัมภาษณ์ใหม่ตามลำดับ" Wait for re-interview.

6. **Claude เผลอลบส่วนอื่นของ SKILL.md** (Output format หาย Voice rules หาย): paste ในหน้าต่าง 2: "เพิ่ง edit SKILL.md ผิด restore ส่วน 'Output format' + 'Voice rules' + 'When unsure' กลับมา (อ่านจากที่บันทึกไว้ตอน Lesson 2 หรือถาม Claude หน้าต่าง 1 ว่า 'Output format ของ SKILL.md company-brief ใน Lesson 2 หน้าตาเป็นยังไง') Steps section ใหม่ที่เรียก agent by name keep ไว้ แต่ส่วนอื่นกลับเป็นเดิม" Wait for fix.

7. **Agent files ขาด frontmatter หรือ `name:` ไม่ตรงกับที่ skill เรียก:** paste ในหน้าต่าง 2: "ไฟล์ใน .claude/agents/ ทุกตัวต้องมี frontmatter `name:` + `description:` ด้านบน body แล้วค่า `name:` ต้องตรงกับชื่อที่ SKILL.md Steps section เรียก ตรวจให้ตรง 2 ที่ ถ้าไม่ตรง แก้ทั้ง 2 ฝั่งให้ match" Wait for fix.

8. **Claude บ่นว่าไม่มี Task tool / Agent tool หรือเถียง syntax:** version specific paste ในหน้าต่าง 2: "OK ใช้ syntax สำหรับเรียก named subagent ที่ Claude Code version นี้รองรับ ใส่ใน Steps section ของ SKILL.md ตรงๆ ขอแค่ยังเรียก 3 agent by name ตามชื่อที่ผมตั้ง ไม่ใช่ inline brief ทั้งก้อน ของพวกนั้นอยู่ใน .claude/agents/<name>.md แล้ว" Wait for clean fix.

9. **Student อยาก rename agent หลังสัมภาษณ์เสร็จ:** OK ก็ได้ paste ในหน้าต่าง 2: "อยาก rename agent `<old-name>` เป็น `<new-name>` rename ไฟล์ .claude/agents/<old-name>.md เป็น .claude/agents/<new-name>.md อัพเดต `name:` ใน frontmatter ของไฟล์นั้นด้วย แล้ว update SKILL.md Steps section ทุกที่ที่อ้าง <old-name> เปลี่ยนเป็น <new-name>" Wait for rename to finish then continue.

10. **Student ถาม "ทำไม Claude ไม่ใส่ syntax เป๊ะๆ ใน SKILL.md?":** ตอบ: "เพราะผม (Paint) ไม่กล้า assert syntax เฉพาะ Claude Code version ของ skill body เขียน 'เรียก agent by name' + Claude resolve syntax จริงตอนรัน คือทาง robust ที่สุด ขอแค่ชื่อใน skill = ชื่อ `name:` ใน agent file 2 ที่ ก็พอ"

หลังทุก case ผ่าน + student ยืนยัน 3 ชื่อ + ของครบ Move to Step 4.

---

## Step 4: รัน /brief v3 (ครั้งแรกที่ใช้ sub-agent)

นี่คือ moment of truth. รัน /brief แล้วดูด้วยตาว่า sub-agent ทำงานจริงไหม

**ก่อน paste, ผมเตือนล่วงหน้า:**

- ถ้า Plan mode เปิดอยู่, จะมี approval หลายรอบ อาจ 1 รอบที่บอกแผนรวม, อาจ 3 รอบแยกตาม sub-agent, อาจมากกว่า **ไม่ต้องตกใจ approve ไปเรื่อยๆ ตามที่ Claude แสดง** ปกติ ทุกครั้งที่ Plan mode ขอ approve ปกติคือ Claude ขอเขียนไฟล์ 1 ตัว (agent 1 → agent 2 → agent 3 → SKILL.md update) approve ไปเรื่อยๆ ตามที่ขึ้นมา ไม่ใช่ error ไม่ใช่ retry แค่ progress ทีละไฟล์
- ที่บ่งชัดกว่าความเร็วคือ chat text ที่บอกว่ากำลัง spawn/delegate/dispatch (timing เร็วกว่า corroborate แต่อาจ subjective). ถ้าเห็น text นั้น คือ parallel ทำงานจริง
- ถ้า output มา 6 sections และ Latest earnings section อิง earnings transcript ชัด + Company snapshot/Fundamentals signal อิง 10-K ชัด, sub-agent ทำงานจริง
- ถ้า output มา 6 sections แต่เวลา feel เหมือน v2 (sequential), อาจ Claude fall back sequential ภายใน ไม่ fail, แค่ไม่ได้ benefit เร็ว

ACTION: Tell the student to do these in order:

1. ในหน้าต่าง 2 พิมพ์ `/brief AAPL` (ใช้ ticker เดิมที่ใช้ตั้งแต่ Lesson 1 เพื่อเทียบของจริง).
2. ถ้า Plan mode ขอ approve, **approve ทุกรอบที่ขึ้นมา** (อาจ 1 อาจ 3 อาจมากกว่า, ปกติ).
3. รอจนเสร็จ ดู chat ว่า:
   - มีข้อความ "spawning..." / "delegating..." / "task..." หรือคำคล้ายๆ ที่บ่งว่า sub-agent ถูก dispatch ไหม?
   - Output 6 sections ครบไหม?
   - เวลารวม feel เร็วกว่า v2 ไหม (subjective ก็ OK)?
4. เปิดไฟล์ `briefs/AAPL.md` ดูเทียบกับครั้งก่อน

---

STOP: บอกผม 5 อย่าง:

1. **Plan-mode approvals**: หน้าต่าง 2 ขอ approve กี่รอบ? (1, 3, มากกว่า, หรือ Auto mode รันเลย?)
2. **Sub-agent signal**: chat โชว์คำที่บ่งว่ามีการ delegate (spawning, task, delegating, agent) ไหม?
3. **Section count**: brief output ครบ 6 sections ไหม?
4. **Speed**: feel เร็วกว่า v2 (Lesson 3) ไหม? (subjective OK)
5. **Latest earnings quality**: section 3 อิง earnings transcript จาก L3 ไม่แต่งจาก memory ใช่ไหม + section 1+2 อิง 10-K excerpt จาก L4 Step 2.5 ใช่ไหม?

---

USER: [Waits for student to report v3 brief output, plan-mode approval count, sub-agent signal]

---

ACTION: When the student responds:

1. **3+ plan-mode approvals + delegate signal + 6 sections + faster + sections อิง source จริง**: full pass say "ผ่าน sub-agent ทำงานจริง 3 ตัวขนาน มีอยู่ของ /brief v3 ใน folder คุณเองแล้ว" Move to Step 5.

2. **1 plan-mode approval + delegate signal + 6 sections + faster + sections อิง source จริง**: ก็ pass version นี้ batch approval รวม say "version ของคุณ batch plan-approval ให้รวมเดียว ไม่ผิดอะไร sub-agent ก็ยัง dispatch จริง" Move to Step 5.

3. **No delegate signal + 6 sections + ไม่ feel เร็ว**: Claude อาจ fall back sequential. ตอบ: "อาจเป็น 1 ใน 2 อย่าง: (a) version ไม่รองรับ parallel dispatch จริงเลย fall back sequential, หรือ (b) Claude อ่าน skill body แล้วเลือก path sequential เพราะคิดว่าเร็วกว่า ลอง paste ใน หน้าต่าง 2: 'เพิ่งรัน /brief AAPL, ตอนนั้น dispatch sub-agent หรือเปล่า ถ้าใช่ใช้ tool ชื่ออะไร ถ้าไม่ใช่ทำไม' Claude จะ explain ให้ ผลลัพธ์ structural ยังดีกว่า v2 แม้ไม่ได้ parallel benefit. ถ้า Claude ตอบว่า fall back, ลอง paste: 'รัน /brief AAPL อีกที force dispatch sub-agent parallel ตามที่ SKILL.md ระบุ ห้าม sequential.' รอบสองอาจ trigger ได้" Then Move to Step 5 anyway, baseline ใช้ได้

4. **Output แค่ 4-5 sections, ขาดบาง**: SKILL.md Steps ใหม่ทำให้ Claude สับสน ตอบ: "Steps ใหม่อาจปนกับ Output format เดิม paste ใน หน้าต่าง 2: 'เพิ่งรัน /brief AAPL ออกแค่ N sections, SKILL.md Output format บอกครบ 6 sections ห้าม skip. รัน /brief AAPL อีกครั้ง ครั้งนี้ครบ 6 sections.' รอบสองมัก fix." Re-run.

5. **Latest earnings ยังแต่งจาก memory** (ตัวเลข specific ที่ transcript ของ Lesson 3 ไม่น่ามี), ตอบ: "earnings sub-agent ลืม source paste: 'รัน /brief AAPL อีกครั้ง earnings sub-agent ต้องอิง earnings transcript ใน sources/AAPL/q*-call.md เท่านั้น ถ้า transcript ไม่มี data ที่ user ถามให้ say so honest ห้ามแต่ง' Re-run ถ้ายังแต่งหลังรอบสอง อาจ source ของ Lesson 3 ไม่ถูก connect ให้ sub-agent กลับไปยืนยัน Lesson 3 source connection ก่อน"

6. **Plan mode ถามเยอะมากจน student fatigue** (5+ approvals กดจนเบื่อ), บอก: "นี่คือ stumble ที่ผมเตือนไว้ Step 4. 3 sub-agent + main Claude orchestrator + file write = หลาย action. Plan mode ปลอดภัยที่สุดแต่กดเยอะ หลังจากครั้งนี้ ถ้าคุ้น flow แล้ว ลองสลับ Auto mode ตอนรัน /brief อีก ลด approval. Plan mode ยังเหมาะตอนทำของใหม่ Auto เหมาะตอน routine." Continue.

7. **Sub-agent ตัวใดตัวหนึ่ง fail (เช่น earnings agent error เพราะ transcript file หาย, fundamentals กับ sentiment ทำเสร็จ)**: classic race condition ตอบ: "นี่คือ stumble ที่ผมจะพูดใน Common stumbles main Claude ควร integrate partial output ห้าม fabricate paste: 'sub-agent earnings fail หรือ partial ใน brief Latest earnings section ระบุว่า transcript ไม่ถึง / sub-agent ไม่สำเร็จ ห้ามแต่ง bullet มาแทน ส่วน fundamentals + sentiment ใช้ของจริงตามที่ได้' Re-show file acceptable outcome" Then Move to Step 5.

---

## Step 5: เช็คความเรียบร้อย + ปิดท้าย

(step นี้ทำในหน้าต่าง 1 ไม่ต้อง paste อะไรในหน้าต่าง 2)

ก่อนปิด Lesson 4 เช็ค checklist:

1. `.claude/skills/company-brief/SKILL.md` Steps section update เป็น **dispatch by name** (เรียก agent 3 ตัวจาก `.claude/agents/` by name ไม่ใช่ inline brief ก้อนใหญ่ใน skill) + frontmatter + Output format + Voice rules + When unsure ของ SKILL.md ยังอยู่ครบ
2. ไฟล์ใน `.claude/agents/` มี 3 ตัว ตามชื่อที่คุณตั้งตอนสัมภาษณ์ใน Step 3 แต่ละไฟล์มี frontmatter (`name` + `description`) + body ที่บอก source/output/กฎของ agent นั้น ค่า `name:` ใน frontmatter ตรงกับชื่อที่ SKILL.md Steps section เรียก (2 ที่ match กัน)
3. รัน `/brief <TICKER>` v3 ครบ 6 sections + มี signal ว่า sub-agent ทำงาน (delegate message ที่อ้างชื่อ agent หรือ Claude อธิบายว่าใช้ syntax อะไรเรียก named subagent) ถ้าไม่เห็น signal ชัด แต่ output 6 sections อิง source จริง ให้ข้ามไป Step 5 โดยไม่ต้อง force re-run
4. Latest earnings section อิง earnings transcript จาก L3 + Company snapshot/Fundamentals signal อิง 10-K จาก L4 Step 2.5 (ไม่แต่งจาก memory)
5. ไฟล์ `sources/<TICKER>/10-k-*.md` มีอยู่ (จาก Step 2.5)
6. หน้าต่าง 2 (folder `my-first-project`) ยังเปิด, Lesson 5 ใช้ต่อ

**หรือถ้า sub-agent ไม่ work ใน version คุณ และคุณเลือกข้าม L4 ไปก่อน** ของจาก L3 ก็พอแล้วสำหรับ L5 กลับมาทำ L4 ตอนหลังได้ พิมพ์ `Start Lesson 5` ได้เลยถ้าตัดสินใจข้าม

---

STOP: ทั้ง 6 ข้อข้างบน ผ่านครบไหม ตอบในหน้าต่าง 1 (หน้าต่างนี้)

---

USER: [Waits for student final checklist confirmation]

---

ACTION: When the student responds:

1. ถ้าผ่าน 6/6, say "ครบ Lesson 4 ผ่าน /brief v3 ของคุณตอนนี้แตกเป็น 3 sub-agent ขนาน structurally แน่นกว่าทุก version ก่อน" Move to "What just happened" + Common Stumbles + handoff

2. ถ้าผ่าน 5/6 และข้อที่ขาดคือข้อ 3 ส่วน sub-agent signal (output 6 sections ครบ แต่ delegate signal ไม่ชัด) แต่ structurally output ดีกว่า v2 visibly, partial pass ได้ "version ของคุณอาจ batch approval หรือไม่ verbose เรื่อง dispatch แต่ output บอกของจริง ใช้ได้" Move on

3. ถ้าผ่าน 4/6 หรือต่ำกว่า, focus แก้เฉพาะข้อที่ค้างก่อน ถ้าข้อ 1 (SKILL.md เรียก agent by name) หรือข้อ 2 (3 agent files มี frontmatter) หรือข้อ 3 (6 sections) ขาด = block, ห้ามขึ้น Lesson 5

4. ถ้า student บอก "Plan mode กด approve 7 รอบเหนื่อยมาก", acknowledge: "นั่นคือ trade-off ของ Plan mode + sub-agent คุ้มเฉพาะตอนทำของใหม่ ครั้งหน้ารัน /brief สลับ Auto mode ก่อน approval ลด"

---

## What just happened (สรุปสั้นๆ)

ใน 30-40 นาทีที่ผ่านมา คุณ:

1. เห็นปัญหาที่ skill ตัวเดียวเริ่มเจอ (งูกินหางตัวเอง, Claude ตัวเดียว juggle 12 อย่างใน context เดียว, attention เริ่มไม่พอ)
2. เข้าใจ sub-agent concept (3 พ่อครัว ทำคนละจาน, attention เต็มต่อคน, ขนานกัน)
3. รับ honest scope flag เรื่อง syntax สำหรับ named subagent (test by demo, ไม่ assert)
4. **คุยกับ Claude หน้าต่าง 2 ผ่าน interview flow สั้นๆ** ตอบชื่อ agent 3 ตัวเอง + confirm description ของแต่ละตัว แล้ว Claude สร้างไฟล์ใน `.claude/agents/` ตามชื่อที่คุณตั้ง (frontmatter `name` + `description` + body ที่บอก source/output/กฎ) ของพวกนี้คือ source-of-truth ของแต่ละพนักงาน
5. ในรอบเดียวกันนั้น Claude หน้าต่าง 2 update `.claude/skills/company-brief/SKILL.md` Steps section ให้ **เรียก agent by name ตามชื่อที่คุณตั้ง** แทน inline brief ทั้งก้อน skill รับหน้าที่ orchestrate, agent definitions รับหน้าที่ของตัวเอง
6. รัน `/brief <TICKER>` v3 ครั้งแรก, 3 sub-agent ทำงาน (parallel ถ้า version รองรับ, sequential isolated ถ้าไม่รองรับ), main Claude integrate เป็น brief 6 sections
7. ผ่าน Plan mode approvals หลายรอบ (ปกติของ sub-agent)

`/brief` ของคุณตอนนี้ structurally แน่นที่สุดในคอร์ส แต่ละ section มี attention เต็มจาก agent ที่ focus หัวข้อนั้น

**Pattern ที่ landed ใน Step 3 ใช้ซ้ำได้** ทุกครั้งที่อยากเพิ่มพนักงาน เพิ่มไฟล์ใน `.claude/agents/<ชื่อใหม่>.md` (frontmatter + body) แล้วเรียก by name ใน skill ที่จะใช้ ของผมเอง agent ทุกตัวใน ClaudyOS (Minnie, Reese, Rae, Chris, Vera, Newy, Nick, อื่นๆ) นิยามแบบเดียวกันนี้ ผมเริ่มจาก agent ตัวเดียวเมื่อ 2 เดือนก่อน แล้วเพิ่มทีละตัวเมื่องานเรียก ทีมจะค่อยๆ มี personality ของมันเอง

ที่ยัง weak อยู่:

- ใช้ในเครื่องคุณคนเดียว (Lesson 5 deploy showcase ให้คนอื่นเห็น output ได้)
- ทุก dimension แยกกันไม่คุยกัน (feature ไม่ใช่ bug, แต่ก็แปลว่า cross-dimension red flag main Claude ต้อง catch)

แต่ engine ของ /brief จบ Lesson 5 จะเอาออกไปโชว์โลก

---

## Common stumbles (ถ้าติดตรงไหน)

- **3 sub-agent race condition** (race condition คือสภาวะที่งานหลายตัวรันพร้อมกันแล้วผลลัพธ์ไม่แน่นอน บางตัวเสร็จก่อน บางตัว fail) **(1 ตัว fail, output partial)**: Claude อาจ fabricate แทน sub-agent ที่ fail กฎ: main Claude **ต้อง report partial honest** ห้ามเติม bullet จาก memory แทน ถ้า earnings agent fail (เช่น transcript file ไม่เจอ) Latest earnings section บอกว่า "sub-agent ไม่สำเร็จ source ไม่ถึง" แทน เห็นในไฟล์แล้วยังแต่ง paste ใน หน้าต่าง 2 ตามที่ผมเขียนใน Step 4 ACTION ข้อ 7

- **Plan-mode approval fatigue (5+ approvals กดจนเบื่อ)**: ปกติของ sub-agent + file write. Plan mode ปลอดภัย แต่ verbose. Workaround: หลังรอบแรกที่ flow คุ้นแล้ว สลับ Auto mode ก่อนรัน /brief ครั้งต่อไป, Auto จะถามเฉพาะเรื่องอันตราย (เช่น delete) ปล่อย dispatch + write ผ่าน ห้าม Bypass mode (อันตราย, จำที่ Lesson 1 บอกได้).

- **Sub-agent context isolation surprises**: fundamentals agent เจอ red flag ใน 10-K (เช่น customer concentration risk ใน Item 1A) แต่ earnings agent ไม่รู้ sentiment agent ก็ไม่รู้ main Claude ต้อง catch ตอน integrate ถ้า Bull/Bear case ใน v3 ดู disconnected (Bear pulse ไม่ตรงกับ Fundamentals signal), paste ใน หน้าต่าง 2: "main Claude ตอน integrate ต้อง cross-reference ทั้ง 3 sub-agent output ถ้า fundamentals signal มี red flag ต้องสะท้อนใน Bear case + Kill conditions" Re-run

- **Tool name unknown / Claude บ่นว่า Agent หรือ Task ไม่รู้จัก**: version specific ถาม Claude หน้าต่าง 2 ตรงๆ "tool ของ version นี้ที่ใช้เรียก named subagent ชื่ออะไร syntax อย่างไร" แล้วแก้ Steps section ของ SKILL.md ตามที่ Claude บอก ห้ามเดา

- **"no subagent named X found" หรือ Claude บอกว่าหา agent ไม่เจอ** (ความเสี่ยงสูงขึ้นเพราะชื่อคุณตั้งเอง typo เป็นไปได้): paste ในหน้าต่าง 2 หนึ่งคำสั่งเดียว debug ได้จบใน chat รอบเดียว "list ไฟล์ใน .claude/agents/ ของ project นี้ทั้งหมด สำหรับแต่ละไฟล์เปิดอ่าน value ของ field `name:` ใน frontmatter แล้วเทียบกับชื่อที่ SKILL.md Steps section เรียก (ทุกที่ที่อ้างชื่อ agent) บอกว่า 2 ฝั่ง match กันไหม ถ้าไม่ match แก้ให้ตรง ถ้า match แล้วยัง error ให้บอก syntax ที่ใช้เรียก named subagent ใน Claude Code version ปัจจุบัน แล้วปรับ Steps section ตามนั้น" สาเหตุที่เจอบ่อย: (a) typo ในชื่อ (เช่น frontmatter เขียน `name: fai` แต่ skill เรียก `Fai` upper-case mismatch หรือชื่อขาด/เกินตัวอักษร) (b) ไฟล์วางผิด folder (ต้องอยู่ใน `.claude/agents/` ของ project root ไม่ใช่ `.claude/skills/` หรือที่อื่น) (c) frontmatter ไม่มี `---` block ปิด-เปิดครบ Claude resolve `name:` ไม่ได้ (d) syntax ที่ skill ใช้เรียก agent ไม่ตรงกับ version

- **Claude หน้าต่าง 2 diverged จาก pre-fixed role ตอนสัมภาษณ์** (เช่น proposed ให้ agent อ่านทั้ง 10-K AND earnings transcript หรือ agent 3 ออก buy/sell recommendation): paste ในหน้าต่าง 2: "agent นี้อ่าน source เดียวเท่านั้นตามที่กำหนดใน prompt ตอนต้น agent 1 = 10-K เท่านั้น agent 2 = earnings transcript เท่านั้น agent 3 = WebSearch เท่านั้น + ห้ามทำนายตลาด/recommend buy-sell context isolation = แต่ละ agent ทำหน้าที่เดียวเต็มที่ ห้าม merge source ระหว่าง agent ถ้า role ที่ propose ไม่ตรง revise แล้วถามชื่อใหม่"

- **Output ยังเหมือน v2 ทั้งที่ skill update แล้ว**: skill ไม่ถูก invoke ปัญหา Lesson 2 เก่าๆ ลอง paste "รัน /brief AAPL, ใช้ skill `company-brief` ที่ update Steps แล้ว ห้ามใช้ logic เก่า" หรือ restart หน้าต่าง 2 เพื่อ refresh skill load

- **Cost spike ผ่าน /context**: 3 sub-agent + main = 4 context รัน ถ้า Lesson 3 intro `/context` แล้วและคุณรันดู usage หลัง /brief v3 จะเห็น token เพิ่มจาก v2. expected. trade-off ที่ Step 1 อธิบาย, brief ครั้งสำคัญคุ้มใช้, brief เร็วๆ อาจไม่จำเป็น

- **paste prompt ผิดหน้าต่าง**: prompt ที่ผมส่งทุกอันต้องไปหน้าต่าง 2 (folder `my-first-project`). ถ้าเผลอ paste ใน หน้าต่าง 1 ผมจะตอบเหมือน Claude ปกติ แต่ skill จะถูก edit ใน folder คอร์ส `ltd-ai-101` ไม่ใช่ของคุณ ลบไฟล์ที่หลงสร้างใน `ltd-ai-101` แล้วสลับไปหน้าต่าง 2 paste ใหม่

ถ้าหาทางออกไม่ได้จริงๆ comment ในคลิปคอร์ส ผมก็เพิ่งหัดเหมือนกัน

---

## พร้อมขึ้น Lesson 5 ยัง

ก่อนขึ้นบทถัดไป ตรวจอีกครั้งว่า:

- `.claude/skills/company-brief/SKILL.md` Steps section ใช้ sub-agent dispatch แล้ว (frontmatter + Output format + Voice rules + When unsure ยังอยู่)
- รัน `/brief <TICKER>` v3 ออก 6 sections + อิง source จริง
- หน้าต่าง 2 (folder `my-first-project`) ยังเปิด Lesson 5 ใช้ต่อ
- ไฟล์ใน `briefs/` มีอย่างน้อย 3 ตัว (Lesson 5 ต้องการ ≥3 ไฟล์สำหรับ showcase). ถ้ายังมีแค่ AAPL.md ลองรัน `/brief NVDA` และ `/brief GOOGL` ใน หน้าต่าง 2 ก่อน (แต่ละรันใช้เวลาเหมือน AAPL ที่เพิ่งทำ).

พิมพ์ `Start Lesson 5` ในหน้าต่างนี้ (หน้าต่าง 1 = `ltd-ai-101`) แล้วเปิดหน้าต่าง 2 ค้างไว้

---

STOP: ทั้ง 4 ข้อข้างบน ผ่านครบไหม? ถ้าครบ พิมพ์ "Start Lesson 5". ถ้ายังขาด บอกผมตรงข้อไหน เราเก็บก่อนไปต่อ

---

USER: [Waits for student to confirm readiness or report missing artifact before moving to Lesson 5]

---

ACTION: When the student types "Start Lesson 5" or anything that signals they're ready (e.g., "พร้อมแล้ว", "ไปต่อ", "next lesson"), read the file at `lesson-modules/5-deploy-and-recap/CLAUDE.md` and begin Lesson 5 from its instructions.

If they ask a question or want to revisit something from Lesson 4, answer it. Don't move on until they say they're ready.

If the file `lesson-modules/5-deploy-and-recap/CLAUDE.md` doesn't exist yet (course is still being shipped lesson by lesson), tell them: "Lesson 5 ยังไม่ ship ครับ คอร์สนี้ทยอยปล่อยทีละบท เก็บ skill `company-brief` ที่แตก sub-agent ไว้แบบนั้น Lesson 5 จะ deploy ของไปโชว์โลกผ่าน Vercel + tour ClaudyOS เต็มรูปของผม ไว้เจอกัน"
